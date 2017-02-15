<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="FCCDefault.ascx.cs" Inherits="Jenzabar.CRM.Faculty.Web.Portlets.FacultyCourseControlPortlet.FCCDefault" %>
<%@ Register TagPrefix="cmn" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<h4><asp:label id="lblCrsListFor" runat="server"></asp:label></h4>
<div class="pSection" id="divMain" runat="server" visible="False">
	<table cellSpacing="3" cellPadding="0" width="100%" border="0">
		<tr>
			<td><cmn:globalizedlinkbutton id="lnkViewDetails" runat="server" TextKey="TXT_VIEW_DETAILS"></cmn:globalizedlinkbutton></td>
			<td align="right"><cmn:globalizedlinkbutton id="lnkFacultySchedule" runat="server" TextKey="TXT_FAC_VIEW_MY_FACULTY_SCHEDULE"></cmn:globalizedlinkbutton></td>
		</tr>
	</table>
	<table cellSpacing="0" cellPadding="0" width="100%" border="0">
		<tr>
			<td colSpan="2">
				<cmn:GroupedGrid id="ggCourseList" Runat="server" DataKeyField="ERPCourseKey" RenderTableHeaders="true">
					<TableHeaderTemplate><%= base._tableHeaderText %></TableHeaderTemplate>
					<Columns>
						<cmn:GlobalizedBoundColumn DataField="DisplayedCourseCode" HeaderTextKey="TXT_COURSE" />
						<cmn:GlobalizedBoundColumn DataField="Title" HeaderTextKey="TXT_TITLE" />
						<cmn:GlobalizedTemplateColumn HeaderTextKey="TXT_GO_DIRECTLY_TO">
							<ItemTemplate>
								<asp:Label Runat=server AssociatedControlID="ddlGoTo" CssClass="accessibility" ID="Label1" NAME="Label1">Select Area</asp:Label>
								<asp:DropDownList ID="ddlGoTo" Runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList_SelectedIndexChanged"/>
							</ItemTemplate>
						</cmn:GlobalizedTemplateColumn>
						<cmn:GlobalizedBoundColumn DataField="EditFinalGrades" Visible="False" HeaderTextKey="Final" />
						<cmn:GlobalizedBoundColumn DataField="EditMidTermGrades" Visible="False" HeaderTextKey="MidTerm" />
					</Columns>
				</cmn:GroupedGrid>
			</td>
		</tr>
	</table>
</div>
