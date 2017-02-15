<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Details.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.DegreeAudit.Details" %>
<%@ Register TagPrefix="common" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<common:SubHeader id="shUserName" visible="false" runat="Server" />
<common:SubHeader id="shParentRequirement" runat="Server" />
<div class="pSection">
	<p><asp:Literal ID="litParentReqDesc" Runat="server" /></p>
	<p id="pCourseRequirements" runat="server">
		<table class="groupedGrid">
			<thead>
				<tr>
					<td colspan="9"><%= Globalizer.GetGlobalizedString("TXT_COURSE_REQUIREMENTS") %></td>
				</tr>
				<tr>
					<th colspan="5">
					</th>
					<th colspan="2">
						<%= Globalizer.GetGlobalizedString("TXT_HOURS") %>
					</th>
					<th colspan="2">
						<%= Globalizer.GetGlobalizedString("TXT_GRADE") %>
					</th>
				</tr>
				<TR>
					<th>
						<%= Globalizer.GetGlobalizedString("TXT_REQ") %>
					</th>
					<th>
						<%= Globalizer.GetGlobalizedString("TXT_DESCRIPTION") %>
					</th>
					<th>
						<%= Globalizer.GetGlobalizedString("TXT_STATUS") %>
					</th>
					<th>
						<%= Globalizer.GetGlobalizedString("TXT_COURSE") %>
					</th>
					<th>
						<%= Globalizer.GetGlobalizedString("TXT_COURSE_TITLE") %>
					</th>
					<th>
						<%= Globalizer.GetGlobalizedString("TXT_NEEDED") %>
					</th>
					<th>
						<%= Globalizer.GetGlobalizedString("TXT_EARNED") %>
					</th>
					<th>
						<%= Globalizer.GetGlobalizedString("TXT_NEEDED") %>
					</th>
					<th>
						<%= Globalizer.GetGlobalizedString("TXT_EARNED") %>
					</th>
				</TR>
			</thead>
			<tbody>
				<asp:Repeater ID="rptCourseRequirements" Runat="server">
					<ItemTemplate>
						<%# GetCourseReqRowHTMLToCourseTitle(Container) %>
						<asp:LinkButton ID="lnkSeeAvail" Runat="server" Visible="False" />
						<%# GetCourseReqRowHTMLFromCourseTitle(Container) %>
					</ItemTemplate>
				</asp:Repeater>
			</tbody>
		</table>
	</p>
	<p id="catReq" runat="server">
		<common:groupedgrid id="ggCategoryRequirements" RenderGroupHeaders="true" runat="server">
			<TableHeaderTemplate>
				<%# Globalizer.GetGlobalizedString("TXT_CATEGORY_REQUIREMENTS") %>
			</TableHeaderTemplate>
			<Columns>
				<asp:TemplateColumn HeaderText="REQUIREMENT">
					<ItemTemplate>
						<asp:LinkButton ID="lnkRequirement" Runat="server" />
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="STATUS">
					<ItemTemplate>
						<asp:Literal id="litStatus" runat="server" />
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="NEEDED">
					<ItemTemplate>
						<asp:Literal id="litNeeded" runat="server" />
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="EARNED">
					<ItemTemplate>
						<asp:Literal id="litEarned" runat="server" />
					</ItemTemplate>
				</asp:TemplateColumn>
			</Columns>
		</common:groupedgrid>
	</p>
	<p id="othReq" runat="server">
		<common:groupedgrid id="ggOtherRequirements" RenderGroupHeaders="true" runat="server">
			<TableHeaderTemplate>
				<%# Globalizer.GetGlobalizedString("TXT_OTHER_REQUIREMENTS") %>
			</TableHeaderTemplate>
			<Columns>
				<asp:TemplateColumn HeaderText="REQUIREMENT">
					<ItemTemplate>
						<asp:Literal ID="litOtherRequirement" Runat="server" />
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="STATUS">
					<ItemTemplate>
						<asp:Literal id="litOtherStatus" runat="server" />
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="NEEDED">
					<ItemTemplate>
						<asp:Literal id="litOtherNeeded" runat="server" />
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="EARNED">
					<ItemTemplate>
						<asp:Literal id="litOtherEarned" runat="server" />
					</ItemTemplate>
				</asp:TemplateColumn>
			</Columns>
		</common:groupedgrid>
	</p>
	<p>
		<asp:Literal ID="pdfLink" Runat="server" />
	</p>
	<p style="text-align:center;">
		<common:GlobalizedButton id="btnRecalculate" runat="server" textKey="TXT_RECALC_STUDENT_PROGRESS" />
	</p>
</div>
