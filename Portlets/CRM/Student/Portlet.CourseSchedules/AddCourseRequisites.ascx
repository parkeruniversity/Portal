<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="AddCourseRequisites.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.CourseSchedulesPortlet.AddCourseRequisites" %>
<div class="pSection">
	<jenzabar:errordisplay id="errDisplay" Runat="server"></jenzabar:errordisplay>
	<table cellSpacing="2" cellPadding="0" width="100%" border="0">
		<tr>
			<td align="left" colSpan="8"><jenzabar:GlobalizedNote id="lblStatus" runat="server"></jenzabar:GlobalizedNote></td>
		</tr>
		<tr>
			<th nowrap align="right"><jenzabar:GlobalizedLiteral id="litCourse" TextKey="TXT_COURSE" runat="server"></jenzabar:GlobalizedLiteral>:&nbsp;</th>
			<td noWrap align="left"><asp:label id="lblCourseCode" Runat="server"></asp:label>&nbsp;&nbsp;&nbsp;<asp:label id="lblCourseTitle" Runat="server"></asp:label></td>
			<th nowrap align="right"><jenzabar:GlobalizedLiteral id="litCreditHours" TextKey="TXT_CREDITS" runat="server"></jenzabar:GlobalizedLiteral>:&nbsp;</th>
			<td noWrap><asp:label id="lblCreditHours" Runat="server"></asp:label></td>
			<th nowrap align="right"><jenzabar:GlobalizedLiteral id="litTerm" TextKey="TXT_TERM" runat="server"></jenzabar:GlobalizedLiteral>:&nbsp;</th>
			<td noWrap><asp:label id="lblTerm" Runat="server"></asp:label></td>
			<th nowrap align="right"><jenzabar:GlobalizedLiteral id="litDivision" runat="server"></jenzabar:GlobalizedLiteral>:&nbsp;</th>
			<td noWrap><asp:label id="lblDivision" Runat="server"></asp:label></td>
		</tr>
	</table>
	<jenzabar:Hint id="hntInstruct" runat="server"></jenzabar:Hint>
	<jenzabar:groupedgrid id="dgReq" ShowHeader="true" RenderTableHeaders="true" DataKeyField="RequisiteGroupKey"
		runat="server" CollapseSubItems="true">
		<TableHeaderTemplate>
			<jenzabar:GlobalizedLabel id="lblReqHeader" runat="server"></jenzabar:GlobalizedLabel>
		</TableHeaderTemplate>
		<Columns>
			<jenzabar:GlobalizedTemplateColumn HeaderTextKey="TXT_ADD" ItemStyle-Width="1%" ItemStyle-VerticalAlign="Top">
				<ItemTemplate>
					<asp:CheckBox ID="chkInclude" Visible='<%#DataBinder.Eval(Container.DataItem, "CanRegister").ToString() == "Y"%>' Runat="server"></asp:CheckBox>
				</ItemTemplate>
			</jenzabar:GlobalizedTemplateColumn>
			<jenzabar:PlusMinusColumn ItemStyle-Width="1%" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" />
			<jenzabar:GlobalizedBoundColumn DataField="RequisiteGroupDesc"></jenzabar:GlobalizedBoundColumn>
		</Columns>
		<SubItemTemplate>
			<table width="96%">
				<tr>
					<td>
						<jenzabar:groupedgrid id="dgSubReq" ShowHeader="true" RenderTableHeaders="true" DataSource='<%#DataBinder.Eval(Container.DataItem, "Requisite")%>' DataKeyField="ERPCourseKey" runat="server">
							<Columns>
								<jenzabar:GlobalizedBoundColumn HeaderTextKey="TXT_TYPE" DataField="RequisiteType" ItemStyle-VerticalAlign="Top"></jenzabar:GlobalizedBoundColumn>
								<jenzabar:GlobalizedBoundColumn HeaderTextKey="TXT_COURSE" DataField="DisplayedCourseCode" ItemStyle-VerticalAlign="Top"></jenzabar:GlobalizedBoundColumn>
								<jenzabar:GlobalizedBoundColumn HeaderTextKey="TXT_TITLE" DataField="Title" ItemStyle-VerticalAlign="Top"></jenzabar:GlobalizedBoundColumn>
								<jenzabar:GlobalizedBoundColumn HeaderTextKey="TXT_CREDITS" DataField="CreditHours" ItemStyle-VerticalAlign="Top"></jenzabar:GlobalizedBoundColumn>
								<jenzabar:GlobalizedBoundColumn HeaderTextKey="TXT_CAMPUS" DataField="CourseCampusCode" ItemStyle-VerticalAlign="Top"></jenzabar:GlobalizedBoundColumn>
								<jenzabar:GlobalizedTemplateColumn HeaderTextKey="TXT_FACULTY" ItemStyle-VerticalAlign="Top">
									<ItemTemplate>
										<ul>
											<asp:Repeater ID="rptFaculty" DataSource='<%#DataBinder.Eval(Container.DataItem, "FacultyList")%>' Runat="server">
												<ItemTemplate>
													<li>
														<%#DataBinder.Eval(Container.DataItem, "FacultyName")%>
													</li>
												</ItemTemplate>
											</asp:Repeater>
										</ul>
									</ItemTemplate>
								</jenzabar:GlobalizedTemplateColumn>
								<jenzabar:GlobalizedTemplateColumn HeaderTextKey="TXT_MEETS" ItemStyle-VerticalAlign="Top">
									<ItemTemplate>
										<ul>
											<asp:Repeater ID="rptMeets" DataSource='<%#DataBinder.Eval(Container.DataItem, "Schedules")%>' Runat="server">
												<ItemTemplate>
													<li>
														<%#DataBinder.Eval(Container.DataItem, "Weekdays")%>
													</li>
													<li>
														<%#DataBinder.Eval(Container.DataItem, "MeetTime")%>
													</li>
												</ItemTemplate>
											</asp:Repeater>
										</ul>
									</ItemTemplate>
								</jenzabar:GlobalizedTemplateColumn>
								<jenzabar:GlobalizedTemplateColumn HeaderTextKey="TXT_DATES" ItemStyle-VerticalAlign="Top">
									<ItemTemplate>
										<ul>
											<asp:Repeater ID="rptDates" DataSource='<%#DataBinder.Eval(Container.DataItem, "Schedules")%>' Runat="server">
												<ItemTemplate>
													<li>
														<%#DataBinder.Eval(Container.DataItem, "BeginDate")%>
														-</li>
													<li>
														<%#DataBinder.Eval(Container.DataItem, "EndDate")%>
													</li>
												</ItemTemplate>
											</asp:Repeater>
										</ul>
									</ItemTemplate>
								</jenzabar:GlobalizedTemplateColumn>
							</Columns>
						</jenzabar:groupedgrid>
					</td>
				</tr>
			</table>
		</SubItemTemplate>
	</jenzabar:groupedgrid>
	<jenzabar:GlobalizedButton id="btnAddReq" runat="server"></jenzabar:GlobalizedButton>
	<jenzabar:GlobalizedButton id="btnCancel" TextKey="TXT_CANCEL" runat="server"></jenzabar:GlobalizedButton>
</div>
