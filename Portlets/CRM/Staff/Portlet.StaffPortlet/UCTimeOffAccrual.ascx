<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="UCTimeOffAccrual.ascx.cs" Inherits="Portlet.StaffPortlet.UCTimeOffAccrual" %>
<div class="pSection" id="divError" visible="False" runat="server"><common:errordisplay id="ctlError" RunAt="server" /></div>
<div class="pSection" id="divHint" visible="False" runat="server"><common:hint id="ctlHint" RunAt="server" /></div>
<style>

</style>
<table>
	<tr>
		<td width="20">&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td width="20">&nbsp;</td>
		<td>
			<TABLE cellSpacing="0" cellPadding="5" width="100%" class="TableStyle">
				<tr align="left" style="">
					<td colspan="6" id="Th2104" runat="server" class="BottomLeftDarkerGray"><b>
							<asp:literal id="litYourTimeOff" runat="Server"></asp:literal></b></td>
				</tr>
				<TR  class="TableStyle">
					<TD id="Th1" runat="server" class="BottomLeftDarkGray">
						<common:globalizedliteral id="Globalizedliteral1" textKey="TXT_TYPE" runat="Server"></common:globalizedliteral>
					</TD>
					<TD id="Th211" runat="server" class="BottomLeftDarkBlue">
						<common:globalizedlabel id="Globalizedlabel1" textKey="TXT_AVAILABLE" runat="Server" CssClass="white"></common:globalizedlabel>
					</TD>
					<TD id="colAccrued" runat="server" class="BottomLeftDarkGray">
						<common:globalizedliteral id="Globalizedliteral115" textKey="TXT_ACCRUED" runat="Server"></common:globalizedliteral>
					</TD>
					<TD id="colCarriedOver" runat="server" class="BottomLeftDarkGray">
						<common:globalizedliteral id="Globalizedliteral116" textKey="TXT_CARRIED_OVER" runat="Server"></common:globalizedliteral>
					</TD>
					<TD runat="server" class="BottomLeftDarkGray" id="colUsed">
						<common:globalizedliteral id="Globalizedliteral117" textKey="TXT_USED" runat="Server"></common:globalizedliteral>
					</TD>
					<TD runat="server" class="BottomLeftDarkGray" id="colPeriod">
						<common:globalizedliteral id="Globalizedliteral2" textKey="TXT_PERIOD" runat="Server"></common:globalizedliteral>
					</TD>
				</TR>
				<asp:Repeater ID="rptData" Runat="server">
					<ItemTemplate>
						<tr  class="TableStyle">
							<td class="BottomLeft">
								<asp:Label ID="lblType" Runat="server"></asp:Label></td>
							<td class="BottomLeftLightBlue" align="right">
								<asp:Label ID="lblAvailable" Runat="server"></asp:Label></td>
							<td id="tdAccrued" runat="server" class="BottomLeftVeryLightBlue" align="right">
								<asp:Label ID="lblAccrued" Runat="server"></asp:Label></td>
							<td id="tdCarriedOver" runat="server" class="BottomLeftVeryLightBlue" align="right">
								<asp:Label ID="lblCarriedOver" Runat="server"></asp:Label></td>
							<td id="tdUsed" runat="server" class="BottomLeft" align="right">
								<asp:Label ID="lblUsed" Runat="server"></asp:Label></td>
							<td id="tdPeriod" runat="server" class="BottomLeft" align="right">
								<asp:Label ID="lblPeriod" Runat="server"></asp:Label></td>
						</tr>
					</ItemTemplate>
					<AlternatingItemTemplate>
						<tr  class="TableStyle">
							<td class="BottomLeftLightGray">
								<asp:Label ID="lblType" Runat="server"></asp:Label></td>
							<td class="BottomLeftMediumBlue"align="right">
								<asp:Label ID="lblAvailable" Runat="server"></asp:Label></td>
							<td id="tdAccrued" runat="server" class="BottomLeftLightGray" align="right">
								<asp:Label ID="lblAccrued" Runat="server"></asp:Label></td>
							<td id="tdCarriedOver" runat="server" class="BottomLeftLightGray" align="right">
								<asp:Label ID="lblCarriedOver" Runat="server"></asp:Label></td>
							<td id="tdUsed" runat="server" class="BottomLeftLightGray" align="right">
								<asp:Label ID="lblUsed" Runat="server"></asp:Label></td>
							<td id="tdPeriod" runat="server" class="BottomLeftLightGray" align="right">
								<asp:Label ID="lblPeriod" Runat="server"></asp:Label></td>
						</tr>
					</AlternatingItemTemplate>
				</asp:Repeater>
			</TABLE>
		</td>
	</tr>
	<tr>
		<td width="20">&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
</table>
<table>
	<tr>
		<td width="20">&nbsp;</td>
		<td width="400"><i><common:globalizedlabel id="glLabelNote" TextKey="TXT_STAFF_TIME_OFF_ACCRUAL_NOTE" runat="server"></common:globalizedlabel></i></td>
	</tr>
	<tr>
		<td width="20">&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
</table>
