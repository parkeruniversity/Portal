<%@ Control Language="c#" AutoEventWireup="True" Codebehind="Default.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.ResidenceInfoPortlet.Default" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<Div class="psection">
	<TABLE id="Table1" height="0" cellSpacing="3" cellPadding="3" width="100%" border="0">
		<TR>
			<TD>
				<div id="divError" runat="server" visible="false"><jenzabar:ErrorDisplay id="ctlError" RunAt="server"></jenzabar:ErrorDisplay></div>
				<div id="divMessage" runat="server" visible="False"><asp:Label ID="lblMessage" Runat="server"></asp:Label></div>
			</TD>
		</TR>
		<TR>
			<TD>
				<asp:LinkButton id="lnkViewYourResidenceInfo" runat="server" onclick="lnkViewYourResidenceInfo_Click"></asp:LinkButton>
			</TD>
		</TR>
	</TABLE>
</Div>
