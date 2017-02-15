<%@ Page language="c#" Codebehind="MainPrintableView.aspx.cs" AutoEventWireup="false" Inherits="Jenzabar.CRM.Student.Web.Portlets.StudentSchedulePortlet.MainPrintableView" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Import namespace="Jenzabar.CRM.Student.Web.Portlets.StudentSchedulePortlet" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
  <HEAD>
		<title></title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="VisualStudio.HTML" name="ProgId">
		<meta content="Microsoft Visual Studio .NET 7.1" name="Originator">
  </HEAD>
	<body>
		<TABLE class="pSection" id="Table1" cellSpacing="2" cellPadding="2" width="95%" border="0">
			<TR>
				<TD noWrap width="100%" colSpan="2" height="14"><asp:label id="lblName" runat="server" Width="64px"></asp:label></TD>
			</TR>
  <TR>
    <TD noWrap width="100%" colSpan=2 height=14>&nbsp;</TD></TR>
		</TABLE>
		<cmn:groupedgrid id="ggCourses" runat="server" CssClass="groupedGrid" RenderTableHeaders="True" visible="true" font-size="XX-Small" font-family="Verdana">
				<TABLEHEADERTEMPLATE>
				<b><%#base.strTermDesc%> - <%#base.strDivDesc%></b> 
			    </TABLEHEADERTEMPLATE>
			<COLUMNS>
				<cmn:GlobalizedTemplateColumn ItemStyle-HorizontalAlign ="left" ItemStyle-Wrap="False" HeaderTextKey="TXT_COURSE" HeaderText="Course">
					<ITEMSTYLE HorizontalAlign="left" VerticalAlign="top"></ITEMSTYLE>
					<ITEMTEMPLATE>
							<%#DataBinder.Eval(Container.DataItem, "DisplayedCourseCode")%>'
					</ITEMTEMPLATE>
				</cmn:GlobalizedTemplateColumn>
				<cmn:GlobalizedTemplateColumn ItemStyle-HorizontalAlign ="left" ItemStyle-Wrap="False" HeaderTextKey="TXT_TITLE" HeaderText="Title">
					<ITEMSTYLE HorizontalAlign="left" VerticalAlign="top" font-size="small"></ITEMSTYLE>
					<ITEMTEMPLATE>
						<%# DataBinder.Eval( Container.DataItem, "Title" ).ToString() %>
					</ITEMTEMPLATE>
				</cmn:GlobalizedTemplateColumn>
				<cmn:GlobalizedTemplateColumn ItemStyle-HorizontalAlign ="left" ItemStyle-Wrap="false" HeaderTextKey="TXT_CREDIT_HOURS" HeaderText="Credit Hours">
					<ITEMSTYLE HorizontalAlign="center" VerticalAlign="top"></ITEMSTYLE>
					<ITEMTEMPLATE>
						<%# DataBinder.Eval( Container.DataItem, "CreditHours" ).ToString() %>
					</ITEMTEMPLATE>
				</cmn:GlobalizedTemplateColumn>
				<cmn:GlobalizedTemplateColumn HeaderTextKey="TXT_CREDIT_TYPE_ABBREVIATED" HeaderText="Cr Type">
					<ITEMSTYLE HorizontalAlign="left" VerticalAlign="top"></ITEMSTYLE>
					<ITEMTEMPLATE>
						<%# DataBinder.Eval( Container.DataItem, "CreditTypeCode" ).ToString() %>
					</ITEMTEMPLATE>
				</cmn:GlobalizedTemplateColumn>
				<cmn:GlobalizedTemplateColumn ItemStyle-VerticalAlign="Top" ItemStyle-Wrap="false" HeaderTextKey="TXT_MEETS" HeaderText="Meets">
					<ITEMSTYLE HorizontalAlign="center" VerticalAlign="top"></ITEMSTYLE>
					<ITEMTEMPLATE></P>
		<UL>
							<asp:Repeater id=rptScheduleP Runat="server" DataSource='<%#DataBinder.Eval(Container.DataItem, "CourseInfo_Schedules")%>'>
								<ItemTemplate>
									<li>
										<%#DataBinder.Eval(Container.DataItem, "Weekdays")%>
										<br>
										<%#DataBinder.Eval(Container.DataItem, "MeetTime")%>
									</li>
								</ItemTemplate>
							</asp:Repeater></UL>
				</ITEMTEMPLATE>
				</cmn:GlobalizedTemplateColumn>
				<cmn:GlobalizedTemplateColumn ItemStyle-VerticalAlign="Top" ItemStyle-Wrap="false" HeaderTextKey="TXT_DATES" HeaderText="Dates">
					<ITEMSTYLE HorizontalAlign="left" VerticalAlign="top"></ITEMSTYLE>
					<ITEMTEMPLATE></P>
							<UL>
							<asp:Repeater id=rptDatesW Runat="server" DataSource='<%#DataBinder.Eval(Container.DataItem, "CourseInfo_Schedules")%>'>
								<ItemTemplate>
									<li>
										<%#DataBinder.Eval(Container.DataItem, "BeginDate")%>
										-<br>
										<%#DataBinder.Eval(Container.DataItem, "EndDate")%>
									</li>
								</ItemTemplate>
							</asp:Repeater></UL>
		<P></ITEMTEMPLATE>
				</cmn:GlobalizedTemplateColumn>
				<cmn:GlobalizedTemplateColumn ItemStyle-VerticalAlign="Top" ItemStyle-Wrap="False" HeaderTextKey="TXT_CAMPUS" HeaderText="Campus">
					<ITEMSTYLE HorizontalAlign="left" VerticalAlign="top"></ITEMSTYLE>
					<ITEMTEMPLATE></P>
		<UL>
							<asp:Repeater id=Repeater1 Runat="server" DataSource='<%#DataBinder.Eval(Container.DataItem, "CourseInfo_Schedules")%>'>
								<ItemTemplate>
									<li>
										<%#DataBinder.Eval(Container.DataItem, "CampusCode")%>
										<br>
										&nbsp;
									</li>
								</ItemTemplate>
							</asp:Repeater></UL>
		<P></ITEMTEMPLATE>
				</cmn:GlobalizedTemplateColumn>
				<cmn:GlobalizedTemplateColumn ItemStyle-VerticalAlign="Top" ItemStyle-Wrap="False" HeaderTextKey="Building">
					<ITEMSTYLE HorizontalAlign="left" VerticalAlign="top"></ITEMSTYLE>
					<ITEMTEMPLATE></P>
		<UL>			
