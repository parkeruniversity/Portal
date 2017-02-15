<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Default.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.RoomRoommatePreferencesPortlet.Default" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<h4><asp:label id="lblTitle" Visible="True" runat="server"></asp:label></h4>
<Div class="pSection">
	<TABLE id="Table1" height="0" cellSpacing="3" cellPadding="3" width="100%" border="0">
		<TR>
			<TD>
				<div id="divError" runat="server" visible="false"><jenzabar:errordisplay id="ctlError" RunAt="server"></jenzabar:errordisplay></div>
				<div id="divMessage" runat="server" visible="False"><asp:Label ID="lblMessage" Runat="server"></asp:Label></div>
			</TD>
		</TR>
		<TR>
			<TD><asp:linkbutton id="lnkSetup" runat="server"></asp:linkbutton>
			</TD>
		</TR>
		<TR>
			<TD><asp:linkbutton id="lnkSetOptions" runat="server"></asp:linkbutton>
			</TD>
		</TR>
		<TR>
			<TD><div id="divLnkPrefChoices" runat="server">&nbsp;&nbsp;&nbsp;<asp:linkbutton id="lnkPrefChoices" runat="server"></asp:linkbutton></div>
			</TD>
		</TR>
		<TR>
			<TD>
				<div id="divLnkRoomPref" runat="server">&nbsp;&nbsp;&nbsp;<asp:linkbutton id="lnkRoomPref" runat="server"></asp:linkbutton></div>
			</TD>
		</TR>
		<TR>
			<TD>
				<div id="divLnkRoommatePref" runat="server">&nbsp;&nbsp;&nbsp;<asp:linkbutton id="lnkRoommatePref" runat="server"></asp:linkbutton></div>
			</TD>
		</TR>
	</TABLE>
</Div>
