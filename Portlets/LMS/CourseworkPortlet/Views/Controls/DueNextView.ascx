<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DueNextView.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.DueNextView" %>
<div class="dueNext">
	<asp:Label ID="_lblDueNext" CssClass="dueNextTitle" runat="server" />
	<asp:Repeater id="_rptDueNext" runat="server">
		<ItemTemplate>
			<asp:Panel ID="_panDueNext" CssClass="dueNextAssignment" runat="server">
				<asp:HyperLink ID="_hypAssign" runat="server" />
				<asp:Label ID="_lblInfo" runat="server" />
				<br />
				<asp:Literal ID="_litDueDate" runat="server" />
			</asp:Panel>
		</ItemTemplate>
	</asp:Repeater>
	<div class="dueNextViewAll">
		<asp:HyperLink ID="_hypAll" runat="server" />
	</div>
</div>