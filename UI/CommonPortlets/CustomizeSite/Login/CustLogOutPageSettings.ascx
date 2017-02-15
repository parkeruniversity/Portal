<%@ Control Language="c#" AutoEventWireup="false" Codebehind="CustLogOutPageSettings.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.CustLogOutPageSettings" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix = "cmn" NameSpace = "Jenzabar.Common.Web.UI.Controls" Assembly = "Jenzabar.Common"%>
<cmn:subheader id="subHeaderOut" runat="server"></cmn:subheader>
<div class="pSection">
	<fieldset>
		<table>
			<tr>
				<th>
					<cmn:formlabel id="lblRedirectOutTo" runat="server" forcontrol="rbPortalPage"></cmn:formlabel></th>
				<td>
					
					<div><asp:radiobutton ID= "rbPortalPage"   GroupName="Redirect" Runat="server"></asp:radiobutton></div>
					<div><asp:radiobutton ID= "rbOther"   GroupName="Redirect" Runat="server" ></asp:radiobutton>&nbsp;<asp:textbox id="txtOtherOut" Runat="server"></asp:textbox><asp:RegularExpressionValidator ID = "txtotherValidator" ControlToValidate = "txtOtherOut" ErrorMessage ="*Please enter a valid URL (including 'http://'), for example: http://www.yoursite.edu/pagename.html" ValidationExpression ="^(ht|f)tp(s?)\:\/\/[0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*(:(0-9)*)*(\/?)([a-zA-Z0-9\-\.\?\,\'\/\\\+&amp;amp;%\$#_]*)?$" Runat ="server" EnableClientScript="false" ></asp:RegularExpressionValidator></div>
				</td>
			</tr>
			<tr>
				<th>
				</th>
				<td><asp:button id="btnSaveOut" Runat="server"></asp:button>&nbsp;<asp:button id="btnCancelOut" Runat="server" CausesValidation = "False"></asp:button></td>
			</tr>
		</table>
	</fieldset>
</div>
