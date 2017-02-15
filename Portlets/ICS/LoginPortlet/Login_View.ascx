<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Login_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.LoginPortlet.Login_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<script type="text/javascript">
    function focus() {
        var e = document.getElementById("<%=txtPassword.ClientID%>");
        if (e == null) {
            setTimeout(focus, 0);
            return;
        }
        e.focus();
    }
    focus();
</script>
<div class="pSection">
	<fieldset>
		<asp:ValidationSummary ID="Summary" DisplayMode="List" Runat="server" />
		<table>
			<tr>
				<th>
				</th>
				<td>
					<p class="PortletError">
						<asp:Label ID="lblLoginMessage" Runat="server" Visible="False"></asp:Label>
					</p>
				</td>
			</tr>
			<tr>
				<th>
					<asp:label ID="lblUserName" Runat="server"></asp:label>
				</th>
				<td>
					<asp:textbox id="txtUserName" runat="server" MaxLength="50" Columns="20" accesskey="l" />
					<asp:RequiredFieldValidator ID="UsernameRequired" ControlToValidate="txtUsername" Text="*" Display="Dynamic" Runat="server" />
					
				</td>
			</tr>
			<tr>
				<th>
					<asp:LABEL ID="lblPassword" Runat="server"></asp:LABEL>
				</th>
				<td>
					<asp:textbox id=txtPassword runat="server" MaxLength="50" Columns="20" textmode="Password" />
					<asp:RequiredFieldValidator ID="PasswordRequired" ControlToValidate="txtPassword" Text="*" Display="Dynamic" Runat="server" />
				</td>
			</tr>
			<tr>
				<th></th>
				<td>
					<asp:Button id=btnLogin runat="server" />
				</td>
			</tr>
			<tr>
				<th></th>
				<td>
					<asp:LinkButton ID="lnkForgot" Runat="server" CausesValidation="False" />
				</td>
			</tr>
		</table>
	</fieldset>

</div>