<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RecentActionSubmissionView.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.RecentActionSubmissionView" %>
<div class="recentSubmissions">
	<asp:Label ID="_lblRecentSub" CssClass="recentSubTitle" runat="server" />
	<asp:Label ID="_lblNoRecent" CssClass="recentSubNo" runat="server" />
	<asp:Repeater ID="_rptSubmissions" runat="server">
		<ItemTemplate>
			<div class="recentSubs">
				<asp:HyperLink ID="_hypLink" CssClass="recentUser" runat="server" />
				<asp:Literal ID="_litAction" runat="server" />
                <asp:HyperLink ID="_hypAssignLink" runat="server" /><asp:Literal ID="_litSubmitDate" runat="server" />
			</div>
		</ItemTemplate>
	</asp:Repeater>
	<div class="recentActionAll">
		<asp:HyperLink ID="_hypAll" runat="server" />
	</div>
</div>