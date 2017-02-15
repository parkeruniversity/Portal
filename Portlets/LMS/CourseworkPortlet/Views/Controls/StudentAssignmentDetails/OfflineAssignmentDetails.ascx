<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OfflineAssignmentDetails.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.StudentAssignmentDetails.OfflineAssignmentDetails" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<div class="readingDetails">
	<asp:Label id="_lblReading" runat="server" />
	<div class="readings">
		<asp:Repeater runat="server" ID="rptrAssignmentReadings">
			<ItemTemplate>
				<ul id="_ul" runat="server">
				</ul>
			</ItemTemplate>
		</asp:Repeater>
	</div>
</div>