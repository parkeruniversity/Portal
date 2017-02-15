<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Setup.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.My1098TInfoPortlet.Setup" %>
<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<jenzabar:SubHeader id="hdrSetup" TextKey="TXT_PORTAL_SETTINGS" runat="server"></jenzabar:SubHeader>
<div class="pSection"><jenzabar:Hint id="hntSetup" runat="server" TextKey="TXT_PORTAL_SETTINGS_HINT"></jenzabar:Hint></div>
<div class="pSection" id="divError" visible="False" runat="server"><jenzabar:errordisplay id="ctlError" RunAt="server"></jenzabar:errordisplay></div>
<div class="pSection" id="divWarning" visible="False" runat="server"><asp:label id="lblWarning" CssClass="PortletError" Runat="server"></asp:label></div>
<div class="pSection" id="divMessage" visible="False" runat="server"><asp:label id="lblMessage" Runat="server" ForeColor=Red></asp:label></div>
<div class="pSection" id="divDetail" visible="True" runat="server">

	<li>
		<table cellSpacing="3" cellPadding="3" runat="server">
			<tr>
				<td><jenzabar:globalizedlabel id="lblDefault1098TYear" runat="server" Font-Bold="True" TextKey="TXT_1098T_SETTINGS_DISPLAY_DEFAULT_1098_T_YEAR_DESC"></jenzabar:globalizedlabel></td>
			</tr>
			<tr>
				<td><asp:dropdownlist id="ddlb1098TYear" runat="server"></asp:dropdownlist></td>
			</tr>
			<tr>
				<td><jenzabar:globalizedlabel id="lblDefault1098TYearDesc" runat="server" TextKey="TXT_1098T_SETTINGS_DISPLAY_DEFAULT_1098_T_YEAR_DESC_UF"></jenzabar:globalizedlabel></td>
			</tr>
			<tr>
				<td><br>
				</td>
			</tr>
			<TR>
				<TD><jenzabar:globalizedlabel id="lblNumPrevYrs" runat="server" Font-Bold="True" TextKey="TXT_1098T_SETTINGS_NUM_PREV_YRS"></jenzabar:globalizedlabel></TD>
			</TR>
			<tr>
				<td>
					<asp:dropdownlist id="ddlbNumPrevYrs" runat="server"></asp:dropdownlist></td>
			</tr>
			<tr>
				<td>
					<jenzabar:globalizedlabel id="lblNumPrevYrsDesc" runat="server" TextKey="TXT_1098T_SETTINGS_NUM_PREV_YRS_UF"></jenzabar:globalizedlabel></td>
			</tr>

			<TR>
				<TD><jenzabar:globalizedlabel id="lblCanViewPrelimData" runat="server" Font-Bold="True" Visible="False" ></jenzabar:globalizedlabel></TD>
			</TR>
			<tr>
				<td>
					<jenzabar:globalizedcheckbox id="cbxCanViewPrelimData" runat="server" Font-Bold="True" TextKey="TXT_1098T_SETTINGS_CAN_VIEW_PRELIM_DATA" Visible="False"></jenzabar:globalizedcheckbox></td>
			</tr>
			<tr>
				<td>
					<jenzabar:globalizedlabel id="lblCanViewPrelimDataDesc" runat="server" TextKey="TXT_1098T_SETTINGS_CAN_VIEW_PRELIM_DATA_UF" Visible="False"></jenzabar:globalizedlabel></td>
			</tr>

			<TR>
				<TD><jenzabar:globalizedlabel id="lblCanView1098TData" runat="server" Font-Bold="True"></jenzabar:globalizedlabel>
				</TD>
			</TR>
			<tr>
				<td>
					<jenzabar:globalizedcheckbox id="cbxCanView1098TData" runat="server" Font-Bold="True" TextKey="TXT_1098T_SETTINGS_CAN_VIEW_1098_T_DATA"></jenzabar:globalizedcheckbox></td>
			</tr>
			<tr>
				<td>
					<jenzabar:globalizedlabel id="lblCanView1098TDataDesc" runat="server" TextKey="TXT_1098T_SETTINGS_CAN_VIEW_1098_T_DATA_UF"></jenzabar:globalizedlabel></td>
			</tr>
			<tr>
				<td><br>
				</td>
			</tr>
			<TR>
				<TD><jenzabar:globalizedlabel id="lblNoViewMessage" runat="server" Font-Bold="True" TextKey="TXT_1098T_SETTINGS_NO_VIEW_MESSAGE"></jenzabar:globalizedlabel></TD>
			</TR>
			<TR>
				<td>
					<asp:textbox id="colNoViewMessage" runat="server" Width="600px"></asp:textbox></td>
			</TR>
			<tr>
				<td>
					<jenzabar:globalizedlabel id="lblNoViewMessageDesc" runat="server" TextKey="TXT_1098T_SETTINGS_NO_VIEW_MESSAGE_UF"></jenzabar:globalizedlabel></td>
			</tr>
			</TR>
		</table>
		<P>
			<jenzabar:globalizedbutton id="btnSave" runat="server" TextKey="TXT_1098T_SAVE_BUTTON" Width="75px"></jenzabar:globalizedbutton>&nbsp;
			<jenzabar:globalizedbutton id="btnCancel" runat="server" TextKey="TXT_1098T_CANCEL_BUTTON" Width="75px" CausesValidation="False"></jenzabar:globalizedbutton>
		</P>
		</TD></TR></TABLE>
	</li>
</div>
