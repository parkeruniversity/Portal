<%@ Control CodeBehind="ManageForms.ascx.cs" Language="c#" AutoEventWireup="false" Inherits="Jenzabar.CRM.Common.Web.PortletModule.EX.FormBuilder.PortletScreens.ManageForms" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="framework" namespace="Jenzabar.Portal.Framework.Web.UI.Controls" assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<script language="JavaScript" src="<%= this.ResolveUrl("~/UI/Common/Scripts/jenz.js") %>"></script>
<script language="javascript">
function confirmDeleteForm(fname)
{
    return confirm('<%= ConfirmDeleteMsg %> "' + fname + '"?');
}
</script>
<jenzabar:errordisplay id="error" Runat="server" />
<h4><asp:literal id="litManage" runat="server" /></h4>
<div class="pSection">
	<table class="GrayBordered" width="100%" cellpadding="3" border="0">
		<tr>
			<td><asp:literal id="litText" runat="server" /></td>
		</tr>
	</table>
	<asp:Repeater ID="rptMainGrid" Runat="server">
		<HeaderTemplate>
			<table border="0" width=100% cellpadding=3 cellspacing=0>
				<tr>
					<td colspan="4" class="fbBorderTopLeftBottomRight"><b><asp:Literal ID="litHeader" runat="server" /></b></td>
				</tr>
				<tr class="fbTblAdminSubHead">
					<td class="BorderLeftBottom">&nbsp;</td>
					<td class="BorderLeftBottom"><%= _portlettextcap%></td>
					<td class="BorderLeftBottom"><%= Globalizer.GetGlobalizedString("TXT_FB_CREATOR")%></td>
					<td class="BorderLeftRightBottom"><%= Globalizer.GetGlobalizedString("TXT_FB_USAGE")%></td>
				</tr>
		</HeaderTemplate>
		<ItemTemplate>
				<tr>
					<td class="BorderLeftBottom"><asp:HyperLink id="hlEdit" Runat="server"><IMG title="" src="UI/Common/Images/PortletImages/Icons/edit.gif"></asp:HyperLink>&nbsp;<asp:ImageButton ID="ibDelete" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "formid")%>' CommandName="Delete" ImageUrl="~\UI/Common/Images/PortletImages/Icons/delete.gif" Visible="False" Runat="server" /></td>
					<td class="BorderLeftBottom"><a id="aEdit" runat="server"><%#DataBinder.Eval(Container.DataItem, "Name")%></a></td>
					<td class="BorderLeftBottom"><%#DataBinder.Eval(Container.DataItem,"CreatorFirstName")%>&nbsp;<%#DataBinder.Eval(Container.DataItem,"CreatorLastName")%></td>
					<td class="BorderLeftRightBottom"><asp:Literal ID="litCount" Runat="server" /></td>
				</tr>
		</ItemTemplate>
		<AlternatingItemTemplate>
				<tr class="fbTblAdminSubHeadAlt">
					<td class="BorderLeftBottom"><asp:HyperLink id="hlEdit" Runat="server"><IMG title="" src="UI/Common/Images/PortletImages/Icons/edit.gif"></asp:HyperLink>&nbsp;<asp:ImageButton ID="ibDelete" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "formid")%>' CommandName="Delete" ImageUrl="~\UI/Common/Images/PortletImages/Icons/delete.gif" Visible="False" Runat="server" /></td>
					<td class="BorderLeftBottom"><a id="aEdit" runat="server"><%#DataBinder.Eval(Container.DataItem, "Name")%></a></td>
					<td class="BorderLeftBottom"><%#DataBinder.Eval(Container.DataItem,"CreatorFirstName")%>&nbsp;<%#DataBinder.Eval(Container.DataItem,"CreatorLastName")%></td>
					<td class="BorderLeftRightBottom"><asp:Literal ID="litCount" Runat="server" /></td>
				</tr>
		</AlternatingItemTemplate>
		<FooterTemplate>
			</table>
		</FooterTemplate>
	</asp:Repeater>
	<a href=<%=this.ParentPortlet.GetNextScreenURL(@"FormBuilder//Main_View")%>><IMG title=""  src="UI/Common/Images/PortletImages/Icons/add.gif">&nbsp;<asp:literal id="litAddNewForm" runat="server" /></a>
</div>
