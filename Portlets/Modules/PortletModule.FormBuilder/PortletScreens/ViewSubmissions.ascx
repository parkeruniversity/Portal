<%@ Control Language="C#" AutoEventWireup="false" CodeBehind="ViewSubmissions.ascx.cs" Inherits="Jenzabar.Portal.Framework.Web.PortletModules.FormBuilder.PortletScreens.ViewSubmissions" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Import namespace="Jenzabar.Common.Globalization"%>
<h4><jenzabar:globalizedliteral id="litSetup" runat="server" textkey="FB_VIEW_SUBMISSIONS_TXT" /></h4>
<div class="FormBuilder">
	<div class="pSection">
		<b><%=Form.Name%></b> (<a id="aChooseForm" runat="server" />)
		<br/><br/>
		<asp:Repeater ID="rptrSubs" Runat="server">
			<HeaderTemplate>
				<table class="GridStyle GridStyleFullWidth" cellpadding="2" cellspacing="0">
					<thead>
					<tr>
						<td colspan="3"><img src="UI/Common/Images/PortletImages/Icons/fb_icon_submissions.gif" width="16" height="17" align="middle" alt="Recent Submissions" /> <%=Globalizer.GetGlobalizedString("FB_RECENT_SUBS")%></td>
					</tr>
					</thead>
					<tr>
						<th>Name</th>
						<th>Review Submission</th>
						<th class="RightTableCell"><%=Globalizer.GetGlobalizedString("TXT_DATE_SUBMITTED")%></th>
					</tr>
			</HeaderTemplate>
			<ItemTemplate>
					<tr id="tr" runat="server">
						<td><asp:Literal ID="litUName" Runat="server" /></td>
						<td><a id="aSingleIcon" runat="server"><img src="UI/Common/Images/PortletImages/Icons/fb_icon_submissions.gif" width="16" height="17" align="middle" alt="Recent Submission" border="0" /></a> <a id="aSingle" runat="server">Review</a></td>
						<td class="RightTableCell"><asp:Literal ID="litLastUpdated" runat="server" /></td>
					</tr>
			</ItemTemplate>
			<FooterTemplate>
				</table>
				<div class="fbFloatRight">
				    <a href="<%=this.ParentPortlet.GetNextScreenURL("FormBuilder//PortletScreens/ViewSubmission_All//" + Form.ID.AsGuid.ToString() + "//1")%>"><img src="UI/Common/Images/PortletImages/Icons/fb_icon_submissions.gif" width="16" height="17" align="middle" alt="View All Submissions" border="0" /></a> <a href="<%=this.ParentPortlet.GetNextScreenURL("FormBuilder//PortletScreens/ViewSubmission_All//" + Form.ID.AsGuid.ToString() + "//1")%>"><%=Globalizer.GetGlobalizedString("TXT_VIEW_ALL_SUBMISSIONS")%></a>
				    <br /><br />
				    <img src="UI/Common/Images/PortletImages/Icons/print.gif" width="14" height="17" align="middle" alt="Print All Submissions" border="0" /> <a href="<%=this.ParentPortlet.GetNextScreenURL("FormBuilder//PortletScreens/ViewSubmissions//" + Form.ID.AsGuid.ToString() + "//DoPrintAllSubs")%>"><%=Globalizer.GetGlobalizedString("TXT_PRINT_ALL_SUBMISSIONS")%></a>
				</div>
			</FooterTemplate>
		</asp:Repeater>
		<br/><br />
		<div class="fbClearBoth"></div>
		<br/><br />
		<asp:Repeater ID="rptrSubsInProg" Runat="server">
			<HeaderTemplate>
				<table class="GridStyle GridStyleFullWidth" cellpadding="2" cellspacing="0" border="0">
					<thead>
					<tr>
						<td colspan="3"><img src="UI/Common/Images/PortletImages/Icons/fb_icon_submissions_sfl.gif" width="16" height="17" align="middle" alt="Recent Submissions" /> <%=Globalizer.GetGlobalizedString("FB_ALL_SAVED_FORMS_TXT")%></td>
					</tr>
					</thead>
					<tr>
						<th>Name</th>
						<th>Review Saved Form</th>
						<th class="RightTableCell"><%=Globalizer.GetGlobalizedString("TXT_LAST_SAVED_ON")%></th>
					</tr>
			</HeaderTemplate>
			<ItemTemplate>
					<tr id="tr" runat="server">
						<td><asp:Literal ID="litUName" Runat="server" /></td>
						<td><a id="aSingleIcon" runat="server"><img src="UI/Common/Images/PortletImages/Icons/fb_icon_submissions_sfl.gif" width="16" height="17" align="middle" alt="Recent Submission" border="0" /></a> <asp:Literal ID="litPercent" runat="server" /> <a id="aSingle" runat="server"> <%=Globalizer.GetGlobalizedString("TXT_REVIEW")%></a></td>
						<td class="RightTableCell"><asp:Literal ID="litLastUpdated" runat="server" /></td>
					</tr>
			</ItemTemplate>
			<FooterTemplate>
				</table>
				<div class="fbFloatRight"><a href="<%=this.ParentPortlet.GetNextScreenURL("FormBuilder//PortletScreens/ViewSubmission_All//" + Form.ID.AsGuid.ToString() + "//0")%>"><img src="UI/Common/Images/PortletImages/Icons/fb_icon_submissions_sfl.gif" width="16" height="17" align="middle" alt="View All Submissions" border="0" /></a> <a href="<%=this.ParentPortlet.GetNextScreenURL("FormBuilder//PortletScreens/ViewSubmission_All//" + Form.ID.AsGuid.ToString() + "//0")%>">View all saved forms</a></div>
			</FooterTemplate>
		</asp:Repeater>
		<div class="fbClearBoth"></div>
		<br/>
		<a id="aBack" runat="server" />
	</div>		
</div>	