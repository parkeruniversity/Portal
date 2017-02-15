<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Register TagPrefix="framework" namespace="Jenzabar.Portal.Framework.Web.UI.Controls" assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Register TagPrefix="common" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="True" Codebehind="Summary.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.DegreeAudit.Summary" %>
<common:subheader id="shName" runat="server" />
<div class="pSection">
	<table cellpadding="0" cellspacing="0">
		<tr>
			<td valign="top"><asp:panel id="pnlPersonalInfo" Runat="server">
      <TABLE>
<asp:Literal id=litAddressLines Runat="server"></asp:Literal>
<asp:Literal id=litCityStateZip Runat="server"></asp:Literal>
<asp:Literal id=litPhoneNumber Runat="server"></asp:Literal>
<asp:Literal id=litEmail Runat="server"></asp:Literal></TABLE>
				</asp:panel></td>
			<td valign="top">
				<table>
					<tr>
						<td align="left"><common:GlobalizedLiteral textKey="LBL_CREDITS_EARNED" runat="server" id="lblCreditsEarned" /></td>
						<td align="left"><asp:Literal id="litCreditsEarned" Runat="server" /></td>
					</tr>
					<tr>
						<td align="left"><common:GlobalizedLiteral textKey="LBL_OVERALL_GPA" runat="server" id="lblOverallGPA" /></td>
						<td align="left"><asp:Literal id="litOverallGPA" Runat="server" /></td>
					</tr>
					<tr>
						<td align="left"><common:GlobalizedLiteral textKey="LBL_LAST_TERM_GPA" runat="server" id="lblLastTermGPA" /></td>
						<td align="left"><asp:Literal id="litLastTermGPA" Runat="server" /></td>
					</tr>
					<tr>
						<td align="left"><common:GlobalizedLiteral textKey="LBL_PROBATION_STATUS" runat="server" id="lblProbationStatus" /></td>
						<td align="left"><asp:Literal id="litProbationStatus" Runat="server" /></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td colSpan="2" height="10">&nbsp;</td>
		</tr>
		<tr>
			<td valign="top"><asp:Literal ID="litPersuentDegrees" Runat="server" /></td>
			<td valign="top">
				<asp:Panel ID="pnlAdvisors" Runat="server">
      <TABLE>
        <TR>
          <TD><B>
<common:GlobalizedLiteral id=litAdvisors runat="server" textKey="TXT_ADVISORS"></common:GlobalizedLiteral></B></TD></TR>
<asp:Repeater id=rptAdvisors Runat="server">
							<ItemTemplate>
								<tr>
									<td>
										<framework:MyInfoPopup id="miPopup" runat="server" />
										<asp:Literal ID="litAdvisorTypeAndDivision" Runat="server" /></td>
								</tr>
							</ItemTemplate>
						</asp:Repeater></TABLE>
				</asp:Panel>
			</td>
		</tr>
		<tr>
			<td colSpan="2" height="10">&nbsp;</td>
		</tr>
		<tr>
			<td align="left" colSpan="2"><asp:DropDownList ID="ddPrograms" AutoPostBack="True" Runat="server" /></td>
		</tr>
		<tr>
			<td colSpan="2" height="10">&nbsp;</td>
		</tr>
		<tr>
			<td colSpan="2">
				<common:groupedgrid id="ggRequirementSummary" RenderGroupHeaders="true" runat="server">
					<TableHeaderTemplate>
						<%# Globalizer.GetGlobalizedString("TXT_REQUIREMENTS_SUMMARY") %>
					</TableHeaderTemplate>
					<Columns>
						<asp:TemplateColumn HeaderText="REQUIREMENT">
							<ItemTemplate>
								<asp:LinkButton ID="lnkRequirement" Runat="server" />
								<asp:Literal ID="litRequirement" Runat="server" />
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="YEAR">
							<ItemTemplate>
								<asp:Literal id="litYear" runat="server" />
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="AIM">
							<ItemTemplate>
								<asp:Literal id="litAim" runat="server" />
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="HOURS_NEEDED">
							<ItemTemplate>
								<asp:Literal id="litHoursNeeded" runat="server" />
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="HOURS_EARNED">
							<ItemTemplate>
								<asp:Literal id="litHoursEarned" runat="server" />
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="HRS_IN_PROGRESS">
							<ItemTemplate>
								<asp:Literal id="litHoursInProgress" runat="server" />
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="QUALITY_POINTS">
							<ItemTemplate>
								<asp:Literal id="litQualityPoints" runat="server" />
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="GPA">
							<ItemTemplate>
								<asp:Literal id="litGPA" runat="server" />
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="STATUS">
							<ItemTemplate>
								<asp:Literal id="litStatus" runat="server" />
							</ItemTemplate>
						</asp:TemplateColumn>
					</Columns>
				</common:groupedgrid>
			</td>
		</tr>
		
		<TR>
			<TD align="left" colSpan="2"></TD>
		</TR>
		<TR>
			<TD align="left" colSpan="2">
				<table cellpadding="3">
					<tr>
						<td align="left" colSpan="2"><asp:Literal ID="pdfLink" Runat="server" /></td>
					</tr>
					<TR>
						<TD align="left" colSpan="2">
					    </TD>
					</TR>
					<tr>
					    <TD align=left colSpan=2>
					        <common:GlobalizedButton id="btnRecalculate" runat="server" textKey="TXT_RECALC_STUDENT_PROGRESS" />
					    </TD>
				    </TR>
				</table>
			</TD>
		</TR>
  <TR>
	</table>
	<TR>
		<TD align="center" colSpan="2"></TD>
	</TR>
	<tr>
		<td align="center" colSpan="2"></td>
	</tr></TABLE>
</div>
