<%@ Control Language="c#" AutoEventWireup="false" Codebehind="CustLoginPageSettings.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.CustLoginPageSettings" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<cmn:subheader id="subHeader" runat="server"></cmn:subheader>
<div class="pSection">
	<fieldset>
		<table>
			<tr>
				<th>
					<cmn:formlabel id="lblRedirectTo" runat="server" forcontrol="rbTheSamePage"></cmn:formlabel></th>
				<td>
					<div><asp:radiobutton id="rbTheSamePage" Runat="server" GroupName="Redirect"></asp:radiobutton></div>
					<div><asp:radiobutton id="rbPersonalPage" Runat="server" GroupName="Redirect"></asp:radiobutton></div>
					<div><asp:radiobutton id="rbPortalPage" Runat="server" GroupName="Redirect"></asp:radiobutton></div>
					<div><asp:radiobutton id="rbOther" Runat="server" GroupName="Redirect"></asp:radiobutton>&nbsp;<asp:textbox id="txtOther" Runat="server"></asp:textbox><asp:RegularExpressionValidator ID ="urlvalidator" ControlToValidate ="txtOther" ValidationExpression ="^(ht|f)tp(s?)\:\/\/[0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*(:(0-9)*)*(\/?)([a-zA-Z0-9\-\.\?\,\'\/\\\+&amp;amp;%\$#_]*)?$" ErrorMessage ="Please enter a valid URL (including 'http://'), for example: http://www.yoursite.edu/pagename.html" Runat ="server"></asp:RegularExpressionValidator></div>
				</td>
			</tr>
			<tr>
				<th>
				</th>
				<td><asp:button id="btnSave" Runat="server"></asp:button><asp:button id="btnCancel" CausesValidation ="False" Runat="server"></asp:button></td>
			</tr>
		</table>
	</fieldset>
</div>

