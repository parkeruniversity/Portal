<%@ Register TagPrefix="common" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Targeting_ViewSingleTemplate.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.Targeting_ViewSingleTemplate" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<div class="pSection">
	<common:SubHeader id="shTemplateHeader" runat="server" />
	<table id="tblShowMessage" cellpadding="7px" cellspacing="0">
		<tr>
			<th>
				<common:GlobalizedLiteral id="litLblShowTo" runat="server" textKey="LBL_SHOW_TO" /></th>
			<td><asp:Literal ID="LitRoles" Runat="server" /></td>
		</tr>
		<tr>
			<th>
				<common:GlobalizedLiteral id="litLblStatus" runat="server" textKey="LBL_STATUS" /></th>
			<td><asp:Literal ID="LitStatus" Runat="server" /></td>
		</tr>
		<tr>
			<th>
				<common:GlobalizedLiteral id="litLblContent" runat="server" textKey="LBL_CONTENT" /></th>
			<td><asp:Literal ID="LitContent" Runat="server" /></td>
		</tr>
		<tr>
			<td id="ContentCell" colspan="2"></td>
		</tr>
		<tr>
			<th>
			</th>
			<td id="ButtonCell">
				<asp:LinkButton Runat="server" ID="btnEdit" />&nbsp;&nbsp;&nbsp;&nbsp;
				<asp:LinkButton Runat="server" ID="btnDelete" />&nbsp;&nbsp;&nbsp;&nbsp;
				<common:GlobalizedLinkButton Runat="server" ID="btnActivateTemplate" textKey="TXT_ACTIVATE_COPY_OF_TEMPLATE" />
			</td>
		</tr>
	</table>
</div>
