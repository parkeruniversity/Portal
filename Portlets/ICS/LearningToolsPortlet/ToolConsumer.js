//alert("sp2 2.0 legacy blti javascript");

function ws_delete_placement(userid, placementid, portletid, timeout) {
    JCSL.ajax.async_post_as_object //JCSL.ajax.async_post_as_text
      (
        (window.Portal.url + "Portlets/ICS/LearningToolsPortlet/Legacy/BLTI.asmx/WS_DeletePlacement"),
        {
            "userIdString": userid,
            "placementIdString": placementid,
            "portletIdString": portletid
        },
        callback_delete_placement, false, timeout
      );

}
function callback_delete_placement(returned) {
    dbg_message = 'callback_delete_placement got back: ' + returned.message;
    new JCSL.ui.windows.MessageBox(dbg_message).open(null);
}
function ws_delete_proxy(proxyid, userid, timeout) {
    JCSL.ajax.async_post_as_object //JCSL.ajax.async_post_as_text
      (
        (window.Portal.url + "Portlets/ICS/LearningToolsPortlet/Legacy/BLTI.asmx/WS_DeleteProxy"),
        {
            "proxyIdString": proxyid,
            "userIdString": userid
        },
        callback_delete_proxy, false, timeout
      );

}
function callback_delete_proxy(returned) {
    if (JCSL.lang.is_error(returned) || returned.type == "ERROR") {
        msg = "Error deleting Tool Proxy." + returned.message;
        new JCSL.ui.windows.MessageBox(msg).open(null);
    }
    else {
        msg = "Tool Proxy successfully deleted";
        new JCSL.ui.windows.MessageBox(msg).open(null);
    }
}
function ws_basiclti_submit_use_session_state(custom_runtime_params, timeout) {
    //alert("in sp2 2.0 - custom_runtime_params: " + custom_runtime_params);
    // Special function to call a local web service that needs to get variables from SESSION state
    // rather than in the parameter list. 
    // Note: "custom" run time parameters include also "extension" parameters that might be generated during Page Load 
    // rather than persisted in database for this Tool or Placement
    JCSL.ajax.async_post_as_object
      (
        (window.Portal.url + "Portlets/ICS/LearningToolsPortlet/Legacy/BLTI.asmx/WS_GetLaunchParamsFromSessionState"),
        {
            "customRuntimeParams": custom_runtime_params
        },
        callback_basiclti_submit, false, timeout
      );

}
// global variable reset when specific link is used
// following used by Igor's code as well as JQuery rewrite
var saved_resource_link_id = '';


// JQuery to manipulate the lis_result_sourcedid and any other run time parameters
function ws_TConsumer_submit() {
    var ERACER_VERSION = "JICS 7.4";

    var service_endpoint = window.Portal.url + "Portlets/ICS/LearningToolsPortlet/Legacy/ToolConsumer.asmx/WS_TConsumerFixup";
    var callback_endpoint = window.Portal.url + "Portlets/ICS/LearningToolsPortlet/Legacy/ToolConsumerOutcomesCallback.aspx";
    var resource_link_id = arguments[0];
    var portlet_id = arguments[1];
    var timeout = arguments[2];
    var runtime_params = arguments[3];
    var col = arguments[4];
    var colid_arg = "{columnid : '" + arguments[4] + "'}"; // B0FA9F4B-6F9C-45C0-B374-BD20590F6D55"

    $.ajax({
        type: "POST",
        url: service_endpoint,
        data: colid_arg,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            //alert('DBG: Entering success function in ExtAss.js with msg=' + response.d.msg);
            if (response.d.err == "OK") // we have a cell in which to store the outcome
            {
                // prepend the placement id (resource_link_id) to the actual cell id so the
                // callback will be able to locate the placement, then the proxy, and then the secret!
                // TO DO: Further hide this through encryption or use of a salt
                opaqueid = resource_link_id + ":" + response.d.msg;
                // set up the lis_result_sourcedid parameter as response.d.msg 
                runtime_params = (runtime_params == "" || runtime_params == null) ? "lis_result_sourcedid=" + opaqueid :
                	            runtime_params + "&lis_result_sourcedid=" + opaqueid; // response.d.msg;
                runtime_params += "&ext_ims_lis_basic_outcome_url=" + callback_endpoint;
                runtime_params += "&ext_lms=" + ERACER_VERSION;
                // call the generic basic lti launch service
                ws_basiclti_submit(resource_link_id, portlet_id, timeout, runtime_params);
            }
            else {
                new JCSL.ui.windows.MessageBox(response.d.message).open(null);
            }
        },
        error: function (response) {
            new JCSL.ui.windows.MessageBox("Error accessing external tool. Please report this error to your system administrator.").open(null);
            return;
        }
    });
};
// Following no longer needed
function ws_TConsumer_delete(proxyid, userid) {
    //     alert('The delete_proxy function received the arguments ' +
    //        '\nproxyid=' + proxyid +
    //        '\nuserid=' + userid);
}

