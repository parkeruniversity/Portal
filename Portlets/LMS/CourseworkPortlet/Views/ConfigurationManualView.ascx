<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ConfigurationManualView.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.ConfigurationManualView" %>
<%@ Register TagPrefix="framework" Assembly="Jenzabar.Portal.Framework.Web" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" %>
<%@ Register TagPrefix="common" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>

<div class="cwkBorderButtonBar top">
	<framework:PortalImageAndHyperLink ID="_pihBack" ImageCategory="PortletIcon"  runat="server" />
</div>

<asp:Label ID="_lblHeader" runat="server" CssClass="cwkHeader" />
<div class="pSection">

	<asp:UpdatePanel ID="_updatePanel" runat="server">
	<ContentTemplate>
		<asp:Label id="_lblOrg" runat="server" /> <asp:DropDownList ID="_ddlOrg" AutoPostBack="true" EnableViewState="false" runat="server" />
		<div class="assignReorderContainer">
		<table class="assignmentGrid reorderHeader" cellpadding="0" width="100%" runat="server" id="_tblHeader"  cellspacing="0">
			<tr>
				<th class="assignMetaNameHeader" > <asp:Literal ID="_litHeaderName" runat="server" /> </th>
				<th class="assignMetaDate"> <asp:Literal ID="_litHeaderDate" runat="server" /></th>
				<th class="assignMetaOrgHeader"> <asp:Literal ID="_litHeaderOrg" runat="server" /></th>
			</tr>
		</table>
		<ajax:ReorderList ID="_reorderAssignment" CssClass="reorderList" AllowReorder="true" DragHandleAlignment="Left" PostBackOnReorder="true" runat="server">
				<ItemTemplate>
					<table class="reorderAssignment" cellpadding="0" cellspacing="0" runat="server" id="_tblReorder">
						<tr>
							<td class="assignMetaName">
								<asp:Literal ID="_litName" runat="server" />
							</td>
							<td class="assignMetaDate">
								<asp:Literal ID="_litDueDate" runat="server" />
							</td>
							<td class="assignMetaOrg" id="_tdOrg" runat="server">
								<asp:Literal ID="_litOrg" runat="server"/>
							</td>
						</tr>
					</table>
				</ItemTemplate>
				<DragHandleTemplate>
					<div class="dragHandle" id="_divDrag" runat="server">
						&nbsp;
					</div>
				</DragHandleTemplate>
				<ReorderTemplate>
					<div class="dragReorder"></div>
				</ReorderTemplate>
			</ajax:ReorderList>
		</div>
	</ContentTemplate>
	</asp:UpdatePanel>
</div>
<div class="cwkBorderButtonBar bottom">
	<common:Mirror Id="_mirror" ControlID="_pihBack" runat="server" />
</div>
