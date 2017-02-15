<%@ Control Language="c#" AutoEventWireup="false" Codebehind="FormSetupChecklist.ascx.cs" Inherits="Jenzabar.CRM.Common.Web.Portlets.FormBuilderPortlet.FormSetupChecklist" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<jenzabar:SubHeader id="hdrFormName" runat="Server"></jenzabar:SubHeader>
<div class="pSection">
<TABLE cellPadding="2" width="100%">
	<TR>
		<TD vAlign="top" noWrap align="left" width="100%" colSpan="2"><asp:label id="lblScreenMessage" runat="server"></asp:label></TD>
	</TR>
	<TR>
		<TD vAlign="top" noWrap align="left" width="100%" colSpan="2" height="68"><asp:table id="tblLinks" runat="server" HorizontalAlign="Left" Width="100%"></asp:table></TD>
	</TR>
	<TR>
		<TD vAlign="top" noWrap align="left" width="100%" colSpan="2"></TD>
	</TR>
	<TR>
		<TD vAlign="top" align="left" width="100%">
			<asp:table id="tblLegend" runat="server" Width="100%" HorizontalAlign="Left"></asp:table></TD>
	</TR>
</TABLE>
</div>
