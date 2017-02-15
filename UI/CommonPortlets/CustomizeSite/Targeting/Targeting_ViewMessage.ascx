<%@ Register TagPrefix="common" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Targeting_ViewMessage.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.Targeting_ViewMessage" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<div class="pSection">
	<common:SubHeader id="shMessageHeader" runat="server" />
	<table id="tblShowMessage" cellpadding="7px" cellspacing="0">
		<tr>
			<th>
				<common:GlobalizedLiteral id="litLblShowTo" runat="server" textKey="LBL_SHOW_TO" /></th>
			<td><asp:Literal ID="LitRoles" Runat="server" /></td>
		</tr>
		<tr>
			<th>
				<common:GlobalizedLiteral id="litLblDateRange" runat="server" textKey="LBL_DATE_RANGE" /></th>
			<td><asp:Literal ID="LitDateRange" Runat="server" /></td>
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
				<common:GlobalizedLinkButton Runat="server" ID="btnPreviewMessage" textKey="TXT_PREVIEW_THIS_MESSAGE" />&nbsp;&nbsp;&nbsp;&nbsp;
				<common:GlobalizedLinkButton Runat="server" ID="btnSaveAsTemplate" textKey="TXT_SAVE_AS_TEMPLATE" />
			</td>
		</tr>
	</table>
</div>
