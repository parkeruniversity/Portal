<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditItemView.ascx.cs" Inherits="Jenzabar.ContainedForm.Controls.EditItemView" %>
<%@ Register TagPrefix="jics" Namespace="Jenzabar.Portal.Framework.Web.TextEditor" Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Register src="../Controls/Options.ascx" tagname="Options" tagprefix="cf" %>
<%@ Register src="../Controls/RuleBuilder.ascx" tagname="RuleBuilder" tagprefix="cf" %>
<%@ Register Src="../Controls/LookUpMapper.ascx" TagPrefix="cf" TagName="LookUpMapper" %>
<%@ Register TagPrefix="cf" Namespace="Jenzabar.ContainedForm.Controls" Assembly="Jenzabar.CFWFCommon" %>
<%@ Register TagPrefix="cf" Namespace="Jenzabar.ContainedForm.Controls" Assembly="Jenzabar.ContainedForm" %>
<asp:Panel ID="pnlItemSettings" CssClass="ItemSettings" runat="server" style="position:relative;">
    <div id="itemTabs">
	    <ul>
		    <li>
		        <a href='<%= jQueryURL + "#tabs-1" %>'>
		            <asp:Literal runat="server" ID="ltTabDefinition"></asp:Literal>
		        </a>
		    </li>
		    <li>
		        <a href='<%= jQueryURL + "#tabs-2" %>'>
		            <asp:Literal runat="server" ID="ltTabSettings"></asp:Literal>
		        </a>
		    </li>
            <li class="jcf-dropdown-type jcf-checkbox-type jcf-radiobutton-type">
                <a href='<%= jQueryURL + "#tabs-3" %>'>
                    <asp:Literal runat="server" ID="ltTabOptions"></asp:Literal>
                </a>
            </li>
		    <li class="jcf-textbox-type jcf-essay-type jcf-dropdown-type jcf-checkbox-type jcf-radiobutton-type jcf-fileupload-type jcf-hidden-type jcf-datepicker-type jcf-button-type jcf-collectiongrid-type">
		        <a href='<%= jQueryURL + "#tabs-4" %>'>
		            <asp:Literal runat="server" ID="ltTabRules"></asp:Literal>
		        </a>
		    </li>
            <li class="jcf-textbox-type jcf-essay-type jcf-dropdown-type jcf-hidden-type">
                <a href='<%= jQueryURL + "#tabs-5" %>'>
                    <asp:Literal runat="server" ID="ltTabLookUp"></asp:Literal>
                </a>
            </li>
            <asp:PlaceHolder runat="server" ID="plhItemToolExtensionsLinks"></asp:PlaceHolder>
	    </ul>
	    <div id="tabs-1" class=".tab1">
            <table style="width:100%;">
                <tr>
                    <td>
                        <asp:Label runat="server" ID="lbUniqueId" AssociatedControlID="itmLabel"></asp:Label>
                    </td>
                    <td colspan="4"><asp:TextBox runat="server" ID="itmLabel" style="width:100%;" MaxLength="255" onchange="Jcf.utils.checkUniqueId(this);"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" ID="lbType" AssociatedControlID="itmType"></asp:Label>
                        <asp:HiddenField ID="itmID" runat="server" />
                    </td>
                    <td colspan="4">
                        <asp:DropDownList ID="itmType" runat="server" onchange="javascript:Jcf.events.onQuestionTypeChanged();" style="width:100%;"></asp:DropDownList>
                    </td>
                </tr>
                <tr class="TextOptsRow jcf-label-type jcf-textbox-type jcf-essay-type jcf-dropdown-type jcf-checkbox-type jcf-radiobutton-type jcf-image-type jcf-fileupload-type jcf-filedownload-type jcf-hidden-type jcf-datepicker-type jcf-button-type jcf-collectiongrid-type">
                    <td>
                        <asp:Label runat="server" ID="lbText" AssociatedControlID="itmText"></asp:Label>
                    </td>
                    <td colspan="4">
                        <jics:TextEditorControl id="itmText" runat="server" Width="100%" Height="200" Layout="jcf-lsr-tags" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="TextOptsRow NotMultiItem jcf-textbox-type jcf-essay-type jcf-dropdown-type jcf-checkbox-type jcf-radiobutton-type jcf-image-type jcf-fileupload-type jcf-filedownload-type jcf-hidden-type jcf-datepicker-type jcf-button-type jcf-collectiongrid-type">
                        <asp:Label runat="server" ID="lbTextPos" AssociatedControlID="itmTextPos"></asp:Label>
                    </td>
                    <td class="TextOptsRow NotMultiItem jcf-textbox-type jcf-essay-type jcf-dropdown-type jcf-checkbox-type jcf-radiobutton-type jcf-image-type jcf-fileupload-type jcf-filedownload-type jcf-hidden-type jcf-datepicker-type jcf-button-type jcf-collectiongrid-type">
                        <asp:DropDownList ID="itmTextPos" runat="server"></asp:DropDownList>
                    </td>
                    <td>
                        <asp:Label runat="server" ID="lbGroup" AssociatedControlID="itmGroupName"></asp:Label>
                    </td>
                    <td><asp:TextBox ID="itmGroupName" runat="server"></asp:TextBox></td>
                </tr>
                <tr runat="server" id="trGridSettings">
                    <td colspan="2" class="GridOptsRow NotMultiItem jcf-textbox-type jcf-essay-type jcf-dropdown-type jcf-radiobutton-type jcf-hidden-type jcf-datepicker-type jcf-button-type">
                        <asp:Label runat="server" ID="lbGrid" AssociatedControlID="itmAssociatedGrid"></asp:Label>
                    </td>
                    <td class="GridOptsRow NotMultiItem jcf-textbox-type jcf-essay-type jcf-dropdown-type jcf-radiobutton-type jcf-hidden-type jcf-datepicker-type jcf-button-type">
                        <asp:DropDownList ID="itmAssociatedGrid" runat="server" data-populate="CollectionGridQuestions"></asp:DropDownList>
                    </td>
                    <td class="GridOptsRow NotMultiItem jcf-textbox-type jcf-essay-type jcf-dropdown-type jcf-radiobutton-type jcf-hidden-type jcf-datepicker-type jcf-button-type">
                        <asp:Label runat="server" ID="lbGridFunction" AssociatedControlID="itmGridFunction"></asp:Label>
                    </td>
                    <td class="GridOptsRow NotMultiItem jcf-textbox-type jcf-essay-type jcf-dropdown-type jcf-radiobutton-type jcf-hidden-type jcf-datepicker-type jcf-button-type"><asp:DropDownList runat="server" ID="itmGridFunction">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem Text="Key" Value="4"></asp:ListItem>
                            <asp:ListItem Text="Summary" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Detail" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Add Button" Value="3"></asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
            </table>
        </div>
        <div id="tabs-2">
            <table width="100%">
                <tr id="AlignmentRow">
                    <td>
                        <table width="100%">
                            <tr>
                                <td style="width:30%;">
                                    <asp:Label runat="server" ID="lblAlignment" AssociatedControlID="itmAlignment"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="itmAlignment" runat="server"></asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr id="StyleRow">
                    <td>
                        <table width="100%">
                            <tr class="jcf-textbox-type jcf-button-type jcf-datepicker-type jcf-essay-type jcf-dropdown-type jcf-image-type">
                                <td>
                                    <asp:Label runat="server" ID="lbWidth" AssociatedControlID="itmWidth"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox runat="server" ID="itmWidth"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label runat="server" ID="lbHeight" AssociatedControlID="itmHeight"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox runat="server" ID="itmHeight"></asp:TextBox>
                                </td>
                            </tr>
                            <tr class="jcf-textbox-type jcf-datepicker-type jcf-essay-type jcf-dropdown-type">
                                <td>
                                    <asp:Label runat="server" ID="lbFontSize" AssociatedControlID="itmFontSize"></asp:Label>
                                </td>
                                <td colspan="3">
                                    <asp:TextBox runat="server" ID="itmFontSize"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr id="SettingsRow">
                    <td>
                        <table width="100%">
                            <tr>
                                <td colspan="3">Attributes:</td>
                            </tr>
                            <tr>
                                <td><asp:CheckBox ID="itmRequired" runat="server" Text="Required" CssClass="jcf-datepicker-type jcf-dropdown-type jcf-essay-type jcf-textbox-type jcf-checkbox-type jcf-radiobutton-type jcf-fileupload-type jcf-collectiongrid-type" /></td>
                                <td><asp:CheckBox ID="itmReadOnly" runat="server" Text="Read Only" CssClass="NotMultiItem ReadOnlyAllowed jcf-datepicker-type jcf-dropdown-type jcf-essay-type jcf-textbox-type jcf-checkbox-type jcf-radiobutton-type"/></td>
                                <td><asp:CheckBox ID="itmReportOnly" runat="server" Text="Show Only in Report" CssClass="NotMultiItem jcf-collectiongrid-type jcf-datepicker-type jcf-dropdown-type jcf-essay-type jcf-textbox-type jcf-checkbox-type jcf-radiobutton-type jcf-hidden-type" /></td>
                            </tr>
                            <tr runat="server" id="trReportItemSettings">
                                <td colspan="2"><asp:CheckBox ID="itmHideOnLoad" runat="server" Text="Hide on Load (Legacy)" /></td>
                                <td><asp:CheckBox ID="itmIsHeader" CssClass="IncludeInHeader NotMultiItem jcf-datepicker-type jcf-dropdown-type jcf-essay-type jcf-textbox-type jcf-radiobutton-type jcf-hidden-type" runat="server" Text="Include in Report Grid" /></td>
                            </tr>
                            <tr>
                                <td colspan="2"><asp:CheckBox ID="itmShowCGDetails" CssClass="CollectionGridOptions jcf-collectiongrid-type" runat="server" Text="Show Details Button" /></td>
                                <td><asp:CheckBox ID="itmShowCGUpdate" CssClass="CollectionGridOptions jcf-collectiongrid-type" runat="server" Text="Show Update Button" /></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr id="HiddenRow" class="jcf-hidden-type">
                    <td>
                        <asp:CheckBox ID="itmOverRideSubmitterID" runat="server" Text="Use ID Number Value to Override Submitter's ID" />
                    </td>
                </tr>
                <tr class="FileRow jcf-filedownload-type jcf-image-type">
                    <td>
                        <asp:Label runat="server" ID="lbFileUpload" AssociatedControlID="itmFileUpload"></asp:Label><br />
                        <cf:CommonFileUpload runat="server" ID="frmFileUpload" TargetFolder="FormDisplayPath" FakeAsync="True"></cf:CommonFileUpload>
                        <asp:FileUpload ID="itmFileUpload" runat="server" Visible="False"/>
                    </td>
                </tr>
                <tr id="ImageRow" class="jcf-image-type">
                    <td>
                        <asp:Label runat="server" ID="lbPath" AssociatedControlID="itmPath"></asp:Label><br />
                        <asp:TextBox ID="itmPath" runat="server" CssClass="jcf-lsr-tags"></asp:TextBox>
                    </td>
                </tr>
                <tr runat="server" id="trFileUploadRow" class="FileUploadRow CollectionGridOptions jcf-collectiongrid-type jcf-fileupload-type">
                    <td>
                        <table width="100%">
                            <tr>
                                <td style="width:30%;">
                                    <asp:Label runat="server" ID="lbFileNameFormat" AssociatedControlID="itmFileNameFormat"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox runat="server" ID="itmFileNameFormat" CssClass="jcf-all-tags"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 30%;">
                                    <asp:Label runat="server" ID="lbAllowedExtensions" AssociatedControlID="itmAllowedExtensions"></asp:Label><br/>
                                    <smaller><asp:Literal runat="server" ID="ltAllowedExtensionsHint"></asp:Literal></smaller>
                                </td>
                                <td>
                                    <asp:TextBox runat="server" ID="itmAllowedExtensions"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr class="TextOptsRow jcf-textbox-type" runat="server" id="trCompareTo">
                    <td>
                        <table width="100%">
                            <tr>
                                <td style="width:30%;">
                                    <asp:Label runat="server" ID="lbCompareItem" AssociatedControlID="itmCompareItem"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList runat="server" ID="itmCompareItem" data-populate="MappableQuestions"></asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr class="CollectionGridOptions jcf-collectiongrid-type">
                    <td>
                        <table width="100%">
                            <tr>
                                <td style="width:30%;">
                                    <asp:Label runat="server" ID="lbCGFileName" AssociatedControlID="itmCGFileName"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox runat="server" ID="itmCGFileName"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr id="DefaultRow" class="jcf-radiobutton-type jcf-dropdown-type jcf-textbox-type jcf-essay-type jcf-hidden-type jcf-filedownload-type">
                    <td>
                        <table width="100%">
                            <tr>
                                <td style="width:30%;">
                                    <asp:Label runat="server" ID="lbDefaultText" AssociatedControlID="itmDefaultText"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="itmDefaultText" runat="server" CssClass="jcf-lsr-tags"></asp:TextBox>
                                </td>
                            </tr>
                            
                        </table>
                    </td>
                </tr>
                <tr id="trPaymentItemSettings" runat="server" class="PaymentSettingsRow jcf-dropdown-type jcf-essay-type jcf-textbox-type jcf-radiobutton-type jcf-hidden-type">
                    <td>
                        <table width="100%">
                            <tr>
                                <td>
                                    <asp:Label runat="server" ID="lbAddToBalance" AssociatedControlID="itmAddToBalance"></asp:Label>
                                </td>
                                <td><asp:CheckBox runat="server" ID="itmAddToBalance"/></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label runat="server" ID="lbMultiplyBalance" AssociatedControlID="itmMultiplyBalance"></asp:Label>
                                </td>
                                <td><asp:CheckBox runat="server" ID="itmMultiplyBalance"/></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr class="jcf-textbox-type jcf-dropdown-type">
                    <td>
                        <table width="100%">
                            <tr>
                                <td style="width:30%;">
                                    <asp:Label runat="server" ID="lbWaiverCodeDatasource" AssociatedControlID="itmWaiverCodeDatasource"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList runat="server" ID="itmWaiverCodeDatasource" data-populate="Datasources"/>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr id="PayMapRow" class="jcf-datepicker-type jcf-dropdown-type jcf-essay-type jcf-textbox-type jcf-radiobutton-type jcf-hidden-type">
                    <td>
                        <table width="100%">
                            <tr>
                                <td style="width:30%;">
                                    <asp:Label runat="server" ID="lbPaymentField"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList runat="server" ID="itmPaymentField">
                                        <Items>
                                            <asp:ListItem Text=""></asp:ListItem>
                                            <asp:ListItem Text="AddrLine"></asp:ListItem>
                                            <asp:ListItem Text="City"></asp:ListItem>
                                            <asp:ListItem Text="CompanyName"></asp:ListItem>
                                            <asp:ListItem Text="Country"></asp:ListItem>
                                            <asp:ListItem Text="EMail"></asp:ListItem>
                                            <asp:ListItem Text="FirstName"></asp:ListItem>
                                            <asp:ListItem Text="LastName"></asp:ListItem>
                                            <asp:ListItem Text="Phone"></asp:ListItem>
                                            <asp:ListItem Text="State"></asp:ListItem>
                                            <asp:ListItem Text="Zip"></asp:ListItem>
                                        </Items>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr id="DefaultDateRow" class="jcf-datepicker-type">
                    <td>
                        <table width="100%">
                            <tr>
                                <td style="width:30%;">
                                    <asp:Label runat="server" ID="lbSelectedDate" AssociatedControlID="itmSelectedDate"></asp:Label>
                                </td>
                                <td>
                                    <cf:JSDatePicker ID="itmSelectedDate" runat="server" DateFormat="UseTime" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label runat="server" ID="lbDateFromTag" AssociatedControlID="itmDateFromTag"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="itmDateFromTag" runat="server" CssClass="jcf-lsr-tags"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label runat="server" ID="lbUseTime" AssociatedControlID="itmUseTime"></asp:Label>
                                </td>
                                <td>
                                    <asp:CheckBox ID="itmUseTime" runat="server" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table width="100%">
                            <tr class="CollectionGridOptions TextBoxOptions jcf-collectiongrid-type jcf-textbox-type jcf-essay-type">
                                <td style="width:30%;">
                                    <asp:Label runat="server" ID="lbLength" AssociatedControlID="itmLength"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox runat="server" ID="itmLength"></asp:TextBox>
                                </td>
                            </tr>
                            <tr class="TextBoxOptions jcf-textbox-type">
                                <td>
                                    <asp:Label runat="server" ID="lbValidation" AssociatedControlID="itmValidation"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList runat="server" ID="itmValidation"></asp:DropDownList>
                                </td>
                            </tr>
                            <tr id="trAutoCompleteItemSetting" runat="server" class="TextBoxOptions jcf-textbox-type">
                                <td>
                                    <asp:Label runat="server" ID="lbAutoCompleteDatasource" AssociatedControlID="itmAutoCompleteDataSource"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="itmAutoCompleteDataSource" runat="server" data-populate="Datasources"></asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <%= ExtensionsRows %>
            </table>
        </div>
        <div id="tabs-3">
            <table width="100%">
                <tr id="OptionsRow">
                    <td>
                        <table id="OrientationRow" width="100%">
                            <tr>
                                <td>
                                    <asp:Label runat="server" ID="lbOrientation" AssociatedControlID="itmOrientation"></asp:Label>
                                </td>
                                <td><asp:DropDownList ID="itmOrientation" runat="server"></asp:DropDownList></td>
                            </tr>
                        </table>
                            <asp:Label runat="server" ID="lbOptions"></asp:Label><br />
                        <cf:Options ID="Options1" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
        <div id="tabs-4">
            <cf:RuleBuilder ID="EventRuleBuilder1" runat="server" />
        </div>
        <div id="tabs-5">
            <cf:LookUpMapper runat="server" id="LookUpMapper" />
        </div>
        <asp:PlaceHolder runat="server" ID="plhItemToolExtensions"></asp:PlaceHolder>
    </div>
    <center><asp:Button ID="itmButtonSave" runat="server" Text="Save" CssClass="propertyControls propertySave jcf-item-settings-btn" OnClientClick="Jcf.func.saveFormItem();return false;" /><asp:Button runat="server" CssClass="propertyControls jcf-item-settings-btn" ID="itmButtonCancel" OnClientClick="Jcf.ui.closeFormItem();return false;" Text="Cancel" /></center>
</asp:Panel>