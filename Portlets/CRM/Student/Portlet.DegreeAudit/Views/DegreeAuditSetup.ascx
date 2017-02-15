<%@ Register TagPrefix="common" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="True" Codebehind="DegreeAuditSetup.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.DegreeAudit.DegreeAuditSetup" %>
<common:SubHeader runat="server" id="shChangeSettings" textkey="TXT_COURSE_NEEDS_SITE_WIDE_SETTINGS" />
<div class="pSection">
	<table id="tblChangeSettings" cellpadding="0" cellspacing="0">
		<tr>
			<th>
				<common:GlobalizedLiteral id="litLblReportsToView" runat="server" TextKey="TXT_GRADE_REPORT_REPORTS_TO_VIEW" /></th>
			<td><asp:DropDownList ID="ddlReportToView" Runat="server" AutoPostBack="True" onselectedindexchanged="ddlReportToView_SelectedIndexChanged" /></td>
		</tr>
		<tr>
		<TR>
			<TD></TD>
			<TD></TD>
			<TD></TD>
		</TR>
		<tr>
			<th>
			</th>
			<td><common:Hint id="hntReportToViewExplained" runat="server" TextKey="DA_SETTINGS_DISPLAY_LINK_TO_CUSTOM_DEG_AUDIT" /></td>
			<td></td>
		</tr>
		<tr>
			<th>
				<common:GlobalizedLiteral id="litLabelCustomReportLinkText" runat="server" TextKey="LBL_CUSTOM_REPORT_TEXT" />
			</th>
			<td><asp:TextBox ID="txtCustomReportLink" MaxLength="50" Runat="server" /></td>
		</tr>
		<TR>
			<TD></TD>
			<TD><common:Hint id="htnCutomReportLinkExplained" runat="server" TextKey="SETTINGS_CUSTOM_REPORT_LINK_TEXT_DESC_DEG_AUD" /></TD>
		</TR>	
		<TR>
			<TD height="3"></TD>
			<TD height="3"></TD>
		</TR>
		<tr>
			<th>
				<common:GlobalizedLiteral id="litLabelRecalculateStudentProgess" runat="server" TextKey="LBL_ALLOW_RECALC_STUDENT_PROG" /></th>
			<td><asp:checkbox ID="cbAllowRecalculate" Runat="server" /></td>
		</tr>
		<tr>
			<th>
			</th>
			<td><common:Hint id="hntAllRecalStudProgExplained" runat="server" TextKey="ALLOW_RECALC_STUDENT_PROG_DESC_DEG_AUD" /></td>
		</tr>
		<TR>
			<TD colSpan="2"></TD>
		</TR>
		<TR>
			<TD colSpan="2"></TD>
		</TR>
		<TR>
			<TD colSpan="2"></TD>
		</TR>
		<tr>
			<td colspan="2" id="buttonCell">
				<common:GlobalizedButton ID="btnSave" Runat="server" TextKey="TXT_SAVE" />
				&nbsp;&nbsp;
				<common:GlobalizedButton ID="btnCancel" Runat="server" TextKey="TXT_CANCEL" />
			</td>
		</tr>
	</table>
</div>
