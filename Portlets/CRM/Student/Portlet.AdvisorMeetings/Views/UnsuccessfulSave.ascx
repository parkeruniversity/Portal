<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Import namespace="Jenzabar.CRM.Student.Web.Portlets.AdvisorMeetingsPortlet" %>
<%@ Import namespace="Jenzabar.Portal.Framework" %>
<%@ Register TagPrefix="fwk" namespace="Jenzabar.Portal.Framework.Web.UI.Controls" assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UnsuccessfulSave.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.AdvisorMeetingsPortlet.UnsuccessfulSave" %>
<div class="pSection" id="divError" runat="server" visible="False"><cmn:errordisplay id="ctlError" RunAt="server"></cmn:errordisplay></div>
<div class="pSection" id="divWarning" runat="server" visible="False"><asp:label id="lblWarning" Runat="server" CssClass="PortletError"></asp:label></div>
<div class="psection" id="divMain" runat="server" visible="true">
	<TABLE id="tblMain" cellSpacing="2" cellPadding="2" width="95%">
		<TBODY>
  <TR>
				<TD>&nbsp</TD>
				<TD></TD>
			</TR>
  <TR>
				<TD><asp:label id="lblSaveStatus" runat="server" Font-Bold="True"></asp:label></TD>
				<TD>&nbsp;</TD>
			</TR>
  <TR>
				<TD>&nbsp;</TD>
			</TR>
  <TR>
				<TD><asp:label id="lblErrorText" runat="server" Font-Bold="True"></asp:label></TD>
			</TR>
  <TR>
				<TD>&nbsp;</TD>
			</TR>
  <TR>
				<TD><asp:linkbutton id="lnkMeetingDetails" runat="server" OnClick="lnkMeetingDetails_Click"></asp:linkbutton></TD>
			</TR>
  <TR>
				<TD>&nbsp;</TD>
			</TR>
  <TR>
				<TD><asp:linkbutton id="lnkMeetingList" runat="server" OnClick="lnkMeetingList_Click"></asp:linkbutton></TD>
			</TR></TR></TBODY></TABLE>
</div>
