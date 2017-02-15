<%@ Control Language="c#" AutoEventWireup="false" Codebehind="DivisionMajorAssignment.ascx.cs" Inherits="Jenzabar.CRM.Candidate.Web.Portlets.DivisionMajorAssignmentPortlet.DivisionMajorAssignment"%>
<%@ Register TagPrefix="jenzabar" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<input type="hidden" value="0" name="isChanged">
<asp:placeholder id="plhJavaScript" Runat="server"></asp:placeholder>
<TABLE id="Table1" cellSpacing="3" cellPadding="3" width="100%">
	<TR>
		<TD><asp:label id="lblError" Visible="False" runat="server" ForeColor="Red" Width="40px">lblError</asp:label></TD>
	</TR>
	<TR>
		<TD><asp:label id="lblInstructionsText" runat="server">lblInstructionsText</asp:label></TD>
	</TR>
	<TR>
		<TD width="25%">
			<jenzabar:globalizedlabel id="lblDivision" runat="server" TextKey="DMAMessages.TXT_CAN_DMA_DIVISION_MAJOR_SCREEN_DROP_DOWN_LABEL">lblDivision</jenzabar:globalizedlabel>
			<asp:dropdownlist id="ddlDivision" runat="server" AutoPostBack="True" DataTextField="DivDesc" DataValueField="DivUniqueIdentifier"></asp:dropdownlist></TD>
	</TR>
	<TR>
		<TD height="84"><asp:datagrid id="ggMajors" Runat="server" Width="100%" ShowHeader="True" DataKeyField="MajorCode"
				GridLines="None" AutoGenerateColumns="False" AlternatingItemStyle-CssClass="alt" HeaderStyle-CssClass="header"
				CellPadding="0" CellSpacing="1">
				<Columns>
					<asp:TemplateColumn HeaderStyle-Width="25%" ItemStyle-Width="25%">
						<HeaderTemplate>
							<asp:CheckBox ID="chkSelectAll" Runat="server" OnClick="javascript: return select_deselectAll (this.checked, this.id);" AutoPostBack="True" Text='<%#Jenzabar.Common.Globalization.Globalizer.GetGlobalizedString("TXT_CAN_DMA_DIVISION_MAJOR_SCREEN_CONTROL_SELECT_ALL")%>' />
						</HeaderTemplate>
						<ItemTemplate>
							<asp:CheckBox ID="chkMajor" Runat="server" OnClick="javascript: return select_deselectAll (this.checked, this.id);" />
						</ItemTemplate>
					</asp:TemplateColumn>
					<asp:BoundColumn DataField="MajorDesc" HeaderStyle-Width="75%" ItemStyle-Width="75%" />
				</Columns>
			</asp:datagrid></TD>
	</TR>
	<TR>
		<TD><asp:button id="btnSave" Runat="server" Text="Save"></asp:button>&nbsp;
			<asp:button id="btnReset" runat="server" Text="Reset"></asp:button>&nbsp;<asp:button id="btnCancel" runat="server" Text="Cancel"></asp:button></TD>
	</TR>
</TABLE>
