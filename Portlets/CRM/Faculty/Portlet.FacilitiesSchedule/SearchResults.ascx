<%@ Control Language="c#" AutoEventWireup="false" Codebehind="SearchResults.ascx.cs" Inherits="Jenzabar.CRM.Faculty.Web.Portlets.FacilitiesSchedulePortlet.SearchResults" %>
<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<h4><jenzabar:GlobalizedLabel id="lblTerm" TextKey="TXT_TERM" Runat="server"></jenzabar:GlobalizedLabel>:&nbsp;<asp:label id="lblTermName" Runat="server"></asp:label>
<jenzabar:GlobalizedLabel id="lblCampus" TextKey="TXT_CAMPUS" Runat="server"></jenzabar:GlobalizedLabel>:&nbsp;<asp:label id="lblCampusName" Runat="server"></asp:label></h4>
			
<div class="pSection"><jenzabar:errordisplay id="errDisplay" Runat="server"></jenzabar:errordisplay>

	<div id="divResults" runat="server">
	<table cellSpacing="0" cellPadding="0" width="100%">
		<tr>
			<th noWrap>
				&nbsp;
				<jenzabar:GlobalizedLabel id="lblPosition" TextKey="TXT_FS_POSITION_TO_ROOM" Runat="server"></jenzabar:GlobalizedLabel>:&nbsp;
				<asp:dropdownlist id="ddlRoom" Runat="server"></asp:dropdownlist>
			</th>
		</tr>
	</table>
	<jenzabar:groupedgrid id="facGrid" runat="server" CellPadding="0" renderGroupHeaders="true">
			<GroupHeaderTemplate><a name='<%#DataBinder.Eval(Container.DataItem, "ERPRoomKey")%>'></a>
				<%#Globalizer.GetGlobalizedString("TXT_BUILDING")%>: <%#DataBinder.Eval(Container.DataItem, "BuildingDesc")%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<%#Globalizer.GetGlobalizedString("TXT_ROOM")%>: <%#DataBinder.Eval(Container.DataItem, "RoomDesc")%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<%#Globalizer.GetGlobalizedString("TXT_FS_ROOM_CAPACITY")%>: <%#DataBinder.Eval(Container.DataItem, "RoomCapacity")%>
				
			</GroupHeaderTemplate>
			<Columns>
				<jenzabar:GlobalizedBoundColumn HeaderTextKey="TXT_COURSE" DataField="CourseCode"></jenzabar:GlobalizedBoundColumn>
				<jenzabar:GlobalizedBoundColumn HeaderTextKey="TXT_TITLE" DataField="Title"></jenzabar:GlobalizedBoundColumn>
				<jenzabar:GlobalizedBoundColumn DataField="DivisionCode"></jenzabar:GlobalizedBoundColumn>
				<jenzabar:GlobalizedBoundColumn HeaderTextKey="TXT_CATALOG" DataField="CatalogCode"></jenzabar:GlobalizedBoundColumn>
				<jenzabar:GlobalizedBoundColumn HeaderTextKey="TXT_DAYS" DataField="Weekdays"></jenzabar:GlobalizedBoundColumn>
				<jenzabar:GlobalizedBoundColumn HeaderTextKey="TXT_MEETS" DataField="MeetTime"></jenzabar:GlobalizedBoundColumn>
				<jenzabar:GlobalizedBoundColumn HeaderTextKey="TXT_DATES" DataField="Dates"></jenzabar:GlobalizedBoundColumn>
			</Columns>
	</jenzabar:groupedgrid>
	
</div>
</div>



<SCRIPT language="JavaScript">
function gotoAnchor(control) {
	window.location.hash=control.options[control.selectedIndex].value;
	return false;
}
function gotoTop() {

	window.location.hash="_Top";
	return false;
}
</SCRIPT>
