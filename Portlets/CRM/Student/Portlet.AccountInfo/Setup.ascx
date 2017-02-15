<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Setup.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.AccountInfoPortlet.Setup" %>
<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<jenzabar:SubHeader id="hrdSettings" TextKey="TXT_PORTAL_SETTINGS" runat="server"/>
<div class="pSection" id="divDetail" visible="True" runat="server">
	<jenzabar:hint id="hntChangeSettings" runat="server" TextKey="TXT_PORTAL_SETTINGS_HINT"></jenzabar:hint>

		<table cellSpacing="3" cellPadding="3" runat="server">
			<tr>
				<td>
					<jenzabar:globalizedcheckbox id="cbxCanViewPrelimData" runat="server" Font-Bold="True" TextKey="TXT_1098T_SETTINGS_CAN_VIEW_PRELIM_DATA"></jenzabar:globalizedcheckbox></td>
			</tr>
			<tr>
				<td>
					<jenzabar:globalizedlabel id="lblCanViewPrelimDataDesc" runat="server" TextKey="TXT_1098T_SETTINGS_CAN_VIEW_PRELIM_DATA_UF"></jenzabar:globalizedlabel></td>
			</tr>
			<TR>
				<TD>&nbsp;</TD>
			</TR>
			<tr>
				<TD><jenzabar:globalizedlabel id="lblReCalcMessage" runat="server" Font-Bold="True" TextKey="TXT_1098T_SETTINGS_RE_CALC_MESSAGE"></jenzabar:globalizedlabel></TD>
			</tr>
			<tr>
				<td>
					<asp:textbox id="colReCalcMessage" runat="server" Width="600px"></asp:textbox></td>
			</tr>
			<tr>
				<td>
					<jenzabar:globalizedlabel id="lblReCalcMessageDesc" runat="server" TextKey="TXT_1098T_SETTINGS_RE_CALC_MESSAGE_UF"></jenzabar:globalizedlabel>
				</td>
			</tr>
			<TR>
				<TD>&nbsp;</TD>
			</TR>
			<tr>
				<td><jenzabar:globalizedcheckbox id="cbxMustPayCourses" runat="server" Font-Bold="True" TextKey="TXT_ACCOUNT_INFO_PAY_MUST_PAY_COURSES"></jenzabar:globalizedcheckbox></td>
			</tr>
			<tr>
				<td><jenzabar:globalizedlabel id="lblMustPayCoursesDesc" runat="server" TextKey="CS_SETTINGS_ADD_DROP_MUST_PAY_COURSE_PROCESS_FOR_SELECTED_COURSE"></jenzabar:globalizedlabel></td>
			</tr>
			<TR>
				<TD>&nbsp;</TD>
			</TR>
			<tr>
				<td><jenzabar:globalizedcheckbox id="cbxShowGrandTotal" runat="server" Font-Bold="True" TextKey="TXT_ACCOUNT_INFO_DISPLAY_GRAND_TOTAL"></jenzabar:globalizedcheckbox></td>
			</tr>
			<tr>
				<td><jenzabar:globalizedlabel id="lblShowGrandTotal" runat="server" TextKey="TXT_ACCOUNT_INFO_DISPLAY_GRAND_TOTAL_UF"></jenzabar:globalizedlabel></td>
			</tr>
		</table>
		<P>
			<jenzabar:globalizedbutton id="btnSave" runat="server" TextKey="TXT_1098T_SAVE_BUTTON" Width="75px"></jenzabar:globalizedbutton>&nbsp;
			<jenzabar:globalizedbutton id="btnCancel" runat="server" TextKey="TXT_1098T_CANCEL_BUTTON" Width="75px" CausesValidation="False"></jenzabar:globalizedbutton>
		</P>
</div>
