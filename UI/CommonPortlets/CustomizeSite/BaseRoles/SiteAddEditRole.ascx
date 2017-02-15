<%@ Control Language="c#" AutoEventWireup="false" Codebehind="SiteAddEditRole.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.SiteAddEditRole" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@Import namespace="Jenzabar.Portal.Framework"%>
<%@ Register TagPrefix="jenz" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<cmn:Subheader id="subHeader" runat="server"></cmn:Subheader>
<div class="pSection">
	<asp:ValidationSummary ID="valSummary" Runat="server"></asp:ValidationSummary>
	<fieldset>
		<table>
			<tr>
				<th>
					<cmn:FormLabel id="lblName" runat="server" forcontrol="txtName"></cmn:FormLabel></th>
				<td>
					<asp:TextBox id="txtName" runat="server" MaxLength="50" />
					<asp:RequiredFieldValidator ID="vldName" EnableClientScript="False" ControlToValidate="txtName" Text="*" Runat="server"></asp:RequiredFieldValidator>
				    <asp:RegularExpressionValidator ID="evldName" ValidationExpression="[^;<>\\\/,:?_+&#=]+" ControlToValidate="txtName" Text="*" runat="server"></asp:RegularExpressionValidator>
				</td>
			</tr>
		</table>
	</fieldset>
</div>
<div class="pSection">
	<div class="psCell">
		<jenz:PrincipalSelector ID="ps" runat="server"></jenz:PrincipalSelector>
	</div>
</div>
<div class="pActionsTransp">
	<asp:Button id="btnSubmit" runat="server" />
	&nbsp;
	<asp:Button id="btnCancel" CausesValidation="False" runat="server" />
</div>
