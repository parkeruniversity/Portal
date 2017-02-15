<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Midterm.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.GradeReportPortlet.Midterm" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<body onselectstart="return false;">
	<jenzabar:subheader id="shGradeReportFor" Runat="server"></jenzabar:subheader>
	<div class="pSection" id="divHolds" runat="Server" visibile="true">
		<jenzabar:Hint id="hntHolds" runat="server"></jenzabar:Hint>
		<jenzabar:groupedgrid id="dgHolds" runat="server" RenderTableHeaders="true" ShowHeader="true" CollapseSubItems="true"  UseAccessibleHeader="true">
			<TableHeaderTemplate>
				<font color="#ff0000"><jenzabar:GlobalizedLiteral id="glitHolds" runat="server" TextKey="TXT_HOLDS"></jenzabar:GlobalizedLiteral></font>
			</TableHeaderTemplate>
			<Columns>
				<jenzabar:PlusMinusColumn ItemStyle-VerticalAlign="Top" ItemStyle-Width="1%" ItemStyle-HorizontalAlign="Center" />
				<jenzabar:GlobalizedTemplateColumn HeaderTextKey="TXT_HOLD" ItemStyle-VerticalAlign="Top">
					<ItemTemplate>
						<%#DataBinder.Eval(Container.DataItem, "HoldCode")%> - <%#DataBinder.Eval(Container.DataItem, "HoldDescription")%>
					</ItemTemplate>
				</jenzabar:GlobalizedTemplateColumn>
				<jenzabar:GlobalizedBoundColumn HeaderTextKey="TXT_TYPE" DataField="HoldTypeDesc" ItemStyle-VerticalAlign="Top"></jenzabar:GlobalizedBoundColumn>
				<jenzabar:GlobalizedBoundColumn HeaderTextKey="TXT_BEGIN_DATE" DataField="HoldBeginDate" ItemStyle-VerticalAlign="Top"></jenzabar:GlobalizedBoundColumn>
				<jenzabar:GlobalizedBoundColumn HeaderTextKey="TXT_EXPIRATION" DataField="HoldExpirationDate" ItemStyle-VerticalAlign="Top"></jenzabar:GlobalizedBoundColumn>
				<jenzabar:GlobalizedBoundColumn HeaderTextKey="TXT_OFFICE" DataField="OfficeName" ItemStyle-VerticalAlign="Top"></jenzabar:GlobalizedBoundColumn>
			</Columns>
			<SubItemTemplate>
				<table cellSpacing="0" cellPadding="0" border="0" align="center">
					<tr runat="server" visible='<%#DataBinder.Eval(Container.DataItem, "HoldRemark").ToString().Trim() != string.Empty%>'>
						<td align="right">
							<jenzabar:GlobalizedLiteral id="litRemarks" TextKey="TXT_REMARKS" runat="server"></jenzabar:GlobalizedLiteral>:</td>
						<td><%#DataBinder.Eval(Container.DataItem, "HoldRemark")%></td>
					</tr>
				</table>
			</SubItemTemplate>
		</jenzabar:groupedgrid>
	</div>
	<Div class="pSection" id="divMain" runat="server" visible="true">
		<TABLE id="Table1" cellSpacing="3" cellPadding="3" width="100%" border="0">
			<TR>
				<TD>
					<div class="pSection" id="divError" runat="server" visible="false"><jenzabar:errordisplay id="ctlError" RunAt="server"></jenzabar:errordisplay></div>
					<div class="pSection" id="divMessage" runat="server" visible="False"><asp:Label ID="lblMessage" Runat="server"></asp:Label></div>
				</TD>
			</TR>
			<TR>
				<TD>
					<TABLE id="Table2" cellSpacing="3" cellPadding="3" width="100%" border="0">
						<TR>
							<TD width="15%"><asp:label id="lblTerm" runat="server" Font-Bold="True" AssociatedControlID="ddlTerm"></asp:label></TD>
							<TD><asp:label id="lblTermSelected" runat="server" Visible="False"></asp:label><asp:dropdownlist id="ddlTerm" runat="server" AutoPostBack="True"></asp:dropdownlist>&nbsp;&nbsp;<asp:linkbutton id="lnkViewGradeReport" runat="server"></asp:linkbutton></TD>
						</TR>
						<TR>
							<TD width="15%"><asp:label id="lblAdvisor" runat="server" Font-Bold="True"></asp:label></TD>
							<TD><asp:label id="lblAdvisorInfo" runat="server"></asp:label></TD>
						</TR>
						<TR>
							<TD width="15%"><asp:label id="lblFirstMajor" runat="server" Font-Bold="True"></asp:label></TD>
							<TD><asp:label id="lblFirstMajorInfo" runat="server"></asp:label></TD>
						</TR>
						<TR>
							<TD width="15%"><asp:label id="lblSecondMajor" runat="server" Font-Bold="True"></asp:label></TD>
							<TD><asp:label id="lblSecondMajorInfo" runat="server"></asp:label></TD>
						</TR>
					</TABLE>
				</TD>
			</TR>
			<TR>
				<TD>
					<TABLE id="Table3" cellSpacing="3" cellPadding="3" width="100%" border="0">
						<asp:repeater id="rptCourseList" Runat="server">
							<ItemTemplate>
								<tr>
									<td class="header">
										<asp:Label ID="lblDivision" Runat="server">&nbsp;
										<%#DataBinder.Eval(Container.DataItem, "DivisionDesc")%>
									</asp:Label>
									</td>
								</tr>
								<tr>
									<td>
										<asp:DataGrid ID="dgCourseList" Runat="server" Width="100%" BorderWidth="0" HeaderStyle-CssClass="header"
											AlternatingItemStyle-CssClass="alt" FooterStyle-CssClass="alt" CssClass="groupedGrid" DataKeyField="ERPStudentCourseKey"
											AutoGenerateColumns="false" ShowHeader="True" ShowFooter="True" OnItemDataBound="dgCourseList_ItemDataBound"  UseAccessibleHeader="true">
											<Columns>
												<asp:BoundColumn DataField="DisplayedCourseCode" ItemStyle-Width="25%" ItemStyle-Wrap="False"></asp:BoundColumn>
												<asp:BoundColumn DataField="Section" ItemStyle-Width="5%" Visible="False"></asp:BoundColumn>
												<asp:BoundColumn DataField="CourseTitle" ItemStyle-Width="45%" ItemStyle-Wrap="True"></asp:BoundColumn>
												<asp:BoundColumn DataField="MidTermGrade" ItemStyle-Width="5%"></asp:BoundColumn>
												<asp:BoundColumn DataField="Repeat" ItemStyle-Width="5%"></asp:BoundColumn>
												<asp:BoundColumn DataField="AttemptedCredits" ItemStyle-Width="5%" ItemStyle-HorizontalAlign="Right"></asp:BoundColumn>
												<asp:BoundColumn DataField="EarnedCredits" ItemStyle-Width="5%" ItemStyle-HorizontalAlign="Right"></asp:BoundColumn>
												<asp:BoundColumn DataField="GPACredits" ItemStyle-Width="5%" ItemStyle-HorizontalAlign="Right"></asp:BoundColumn>
												<asp:BoundColumn DataField="QualityPoints" ItemStyle-Width="5%" ItemStyle-HorizontalAlign="Right"></asp:BoundColumn>
												<asp:TemplateColumn>
													<ItemStyle Wrap="False"></ItemStyle>
													<ItemTemplate>
														<asp:Label ID="lblGPA" Runat="server" Visible="True"></asp:Label>
													</ItemTemplate>
												</asp:TemplateColumn>
											</Columns>
										</asp:DataGrid>
									</td>
								</tr>
							</ItemTemplate>
						</asp:repeater></TABLE>
				</TD>
			</TR>
			<TR>
				<TD><asp:imagebutton id="ibPrtFriendlyRept" runat="server" Visible="False"></asp:imagebutton>&nbsp;<asp:linkbutton id="lnkPrtFriendlyRept" runat="server" Visible="False"></asp:linkbutton>&nbsp;<asp:linkbutton id="lnkClose" runat="server" Visible="False"></asp:linkbutton></TD>
			</TR>
		</TABLE>
	</Div>
</body>