// global timeout for methods that are not passed a value, e.g. callbacks and callbacks of callbacks
var ajax_timeout;

function ws_basiclti_submit() {
    // required
    var resource_link_id = arguments[0];
    saved_resource_link_id = resource_link_id.replace(/-/gi, "");
    var portlet_id = arguments[1];
    var timeout = arguments[2];
    ajax_timeout = timeout; // global for other methods
    // optional
    var custom_runtime_params = '';
    if (arguments.length > 3) {
        custom_runtime_params = arguments[3];
    }
    JCSL.ajax.async_post_as_object
      (
        (window.Portal.url + "Portlets/ICS/LearningToolsPortlet/Legacy/BLTI.asmx/WS_GetLaunchParams"),
        {
            "resourceLinkIdString": resource_link_id,
            "portletIdString": portlet_id,
            "customRuntimeParams": custom_runtime_params

        },
        callback_basiclti_submit, false, timeout
      );
}

function callback_basiclti_submit(returned) {
    //alert(returned);
    if (JCSL.lang.is_error(returned) || returned.type == "ERROR") {
        // display message and slink away in shame
        new JCSL.ui.windows.MessageBox(returned.message).open(null);
    }
    else {
        var launch_url = returned.launch_url; //string
        var launch_params = returned.launch_params; //string

        //alert("launch_params: " + launch_params);
        //document.write(launch_params);
        //return;
        //alert("don't return");

        // Explode the returned parameter string into an array.
        // What if the name or value contains a '&' character? It should be urlencoded, if so!
        var parms_arr = returned.launch_params.split('&');
        // Create associative array from the above array
        var launch_parms_arr = new Array();
        for (var i = 0; i < parms_arr.length; i++) {
            // The param value might contain a '=' (happens regularly for oauth_signature!) so we cannot just split on '='
            var equal_sign_loc = parms_arr[i].indexOf('=');
            var one_param_name = parms_arr[i].substring(0, equal_sign_loc);
            var one_param_val = parms_arr[i].substring(equal_sign_loc + 1);
            launch_parms_arr[one_param_name] = one_param_val;
        }

        // default values for new window launch
        var window_params = 'menubar=1,scrollbars=1,resizable=1,status=1';
        // should test the width and height values to make sure they are reasonable integers, but... later...
        // a value of 0 means: inherit height and width from parent window
        if (launch_parms_arr["launch_presentation_width"] > 0) {
            window_params += ",width=" + launch_parms_arr["launch_presentation_width"];
        }
        if (launch_parms_arr["launch_presentation_height"] > 0) {
            window_params += ",height=" + launch_parms_arr["launch_presentation_height"];
        }
        // per R. Abel's suggestion, always open tool in (another) new window
        var win_name = '_blank';
        if (!("launch_presentation_document_target" in launch_parms_arr) ||
            launch_parms_arr["launch_presentation_document_target"].toLowerCase() == 'window') {
            var newwin = window.open(window.Portal.url +
                "Portlets/ICS/LearningToolsPortlet/Legacy/BLTI_ToolLaunch.html",
                win_name,
                window_params);

            //alert("newwin: " + newwin);
            //alert("launch_url" + launch_url);

            var f = function () {
                var blti_form = newwin.document.forms[0];
                for (var param in launch_parms_arr) {
                    var input_element = newwin.document.createElement("input");
                    input_element.type = "hidden";
                    input_element.name = param;
                    input_element.id = param;
                    input_element.value = launch_parms_arr[param];
                    blti_form.appendChild(input_element);
                }
                blti_form.action = launch_url;
                blti_form.method = "POST";
                blti_form.submit();
            };
            setTimeout(f, 1000);
        }
        else if (launch_parms_arr["launch_presentation_document_target"].toLowerCase() == 'frame' ||
            launch_parms_arr["launch_presentation_document_target"].toLowerCase() == 'iframe') {
            // TO DO: FOR SOME REASON WE CANNOT GET FOLLOWING TO WORK. SINCE THE IFRAME IS LOCAL THERE IS REALLY NO NEED FOR A setTimeout ANYWAY.
            //func_ref = "launch_in_frame('" + in_frame_form_name + "','" + launch_url + "','" + launch_parms_arr + "')";
            //setTimeout(func_ref, 1000);

            // yes, we could let the web service get the resource_link_id from the parameter string, but this is faster
            // we strip hyphens to convert the unique resource link id to the unique iframe identifier. This matches what is 
            // done when the frame is created in Main_View.ascx.cs.
            var launch_id = launch_parms_arr["resource_link_id"].replace(/-/g, "");
            // We have to convert '+' to '%2b' so that it will avoid be converted into a space by the web service that passes 
            // the signature to the tool. This is a horrible hack, as is all the encoding foisted upon us by the BLTI/Oauth reserved character set.
            launch_params = launch_params.replace(/\+/g, "%2b");
            JCSL.ajax.async_post_as_object
              (
                (window.Portal.url + "Portlets/ICS/LearningToolsPortlet/Legacy/BLTI.asmx/WS_GetToolResponse"),
                {
                    "launchUrl": launch_url,
                    "launchParams": launch_params,
                    "launchId": launch_id
                },
                callback_callback_basiclti_submit, false, ajax_timeout
              );
        }
        else {
            new JCSL.ui.windows.MessageBox("Error. Unknown launch_presentation_document_target.").open(null);
            return;
        }
    }
}

