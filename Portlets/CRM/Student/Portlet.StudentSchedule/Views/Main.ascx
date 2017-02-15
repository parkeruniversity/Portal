<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="True" Codebehind="Main.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.StudentSchedulePortlet.Main"%>
<%@ Import namespace="Jenzabar.CRM.Student.Web.Portlets.StudentSchedulePortlet" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<div id="divBreadCrumb" runat="server" visible="true"><cmn:breadcrumbtrail id="brdHistory" visible="true" Runat="server"></cmn:breadcrumbtrail></div>
<div class="pSection" id="divError" visible="False" runat="server"><cmn:errordisplay id="ctlError" RunAt="server"></cmn:errordisplay></div>
<div class="pSection" id="divWarning" visible="False" runat="server"><asp:label id="lblWarning" CssClass="PortletError" Runat="server"></asp:label></div>
<div id="divHeader" visible="False" runat="server"><cmn:subheader id="shCourseSchedFor" Runat="server"></cmn:subheader></div>
<div id="divTermWarning" visible="true" runat="server"><cmn:Hint id="hntTermWarn" runat="server" TextKey="TXT_TERM_DATA_WARN_MSG" /></div>
<div class="pSection" id="divMain" visible="false" runat="server">
	<table cellSpacing="2" cellPadding="2" width="75%" border="0">
		<tr>
			<td height="14"><cmn:globalizedliteral id="litTerm" Runat="server" TextKey="LBL_TERM"></cmn:globalizedliteral>&nbsp;
				<asp:dropdownlist id="ddlTerm" Runat="server"></asp:dropdownlist></td>
			<td height="14"><cmn:globalizedliteral id="litDivision" runat="server" TextKey="LBL_DIVISION"></cmn:globalizedliteral>&nbsp;
				<asp:dropdownlist id="ddlDivision" Runat="server"></asp:dropdownlist></td>
		</tr>
		<tr>
			<td colSpan="2"><cmn:globalizedbutton id="btnSearch" runat="server" TextKey="TXT_SEARCH" Width="80px"></cmn:globalizedbutton></td>
		</tr>
		<TR>
			<TD colSpan="2"></TD>
		</TR>
		<tr>
			<td colSpan="2">
				<DIV id="divGroupedGrid" runat="server">
				<cmn:groupedgrid id="ggCourses" runat="server" RenderTableHeaders="True" CollapseSubItems="true">
						<TableHeaderTemplate>
                			<%#base.strTermDesc%> - <%#base.strDivDesc%>
                		</TableHeaderTemplate>
						<Columns>
                    		<cmn:PlusMinusColumn id="pmtbk" HeaderText="Textbooks" ItemStyle-VerticalAlign="Top" ItemStyle-Width="1%" ItemStyle-HorizontalAlign="Center" />
							<cmn:GlobalizedTemplateColumn HeaderText="TXT_COURSE" HeaderTextKey="TXT_COURSE" ItemStyle-Wrap="False">
								<ItemStyle VerticalAlign="top" HorizontalAlign="left"></ItemStyle>
								<ItemTemplate>
									<cmn:GlobalizedLinkButton ID="lnkCourse" Runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "DisplayedCourseCode")%>' CommandArgument='<%#DataBinder.Eval(Container.DataItem, "ERPCourseKey")%>' OnCommand="lnkCourse_Click" TextKey="TXT_CS_MOVE_TO_CURRENT" Visible='true'>
									</cmn:GlobalizedLinkButton>
								</ItemTemplate>
							</cmn:GlobalizedTemplateColumn>
							<cmn:GlobalizedTemplateColumn HeaderText="TXT_TITLE" HeaderTextKey="TXT_TITLE">
								<ItemStyle VerticalAlign="top" HorizontalAlign="left"></ItemStyle>
								<ItemTemplate>
									<%# DataBinder.Eval( Container.DataItem, "Title" ).ToString() %>
								</ItemTemplate>
							</cmn:GlobalizedTemplateColumn>
							<cmn:GlobalizedTemplateColumn HeaderText="TXT_CREDIT_HOURS" HeaderTextKey="TXT_CREDIT_HOURS">
								<ItemStyle VerticalAlign="top" HorizontalAlign="left"></ItemStyle>
								<ItemTemplate>
									<%# DataBinder.Eval( Container.DataItem, "CreditHours" ).ToString() %>
								</ItemTemplate>
							</cmn:GlobalizedTemplateColumn>
                            <cmn:GlobalizedTemplateColumn HeaderTextKey="TXT_STATUS">
								<ItemStyle VerticalAlign="top" HorizontalAlign="left"></ItemStyle>
								<ItemTemplate>
									<%# DataBinder.Eval(Container.DataItem, "CourseRegistrationStatus").ToString()%>
								</ItemTemplate>
							</cmn:GlobalizedTemplateColumn>
							<cmn:GlobalizedTemplateColumn HeaderTextKey="TXT_CREDIT_TYPE_ABBREVIATED">
								<ItemStyle VerticalAlign="top" HorizontalAlign="left"></ItemStyle>
								<ItemTemplate>
									<%# DataBinder.Eval( Container.DataItem, "CreditTypeCode" ).ToString() %>
								</ItemTemplate>
							</cmn:GlobalizedTemplateColumn>
							<cmn:GlobalizedTemplateColumn HeaderTextKey="TXT_COURSE_INSTRUCTORS" ItemStyle-VerticalAlign="Top">
								<ItemStyle VerticalAlign="top" HorizontalAlign="left"></ItemStyle>
								<ItemTemplate>
									<ul>
										<asp:Repeater ID="rptInstructor" DataSource='<%#DataBinder.Eval(Container.DataItem, "FacultyList")%>' Runat="server">
											<ItemTemplate>
												<li>
													<%#DataBinder.Eval(Container.DataItem, "FacultyName")%>
													<br>
													&nbsp
												</li>
											</ItemTemplate>
										</asp:Repeater>
									</ul>
								</ItemTemplate>
							</cmn:GlobalizedTemplateColumn>
							<cmn:GlobalizedTemplateColumn HeaderText="TXT_MEET_TIMES" HeaderTextKey="TXT_MEETS" ItemStyle-VerticalAlign="Top"
								ItemStyle-Wrap="false">
								<ItemStyle VerticalAlign="top" HorizontalAlign="left"></ItemStyle>
								<ItemTemplate>
									<ul>
										<asp:Repeater ID="rptScheduleP" DataSource='<%#DataBinder.Eval(Container.DataItem, "Schedules")%>' Runat="server" >
											<ItemTemplate>
												<li>
													<%#DataBinder.Eval(Container.DataItem, "Weekdays")%>
													<br>
													<%#DataBinder.Eval(Container.DataItem, "MeetTime")%>
												</li>
											</ItemTemplate>
										</asp:Repeater>
									</ul>
								</ItemTemplate>
							</cmn:GlobalizedTemplateColumn>
							<cmn:GlobalizedTemplateColumn HeaderText="TXT_DATES" HeaderTextKey="TXT_DATES" ItemStyle-VerticalAlign="Top" ItemStyle-Wrap="false">
								<ItemStyle VerticalAlign="top" HorizontalAlign="left"></ItemStyle>
								<ItemTemplate>
									<ul>
										<asp:Repeater ID="rptDatesW" DataSource='<%#DataBinder.Eval(Container.DataItem, "Schedules")%>' Runat="server">
											<ItemTemplate>
												<li>
													<%#DataBinder.Eval(Container.DataItem, "BeginDate")%>
													-<br>
													<%#DataBinder.Eval(Container.DataItem, "EndDate")%>
												</li>
											</ItemTemplate>
										</asp:Repeater>
									</ul>
								</ItemTemplate>
							</cmn:GlobalizedTemplateColumn>
							<cmn:GlobalizedTemplateColumn HeaderText="TXT_ROOM" HeaderTextKey="TXT_ROOM" ItemStyle-VerticalAlign="Top" ItemStyle-Wrap="False">
								<ItemStyle VerticalAlign="top" HorizontalAlign="left"></ItemStyle>
								<ItemTemplate>
									<ul>
										<asp:Repeater ID="rptRoom" DataSource='<%#DataBinder.Eval(Container.DataItem, "Schedules")%>' Runat="server">
											<ItemTemplate>
												<li>
													<%#DataBinder.Eval(Container.DataItem, "CampusCode")%>
													/
													<%#DataBinder.Eval(Container.DataItem, "BuildingCode")%>
													/
													<%#DataBinder.Eval(Container.DataItem, "RoomCode")%>
													<br>
													&nbsp
												</li>
											</ItemTemplate>
										</asp:Repeater>
									</ul>
								</ItemTemplate>
							</cmn:GlobalizedTemplateColumn>
						</Columns>
			<SubItemTemplate>
			<table width="96%">
				<tr><td >
        	<asp:table id="tblBookstore" visible="false" runat="server" width="100%">
                <asp:tablerow><asp:tablecell >
                   <asp:Label ID="lblBookstore" runat="server" Visible="false" ></asp:Label>
                   &raquo <asp:HyperLink ID="lnkBookstore" runat="server" Target="_blank" Visible="false" ></asp:HyperLink>
         </asp:tablecell></asp:tablerow>
    </asp:table>
              </td></tr>
                <tr>
					<td>
                    <cmn:groupedgrid id="ggTextbooks" runat="server" Visible='<%#DataBinder.Eval(Container.DataItem, "Textbook") != null %>' DataSource='<%#DataBinder.Eval(Container.DataItem, "Textbook")%>' DataKeyField="TextbookCode" RenderTableHeaders="true" >
	            <Columns>
		            <cmn:GlobalizedTemplateColumn HeaderTextKey="TXT_BOOK_TITLE">
		                <ItemTemplate>
			                <strong><%# DataBinder.Eval(Container.DataItem, "TextbookTitle")%></strong>
    		            </ItemTemplate>
		            </cmn:GlobalizedTemplateColumn>
		            <cmn:GlobalizedBoundColumn ItemStyle-VerticalAlign="top" DataField="TextbookISBN" HeaderTextKey="TXT_ISBN" />
		            <cmn:GlobalizedBoundColumn ItemStyle-VerticalAlign="top" DataField="ISBN13" HeaderTextKey="TXT_ISBN13" />
                    <cmn:GlobalizedBoundColumn ItemStyle-VerticalAlign="top" DataField="TextbookPrice" HeaderTextKey="TXT_NEW" />
		            <cmn:GlobalizedBoundColumn ItemStyle-VerticalAlign="top" DataField="UsedBookPrice" HeaderTextKey="TXT_USED" />
		            <cmn:GlobalizedBoundColumn ItemStyle-VerticalAlign="top" DataField="RentalPrice" HeaderTextKey="TXT_RENTAL" />
	            </Columns>
	            <SubItemTemplate>
		            <table cellSpacing="0" cellPadding="0" border="0" align="left" >
			            <tr id="Tr1" runat="server" visible='<%#DataBinder.Eval(Container.DataItem, "Authors").ToString().Trim() != string.Empty%>'>
				            <td colspan="2" class="body">
					            <strong><cmn:GlobalizedLiteral id="litAuthors" TextKey="LBL_AUTHOR(S)" runat="server"></cmn:GlobalizedLiteral></strong><%#DataBinder.Eval(Container.DataItem, "Authors")%></td>
			            </tr>
			            <tr id="Tr2" runat="server" visible='<%#DataBinder.Eval(Container.DataItem, "TextbookCopyright").ToString().Trim() + DataBinder.Eval(Container.DataItem, "TextbookPublisher").ToString().Trim() != string.Empty%>'>
				            <td class="body" visible='<%#DataBinder.Eval(Container.DataItem, "TextbookCopyright").ToString().Trim() != string.Empty%>' >
					            <strong><cmn:GlobalizedLiteral id="litCopyright" TextKey="LBL_COPYRIGHT" runat="server" ></cmn:GlobalizedLiteral></strong>
				                <%#DataBinder.Eval(Container.DataItem, "TextbookCopyright")%>
				            </td>
				            <td class="body" visible='<%#DataBinder.Eval(Container.DataItem, "TextbookPublisher").ToString().Trim() != string.Empty%>' >
				                <strong><cmn:GlobalizedLiteral id="litPublisher" TextKey="LBL_PUBLISHER" runat="server" ></cmn:GlobalizedLiteral></strong>
				                <%#DataBinder.Eval(Container.DataItem, "TextbookPublisher")%>
				            </td>
			            </tr>
			            <tr id="Tr3" runat="server" visible='<%#DataBinder.Eval(Container.DataItem, "TextbookDescription").ToString().Trim() != string.Empty%>'>
				            <td colspan="2" class="body">
					            <strong><cmn:GlobalizedLiteral id="litRemarks" TextKey="LBL_DESCRIPTION" runat="server"></cmn:GlobalizedLiteral></strong>
				                <cmn:CollapsibleText runat="server" text='<%#DataBinder.Eval(Container.DataItem, "TextbookDescription")%>' ></cmn:CollapsibleText>
				            </td>
			            </tr>
		            </table>
				</SubItemTemplate>
		    </cmn:groupedgrid>
        </td></tr></table>
	</SubItemTemplate>
						<EmptyTableTemplate>
							<div class="PortletError">
								<%= Globalizer.GetGlobalizedString("MSG_NO_STUDENT_COURSES") %>
							</div>
						</EmptyTableTemplate>
					</cmn:groupedgrid></DIV>
			</td>
		</tr>
	</table>
	<div class="smalltext" id="divGroupedGrid">&nbsp;</div>
	<table>
		<tr>
			<td>
				<asp:HyperLink id="lnkCustomReport" Runat="server" Enabled="True" Visible="True"></asp:HyperLink></td>
		</tr>
		<tr>
			<td><asp:HyperLink id="lnkReport" Runat="server" Enabled="True" Visible="False"></asp:HyperLink></td>
		</tr>
	</table>
</div>
