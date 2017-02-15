<%@ Control Language="c#" AutoEventWireup="True" Codebehind="CourseNeedsSetup.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.CourseNeedsPortlet.CourseNeedsSetup" %>
<%@ Register TagPrefix="cmn" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common"%>
<h4><cmn:GlobalizedLiteral id="glitHeader" TextKey="TXT_COURSE_NEEDS_SITE_WIDE_SETTINGS" runat="server" /></h4>
<div class="pSection">
	<cmn:errordisplay id="ctlError" RunAt="server" />
	<table id="tblChangeSettings" cellpadding="0" cellspacing="0">
		<tr>
			<th>
				<cmn:GlobalizedLiteral id="glitReportsToView" TextKey="TXT_CN_REPORTS_TO_VIEW" runat="server" />:</th>
			<td><asp:DropDownList ID="ddlReportToView" Runat="server" AutoPostBack="True" /></td>
		</tr>
		<tr>
			<th>
			</th>
			<td>
				<cmn:Hint ID="hntReportToInstr" Runat="server" TextKey="CN_SETTINGS_DISPLAY_LINK_TO_CUSTOM_ADV_WORKSHEET" />
			</td>
		</tr>
		<tr>
			<th>
				<cmn:GlobalizedLiteral id="glitCustomReportLink" TextKey="LBL_CUSTOM_REPORT_TEXT" runat="server" /></th>
			<td><asp:TextBox ID="tbCustomReportLink" Runat="server" Columns="35" MaxLength="50" /></td>
		</tr>
		<tr>
			<td></td>
			<td>
				<cmn:Hint ID="hntCustomReportInstr" Runat="server" TextKey="CN_SETTINGS_CUSTOM_REPORT_LINK_TEXT" />
			</td>
		</tr>
		<tr>
			<th>
				<cmn:GlobalizedLiteral id="glitAllowUpdate" TextKey="TXT_CN_ALLOW_UPDATE_COURSE_NEEDS" runat="server" /></th>
			<td><cmn:GlobalizedCheckBox ID="gcbxAllowUpdate" Runat="server" /></td>
		</tr>
		<tr>
			<td></td>
			<td><cmn:Hint ID="hntAllowUpdate" Runat="server" TextKey="CN_SETTINGS_ALLOW_UPDATE_RECALC_COURSE_NEEDS" /></td>
		</tr>
	</table>
	<br>
	<li>
		<cmn:GlobalizedButton ID="btnSave" Runat="server" TextKey="TXT_SAVE" />
		&nbsp;&nbsp;
		<cmn:GlobalizedButton ID="btnCancel" Runat="server" TextKey="TXT_CANCEL" />
	</li>
</div>
