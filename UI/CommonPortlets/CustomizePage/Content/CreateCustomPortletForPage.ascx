<%@ Control Language="c#" AutoEventWireup="false" Codebehind="CreateCustomPortletForPage.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.Controls.CreateCustomPortletForPage" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<div class="pSection">
<asp:ValidationSummary id="valSummary" runat="server"></asp:ValidationSummary>
	<table>
		<tr>
			<th><cmn:FormLabel id="lblTitle" ForControl="txtContentName" Runat="server" /></th>
			<td><asp:TextBox ID="txtContentName" Columns="30" MaxLength="50" Runat="server"></asp:TextBox><asp:RequiredFieldValidator id="rqvContentName" runat="server" ControlToValidate="txtContentName">*</asp:RequiredFieldValidator></td>
		</tr>
		<tr>
			<th>
			</th>
			<td>
				<asp:Button ID="btnCreate" Runat="server" />
				<asp:Button ID="btnCancel" CausesValidation="False" Runat="server" />
			</td>
		</tr>
	</table>
</div>
