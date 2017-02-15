<%@ Control Language="c#" AutoEventWireup="True" Codebehind="ChangeWaitlistedToCurrent.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.CourseSchedulesPortlet.ChangeWaitlistedToCurrent" %>
<%@ Register TagPrefix="cmn" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common"%>
<div id="divError" runat="server"><cmn:errordisplay id="ctlError" RunAt="server"></cmn:errordisplay></div>
<asp:Literal ID="litCourseKey" Runat="server" Visible="False"></asp:Literal>
<div class="pSection" id="divMain" runat="server" visible="true">
	<table width="100%">
		<tr>
			<td noWrap><asp:literal id="litCourse" runat="server"></asp:literal></td>
			<td noWrap><asp:literal id="litCourseValue" Runat="server"></asp:literal></td>
			<td noWrap><asp:literal id="litCredits" runat="server"></asp:literal></td>
			<td noWrap><asp:literal id="litTerm" runat="server"></asp:literal></td>
			<td noWrap><asp:literal id="litDivision" runat="server"></asp:literal></td>
		</tr>
		<tr>
			<td colSpan="5">
				<p><asp:literal id="litWaitlistDesc" Runat="server"></asp:literal></p>
			</td>
		</tr>
		<tr>
			<td colSpan="5"><asp:button id="btnChangeWaitlistedToCurrent" Runat="server" onclick="btnChangeWaitlistedToCurrent_Click"></asp:button>&nbsp;&nbsp;
				<asp:button id="btnCancel" Runat="server" onclick="btnCancel_Click"></asp:button></td>
		</tr>
	</table>
</div>
