<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Register TagPrefix="cmn" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="jics" tagname="TextEditor" src="~\UI\Controls\TextEditor.ascx" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="EditFormSettings_View.ascx.cs" Inherits="Jenzabar.Portal.Framework.Web.PortletModules.FormBuilder.Settings.EditFormSettings_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<div class="FormBuilder">
	<div class="MainHeader MainHeaderSecondary">
		<h4><i><%= Globalizer.GetGlobalizedString("LBL_FORM_BUILDER") %></i> <span id="spnFormName" runat="server" /></h4>
	</div>
	<div class="pSection">
		<cmn:SuperBreadcrumbs ID="brdCrumbs" runat="server" />
		<h5><strong>
			<cmn:GlobalizedLiteral Runat="server" TextKey="FORMBUILDER_FORM_SETTINGS_BASIC_LBL" id="glBodyTitle" />
		</strong></h5>
		<p class="hint" style="text-align:center;">
			<a id="lnkImportSettings" runat="server"><asp:Image ID="imgImport" Runat="server" ImageUrl="~/UI/Common/Images/PortletImages/Icons/add.gif" /> <%= Globalizer.Format("FB_SETTINGS_IMPORTURT_TXT",Globalizer.GetGlobalizedString("FORMBUILDER_FORM_SETTINGS_BASIC_LBL")) %></a>
		</p>
		<fieldset>
			<table cellSpacing="3" cellPadding="3" class="SmallText">
				<tr>
					<td align="right"><cmn:FormLabel id="flFormName" runat="server" TextKey="FORMBUILDER_FORM_SETTINGS_FORMNAME_LBL" /></td>
					<td>
						<asp:TextBox ID="tbName" Runat="server" Width="200px" MaxLength="100" />
						<asp:RequiredFieldValidator ID="rfvName" Runat="server" ControlToValidate="tbName" />
					</td>
				</tr>
				<tr>
					<td align="right"><cmn:FormLabel id="flShrtDesc" runat="server" TextKey="FORMBUILDER_FORM_SETTINGS_SHRTDESC_LBL" /></td>
					<td><jics:TextEditor id="_textEditorDescription" MaxLength="6000" runat="server" /></td>
				</tr>
				<tr>
					<td align="right" valign="top"><%= Globalizer.GetGlobalizedString("FB_CONTACTEMAIL_TXT") %></td>
					<td valign="top">
						<asp:CustomValidator ID="cvNotifyEmail" Runat="server" ControlToValidate="tbSubmissionErrorNotifyUser" Display="Dynamic" ErrorMessage="" OnServerValidate="checkEmail" />
						<cmn:GlobalizedLabel id="glErrEmail" runat="server" visible="false" ForeColor="Red" />
						<asp:TextBox ID="tbSubmissionErrorNotifyUser" Runat="server" MaxLength="500" Width="400" />
						<br/><br />
						<cmn:Hint id="Hint1" runat="server" TextKey="FB_ERROR_NOTIFY_TXT" />
					</td>
				</tr>
				<tr id="trSaveLater" runat="server">
				    <td align="right"><%=Globalizer.GetGlobalizedString("TXT_SAVE_FOR_LATER")%></td>
				    <td valign="top">
				        <asp:CheckBox ID="cbSaveForLater" runat="server" /> <%=Globalizer.GetGlobalizedString("MSG_SAVE_LATER_BUTTON")%>
				        <br /><br />
				        <cmn:Hint ID="hintSaveLater" runat="server" TextKey="MSG_SAVE_FOR_LATER_INSTRUCTION" />
				    </td>
				</tr>
				<tr>
					<td align="right"><cmn:FormLabel id="flSupFiles" runat="server" TextKey="FORMBUILDER_FORM_SETTINGS_SUPFILES_LBL" /></td>
					<td>
						<cmn:Hint id="hintSupFiles" runat="server" TextKey="FORMBUILDER_FORM_SETTINGS_SUP_FILES" />
						<b><cmn:GlobalizedLabel ID="SavedFilesLabel" TextKey="FORMBUILDER_FORM_SETTINGS_BASIC_CURFILES_LBL" runat="server" visible="true" /></b>
						<asp:Repeater ID="SavedFiles" Runat="server">
							<ItemTemplate>
								<div style="padding: 4px 0px 4px 10px;">
									<asp:Literal ID="SavedFileID" Text='<%# DataBinder.Eval(Container.DataItem, "ID") %>' Visible="false" runat="server" />
									<asp:HyperLink ID="FileLink" 
											NavigateUrl='<%# DataBinder.Eval(Container.DataItem, "Path") %>' 
											Target="_blank" Runat="server">
										<%# DataBinder.Eval(Container.DataItem, "Name") %>
									</asp:HyperLink> 
									(<%# DataBinder.Eval(Container.DataItem, "Size") %>) 
									<asp:LinkButton ID="DeleteButton" CommandName="Delete" CausesValidation="false" runat="server">
										<asp:Image id="imgDeleteButton" Runat="server" ImageUrl="~/UI/Common/Images/PortletImages/Icons/delete.gif" AlternateText='<%# Jenzabar.Common.Globalization.Globalizer.GetGlobalizedString("TXT_DELETE") %>' />
									</asp:LinkButton>
								</div>
							</ItemTemplate>
						</asp:Repeater>
						<br/>
						<b><%= Globalizer.GetGlobalizedString("TXT_ADD_A_FILE") %></b>
						<table cellSpacing="3" cellPadding="3" class="SmallText">
							<tr>
								<th><cmn:FormLabel ID="FileInputLabel" ForControl="FileInput" TextKey="LBL_FILE" Runat="server" /></th>
								<td>
									<input type="file" id="FileInput" runat="server" NAME="FileInput" />
									<asp:Label ID="FileName" visible="false" runat="server" />
									<asp:Literal ID="FileID" visible="false" runat="server" />
								</td>
							</tr>
							<tr>
								<th><cmn:FormLabel ID="FileLabelLabel" ForControl="FileLabel" TextKey="LBL_LABEL" Runat="server" /></th>
								<td><asp:TextBox ID="FileLabel" Width="175px" MaxLength="250" Runat="server" /></td>
							</tr>
							<tr>
								<th></th>
								<td>
									<cmn:GlobalizedButton ID="UploadButton" TextKey="FORMBUILDER_FORM_SETTINGS_BASIC_ADDFILE_TXT" CausesValidation="true" Runat="server" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td></td>
					<td>
						<cmn:GlobalizedButton ID="btnSave" Runat="server" TextKey="FORMBUILDER_FORM_SETTINGS_SAVE_BTN" /> &nbsp; 
						<cmn:GlobalizedButton ID="btnCancel" Runat="server" TextKey="FORMBUILDER_FORM_SETTINGS_CANCEL_BTN" CausesValidation="False" />
					</td>
				</tr>
			</table>
		</fieldset>
	</div>
</div>
