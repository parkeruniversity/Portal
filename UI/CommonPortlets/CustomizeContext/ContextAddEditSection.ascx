<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ContextAddEditSection.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.Controls.ContextAddEditSection" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<cmn:Subheader id="subHeader" runat="server"></cmn:Subheader>
	<div class="pSection">
		<asp:ValidationSummary ID="valSummary" Runat="server"></asp:ValidationSummary>
		<fieldset>
		
		<table>
		<tr><th><cmn:FormLabel id="lblName" runat="server" forcontrol="txtName"></cmn:FormLabel></th>
			<td><asp:TextBox id="txtName" runat="server" MaxLength="50" />
				<asp:RequiredFieldValidator ID="vldName" Text="*" ControlToValidate="txtName" EnableClientScript="false" Runat="server" />
				<asp:RegularExpressionValidator ID="vldName2" Text="*" ControlToValidate="txtName" Runat="server" EnableClientScript="false" />
			</td>
		</tr>
		<tr><th></th>
			<td><asp:Button id="btnSubmit" runat="server" />
				&nbsp;
				<asp:Button id="btnCancel" CausesValidation="false" runat="server" />
			</td>
		</tr>
		</table>
		</fieldset>
	</div>
