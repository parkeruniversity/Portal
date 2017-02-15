<%@ Control Language="C#" EnableViewState="false" AutoEventWireup="true" CodeBehind="FileUploader.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.Controls.AsyncUploader.ImageUploader.FileUploader" %>
<%@ Register src="../UploaderJS.ascx" tagname="UploadJS" tagprefix="jics" %>

<jics:UploadJS ID="_js" runat="server" />

<asp:PlaceHolder ID="_phScript" runat="server">
 
 <asp:PlaceHolder ID="_phToggleScript" runat="server">
		<script language="javascript" type="text/javascript">

		    function ToggleOriginal(org, show, event) {
		        var elem, vis;
		        if (document.getElementById) // this is the way the standards work
		            elem = document.getElementById(org);
		        else if (document.all) // this is the way old msie versions work
		            elem = document.all[org];
		        else if (document.layers) // this is the way nn4 works
		            elem = document.layers[org];
		        vis = elem.style;
		        vis.display = show ? 'block' : 'none';
		        vis.zIndex = 10000;

		        if (show) {
		            var xy = getPosition(event);
		            vis.position = "absolute";
		            vis.top = xy.y - 23;
		            vis.left = xy.x - 15;
		        }
		        else
		            vis.position = "static";

		        return false;
		    }

		    function getPosition(e) {
		        e = e || window.event;
		        var cursor = { x: 0, y: 0 };
		        if (e.pageX || e.pageY) {
		            cursor.x = e.pageX;
		            cursor.y = e.pageY;
		        }
		        else {
		            var de = document.documentElement;
		            var b = document.body;
		            cursor.x = e.clientX +
            (de.scrollLeft || b.scrollLeft) - (de.clientLeft || 0);
		            cursor.y = e.clientY +
            (de.scrollTop || b.scrollTop) - (de.clientTop || 0);
		        }
		        return cursor;
		    }
    </script>
</asp:PlaceHolder>


<asp:PlaceHolder id="_phLoadScript" runat="server">
    
<script type="text/javascript" language="javascript">

    addLoadEvent(LoadSWFUploadValues<%=this.Instance%>); //defined in jenz.js
    
   

    function LoadSWFUploadValues<%=this.Instance%>(deleteCtrl) {

        if (document.getElementById("swfu_div<%=this.Instance%>") == null) return;
        if (document.getElementById("spanButtonPlaceholder<%=this.Instance%>") == null) return;
        
			new SWFUpload({
				// Backend Settings 
			    upload_url:'<%=this.ResolveUrl("UploadFile.aspx") %>?IsInPartialPostback=<%= this.IsInPartialPostback %>',
				post_params: {
                    "INSTANCE" : "<%=this.Instance%>",
                    "ASPSESSID" : "<%=Page.Session.SessionID %>",
                    "PORTLETID" : "<%=Portlet.Guid %>",
                    "DELETEID": ((deleteCtrl != null) ? deleteCtrl : "<%=GetDeleteControlID()%>")
                },

				// File Upload Settings
				file_size_limit : "<%=GetMaxBytes() %>",
				file_types : "<%=GetFileTypes() %>",
				file_types_description : "Web Images",
				file_upload_limit : "0",    // Zero means unlimited

				// Event Handler Settings - these functions as defined in Handlers.js
				//  The handlers are not part of SWFUpload but are part of my website and control how
				//  my website reacts to the SWFUpload events.
				file_queue_error_handler : fileQueueError,
				file_dialog_complete_handler : fileDialogComplete,
				upload_progress_handler : uploadProgress,
				upload_error_handler : uploadError,
				upload_success_handler : uploadSuccess,
				upload_complete_handler : uploadComplete,

				// Button settings
				button_image_url :'<%=this.ResolveUrl("~/UI/Common/Images/PortletImages/SWFUpload/XPButtonNoText_110x22.png") %>',
				button_placeholder_id : "spanButtonPlaceholder<%=this.Instance%>",
				button_width: 111,
				button_height: 22,
				button_text : '<span class="button"><%=GetImgBtnText() %></span>',
				button_text_style : '.button { font-family: Helvetica, Arial, sans-serif; font-size: 14pt; } .buttonSmall { font-size: 10pt; }',
				button_text_top_padding: 1,
				button_text_left_padding: 5,
				button_window_mode: SWFUpload.WINDOW_MODE.TRANSPARENT,

				// Flash Settings
				flash_url: '<%=this.ResolveUrl("~/UI/Common/Scripts/SWFUpload/swfupload.swf") %>',
				
				 // SWFObject settings
                minimum_flash_version : "9.0.28",
                swfupload_pre_load_handler : swfUploadPreLoad,
                swfupload_load_failed_handler : swfUploadLoadFailed,
                


				custom_settings : {
				    swfu_container: "swfu_div<%=this.Instance%>",
					item_container : "thumbnails<%=this.Instance%>",
					error_container : "imgErrorMsg<%=this.Instance%>",
					degrade_container : "degraded_div<%=this.Instance%>"
				},

				// Debug Settings
				debug: false
			});
		}
	</script>
</asp:PlaceHolder>

</asp:PlaceHolder>
<asp:PlaceHolder ID="_phUploadControl" runat="server">


    <!--<asp:LinkButton ID="_lbtnDelete" runat="server" OnClick="_lbtnDelete_Click" />-->
    <div id="swfu_container">
                <div id="_divImgErrorMsg" runat="server" class="feedbackError" style="display:none;"></div>
                <div style="width:300px;">
                     <div class='howTo'>
                        <img class="howToImg" src='<%=GetPortletImagePath("camera_question.gif") %>' alt="Camera help icon" /> 
                        <a href="#" onclick="preventDefaultEvent(event, ToggleOriginal('howToDiv<%=this.Instance%>',true,event));"><asp:Literal ID="_litHowTo" runat="server" /></a>
                        <div id='howToDiv<%=this.Instance%>' class='originalDiv'><input type='image' onclick="preventDefaultEvent(event, ToggleOriginal('howToDiv<%=this.Instance%>',false,event));" alt='close' src='<%=GetPortletImagePath("close_me.gif") %>' />
                            <div id='howToText'>
                                <asp:Literal ID="_litHelpTxt" runat="server" />
                            </div>
                        </div>
                    </div>
                	<div id="swfu_div<%=this.Instance%>" style="margin:0px;">
				        <span id="spanButtonPlaceholder<%=this.Instance%>"></span>
		            </div>
		            <div id="degraded_div<%=this.Instance%>" style="margin:0px;display:none;">
                        <asp:FileUpload ID="_fupDegraded" runat="server" />
                        <asp:Button ID="_btnUploadDegraded" runat="server" OnClick="_btnUploadDegraded_Click" />
                    </div>
                </div>

                <div style="clear:both;"></div>
		        <div id="thumbnails<%=this.Instance%>">
		            <div id='imgContainer'>
                    </div>
                
		            <div id="_divImages" class="thumbnailImages" runat="server"></div>
		      </div>
		      <div style="clear:both;"></div>
    </div>


</asp:PlaceHolder>
<asp:HiddenField ID="_hInstance" runat="server" />