function callback_callback_basiclti_submit(returned) {
    if (JCSL.lang.is_error(returned) || returned.type == "ERROR") {
        // display message and slink away in shame
        new JCSL.ui.windows.MessageBox(returned.message).open(null);
    }
    else {
        // returned.status  is a string that can be tested against "200" but for now we ignore
        // returned.contenttype should be "html" but might be something else the tool sent
        // returned.body is the actual response body
        display_in_frame(returned.launchid, returned.body);
    }
}



function display_in_frame(iframe_form_id, tool_response) {

    form_name = 'form_' + iframe_form_id;
    iframe_name = 'iframe_' + iframe_form_id;
    div_iframe_id = 'div_iframe_' + iframe_form_id;
    div_descr_id = 'div_descr_' + iframe_form_id;
    div_link_id = 'div_link_' + iframe_form_id;


    // we need to set the iframe to visible just before we launch the tool in it
    div_iframe_obj = document.getElementById(div_iframe_id);
    if (div_iframe_obj == null) { alert('Error. Could not find DIV with ID=' + div_iframe_id); return; } //else { alert('Found the DIV'); }
    div_iframe_obj.style.visibility = 'visible';

    // Remove the Tool Description
    div_descr_obj = document.getElementById(div_descr_id);
    if (div_descr_obj == null) { alert('Error. Could not find DIV with ID=' + div_descr_id); return; } //else { alert('Found the DIV'); }
    div_descr_obj.style.display = 'none';

    // Remove the link to the tool
    div_link_obj = document.getElementById(div_link_id);
    if (div_link_obj == null) { alert('Could not find DIV with ID=' + div_link_id); } //else { alert('Found the DIV'); }
    div_link_obj.style.display = 'none';

    // Get the IFrame that is inside div_iframe_obj
    iframe_obj = document.getElementsByName(iframe_name);
    if (iframe_obj[0] == null) { alert('Error. Could not find iframe'); }
    iframe_obj[0].frameborder = 0;
    // TO DO: When we return to allowing tool launching in the Default View iframe we will need to move the height and width resetting back into the 
    // codebehind. Right now we can force it to 1000px for height and 100% for width here in the javascript since we know that only the Main View iframe is involved.
    iframe_obj[0].style.height = '1000px';
    //iframe_obj[0].style.height = (launch_params_arr["launch_presentation_document_target"].toLowerCase() == 'frame') ? '1000px' : '100%';
    iframe_obj[0].style.width = '100%';
    iframe_obj[0].style.visibility = 'visible';
    iframe_obj[0].style.display = 'inline';

    /*
    // handle some old IE browser weirdness
    var y = (iframe_obj[0].contentWindow || iframe_obj[0].contentDocument);
    if (y.document) y = y.document;
    */
    //if (iframe_obj[0].contentDocument == null) alert('Error. Null iframe_obj[0].contentDocument');
    //if (iframe_obj[0].contentWindow == null) alert('Error. Null iframe_obj[0].contentWindow');
    var content_of_document = null;
    try { content_of_document = iframe_obj[0].contentDocument.body.innerHTML; } catch (err) { content_of_document = null; }
    if (content_of_document != null) {
        iframe_obj[0].contentDocument.body.innerHTML = tool_response;
    }
    else {
        // if no luck with above then perhaps this is an old IE
        var content_of_window = null;
        try { content_of_window = iframe_obj[0].contentWindow.document.body.innerHTML; } catch (err) { content_of_window = null; }
        if (content_of_window != null) iframe_obj[0].contentWindow.document.body.innerHTML = tool_response;
    }
};