<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BuildFormView.ascx.cs" Inherits="Jenzabar.ContainedForm.Views.BuildFormView" %>
<%@ Register Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" TagPrefix="cc1" %>
<%@ Register Assembly="Jenzabar.CFWFCommon" Namespace="Jenzabar.ContainedForm.Controls"
    TagPrefix="cf" %>
<%@ Import Namespace="Jenzabar.Portal.Framework.InstalledApplications" %>
<%@ Import Namespace="Jenzabar.ContainedForm.Helpers" %>
<%@ Register TagPrefix="jics" Namespace="Jenzabar.Portal.Framework.Web.TextEditor" Assembly="Jenzabar.Portal.Framework.Web" %>


<%@ Register src="../Controls/DataSourceBuilder.ascx" tagname="DataSourceBuilder" tagprefix="cf" %>
<%@ Register src="../Controls/PayProfileBuilder.ascx" tagname="PayProfileBuilder" tagprefix="cf" %>
<%@ Register src="../Controls/LSRView.ascx" tagname="LSRView" tagprefix="cf" %>
<%@ Register src="../Controls/Mapping.ascx" tagname="Mapping" tagprefix="cf" %>
<%@ Register src="../Controls/ValidationBuilder.ascx" tagname="ValidationBuilder" tagprefix="cf" %>
<%@ Register src="../Controls/GenerateView.ascx" tagname="GenerateView" tagprefix="cf" %>
<%@ Register src="../Controls/StoredProcedureBuilder.ascx" tagname="StoredProcedureBuilder" tagprefix="cf" %>
<%@ Register Src="../Controls/DatabaseView.ascx" TagPrefix="cf" TagName="DatabaseBuilder" %>
<%@ Register Src="../Controls/BalanceCalculator.ascx" TagPrefix="cf" TagName="BalanceCalculator" %>
<%@ Register Src="../Controls/EditItemView.ascx" TagPrefix="cf" TagName="EditItemView" %>

<style>
    /*local styles*/
    .jcf-row:hover {
        outline:1px dashed #B2B2B2;
    }
</style>
<%= EditItemView.Scripts %>
<script>
    var pageUrl = '<%= jQueryURL %>';
    var questionDictionary = <%= QuestDictionary %>;
    var questionPlusCGDictionary = <%= QuestCGDictionary %>;
    var lsrDictionary = <%= LSRDictionary %>;
    var uploadPath = '<%= ResolveUrl("~/Portlets/CUS/ICS/Jenzabar.ContainedForm/Services/FileService.asmx/GetUploadForm?uploadPath=FormDisplayPath&objectId=" + FormId) %>';
