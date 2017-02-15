<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Setup.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.StudentSchedulePortlet.Setup" %>
<%@ Register TagPrefix="cmn" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<cmn:subheader ID="subPortalSettings" runat="server" TextKey="TXT_PORTAL_SETTINGS" />
<div class="pSection" id="divHint" runat="server"><cmn:Hint id="hntPortalSettings" runat="server" TextKey="TXT_PORTAL_SETTINGS_HINT" /></div>
<div class="pSection">

	<table cellSpacing="2" cellPadding="1" width="100%" border="0">
		<tr>
			<th align="left" colSpan="3">
			</th>
		</tr>
		<TR>
			<TD vAlign="top" noWrap width="8%" colSpan="3"><cmn:globalizedlabel id="lblTextbook" TextKey="TEXTBOOK_DISPLAY" Runat="server"></cmn:globalizedlabel></TD>
		</TR>
		<TR>
			<TD vAlign="top" noWrap width="8%" colSpan="3"><cmn:globalizedcheckbox id="gcbxCourseTextBook" TextKey="SSC_SETTINGS_DISPLAY_COURSE_TEXT_BOOK_COL" Runat="server"></cmn:globalizedcheckbox></TD>
		</TR>
		<TR>
			<TD vAlign="top" noWrap width="8%" colSpan="3">&nbsp;</TD>
		</TR>
		<TR>
			<TD vAlign="top" width="8%" colSpan="3" noWrap><cmn:globalizedlabel id="lblReportsToView" TextKey="TXT_GRADE_REPORT_REPORTS_TO_VIEW" Runat="server"></cmn:globalizedlabel></TD>
		</TR>
		<tr>
			<td vAlign="top" width="8%" colSpan="1" height="32"><asp:dropdownlist id="ddlCustomReportLinkText" Runat="server" Width="152px"></asp:dropdownlist></td>
			<td vAlign="top" width="90%"><cmn:globalizedlabel id="lblReportsToViewDesc" TextKey="SSC_SETTINGS_REPORTS_TO_VIEW_DESC" Runat="server"></cmn:globalizedlabel></td>
		</tr>
		<TR>
			<TD vAlign="top" noWrap width="8%" colSpan="3"></TD>
		</TR>
		<TR>
			<TD vAlign="top" noWrap width="8%" colSpan="3"><cmn:globalizedlabel id="lblCustomReportLinkText" TextKey="LBL_CUSTOM_REPORT_TEXT" Runat="server"></cmn:globalizedlabel></TD>
		</TR>
		<TR>
			<TD vAlign="top" noWrap width="8%">
				<asp:TextBox id="txtCustomReportLinkText" Runat="server" MaxLength="100"></asp:TextBox></TD>
			<TD vAlign="top" width="90%">
				<cmn:globalizedlabel id="lblCustomReportLinkTextDesc" TextKey="SSC_SETTINGS_CUSTOM_RPT_LINK_TEXT_DESC"
					Runat="server"></cmn:globalizedlabel></TD>
		</TR>
		<TR>
			<TD vAlign="top" noWrap width="8%" colSpan="3"></TD>
		</TR>
		<tr>
			<td colSpan="3">
				<TABLE id="Table1" cellSpacing="2" cellPadding="1" width="300" border="0">
					<TR>
						<TD><cmn:globalizedbutton id="btnSave" TextKey="TXT_SAVE" Runat="server"></cmn:globalizedbutton></TD>
						<TD><cmn:globalizedbutton id="btnCancel" TextKey="TXT_CANCEL" Runat="server"></cmn:globalizedbutton></TD>
					</TR>
				</TABLE>
			</td>
		</tr>
	</table>
</div>
