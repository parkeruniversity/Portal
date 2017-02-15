<%@ Control Language="c#" AutoEventWireup="True" Codebehind="TuitionStatementData.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.My1098TInfoPortlet.TuitionStatementData"%>
<%@ Register TagPrefix="cmn" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Import namespace="System.Threading" %>
<div class="pSection" id="divError" runat="server" visible="False"><cmn:errordisplay id="ctlError" RunAt="server"></cmn:errordisplay>&nbsp;</div>
<div class="pSection" id="divWarning" runat="server" visible="False"><asp:label id="lblWarning" CssClass="PortletError" Runat="server"></asp:label></div>
<div class="pSection" id="divMessage" runat="server" visible="False"><asp:label id="lblMessage" Runat="server"></asp:label></div>
<div class="pSection" id="divDetail" runat="server" visible="True">
	<table width="100%">
		<TR>
			<td align="left" width="101"><cmn:globalizedlabel id="lblSelectAYear" runat="server" TextKey="TXT_1098_T_SELECT_A_YEAR"></cmn:globalizedlabel></td>
			<td><asp:dropdownlist id="ddlb1098TYear" runat="server" OnSelectedIndexChanged="SelChanged1098T" AutoPostBack="True"></asp:dropdownlist></td>
		</TR>
	</table>
	<table width="100%">
		<tr>
			<td align="left" width="101"><cmn:globalizedlabel id="lblname" runat="server" TextKey="TXT_1098_T_NAME_:"></cmn:globalizedlabel></td>
			<td align="left"><cmn:globalizedlabel id="colName" runat="server"></cmn:globalizedlabel></td>
		</tr>
		<tr>
			<td align="left" width="101"><cmn:globalizedlabel id="lblAddress" runat="server" TextKey="TXT_1098_T_ADDRESS_:"></cmn:globalizedlabel></td>
			<td align="left"><cmn:globalizedlabel id="colAddress" runat="server"></cmn:globalizedlabel></td>
		</tr>
	</table>
	<div id="DIV_100" runat="server" Visible="True">
		<table width="100%" border="1">
			<tr>
				<td>
					<table width="100%" border="0">
						<tr>
							<td bgColor="gainsboro" height="20"><cmn:globalizedlabel id="lblBOX2" runat="server" TextKey="TXT_1098_T_AMOUNT_BILLED_FOR_QUALIFIED_TUITION_AND_RELATED_EXPENSES"></cmn:globalizedlabel></td>
							<td align="right" bgColor="gainsboro" height="20"><cmn:globalizedlabel id="colBOX2" runat="server"></cmn:globalizedlabel></td>
						</tr>
						<tr>
							<td><cmn:globalizedlabel id="lblBOX3" runat="server" TextKey="TXT_1098_T_ADJUSTMENTS_FOR_A_PRIOR_YEAR"></cmn:globalizedlabel></td>
							<td align="right"><cmn:globalizedlabel id="colBOX3" runat="server"></cmn:globalizedlabel></td>
						</tr>
						<tr>
							<td bgColor="gainsboro"><cmn:globalizedlabel id="lblBOX4" runat="server" TextKey="TXT_1098_T_SCHOLARSHIPS_OR_GRANTS"></cmn:globalizedlabel></td>
							<td align="right" bgColor="gainsboro"><cmn:globalizedlabel id="colBOX4" runat="server"></cmn:globalizedlabel></td>
						</tr>
						<tr>
							<td height="20"><cmn:globalizedlabel id="lblBOX5" runat="server" TextKey="TXT_1098_T_ADJUSTMENTS_TO_SCHOLARSHIPS_OR_GRANTS_FOR_A_PRIOR_YEAR"></cmn:globalizedlabel></td>
							<td align="right" height="20"><cmn:globalizedlabel id="colBOX5" runat="server"></cmn:globalizedlabel></td>
						</tr>
						<tr>
							<td bgColor="gainsboro" colSpan="3"><cmn:globalizedlabel id="lblBOX8" runat="server"></cmn:globalizedlabel></td>
						</tr>
						<tr>
							<td colSpan="3"><cmn:globalizedlabel id="lblBOX9" runat="server"></cmn:globalizedlabel></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
</div>
