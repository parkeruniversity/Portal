<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdminView.ascx.cs" Inherits="Jenzabar.ContainedForm.Views.AdminView" %>
<%@ Register Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" TagPrefix="cc1" %>
<%@ Register Assembly="Jenzabar.ContainedForm" Namespace="Jenzabar.ContainedForm.Controls" TagPrefix="cf" %>
<div class="pSection">
    <script type="text/javascript">
        var Jcf = {
            cache: {
                CurrentModal: null
            },
            events : {
                onAddFormClick : function() {
                    Jcf.ui.showModal("Add New Form",
                        $('#JcfAddFormModal'),
                        300,
                        175,
                        [$('[id*=btnAddForm]')]);
                }
            },
            ui: {
                createModal: function (title, content, width, height, buttonsArr) {
                    var wrapper = $("<div class='jcf-modal-content'></div>");
                    wrapper.append(content);

                    var dialog = jQuery(wrapper).dialog({
                        title: title,
                        modal: true,
                        width: width,
                        autoOpen: false,
                        appendTo: 'form[name=MAINFORM]'
                    });
                    if (buttonsArr != null) {
                        var wrapperFooter = $("<div class='jcf-modal-buttons  ui-dialog-buttonpane ui-widget-content ui-helper-clearfix'></div>");
                        for (var i in buttonsArr) {
                            $(buttonsArr[i]).addClass("ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-primary");
                            wrapperFooter.append($(buttonsArr[i]));
                        }
                        dialog.after(wrapperFooter);
                    }
                    if (height != null)
                        dialog.dialog('option', 'height', height);
                    return dialog;
                },
                showModal: function (title, content, width, height, buttonsArr) {
                    var modal = content.closest('.jcf-modal-content');
                    if (modal.length == 0)
                        Jcf.cache.CurrentModal = Jcf.ui.createModal(title, content, width, height, buttonsArr);
                    else {
                        Jcf.cache.CurrentModal = modal;
                    }
                    content.show();
                    Jcf.cache.CurrentModal.dialog('open');
                },
                closeModal: function () {
                    Jcf.cache.CurrentModal.dialog('close');
                    Jcf.cache.CurrentModal = null;
                },
                fileSelected: function (messageId, path) {
                    var fileName = path.substring(path.lastIndexOf("\\") + 1);
                    $('[id*=' + messageId + ']').html(fileName);
                    if (fileName.indexOf(".cfproj") >= 0) {
                        $('[id*=btnImportForm]').removeAttr('disabled');
                    } else {
                        $('[id*=btnImportForm]').attr('disabled', 'disabled');
                    }
                }
            }
        };
        jQuery(document).ready(function () {
            if (jQuery('.SortForms').length > 0) {
                jQuery('.SortForms').sortable({
                    handle: '.dragHandle',
                    stop: function (event, ui) {
                        var pos = 0;
                        var rows = new Array();

                        $('.AdminFormRow', '.SortForms').each(function () {
                            var obj = { FormID: jQuery('#formID', this).val(), Position: pos };
                            rows[pos] = obj;
                            pos++;
                        });
                        ajaxUtil.callWebService('<%= ResolveUrl("~/Portlets/CUS/ICS/Jenzabar.ContainedForm/Services/FormBuildWebService.asmx/SaveFormPosition") %>',
                            { 'forms': rows, 'portlet': '<%= this.ParentPortlet.Portlet.Guid.ToString() %>' },
                            function (data) {

                            }
                        );
                    }
                });
            }
        });
        ///////////////////////////////////////////////////////////////////////////////
        // ajaxUtil
        ///////////////////////////////////////////////////////////////////////////////
        (function (au, $) {
            au.callWebService = function (webService, data, callback) {
                $.ajax({
                    type: 'POST',
                    url: webService,
                    contentType: 'application/json; charset=utf-8',
                    data: JSON.stringify(data),
                    dataType: 'json',
                    success: callback
                });
            };
        }(window.ajaxUtil = window.ajaxUtil || {}, jQuery));
    </script>
    <div class="jcf-breadcrumbs">
        Manage Forms
    </div>
    <table>
        <tr>
            <td style="width:25%;">
                <asp:Image runat="server" ID="imgAdd"></asp:Image>&nbsp;
                <a href="#" onclick="Jcf.events.onAddFormClick();return false;">Add Form</a>
            </td>
            <td>
                <cf:CommonFileUpload runat="server" ID="fuFormImport" FakeAsync="False" TargetFolder="TempPath" />
                <asp:Button runat="server" ID="btnImportForm" onclick="btnImportForm_Click" CssClass="jcf-fileupload-btn" Text="Import" disabled="disabled"/>
            </td>
            <td style="width:25%;text-align:center;"><asp:LinkButton runat="server" ID="lnkSiteAdmin" OnClick="lnkSiteAdmin_Click" Text="Site Administrators"></asp:LinkButton></td>
        </tr>
    </table>
    <div class="SortForms">
        <asp:Repeater ID="rptPortletForms" runat="server" 
            onitemcommand="rptPortletForms_ItemCommand" 
            onitemdatabound="rptPortletForms_ItemDataBound">
            <ItemTemplate>
                <asp:Panel runat="server" ID="AdminFormRow" CssClass="AdminFormRow" style="margin-bottom:2px;">
                    <input type="hidden" id="formID" value='<%# DataBinder.Eval(Container.DataItem, "FormID") %>' />
                    <div class="commandDiv">
                        <div class="dragHandle">&nbsp;</div>
                    </div>
                    <asp:LinkButton ID="lnkFormName" runat="server" CommandName="OpenForm"></asp:LinkButton>
                    <div class="FormLinks">
                        <asp:ImageButton ID="imgExportForm" runat="server" ToolTip="Export" OnClick="imgExportForm_Click"/>
                        <asp:ImageButton ID="imgActivate" runat="server" ToolTip="Toggle On/Off" OnClick="imgActivate_Click" />
                        <asp:ImageButton ID="imgDelete" runat="server" ToolTip="Delete" OnClientClick="if (!confirm('Deleting this form will delete all submissions with it. Are you sure you want to continue?')){return false;}" OnClick="imgDelete_Click" />
                    </div>
                </asp:Panel>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <div id="JcfAddFormModal" style="display: none;">
        <p>Choose a template</p>
        <asp:DropDownList runat="server" ID="drpTemplates" CssClass="form-control"/><br/>
        <asp:Button runat="server" ID="btnAddForm" Text="Create" OnClick="btnAddForm_Click"/>
    </div>
</div>