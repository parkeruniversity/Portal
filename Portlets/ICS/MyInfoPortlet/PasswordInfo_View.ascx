<%@ Import Namespace="Jenzabar.Common.Globalization" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="PasswordInfo_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.MyInfoPortlet.PasswordInfo_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<common:subheader id="shPassword" runat="server"></common:subheader>
<fieldset>
	<div class="pSection">
		<common:Hint id="hint" runat="server" />
		<common:GlobalizedCompareValidator ID="ComparePasswords" ControlToValidate="txtConfirmPassword" ControlToCompare="txtPassword"
			Operator="Equal" Type="String" TextKey="ERR_DIFFERENT_PASSWORDS"  Runat="server" />
		<table cellpadding="2">
			<tr>
			
				<th>
					<asp:Label ID="lblOldPassword" Runat="server" />
				</th>
				<td>
					<asp:Textbox id="txtOldPassword" runat="server" Columns="32" TextMode="Password" />&nbsp;
					<asp:RequiredFieldValidator ID="OldPasswordRequired" ControlToValidate="txtOldPassword" Text="*" Display="Dynamic"
						Runat="server" />
				</td>
			</tr>
			<tr>
				<th>
					<asp:Label ID="lblPassword" Runat="server" />
				</th>
				<td>
					<asp:Textbox id="txtPassword" runat="server" MaxLength="32" Columns="32" TextMode="Password" />&nbsp;
					<asp:RequiredFieldValidator ID="PasswordRequired" ControlToValidate="txtPassword" Text="*" Display="Dynamic"
						Runat="server" />
				</td>
			</tr>
			<tr>
				<th>
					<asp:Label ID="lblConfirmPassword" Runat="server" />
				</th>
				<td>
					<asp:Textbox id="txtConfirmPassword" runat="server" MaxLength="32" Columns="32" TextMode="Password" />&nbsp;
					<asp:RequiredFieldValidator ID="ConfirmPasswordRequired" ControlToValidate="txtConfirmPassword" Text="*" Display="Dynamic"
						Runat="server" />
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td><common:GlobalizedButton ID="SaveButton" textKey="TXT_SAVE" Runat="server"></common:GlobalizedButton>&nbsp;<common:GlobalizedButton ID="CancelButton"  CausesValidation="False" textKey="TXT_CANCEL" Runat="server" /></td>
			</tr>
		</table>
		<common:GlobalizedLinkButton id="lnkPasswordHint" CausesValidation="False" textKey="TXT_PASSWORD_HINT" runat="server" />
	</div>
</fieldset>
