<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="True" Codebehind="Default.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.UnofficialTranscriptPortlet.Default"%>
<div class="pSection" id="divError" visible="False" runat="server"><cmn:errordisplay id="ctlError" RunAt="server"></cmn:errordisplay></div>
<div class="pSection" id="divWarning" visible="False" runat="server"><asp:label id="lblWarning" CssClass="PortletError" Runat="server"></asp:label></div>
<TABLE class="psection" id="tblMain" height="40" cellSpacing="3" cellPadding="3" Visible="false"
	runat="server">
	<TR>
		<TD><asp:linkbutton id="lnkSetup" runat="server" onclick="lnkSetup_Click"></asp:linkbutton></TD>
	</TR>
	<TR>
		<TD></TD>
	</TR>
	<TR>
		<TD><asp:label id="lblInstructions" runat="server"></asp:label></TD>
	</TR>
	<TR>
		<TD></TD>
	</TR>
	<TR>
		<TD><asp:table id="tblDivisions" runat="server" Visible="False" Width="80px"></asp:table></TD>
	</TR>
	<TR>
		<TD></TD>
	</TR>
	<TR>
		<TD><asp:linkbutton id="lnkViewTrans" runat="server" Visible="False" onclick="lnkViewTrans_Click">LinkButton</asp:linkbutton></TD>
	</TR>
	<TR>
		<TD></TD>
	</TR>
</TABLE>
