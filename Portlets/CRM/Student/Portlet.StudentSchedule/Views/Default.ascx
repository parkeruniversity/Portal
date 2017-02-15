<%@ Control Language="c#" AutoEventWireup="True" Codebehind="Default.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.StudentSchedulePortlet.Default"%>
<%@ Import namespace="Jenzabar.CRM.Student.Web.Portlets.StudentSchedulePortlet" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<div id="divPageHeader" align="left" visible="False" runat="server">
<h4><asp:label id="lblCourseSched" Runat="server" Visible="true" Font-Bold="True" OnCommand="lnkCourse_Click"></asp:label></h4></div>
<div class="pSection" id="divMain" visible="false" runat="server">
	<table cellSpacing="0" cellPadding="0" width="100%">
		<tr>
			<td align="right"><asp:linkbutton id="lnkView" runat="server" Visible="true" OnCommand="lnkView_Click"></asp:linkbutton></td>
		</tr>
	</table>
	<div class="smalltext" id="divSchedule" visible="false" runat="server">
		<cmn:groupedgrid id="ggCourses" runat="server" CssClass="groupedGrid" RenderTableHeaders="True" OnItemCommand="lnkCourse_Click">
			<TableHeaderTemplate>
				<%= base._tableHeaderText %>
			</TableHeaderTemplate>
			<Columns>
				<cmn:GlobalizedTemplateColumn HeaderText="TXT_COURSE" HeaderTextKey="TXT_COURSE" ItemStyle-Wrap="False" ItemStyle-VerticalAlign="Top">
					<ItemTemplate>
						<cmn:GlobalizedLinkButton ID="lnkCourse" Runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "DisplayedCourseCode")%>' CommandArgument='<%#DataBinder.Eval(Container.DataItem, "ERPCourseKey")%>' TextKey="TXT_CS_MOVE_TO_CURRENT" Visible='true'>
						</cmn:GlobalizedLinkButton>
					</ItemTemplate>
				</cmn:GlobalizedTemplateColumn>
				<cmn:GlobalizedTemplateColumn HeaderText="TXT_TITLE" HeaderTextKey="TXT_TITLE">
					<ItemStyle VerticalAlign="Top"></ItemStyle>
					<ItemTemplate>
						<%# DataBinder.Eval( Container.DataItem, "Title" ).ToString() %>
					</ItemTemplate>
				</cmn:GlobalizedTemplateColumn>
				<cmn:GlobalizedTemplateColumn HeaderText="TXT_MEET_TIMES" HeaderTextKey="TXT_MEETS" ItemStyle-VerticalAlign="Top"
					ItemStyle-Wrap="False">
					<ItemTemplate>
						<ul>
							<asp:Repeater ID="rptScheduleP" DataSource='<%#DataBinder.Eval(Container.DataItem, "Schedules")%>' Runat="server">
								<ItemTemplate>
									<li>
										<%#DataBinder.Eval(Container.DataItem, "Weekdays")%>
										-<%#DataBinder.Eval(Container.DataItem, "MeetTime")%></li>
								</ItemTemplate>
							</asp:Repeater>
						</ul>
					</ItemTemplate>
				</cmn:GlobalizedTemplateColumn>
			</Columns>
			<EmptyTableTemplate>
				<div class="PortletError">
					<%= Globalizer.GetGlobalizedString("MSG_NO_STUDENT_COURSES") %>
				</div>
			</EmptyTableTemplate>
		</cmn:groupedgrid></div>
</div>
