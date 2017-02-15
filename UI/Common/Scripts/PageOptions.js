(function( Edp, $) {

    Edp.Globalization;
    Edp.PageInfo;
    Edp.PortletInfo;
    
    Edp.Popup = {};
    Edp.Popup.HTML = {};
    Edp.HTML = {};
    Edp.HTML.MaxPortletReached = function () {
        Edp.GetGlobalizations();
        return "<span class=\"maxPortletsReached\">" + Edp.Globalization.txT_PAGE_OTPIONS_MAX_PORTLET + ".<span>";
    };

    Edp.HTML.DirectLinkConctainer = function ($) {

        
        var config, getHTML, globalizer,portletInfo;
        //TODO: prepare the html with all the needes substitutions here before it's get served to the client code. 
        config = function (glb,ptInfo) {
            globalizer = glb;
            portletInfo = ptInfo;
        };

        getHTML = function () {
            try {
                var htmlTemplate = "<a id=\"diretLinkCollapser\">Use this feature on its own</a>"
               +"<div style=\"clear:both\"></div>"
               + "<div class=\"directLinkContainer editPortlet\">"
               + "<p>" + stringUtil.format(globalizer.txT_PORTLET_DIRECT_LINK_DESCRIPTION, Edp.PageInfo.PageName) + "</p>"
               + "<p>" + globalizer.txT_PORTLET_DIRECT_LINK_DESCRIPTION2 + "</p>"
               + "<p id=\"link\">" + portletInfo.url + "</p>"
               + "<div style=\"position: relative\" class=\"actions\">"
               + "<a target=\"_blank\" href=\"" + portletInfo.url + "\">" + globalizer.txT_PAGE_DIRECT_LINK_PREVIEW_LINK + "</a>"
               + "<a id=\"copyLinkToClipBoard\">" + globalizer.txT_PAGE_DIRECT_LINK_COPY_LIK + "</a>"
               + "</div>"
               + "<p>" + globalizer.txT_PAGE_DIRECT_LINK_HTML_DESCRIPTION + "</p>"
               + "<textarea name=\"txtIframeHtml\" rows=\"4\" cols=\"20\" readonly=\"readonly\" id=\"txtIframeHtml\" style=\"width:100%;\">"
               + "<iframe frameborder=\"0\" width=\"100%\" height=\"100%\" src=" + portletInfo.url + "/>"
               + "</textarea>"
               + "<a id=\"copyHTMLToClipart\">" + globalizer.txT_PAGE_DIRECT_LINK_COPY_HTML_LINK + "</a>"
               + "<p class=\"link-info\">"+ globalizer.txT_PORTLET_DIRECT_LINK_INFO+ "</p>"
               + "</div>";
            } catch (ex) {
                console.log(ex);
            }

            return htmlTemplate;
        };
        /// public public functions
        return {
            GetHTML: getHTML,
            Config: config
        };
    }($);
    
    Edp.Popup.ConfirmPortletDeletion = {};
    Edp.Popup.ConfirmPortletDeletion.HTML = {};
    
    Edp.Popup.ConfirmPortletDeletion.HTML.ConfirmPortletDeletion = function() {
       return $(Edp.Popup.ConfirmPortletDeletion.HTML.Template()).clone();
    };
    Edp.Popup.ConfirmPortletDeletion.HTML.Template = function() {
        Edp.GetGlobalizations();
        return "<div ID=\"DeletePortletPopup\">" 
                +"<div id=\"closePopup\" class=\"modalHeadingImg\"></div>" 
                +"<div style=\"clear: both\"></div>" 
                +"<div class=\"DeletePagePanel\">" 
                +"<span class=\"header\">" + Edp.Globalization.txT_PAGE_OPTIONS_DELETE_PORTLET_HEADER + "</span>" 
                +"<div class=\"warning-info\">" 
                +"<header>" + Edp.Globalization.txT_PAGE_OPTIONS_DELETE_PORTLET_WARNING_HEADER + "</header>" 
                +"<p>" + Edp.Globalization.txT_PAGE_OPTIONS_DELETE_PORTLET_CONTENT + "</p>" 
                +"</div>" 
                +"<div class=\"deleteButtonPanel\">" 
                +"<header>If you're sure</header>" 
                +"<div>" 
                +"<a id=\"deletePortlet\" class=\"deletePortlet\">" + Edp.Globalization.txT_PAGE_OPTIONS_DELETE_PORTLET_HEADER + "</a>" 
                +"</div>" 
                +"<a id=\"closePopupLink\" class=\"closeLInk\">" + Edp.Globalization.txT_PAGE_OPTIONS_DELETE_PORTLET_CANCEL + "</a>" 
                +"</div>" 
                +"<a id=\"closePopupLink\" class=\"closeLInk\">" + Edp.Globalization.txT_PAGE_OPTIONS_CLOSE_POPUP_BUTTON + "</a>" 
                +"</div>" 
                +"</div>";
    };
    Edp.Popup.DeleteShortcut = {};
    Edp.Popup.DeleteShortcut.HTML = {};
    Edp.Popup.DeleteShortcut.HTML.getHTML = function () {
        Edp.SetPageInformation();
        return $(Edp.Popup.DeleteShortcut.HTML.Template()).clone();
    };
    
    Edp.Popup.DeleteShortcut.HTML.Template = function() {
        Edp.GetGlobalizations();
        return  "<div ID=\"DeleteShortcutPopup\">" +
                "<div id=\"closePopup\" class=\"modalHeadingImg\"></div>" +
                "<div style=\"clear: both\"></div>" +
                "<div class=\"Content\">" +
                    "<span class=\"title\"></span>" +
                    "<span class=\"title-description\">" + Edp.Globalization.txT_PAGE_OPTIONS_DELETE_SHORTCUT_TITLE + "</span>" +
                    "<div class=\"sharedFrom\"> " +
                        "<span>" + Edp.Globalization.txT_PAGE_OPTIONS_DELETE_SHORTCUT_SHARED_FROM + "</span>" +
                         "<a></a>" +
                    "</div>" +
                    "<div class=\"devider\"></div>" +
                    "<input class=\"deletePortlet\" type=\"submit\" value=\"" + Edp.Globalization.txT_PAGE_OPTIONS_DELETE_SHORTCUT_BUTTON_TXT + "\">" +
                    "<a id=\"closePopupLink\">" + Edp.Globalization.txT_PAGE_OPTIONS_CLOSE_POPUP_BUTTON + "</a>" +
                "</div>" + "</div>";
                
    };

    Edp.Popup.ConfirmPortletDeletion.UpdateConfirmPortletDelection = function (portletName) {
        var comfirmDletePortlet = Edp.Popup.ConfirmPortletDeletion.HTML.ConfirmPortletDeletion();
        var warningInfoheader = $(comfirmDletePortlet).find('.DeletePagePanel>.header');
        var warningInfo = $(comfirmDletePortlet).find('.warning-info>p');
        var deletePortlet = $(comfirmDletePortlet).find('.deletePortlet');

        warningInfoheader.html(window.stringUtil.format(warningInfoheader.text(), "<strong>" + portletName + "</strong>"));
        warningInfo.text(window.stringUtil.format(warningInfo.text(), portletName));
        deletePortlet.text(window.stringUtil.format(deletePortlet.text(), portletName));
        return comfirmDletePortlet;
    };
    Edp.Popup.UpdateTextWithNewPortletName = function (portletName) {
        var editPortletPopup = Edp.Popup.HTML.EditPortletPopuObject;
        //replace the text with the portlet name and and displayname. 
        $(editPortletPopup).find(".title-description").text(window.stringUtil.format($(Edp.Popup.HTML.Template()).find(".title-description").text(), portletName, Edp.PageInfo.PageName));
        $(editPortletPopup).find(".title").text(window.stringUtil.format($(Edp.Popup.HTML.Template()).find(".title").text(), portletName));
        $(editPortletPopup).find("#portletNameTextBox").val(window.stringUtil.format($(Edp.Popup.HTML.Template()).find("#portletNameTextBox").val(), portletName));
        $(editPortletPopup).find(".deletePortlet").attr("value", window.stringUtil.format($(Edp.Popup.HTML.Template()).find(".deletePortlet").attr("value"), portletName));
        $(editPortletPopup).find("#portletNameTextBox").removeClass("error");
        $(editPortletPopup).find(".ValidationError").remove();
    };
    Edp.Popup.Valid = function () {
        // validate a string through regular expression. 
        var exp = new RegExp("[<>]+");
        var editPortletPopup = $("#editPortletPopup");
        var newPortletname = $(editPortletPopup).find("#portletNameTextBox").val();
        return newPortletname.length != 0 && !exp.test(newPortletname);
    };
    Edp.Popup.ShowValidationMessage = function () {
        //TODO: if the validator exists then edit it otherwise add it. 
        var ilegalCharacter =  "Name cannot contain (< or >) - please remove any and try saving again.";
        var errorMessage;
        
        var exp = new RegExp("[<>]+");
        if(exp.test($(editPortletPopup).find("#portletNameTextBox").val())){
            errorMessage = ilegalCharacter;
        }else{
            errorMessage = "Name for a portlet is required.";
        }
        Edp.Popup.ShowRenameErrorMessage(errorMessage);
    };

    Edp.Popup.ShowRenameErrorMessage = function (errorMessage) {
        var editPortletPopup = $("#editPortletPopup");
        if ($(editPortletPopup).find(".ValidationError").length == 0) {
            $("<span class=\"ValidationError\">" + errorMessage + "</span>").insertBefore($(editPortletPopup).find("#portletNameTextBox"));
            $("#editPortletPopup").find("#portletNameTextBox").addClass("error");
        } else {
            $(".ValidationError").text(errorMessage);
        }
    }
    Edp.Popup.HTML.Template = function() {
        var globalizer, template;

        globalizer = Edp.GetGlobalizations();

        template = "<div ID=\"editPortletPopup\">"
            +"<div id=\"closePopup\" class=\"modalHeadingImg\"></div>" 
            +"<div style=\"clear: both\"></div>" 
            +"<div class=\"Content\">" 
            +"<span class=\"title\">{0}</span>" 
            +"<span class=\"title-description\">" + Edp.Globalization.txT_PAGE_OPTIONS_RENAME_TITLE_DESCRIPTION + "</span>" 
            +"<div class=\"portletRename\"> <span>" + Edp.Globalization.txT_PAGE_OPTIONS_RENAME_PORTLET + "</span>" 
            +"<label for=\"portletNameTextBox\" id=\"accesibilitynewName\" style=\"display: none;\">Rename Feature Button</label>" 
            +"<input id=\"portletNameTextBox\" type=\"text\" value=\"{0}\" rows=\"1\"></input>" 
            +"<input id=\"renamePorltet\" type=\"submit\" value=\"" + Edp.Globalization.txT_PAGE_OPTIONS_RENAME_BUTTON + "\"></div>" 
            +"<div class=\"devider\"></div>" 
            + "<input class=\"deletePortlet\" type=\"submit\" value=\"" + Edp.Globalization.txT_PAGE_OPTIONS_DELETE_PORTLET_BUTTON + "\">"
            + "{2}"
            +"<a id=\"closePopupLink\">" + Edp.Globalization.txT_PAGE_OPTIONS_CLOSE_POPUP_BUTTON + "</a>" 
            +"</div>" 
            + "</div>";
        
        if (Edp.PortletInfo.CanSeeDirectLink == "True") {
            Edp.HTML.DirectLinkConctainer.Config(Edp.Globalization,Edp.PortletInfo);
            return stringUtil.format(template,"{0}","{1}",Edp.HTML.DirectLinkConctainer.GetHTML());
        } else {
            return template.replace("{2}","");
        }
        
    };
    
    Edp.Popup.HTML.EditPortletPopuObject;
    
    Edp.Popup.HTML.EditPortlet = function () {
        Edp.SetPageInformation();
        Edp.Popup.HTML.EditPortletPopuObject = $(Edp.Popup.HTML.Template()).clone();
        return Edp.Popup.HTML.EditPortletPopuObject;
    };


    Edp.SetPageInformation = function() {
        $.ajax({
            type: "POST",
            url: urlUtil.getAppRoot() + "services/PageAdmin/PageOptionsService.asmx/GetPageInformation",
            contentType: "application/json; charset=utf-8",
            data: "{\"pageID\":\"" + pageInfo + "\"}",
            dataType: "json",
            async :false,
            success: function (msg) {
                Edp.PageInfo = $.parseJSON(msg.d);
            }
        });
    };

    
    var DeletePorlet = function(portletID, successCallback,portletObject) {
        var portletDeletionInfo = {};
        portletDeletionInfo.pageID = pageInfo;
        portletDeletionInfo.portletID = portletID;
        
        $.ajax({
            type: "POST",
            url: urlUtil.getAppRoot() + "services/PageAdmin/PageOptionsService.asmx/DeletePortlet",
            contentType: "application/json; charset=utf-8",
            data: "{'portletDeletionInfo':"+JSON.stringify(portletDeletionInfo)+"}",
            dataType: "json",
            success: function(msg) {
                var response = $.parseJSON(msg.d);
                if (response.Valid) {
                    if (typeof successCallback !== 'undefined') {
                        successCallback();
                    }
                } else {
                    alert("Something went wrong, please look at the event viewer");
                }

            }
        });
    };

    Edp.GetGlobalizations = function () {
        if (typeof Edp.Globalization == 'undefined') {
            $.ajax({ url: window.portalSettings.globalizerWebServiceUrl + "pageoptions", async: false }).then(function (response) {
                Edp.Globalization = response;
            });
        }
    };
    
    Edp.RenamePortlet = function (newName, portletID, successCallback) {
        // build object to send over the wire
        var portletRenamingInfo = {};
        portletRenamingInfo.portletID = portletID;
        portletRenamingInfo.newName = newName;
        portletRenamingInfo.pageID = pageInfo;
        $.ajax({
            type: "POST",
            url: urlUtil.getAppRoot() + "services/PageAdmin/PageOptionsService.asmx/RenamePortlet",
            contentType: "application/json; charset=utf-8",
            data: "{'portletRenamingInfo':" + JSON.stringify(portletRenamingInfo) + "}",
            dataType: "json",
            success: function(msg) {
                var response = $.parseJSON(msg.d);
                if (response.Valid) {
                    if (typeof successCallback !== 'undefined') {
                        successCallback();
                    }
                }
            }
        });
    };
    
    Edp.ExisingPortlets = function () {
        return $(".pagePortlets>li>.portletDisplayName");
    };
    Edp.ExisingShortcuts = function () {
        return $("[data-portlettype='shortcut']");

    };
    var shortucLinks;
    var addPortlets;
    Edp.HandleMaxPortlets = function () {
        if (Edp.ExisingPortlets().length >= Number(Edp.Globalization.maX_PORTLETS) ) {
            if ($(".maxPortletsReache").length == 0) {
                $(Edp.HTML.MaxPortletReached()).insertBefore(".addNewPage");
                shortucLinks = $(".shortuct").clone();
                addPortlets = $(".addPortlet").clone();

                $(".shortuct").remove();
                $(".addPortlet").remove();
            }
            
        } else {
            $(".maxPortletsReached").remove();
            $(addPortlets).insertBefore(".addNewPage");
            $(shortucLinks).insertBefore(".addNewPage");
        }
    };

    
    Edp.showShortcutPopup = function(shortCutInfo, portletObject) {
       
        var portletName = shortCutInfo.Name;
        var portletID = shortCutInfo.id;
        var linkHTML = shortCutInfo.linkHTML;
        
        var deleteShortcut = Edp.Popup.DeleteShortcut.HTML.getHTML();

        //TODO: replace text with relevant information. 
        var portletDescription = $(deleteShortcut).find(".Content>.title-description");
        var deleteShortuctButton = $(deleteShortcut).find(".deletePortlet");
        var originContainer = $(deleteShortcut).find(".sharedFrom");

        $(deleteShortcut).find(".Content>.title").text(portletName);
        portletDescription.text(stringUtil.format(portletDescription.text(), portletName, Edp.PageInfo.PageName));
        deleteShortuctButton.val(stringUtil.format(deleteShortuctButton.val(), portletName));
        originContainer.html(linkHTML);
        
        
        $(deleteShortcut).dialog(
           {
               autoOpen: true,
               resizable: false,
               height: "auto",
               width: "auto",
               position: { my: 'center', at: 'center', of: window },
               modal: true,
               dialogClass: 'PageOptionsPopup',
               close: function () {
                   $(this).dialog('destroy');
                   if ($('#DeleteShortcutPopup')) {
                       $('#DeleteShortcutPopup').unbind();
                   }
               },
               open: function (data) {
                   $(data.target).find("#closePopup").click(function () {
                       $(this).parents().find('#DeleteShortcutPopup').dialog("close");
                   });

                   $(data.target).find('#closePopupLink').click(function () {
                       $(this).parents().find('#DeleteShortcutPopup').dialog("close");
                   });
               }
           });

        $(deleteShortcut).find(".deletePortlet").click(function () {

            if (Edp.ExisingPortlets().length > 1) {
                $(deleteShortcut).find(".deletePortlet").addClass("notActive");
                var origianlText = $(deleteShortcut).find(".deletePortlet").val();
                $(deleteShortcut).find(".deletePortlet").val("Stopping Sharing this Feature..");
                
                DeletePorlet(portletID, function (data) {
                    if (Edp.ExisingPortlets().length == 2) {
                        window.location.href = "javascript:__doPostBack('adminBar$pageOptionsLink','')";
                    } else {
                        $(deleteShortcut).find(".deletePortlet").val(origianlText);
                        $(deleteShortcut).find(".deletePortlet").removeClass("notActive");
                        $(portletObject.parent()).remove();
                        if (Edp.ExisingShortcuts().length == 0) $("#CP_V_pageShortcuts").remove();
                        $(deleteShortcut).dialog("close");
                    }

                    Edp.HandleMaxPortlets();
                    $("#portletCount").text(Edp.ExisingPortlets().length);

                });
            }
        });


    };
    Edp.Load = function () {
        try {
            Edp.SetPageInformation();
            Edp.GetGlobalizations();
        }catch(ex){ 
          console.log(ex);
        }
        
    };
    Edp.showPopup = function (portletInfo, portletObject) {

        var portletName, portletID,editPortletPopup;
        
        portletName = portletInfo.Name;
        portletID = portletInfo.id;
        Edp.PortletInfo = portletInfo;
        
        editPortletPopup = EditPortlet.Popup.HTML.EditPortlet();
        Edp.Popup.UpdateTextWithNewPortletName(portletName);

        $(editPortletPopup).find("#renamePorltet").click(function () {
            if (!Edp.Popup.Valid()) {
                Edp.Popup.ShowValidationMessage();
            } else {
                var newPortletname = $(editPortletPopup).find("#portletNameTextBox").val();
                Edp.RenamePortlet(newPortletname, portletID, function () {
                    $(portletObject).text(newPortletname);
                    Edp.Popup.UpdateTextWithNewPortletName(newPortletname);
                });
                $('#editPortletPopup').dialog("close");
            }
            });

            //TODO: bind the detete event. 
            $(editPortletPopup).find(".deletePortlet").click(function () {

                $(editPortletPopup).dialog("close");
                var comfirmDletePortlet =  Edp.Popup.ConfirmPortletDeletion.UpdateConfirmPortletDelection(portletName);

                $(comfirmDletePortlet).dialog(
                {
                    autoOpen: true,
                    resizable: false,
                    height: "auto",
                    width: "auto",
                    position: { my: 'center', at: 'center', of: window },
                    modal: true,
                    dialogClass: 'PageOptionsPopup',
                    close: function () {
                        $(this).dialog('destroy');
                        if ($('#DeletePortletPopup')) {
                            $('#DeletePortletPopup').unbind();
                        }
                        $(comfirmDletePortlet).find(".deletePortlet").unbind();
                    },
                    open: function (data) {
                        $(data.target).find("#closePopup").click(function () {
                            $(this).parents().find('#DeletePortletPopup').dialog("close");
                        });

                        $(data.target).find('.closeLInk').click(function () {
                            $(this).parents().find('#DeletePortletPopup').dialog("close");
                        });
                        
                        
                    }
                });

                $(comfirmDletePortlet).find(".deletePortlet").click(function () {

                    if (Edp.ExisingPortlets().length >= 2) {
                        $(comfirmDletePortlet).find(".deletePortlet").addClass("notActive");
                        var origianlText = $(comfirmDletePortlet).find(".deletePortlet").text();
                        $(comfirmDletePortlet).find(".deletePortlet").text("Deleting Feature..");
                        //TODO: disable the delete button. 
                        DeletePorlet(portletID, function (data) {
                            if (Edp.ExisingPortlets().length == 2) {
                                window.location.href = "javascript:__doPostBack('adminBar$pageOptionsLink','')";
                            } else {
                                $(comfirmDletePortlet).dialog("close");
                                $(comfirmDletePortlet).find(".deletePortlet").text(origianlText);
                                $(comfirmDletePortlet).find(".deletePortlet").removeClass("notActive");
                                $(portletObject.parent()).remove();
                                
                                Edp.HandleMaxPortlets();
                                $("#portletCount").text(Edp.ExisingPortlets().length);
                            }
                        });
                    }
                });

            });
            if ($(editPortletPopup)) {
                $(editPortletPopup).dialog(
                    {
                        autoOpen: true,
                        resizable: false,
                        height: "auto",
                        width: "auto",
                        position: { my: 'center', at: 'center', of: window },
                        modal: true,
                        dialogClass: 'PageOptionsPopup',
                        close: function () {
                            $(this).dialog('destroy');
                            if ($('#editPortletPopup')) {
                                $('#editPortletPopup').unbind();
                            }
                        },
                        open: function (data) {
                            $(data.target).find("#closePopup").click(function () {
                                $(this).parent().dialog("close");
                            });

                            $(data.target).find('#closePopupLink').click(function () {
                                $(this).parents().find('#editPortletPopup').dialog("close");
                            });
                            $("#diretLinkCollapser").click(function () {
                                $(".directLinkContainer.editPortlet").slideToggle("slow");
                                
                                var copyHtmlLink = $('.directLinkContainer.editPortlet').find('a#copyHTMLToClipart');
                                var copyLink = $('.directLinkContainer.editPortlet').find('a#copyLinkToClipBoard');
                                var htmlText = $('.directLinkContainer.editPortlet').find('#txtIframeHtml').text();
                                var linkText = $('.directLinkContainer.editPortlet>p#link').text();
                                
                                if (window.clipboardData) // Internet Explorer ClipBoard 
                                {
                                    copyHtmlLink.click(function () {
                                        window.clipboardData.setData("Text", htmlText);
                                        alert(htmlText + " was copied to clipboard");
                                    });

                                    copyLink.click(function () {
                                        window.clipboardData.setData("Text", linkText);
                                        alert($('.directLinkContainer.editPortlet>p#link').text() + " was copied to clipboard");
                                    });
                                } else {
                                    // Clipboard functionality for any other browser then Internet Explorer.
                                    copyHtmlLink.zclip({
                                        path: 'UI/Common/Scripts/ZeroClipboard.swf',
                                        copy: htmlText,
                                        afterCopy: function () {
                                            alert(htmlText + " was copied to clipboard");
                                        }
                                    });

                                    copyLink.zclip({
                                        path: 'UI/Common/Scripts/ZeroClipboard.swf',
                                        copy: $('.directLinkContainer.editPortlet>p#link').text(),
                                        afterCopy: function () {
                                            alert(linkText + " was copied to clipboard");
                                        }
                                    });
                                }
                            });
                            
                        }
                    });
            }
    };
    
} ( window.EditPortlet = window.EditPortlet || {}, jQuery ));


