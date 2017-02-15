<%@ Register TagPrefix="cmn" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Default.ascx.cs" Inherits="Jenzabar.CRM.Faculty.Web.Portlets.GradeEntryPortlet.Default" %>
<div class="pSection" id="divError" runat="server" visible="False"><cmn:errordisplay id="ctlError" RunAt="server"></cmn:errordisplay></div>
<div class="pSection" id="divWarning" runat="server" visible="False"><asp:label id="lblWarning" Runat="server" CssClass="PortletError"></asp:label></div>
<div class="pSection" id="divMessage" runat="server" visible="False"><asp:label id="lblMessage" Runat="server"></asp:label></div>
<div class="pSection" id="divSetup" runat="server" visible="False">
	<table cellSpacing="1" cellPadding="1" width="100%">
		<tr>
			<td><cmn:globalizedlinkbutton id="lnkSetup" runat="server" Visible="False" TextKey="TXT_FACT_GE_SETUP"></cmn:globalizedlinkbutton></td>
		</tr>
	</table>
</div>
<div class="pSection" id="divViewCourseList" runat="server" visible="False">
	<table cellSpacing="1" cellPadding="1" width="100%">
		<tr>
			<td><cmn:globalizedlinkbutton id="lnkViewCourseList" runat="server" Visible="True" TextKey="TXT_FACT_GE_VIEW_COURSE_LIST_LINK"></cmn:globalizedlinkbutton></td>
		</tr>
	</table>
</div>