</script>
<script type="text/javascript" src='<%= ResolveUrl("~/Portlets/CUS/ICS/Jenzabar.ContainedForm/Scripts/commonScripts.js?v=" + new InstalledApplicationService().GetApplicationVersion(FormResources.ApplicationName)) %>'></script>
<script type="text/javascript" src='<%= ResolveUrl("~/Portlets/CUS/ICS/Jenzabar.ContainedForm/Scripts/buildFormScripts.js?v=" + new InstalledApplicationService().GetApplicationVersion(FormResources.ApplicationName)) %>'></script>
<script type="text/javascript">
<% = ExtensionsJs %>
</script>
<div class=".pSection">
<asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
</asp:ScriptManagerProxy>
<asp:HiddenField ID="hdnPageURL" runat="server" />
<asp:HiddenField ID="hdnPortletID" runat="server" />
<asp:HiddenField ID="itmParent" runat="server" />
<asp:HiddenField ID="hdnItemArray" runat="server" />
<asp:HiddenField ID="hdnCurrentQuestion" runat="server" />
<asp:HiddenField ID="hdnShowFormSettings" runat="server" />
<asp:HiddenField ID="itmTab" runat="server" Value="" />
<asp:HiddenField ID="hdnRowEditing" runat="server" Value="" />
<asp:HiddenField ID="hdnTabEditing" runat="server" Value=""/>
<div id="jcfErrorContainer" style="display: none" class="feedbackError"></div>
    <asp:Panel ID="pnlFormSettings" CssClass="FormSettings" runat="server">
        <div id="tabs">
	        <ul>
		        <li><a href="<%= jQueryURL %>#tabs-1">Definition</a></li>
		        <li><a href="<%= jQueryURL %>#tabs-2">Settings</a></li>
		        <li><a href="<%= jQueryURL %>#tabs-3">On Finish</a></li>
                <li><a href="<%= jQueryURL %>#tabs-4">Access/Security</a></li>
                <li><a href="<%= jQueryURL %>#tabs-5">Extensions</a></li>
	        </ul>
	        <div id="tabs-1">
                <asp:Label ID="lnkDirectLink" runat="server"></asp:Label>
		         <table width="100%">
                    <tr>
                        <td>Form Name:</td>
                        <td><asp:TextBox ID="tbxName" runat="server" style="width: 100%;"></asp:TextBox></td>
                    </tr>
                    <tr>
                         <td>Tab Orientation:</td>
                         <td><asp:DropDownList runat="server" ID="drpTabOrientation" style="width: 100%;">
                                 <Items>
                                     <asp:ListItem Text="Horizontal" Value="0"></asp:ListItem>
                                     <asp:ListItem Text="Vertical" Value="1"></asp:ListItem>
                                 </Items>
                             </asp:DropDownList>
                         </td>
                    </tr>
                    <tr>
                        <td>Description:</td>
                        <td>
                            <jics:TextEditorControl id="edtDescription" runat="server" Layout="jcf-lsr-tags" Height="200"/>
                        </td>
                    </tr>
                </table>
	        </div>
	        <div id="tabs-2">
		        <table>
                    <tr>
                        <td>
                            Display On:
                        </td>
                        <td>
                            <cf:JSDatePicker ID="frmStartTime" runat="server" DateFormat="UseTime" />
                        </td>
                    </tr>
                    <tr>
                        <td>Message Before Start:</td>
                        <td><asp:TextBox ID="frmBeforeStart" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>
                            End On:
                        </td>
                        <td>
                            <cf:JSDatePicker ID="frmEndTime" runat="server" DateFormat="UseTime" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Message After End:
                        </td>
                        <td>
                            <asp:TextBox ID="frmAfterEnd" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr runat="server" ID="trGoToDo" visible="false">
                        <td>Display in To Do Portlet:</td>
                        <td>
                            <asp:CheckBox ID="frmToDo" runat="server" />
                        </td>
                    </tr>
                    <tr runat="server" ID="trGoMain">
                        <td>Display in Main View:</td>
                        <td>
                            <asp:CheckBox ID="frmShowInMain" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>File Upload Root:</td>
                        <td><asp:TextBox runat="server" ID="frmFileUploadPath"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Randomize Questions:
                        <br />
                        <i>*Each question will be moved to its own row.</i>                    
                        </td>
                        <td>
                            <asp:CheckBox ID="frmRandomize" runat="server" />
                        </td>
                    </tr>
                </table>
	        </div>
	        <div id="tabs-3">
		        <table>
                    <tr>
                        <td colspan="2"><asp:CheckBox ID="cbxUseCaptcha" runat="server" Text="Use reCaptcha" /></td>
                    </tr>
                    <tr>
                        <td>
                            Public Key
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="tbxCaptchaPublic"></asp:TextBox>
                        </td>                
                    </tr>
                    <tr>
                        <td>Private Key</td>
                        <td>
                            <asp:TextBox runat="server" ID="tbxCaptchaPrivate"></asp:TextBox>
                        </td>                
                    </tr>
                    <tr>
                        <td>reCaptcha Theme</td>
                        <td>
                            <asp:DropDownList runat="server" ID="drpCaptchaColor">
                                <asp:ListItem Text="Red" Value="red"></asp:ListItem>
                                <asp:ListItem Text="White" Value="white"></asp:ListItem>
                                <asp:ListItem Text="Black Glass" Value="blackglass"></asp:ListItem>
                                <asp:ListItem Text="Clean" Value="clean"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td><asp:CheckBox ID="frmShowMessage" runat="server" Text="Display a Message to the User" /></td>
                        <td>
                            <jics:TextEditorControl id="frmMessageToShow" runat="server" Layout="jcf-all-tags" Height="200"/>
                        </td>                
                    </tr>
                    <tr>
                        <td><asp:CheckBox ID="frmTransfer" runat="server" Text="Transfer to Web Page" CssClass="jcf-lsr-tags"/></td>
                        <td><asp:TextBox ID="frmWebPage" runat="server"></asp:TextBox></td>
                    </tr>
                </table>
	        </div>
            <div id="tabs-4">
		        <table>
                    <tr>
                        <td>Number of Times a User Can Submit:
                            <br /><i>For unlimited, enter 0</i>
                        </td>
                        <td><asp:TextBox ID="frmTimesCanSubmit" runat="server"></asp:TextBox></td>
                    </tr>
                    <asp:PlaceHolder runat="server" ID="plhLicensedFormSettings">
                        <tr>
                            <td>
                                Make Submissions Anonymous:
                            </td>
                            <td><asp:CheckBox ID="frmMakeAnonymous" runat="server" /></td>
                        </tr>
                        <tr>
                            <td>
                                Allow Users to Review Their Own Submissions:
                            </td>
                            <td>
                                <asp:CheckBox ID="frmReviewOwn" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Limit Access to:
                            </td>
                            <td>
                                <asp:DropDownList ID="frmAccessLists" runat="server"></asp:DropDownList>
                            </td>
                        </tr>
                    </asp:PlaceHolder>
                </table>
	        </div>
            <div id="tabs-5">
                <% = FormExtensionRows %>
            </div>
        </div>
        <center><asp:Button ID="btnSaveSettings" CssClass="jcf-form-settings-btn" runat="server" Text="Save" OnClientClick="/*Jcf.func.clearFormSettings();*/"/><asp:Button runat="server" ID="btnCancelSettings" CssClass="jcf-form-settings-btn" OnClientClick="Jcf.common.ui.closeModal();jQuery('[id*=hdnShowFormSetting]').val('');return false;" Text="Cancel" /></center>
    
    </asp:Panel>
    <cf:EditItemView runat="server" id="EditItemView" />
    <div class="jcf-breadcrumbs">
        <cc1:BreadCrumbTrail ID="BreadCrumbTrail" runat="server"></cc1:BreadCrumbTrail>&nbsp;<asp:Label runat="server" ID="lblFormName"></asp:Label>
    </div>
    <asp:Panel ID="pnlFormDesign" CssClass="FormBuilder" runat="server">
        <div id="SCFFormBuilder">
            <div ID="divMenuBar" runat="server" class="cssmenu">
                <ul id="SCFToolBar">
                    <asp:PlaceHolder runat="server" ID="plhClipboardLicensed">
                        <li class="has-sub"><a><span class="fa fa-clipboard"></span></a>
                            <ul id="jcf-clipboard-items">
                                <asp:Repeater runat="server" ID="rptClipboard">
                                    <ItemTemplate>
                                        <li>
                                            <asp:LinkButton runat="server" 
                                                ID="lnkPasteLink"
                                                CommandArgument='<%# ((Jenzabar.ContainedForm.Entities.DTO.ClipboardItemStub)Container.DataItem).ItemID %>'
                                                OnClick="lnkPasteLink_OnClick">
                                                <small style="font-size: x-small;"><%# ((Jenzabar.ContainedForm.Entities.DTO.ClipboardItemStub)Container.DataItem).FormName %></small><br/>
                                                <%# ((Jenzabar.ContainedForm.Entities.DTO.ClipboardItemStub)Container.DataItem).ItemName %>
                                            </asp:LinkButton>
                                        </li>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </ul>
                        </li>
                    </asp:PlaceHolder>
                    <li><a onclick="javascript:Jcf.ui.addRow();" style="cursor:pointer;">Add Row</a></li>
                    <li><a onclick="javascript:Jcf.ui.addTab();" style="cursor:pointer;">Add Tab</a></li>
                    <li><a onclick="javascript:Jcf.ui.addQuestion();" style="cursor:pointer;">Add Question</a></li>
                    <li><asp:LinkButton ID="formOptions" runat="server" onclick="formOptions_Click">Form Settings</asp:LinkButton></li>
                    <asp:PlaceHolder runat="server" ID="plTools">
                        <li class="has-sub"><a>Tools</a>
                            <ul runat="server" id="ulTools">
                                <li class="jcf-menu-seperator"><small style="font-size: x-small;color:#fff; margin-left: 10px;">Form Specific Tools</small><hr/></li>
                                <asp:PlaceHolder runat="server" ID="plhFormExtensions">
                                    <asp:PlaceHolder runat="server" ID="plhSiteAdminLicensed">
                                        <li><asp:LinkButton runat="server" ID="lnkMapping" OnClick="lnkMapping_Click">Mapped Statements</asp:LinkButton></li>
                                        <li><asp:LinkButton runat="server" ID="lnkStoredProcedures" OnClick="lnkStoredProcedures_Click">Stored Procedures</asp:LinkButton></li>
                                        <li><asp:LinkButton runat="server" ID="lnkGenerateView" OnClick="lnkGenerateView_Click">Generate View</asp:LinkButton></li>
                                    </asp:PlaceHolder>
                                    <li><asp:LinkButton runat="server" ID="lnkPaymentProfiles" OnClick="lnkPaymentProfiles_Click">Payment Profiles</asp:LinkButton></li>
                                    <li><asp:LinkButton runat="server" ID="lnkBalanceCalc" OnClick="lnkBalanceCalc_Click">Balance Calculator</asp:LinkButton></li>
                                </asp:PlaceHolder>
                                <li class="jcf-menu-seperator"><small style="font-size: x-small;color:#fff; margin-left: 10px;">Global Tools</small><hr/></li>
                                <asp:PlaceHolder runat="server" ID="plhGlobalExtensions">
                                    <li><asp:LinkButton runat="server" ID="lnkValidations" OnClick="lnkValidations_Click">Data Validation</asp:LinkButton></li>
                                    <li><asp:LinkButton runat="server" ID="lnkStringReplacer" OnClick="lnkStringReplacer_Click">String Replacer</asp:LinkButton></li>
                                    <li><asp:LinkButton runat="server" ID="lnkDatabases" OnClick="lnkDatabases_Click">Databases</asp:LinkButton></li>
                                    <li><asp:LinkButton runat="server" ID="lnkDataSources" OnClick="lnkDataSources_Click">Data Sources</asp:LinkButton></li>
                                </asp:PlaceHolder>
                                <li runat="server" Visible="false" id="liServicesTools" class="jcf-menu-seperator"><small style="font-size: x-small;color:#fff; margin-left: 10px;">Services Tools</small><hr/></li>
                                <asp:PlaceHolder runat="server" ID="plhServicesExtensions"></asp:PlaceHolder>
                                <li runat="server" Visible="False" id="liCustomTools" class="jcf-menu-seperator"><small style="font-size: x-small;color:#fff; margin-left: 10px;">Custom Tools</small><hr/></li>
                                <asp:PlaceHolder runat="server" ID="plhCustomExtensions"></asp:PlaceHolder>
                            </ul>
                        </li>
                    </asp:PlaceHolder>
                </ul>
            </div>
            <div id="BlankTemplate" class="jcf-row sortable" style="display:none;">
                <div class="commandDiv">
                    <div class="dragHandle" oncontextmenu="javascript:Jcf.events.onRowContextMenu(this, rowCounter);return false;">&nbsp;</div>
                </div>
                <div id="temp" class="element QuestionContainer jcf-col">&nbsp;</div>
            </div>
            <div id="TheForm" class="jcf-form-display">
                <div id="SCFDropMenu" class="contextMenu" style="display:none;">
                    <ul>
                        <li class="jcf-add-question"><a href="#" onclick="Jcf.ui.addQuestion();return false;">Add Question</a></li>
                        <li class="jcf-cm-itemcommand"><asp:LinkButton ID="itmDelete" runat="server" OnClientClick="javascript:if (!confirm('Are you sure you want to delete this item?')) {return false;} else {Jcf.func.setItemEditing();return true;}" OnClick="itemDelete_Click">Delete</asp:LinkButton></li>
                        <li class="jcf-cm-itemcommand"><asp:LinkButton ID="itmCopy" runat="server" OnClientClick="Jcf.func.setItemEditing();" OnClick="itmCopy_Click">Copy To This Form</asp:LinkButton></li>
                        <li class="jcf-cm-itemcommand"><asp:LinkButton ID="itmCopyClipboard" runat="server" OnClientClick="Jcf.func.setItemEditing();" OnClick="itmCopyClipboard_OnClick">Copy to Clipboard</asp:LinkButton></li>
                        <li class="jcf-cm-itemcommand" id="liMove"><a href="#" onclick="return false;">Move to Tab ></a>
                            <div class="contextMenu" style="position:absolute;right:-50px;">
                                <ul id="tabsAvailable">
                                </ul>
                            </div>
                        </li>
                        <li class="jcf-cm-itemcommand"><asp:LinkButton ID="itmProperties" runat="server" OnClientClick="javascript:Jcf.func.editFormItem();return false;" >Properties</asp:LinkButton></li>
                    </ul>
                </div>
                <div id="SCFRowDropMenu" class="contextMenu" style="display:none;">
                    <ul>
                        <li><asp:LinkButton ID="rowCopy" runat="server" OnClick="rowCopy_Click">Copy To This Form</asp:LinkButton></li>
                        <li><asp:LinkButton ID="rowDelete" runat="server" OnClientClick="javascript:if (!confirm('Are you sure you want to delete this row?')) {return false;} else {jQuery('[id*=hdnCurrentQuestion]').val('');return true;}" OnClick="rowDelete_OnClick">Delete</asp:LinkButton></li>
                    </ul>
                </div>
                <div id="SCFTabDropMenu" class="contextMenu" style="display:none;">
                    <ul>
                        <li><a href="#" onclick="Jcf.func.deleteTab();return false;">Delete</a></li>
                        <li><a href="#" onclick="Jcf.func.editTab();return false;">Properties</a></li>
                    </ul>
                </div>
                <asp:PlaceHolder ID="plForm" runat="server"></asp:PlaceHolder>
            </div>
        </div>
        <div class="tabSettingDiv">
            <label>Tab Name</label>
            <input type="hidden" id="tabID" />
            <input type="text" id="tabName" />
            <asp:PlaceHolder runat="server" ID="plhTabEditMode">
                <label>Show In Edit Mode</label>
                <input type="checkbox" id="showInReport" />
            </asp:PlaceHolder>
            <input id="JcfTabSave" class="jcf-modal-button" type="button" value="Save" onclick="Jcf.func.saveTab();" /> 
        </div>
    </asp:Panel>
    <div class="jcf-tools">
        <cf:DatabaseBuilder ID="DatabaseBuilder1" runat="server" Visible="False" />
        <cf:DataSourceBuilder ID="DataSourceBuilder1" runat="server" Visible="False"/>
        <cf:PayProfileBuilder ID="PayProfileBuilder1" runat="server" Visible="False" />
        <cf:LSRView ID="LSRView1" runat="server" Visible="False"/>
        <cf:Mapping ID="Mapping1" runat="server" Visible="False"/>
        <cf:validationbuilder ID="ValidationBuilder1" runat="server" Visible="False"/>
        <cf:GenerateView ID="GenerateView1" runat="server" Visible="False"/>
        <cf:StoredProcedureBuilder ID="StoredProcedureBuilder1" runat="server" Visible="False"/>
        <cf:BalanceCalculator runat="server" id="BalanceCalculator" Visible="false" />
        <asp:PlaceHolder runat="server" ID="customAdminTool" Visible="False"></asp:PlaceHolder>
    </div>
</div>
