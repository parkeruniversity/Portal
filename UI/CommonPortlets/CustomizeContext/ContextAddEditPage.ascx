<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ContextAddEditPage.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.Controls.ContextAddEditPage" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<cmn:Subheader id="subHeader" runat="server"></cmn:Subheader>
	<div class="pSection">
		<asp:ValidationSummary ID="valSummary" Runat="server"></asp:ValidationSummary>

		<fieldset>
		<table>
		<tr><th><cmn:FormLabel id="lblName" runat="server" forcontrol="txtName"></cmn:FormLabel></th>
			<td><asp:TextBox id="txtName" runat="server" MaxLength="50" />
				<asp:RequiredFieldValidator ID="vldName" Text="*" ControlToValidate="txtName" Runat="server"></asp:RequiredFieldValidator>
				<asp:RegularExpressionValidator ID="vldName2" Text="*" ControlToValidate="txtName" Runat="server"></asp:RegularExpressionValidator>
			</td>
		</tr>
		<tr><th></th>
			<td><asp:Button id="btnSubmit" runat="server" />
				&nbsp;
				<asp:Button id="btnCancel" CausesValidation="False" runat="server" />
			</td>
		</tr>
		</table>
		</fieldset>
	</div>
