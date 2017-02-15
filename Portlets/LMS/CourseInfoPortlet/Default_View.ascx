<%@ Import namespace="Jenzabar.ICS" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Default_View.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseInfoPortlet.Default_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="framework" namespace="Jenzabar.Portal.Framework.Web.UI.Controls" assembly="Jenzabar.Portal.Framework.Web" %>
<div class="pSection">
	<div id="TermInfo">
		<p>
			<asp:Literal ID="litCourseTitle" Runat=server />
		</p>
		<p>
			<cmn:globalizedliteral id="litTermLabel" Runat=server textKey="LBL_TERM" />&nbsp;<asp:Literal ID="litTerm" Runat=server />
		</p>
	</div>
	<div id="Faculty"><cmn:subheader id="shFaculty" runat="server"></cmn:subheader>
		<asp:Repeater ID=rptFaculty Runat=server>
			<ItemTemplate>
				<table cellSpacing="0" cellPadding="5" border="0">
					<tr valign=top>
						<td align="left" rowSpan="5"><asp:image id="Photo" Runat="server" ImageAlign="Top"></asp:image></td>
					</tr>
					<tr valign=top>
						<td><framework:myinfopopup id="FullNamePopup" runat="server"></framework:myinfopopup></td>
					</tr>
					<tr runat=server id=rowEmail valign=top>
						<td>
						  <asp:Label ID="lblPrivateEmail" Runat="server" Visible="False" />
						  <asp:LinkButton id="EmailAddress" Runat="server" />
						</td>
					</tr>
					<tr runat=server id=rowOfficeHours valign=top>
						<td vAlign="top"><b><asp:label id="OfficeHoursHeader" Runat="server"></asp:label></b>
						<asp:repeater id="OfficeHoursRepeater" Runat="server">
								<ItemTemplate>
									<li><%# ((OfficeHours)Container.DataItem).MainText %></li>
									<li id="Note" class="mainInfoNote" visible="false" runat="server"><%# ((OfficeHours)Container.DataItem).SecondaryText %></li>
								</ItemTemplate>
							</asp:repeater>
					</td>
					</tr>
					<tr>
						<td height="100%">&nbsp;</td>
					</tr>
				</table>
			</ItemTemplate>
		</asp:Repeater>
		<asp:Label id=lblNoFaculty Visible=False Runat=server cssclass="ApplicationError"></asp:Label>
	</div>
	<div id="Schedule" runat=server><cmn:subheader id="shSchedule" runat="server"></cmn:subheader>
		<p class="pSection">
			<asp:repeater id="ScheduleRepeater" Runat="server">
				<ItemTemplate>
					<%# BuildSchedule(Container.DataItem) %>
				</ItemTemplate>
			</asp:repeater>
		</p>
	</div>
	<div  id="CourseDescription"><cmn:subheader id="shDescription" runat="server"></cmn:subheader>
		<p class="pSection">
			<asp:literal id="litDescription" runat="server"></asp:literal>
		</p>
	</div>
</div>
<div class="buttonBar" style="MARGIN-TOP: 10px; TEXT-ALIGN: right">
	<asp:linkbutton id="lnkShowMain" runat="server"></asp:linkbutton>
</div>
