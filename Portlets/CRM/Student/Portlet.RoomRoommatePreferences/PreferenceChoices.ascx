<%@ Control Language="c#" AutoEventWireup="false" Codebehind="PreferenceChoices.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.RoomRoommatePreferencesPortlet.PreferenceChoices" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<h4><asp:label id="lblTitle" runat="server"></asp:label></h4>
<DIV class="pSection">
	<TABLE id="Table1" height="0" cellSpacing="3" cellPadding="3" width="100%" border="0">
		<TR>
			<TD>
				<div id="divError" visible="false" runat="server"><jenzabar:errordisplay id="ctlError" RunAt="server"></jenzabar:errordisplay></div>
				<div id="divMessage" visible="False" runat="server"><asp:label id="lblMessage" Runat="server"></asp:label></div>
			</TD>
		</TR>
		<TR>
			<TD><h6><asp:literal id="lblPrefRoomType" runat="server" Visible="True"></asp:literal></h6>
				<TABLE id="Table2" height="0" cellSpacing="5" cellPadding="5" width="75%" border="0">
					<TR>
						<TD><jenzabar:hint id="lblPrefRoomTypeInst" runat="server" Visible="True"></jenzabar:hint></TD>
					</TR>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:label id="lblType" runat="server"></asp:label>
							<asp:DropDownList id="ddlType" runat="server" Width="200px"></asp:DropDownList>
						</td>
					</tr>
					<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label id="lblRoomTypeError" runat="server" Visible="False" ForeColor="Red"></asp:Label></td></tr>
				</TABLE>
			</TD>
		</TR>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<TR>
			<TD><h6><asp:literal id="lblMyRoommatePrefStatus" runat="server" Visible="True"></asp:literal></h6>
				<TABLE id="Table3" height="0" cellSpacing="5" cellPadding="5" width="75%" border="0">
					<TR>
						<TD><jenzabar:hint id="lblMyRoommatePrefStatusInst" runat="server" Visible="True"></jenzabar:hint></TD>
					</TR>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;<asp:label id="lblStatus" runat="server"></asp:label>
							<asp:DropDownList id="ddlStatus" runat="server" Width="200px"></asp:DropDownList></td>
					</tr>
				</TABLE>
			</TD>
		</TR>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<TR>
			<TD>
				<asp:button id="btnSave" runat="server" Width="75px"></asp:button>&nbsp;&nbsp;&nbsp;<asp:button id="btnCancel" runat="server" Width="75px" CausesValidation="False"></asp:button>
			</TD>
		</TR>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<TR>
			<TD>
				<div id="divLnkRoomPref" runat="server"><asp:linkbutton id="lnkRoomPref" runat="server"></asp:linkbutton></div>
			</TD>
		</TR>
		<TR>
			<TD>
				<div id="divLnkRoommatePref" runat="server"><asp:linkbutton id="lnkRoommatePref" runat="server"></asp:linkbutton></div>
			</TD>
		</TR>
	</TABLE>
</DIV>
