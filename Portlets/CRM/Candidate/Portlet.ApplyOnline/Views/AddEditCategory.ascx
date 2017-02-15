<%@ Control CodeBehind="AddEditCategory.ascx.cs" Language="c#" AutoEventWireup="True" Inherits="Jenzabar.CRM.Candidate.Web.Portlets.ApplyOnline.AddCategory" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="framework" namespace="Jenzabar.Portal.Framework.Web.UI.Controls" assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Register TagPrefix="secured" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls.Secured" Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Import namespace="Jenzabar.ICS.Web.Portlets.BookmarkPortlet" %>
<%@ Register TagPrefix="jics" tagname="TextEditor" src="~\UI\Controls\TextEditor.ascx" %>
<script language="JavaScript" src="<%= this.ResolveUrl("~/UI/Common/Scripts/jenz.js") %>"></script>
<jenzabar:errordisplay id="error" Runat="server" />
<div class="pSection">
	<fieldset>
		<div class="FormBuilder"><div class="ErrorMsg"><asp:literal id=litErrorMsg Runat="server" Visible="False"></asp:Literal></div></div>
		<table>
			<tr>
				<th><jenzabar:globalizedlabel id="lblLabel" runat="server" TextKey="TXT_AO_CATEGORY_NAME" /></th>
				<td>
					<asp:textbox id="txtLabel" runat="server" MaxLength="200" Columns="40" />&nbsp;
					<asp:requiredfieldvalidator id="RequiredFieldValidator1" runat="server" ControlToValidate="txtLabel" Display="Dynamic" />
					<input type="text" style="visibility:hidden;">
				</td>
			</tr>
			<tr>
				<th>
					<jenzabar:globalizedlabel id="lblDescription" runat="server" TextKey="TXT_DESCRIPTION" /></th>
				<td><jics:TextEditor id="_textEditorDescription" MaxLength="2000" runat="server" /></td>
			</tr>
			<tr>
				<th>
					<jenzabar:globalizedlabel id="Globalizedlabel1" runat="server" TextKey="TXT_AVAILABLE_TO" /></th>
				<td><div class="psCell">
					<framework:PrincipalSelector id="psPermitRoles" runat="server" />
					</div></td>
			</tr>
			<tr>
				<th>&nbsp;</th>
				<td><jenzabar:globalizedbutton id="btnSave" runat="server" TextKey="TXT_SAVE" />&nbsp;
					<jenzabar:globalizedbutton  id="btnCancel" runat="server" CausesValidation="False" TextKey="TXT_CANCEL" /></td>
			</tr>
		</table>
	</fieldset>
</div>