<asp:Repeater id=rptBldg Runat="server" DataSource='<%#DataBinder.Eval(Container.DataItem, "CourseInfo_Schedules")%>'>
								<ItemTemplate>
									<li>
										<%#DataBinder.Eval(Container.DataItem, "BuildingCode")%>
										<br>
										&nbsp;
									</li>
								</ItemTemplate>
							</asp:Repeater></UL>
		></ITEMTEMPLATE>
				</cmn:GlobalizedTemplateColumn>
				<cmn:GlobalizedTemplateColumn ItemStyle-VerticalAlign="Top" ItemStyle-Wrap="False" HeaderTextKey="TXT_ROOM" HeaderText="Room">
					
					<ITEMSTYLE HorizontalAlign="left" VerticalAlign="top"></ITEMSTYLE>
					<ITEMTEMPLATE></P>
		<UL>
							<asp:Repeater id=rptRoom Runat="server" DataSource='<%#DataBinder.Eval(Container.DataItem, "CourseInfo_Schedules")%>'>
								<ItemTemplate>
									<li>
										<%#DataBinder.Eval(Container.DataItem, "RoomCode")%>
										<br>
										&nbsp;
									</li>
								</ItemTemplate>
							</asp:Repeater></UL>
		   </ITEMTEMPLATE>
				</cmn:GlobalizedTemplateColumn>
			</COLUMNS>
			<SUBITEMTEMPLATE>
				<TABLE id="Table2">
					<TR>
						<TD vAlign="top" noWrap>
							<UL>
								<asp:Repeater id=rptRoomsW Runat="server" DataSource='<%#DataBinder.Eval(Container.DataItem, "CourseInfo_Textbook")%>'>
									<HeaderTemplate>
										<tr>
											<td><b><%# SSMessages.TXT_BOOK_TITLE %></b></td>
											<td><b><%# SSMessages.TXT_AUTHOR %></b></td>
											<td><b><%# SSMessages.TXT_CODE %></b></td>
											<td><b><%# SSMessages.TXT_PRICE %></b></td>
											<td><b><%# SSMessages.TXT_LOCATION %></b></td>
										</tr>
									</HeaderTemplate>
									<ItemTemplate>
										<tr>
											<td><%#DataBinder.Eval(Container.DataItem, "TextbookTitle")%></td>
											<td><%#DataBinder.Eval(Container.DataItem, "Authors")%></td>
											<td><%#DataBinder.Eval(Container.DataItem, "TextbookCode")%></td>
											<td><%#DataBinder.Eval(Container.DataItem, "TextbookPrice")%></td>
											<td><%#DataBinder.Eval(Container.DataItem, "TextbookLocation")%></td>
										</tr>
									</ItemTemplate>
								</asp:Repeater></UL>
						</TD>
					</TR>
				</TABLE>
			</SUBITEMTEMPLATE>
			<EMPTYTABLETEMPLATE>
				<DIV class="PortletError"><%= Globalizer.GetGlobalizedString("MSG_NO_STUDENT_COURSES") %></DIV>
			</EMPTYTABLETEMPLATE>
		</cmn:groupedgrid>
	</body>
</HTML>