(function (po, $) {

    po.DeletePagePopup = {};
    po.DeletePagePopup.Show = function () {
        if (typeof preventDefault !== 'undefined' && preventDefault != null) {
            preventDefault = null;
        }
        $('#deletePagePopup').dialog("open");
        $('#deletePagePopup').dialog('option', 'position', 'center');
    };
    po.DeletePagePopup.Close = function () {
        $('#deletePagePopup').dialog("close");
    };

    po.DeletePagePopup.Load = function () {
        if ($('#deletePagePopup')) {
            $('#deletePagePopup').dialog(
                {
                    autoOpen: false,
                    resizable: false,
                    height: "auto",
                    width: 600,
                    modal: true,
                    dialogClass: 'PageOptionsPopup',
                    close: function () {
                        if ($('#hidePageFromAll')) {
                            $('#hidePageFromAll').unbind();
                        }
                    },
                    open: function (data) {
                        if ($('#hidePageFromAll')) {
                            $('#hidePageFromAll').click(function () {
                                $.ajax({
                                    type: "POST",
                                    url: window.Portal.url + "/services/PageAdmin/PageOptionsService.asmx/HidePageFromAll",
                                    contentType: "application/json; charset=utf-8",
                                    data: "{\"pageID\":\"" + pageInfo + "\"}",
                                    dataType: "json",
                                    success: function (msg) {
                                        // parse the message to inform the user whether the action was successful or failed.
                                        var result = JSON.parse(msg.d);
                                        alert(result.Result);
                                        po.DeletePagePopup.Close();
                                    },
                                    error: function (e) {
                                        alert("Something went wrong. We were not able to finish your request.");
                                    }
                                });
                            });
                        }
                        $('#closePopup').click(function () {
                            po.DeletePagePopup.Close();
                        });

                        $('#closePopupLink').click(function () {
                            po.DeletePagePopup.Close();
                        });
                    }
                });
        }
    };

    po.DirectLinkPopup = {};
    po.DirectLinkPopup.Load = function () {
        
        if ($('#directLinkPopup')) {
            // The Direct LInk PoPup. 
            // We also have to add the code for the coping of on the clipboard here, because this functionality is shown within the popup. 
            $('#directLinkPopup').dialog({
                autoOpen: false,
                resizable: false,
                height: "auto",
                width: "auto",
                modal: true,
                dialogClass: 'PageOptionsPopup',
                close: function () {
                    $('a#copyHTMLToClipart').unbind();
                    $('a#copyLinkToClipBoard').unbind();
                    $('a#copyHTMLToClipart').unbind();
                    $('a#copyLinkToClipBoard').unbind();
                },
                open: function (data) { // Registering the call back for the clipboard functionality once the dialog loads. 

                    // Direct Link Popup control functionality. 
                    if ($('#closeDirectLinkPopup')) {
                        $('#closeDirectLinkPopup').click(function () {
                            po.DirectLinkPopup.Close();
                        });
                    }

                    if ($('#closePageOptionsPopup')) {
                        $('#closePageOptionsPopup').click(function () {
                            po.DirectLinkPopup.Close();
                        });
                    }

                    if (window.clipboardData) // Internet Explorer ClipBoard 
                    {
                        $('a#copyHTMLToClipart').click(function () {
                            window.clipboardData.setData("Text", $('#CP_V_ShowPageThorughLink_txtIframeHtml').text());
                            alert($('#CP_V_ShowPageThorughLink_txtIframeHtml').text() + " was copied to clipboard");
                        });

                        $('a#copyLinkToClipBoard').click(function () {
                            window.clipboardData.setData("Text", $('p#link').text().trim());
                            alert($('p#link').text() + " was copied to clipboard");
                        });
                    } else { // Clipboard functionality for any other browser then Internet Explorer.

                        $('a#copyHTMLToClipart').zclip({
                            path: 'UI/Common/Scripts/ZeroClipboard.swf',
                            copy: $('#CP_V_ShowPageThorughLink_txtIframeHtml').text(),
                            afterCopy: function () {
                                alert($('#CP_V_ShowPageThorughLink_txtIframeHtml').text() + " was copied to clipboard");
                            }
                        });

                        $('a#copyLinkToClipBoard').zclip({
                            path: 'UI/Common/Scripts/ZeroClipboard.swf',
                            copy: $('p#link').text(),
                            afterCopy: function () {
                                alert($('p#link').text() + " was copied to clipboard");
                            }
                        });
                    }
                }
            }); 
        }
    };
    
    po.DirectLinkPopup.Show = function () {
        if (typeof preventDefault !== 'undefined' && preventDefault != null) {
            preventDefault = null;
        }
        $('#directLinkPopup').dialog("open");
        $('#directLinkPopup').dialog('option', 'position', 'center');
    };
    po.DirectLinkPopup.Close = function () {
        $('#directLinkPopup').dialog('close');
    };
    
    po.load = function() {
        
        // hookup for the dialog 
        EditPortlet.Load();

        if ($('#CP_V_directLink')) {
            $('#CP_V_directLink').click(function () {
                po.DirectLinkPopup.Show();
            });
        }
        $(window).on("scroll resize", function () {
            if ($("#directLinkPopup").dialog("isOpen")) {
                $('#directLinkPopup').dialog('option', 'position', 'center');
            }
            if ($("#deletePagePopup").dialog("isOpen")) {
                $('#deletePagePopup').dialog('option', 'position', 'center');
            }
        });
        
        $(".pagePortlets>li>.portletDisplayName").click(function () {

            //TODO: this needs to provide the portlet name and the page name. 
            if (typeof preventDefault !== 'undefined' && preventDefault != null) {
                preventDefault = null;
            }
            var shortCutInfo = {};
            shortCutInfo.Name = $.trim($(this).text());
            shortCutInfo.id = $(this).attr("data-PortletID");
            shortCutInfo.linkHTML = $(this).parent().find(".shareFrom").html();

            var portletType = $(this).attr("data-PortletType");

            if (portletType == "shortcut") {
                EditPortlet.showShortcutPopup(shortCutInfo, $(this));
            } else {
                var portletInfo = {};
                portletInfo.Name = $.trim($(this).text());
                portletInfo.id = $(this).attr("data-PortletID");
                portletInfo.url = $(this).attr("data-url");
                portletInfo.type = $(this).attr("data-PortletType");
                portletInfo.CanSeeDirectLink = $(this).attr("data-showdirectlink");

                EditPortlet.showPopup(portletInfo, $(this));
            }

        });
        
        po.DirectLinkPopup.Load();
        
        if (window.PageInfo.IsReadOnly == "False") {
            if ($('#CP_V_deleteButton')) {
                $('#CP_V_deleteButton').click(function () {
                    po.DeletePagePopup.Show();
                });
            }
            if ($('#CP_V_deleteButton')) {
                if ($('#CP_V_deleteButton').hasClass("deletePage disabled")) {
                    $('#CP_V_deleteButton').unbind();
                }
            }
            
           
            EditPortlet.HandleMaxPortlets();
            po.DeletePagePopup.Load();
            
        }else{
            $("#deletePagePopup").hide();
        }
    };
}(window.PageOptions = window.PageOptions || {}, jQuery));

$(document).ready(function () {
    //TODO: add a modifying css vs editing the css directly.
    
    var ls = $(".pageOptionsPanel");
    if (ls.length != 0) {
        $(".portlet").addClass("pageOptions");
    }
    window.PageOptions.load();
});
