<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Admin_Main_View.ascx.cs" Inherits="Jenzabar.CRM.Web.Portlets.CourseEvaluationPortlet.Admin_Main_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="common" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="framework" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" Assembly="Jenzabar.Portal.Framework.Web" %>

<common:Subheader ID="PageHeader" Text="Comments Permissions" runat="server" />

<div class="pSection">
	<p>By default, viewers of reports can only see comment responses directed toward them, in course sections for which they are faculty members.  This screen allows certain users and roles to be granted permission to view additional comments.</p>
	
	<asp:LinkButton ID="BackButton" Text="Back to main screen" runat="server" />

	<asp:Repeater ID="CommentsAdminRepeater" runat="server">
		<HeaderTemplate>
			<table class="groupedGrid">
			<thead>
				<tr>
					<th>Department</th>
					<th>Comments Viewers</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td valign="top"><strong>View Comments For All Reports</strong></td>
					<td valign="top">
						<framework:PortalImageAndTextButton ID="AllReportsAdminButton" Text="Add Users and Roles"
								ImageCategory="PortletIcon" ImageUrl="add.gif"
								CommandName="EditAllReportsUsers" runat="server" />
						<asp:Repeater ID="AllReportsUserList" Visible="false" runat="server">
							<HeaderTemplate><ul></HeaderTemplate>
							<ItemTemplate>
								<li>
									<framework:PortalImage ID="PrincipalIcon" ImageCategory="PortletIcon" runat="server" />
									<asp:Literal ID="PrincipalName" runat="server" />
								</li>
							</ItemTemplate>
							<FooterTemplate></ul></FooterTemplate>
						</asp:Repeater>
					</td>
				</tr>
		</HeaderTemplate>
		<ItemTemplate>
				<tr class="<%# (Container.ItemIndex % 2 == 0) ? "alt" : "" %>">
					<td valign="top"><span id="DepartmentName" runat="server" /></td>
					<td valign="top">
						<framework:PortalImageAndTextButton ID="DepartmentAdminButton" Text="Add Users and Roles"
								ImageCategory="PortletIcon" ImageUrl="add.gif"
								CommandName="EditDepartmentUsers" runat="server" />
						<asp:Repeater ID="DepartmentUserList" Visible="false" runat="server">
							<HeaderTemplate><ul></HeaderTemplate>
							<ItemTemplate>
								<li>
									<framework:PortalImage ID="PrincipalIcon" ImageCategory="PortletIcon" runat="server" />
									<asp:Literal ID="PrincipalName" runat="server" />
								</li>
							</ItemTemplate>
							<FooterTemplate></ul></FooterTemplate>
						</asp:Repeater>
					</td>
				</tr>
		</ItemTemplate>
		<FooterTemplate>
			</tbody>
			</table>
		</FooterTemplate>
	</asp:Repeater>

	<common:PageNavigator ID="Pager" runat="server" />

	<asp:LinkButton ID="BackButton2" Text="Back to main screen" runat="server" />
</div>
