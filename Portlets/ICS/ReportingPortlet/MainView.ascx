<%@ Control Language="c#" AutoEventWireup="false" Codebehind="MainView.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.ReportingPortlet.MainView" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Import namespace="Jenzabar.ICS" %>

<!-- This value is the number of days JICS should wait before re-loading the user count into memory. -->
<asp:Literal ID="DaysToCacheUserCount" Text="1" Visible="False" Runat="server" />

<style>
	ul.reportingStatus li strong { padding-left: 10px; }
</style>

<div class="pSection">

<h5><%= Globalizer.GetGlobalizedString("TXT_CURRENT_STATUS") %></h5>

<common:Hint ID="MissingPerfMonError" TextKey="ERR_REPORTING_MISSING_PERFMON" visible="false" runat="server" />

<ul class="reportingStatus">
	<li>
		<%= Globalizer.GetGlobalizedString("TXT_USERS_IN_SYSTEM") %>
		<strong><%= this.UsersInSystem.ToString() %></strong>
	</li>
	<li id="UsersOnlineItem" runat="server">
		<%= Globalizer.GetGlobalizedString("TXT_USERS_ONLINE_NOW") %>
		<strong><%= this.UsersOnlineNow.ToString() %></strong>
	</li>
</ul>

<a href="<%= this.ReportingToolUrl %>" target="_newWindow"><%= Globalizer.GetGlobalizedString("MSG_REPORTING_REPORT_TOOL_LINK") %></a>

</div>
