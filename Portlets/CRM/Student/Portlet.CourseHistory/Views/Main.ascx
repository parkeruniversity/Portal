<%@ Control Language="c#" AutoEventWireup="True" Codebehind="Main.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.CourseHistoryPortlet.Main" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<jenzabar:subheader id="shCourseHistoryfor" Runat="server"></jenzabar:subheader>
<div class="pSection" id="divHolds" runat="Server" visibile="true">
		<jenzabar:Hint id="hntHolds" runat="server"></jenzabar:Hint>
		<jenzabar:groupedgrid id="dgHolds" runat="server" RenderTableHeaders="true" ShowHeader="true" CollapseSubItems="true">
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
<DIV class="pSection" id="divMain" runat="server" visible="true">
	<TABLE id="Table1" cellSpacing="3" cellPadding="3" width="100%" border="0">
		<TR>
			<TD>
				<div id="divError" visible="false" runat="server"><jenzabar:errordisplay id="ctlError" RunAt="server"></jenzabar:errordisplay></div>
				<div id="divMessage" visible="False" runat="server"><asp:label id="lblMessage" Runat="server"></asp:label></div>
			</TD>
		</TR>
		<TR>
			<td>
				<asp:repeater id="rptCourseList" Runat="server">
					<ItemTemplate>
						<tr>
							<td class="header">
								<asp:Label ID="lblTerm" Runat="server">&nbsp;
										<%#DataBinder.Eval(Container.DataItem, "TermDesc")%>
									</asp:Label>
							</td>
						</tr>
						<tr>
							<td>
								<asp:DataGrid ID="dgCourseHistory" Runat="server" Width="100%" BorderWidth="0" HeaderStyle-CssClass="header"
									AlternatingItemStyle-CssClass="alt" FooterStyle-CssClass="alt" CssClass="groupedGrid" AutoGenerateColumns="false"
									ShowHeader="True" ShowFooter="False">
									<Columns>
										<asp:BoundColumn DataField="DisplayedCourseCode" ItemStyle-Width="120" ItemStyle-Wrap="False"></asp:BoundColumn>
										<asp:BoundColumn DataField="Title" ItemStyle-Width="150" ItemStyle-Wrap="True"></asp:BoundColumn>
										<asp:BoundColumn DataField="DivisionDesc" ItemStyle-Width="100" ItemStyle-Wrap="False"></asp:BoundColumn>
										<asp:BoundColumn DataField="CatalogCode" ItemStyle-Width="50"></asp:BoundColumn>
										<asp:BoundColumn DataField="CreditHours" ItemStyle-Width="50"></asp:BoundColumn>
										<asp:BoundColumn DataField="CourseGradeTypeDesc" ItemStyle-Width="120" ItemStyle-Wrap="False"></asp:BoundColumn>
										<asp:BoundColumn DataField="GradeCode" ItemStyle-Width="50" ItemStyle-Wrap="False"></asp:BoundColumn>
										<asp:BoundColumn DataField="Requirement" ItemStyle-Width="100" ItemStyle-Wrap="False"></asp:BoundColumn>
									</Columns>
								</asp:DataGrid>
							</td>
						</tr>
					</ItemTemplate>
				</asp:repeater></td>
		</TR>
	</TABLE>
</DIV>
