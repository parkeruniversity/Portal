<%@ Register TagPrefix="jenzabar" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="True" Codebehind="DivisionMajorUserAssignment.ascx.cs" Inherits="Jenzabar.CRM.Candidate.Web.Portlets.DivisionMajorAssignmentPortlet.DivisionMajorUserAssignment"%>
<input type="hidden" value="0" name="isChanged">
<asp:placeholder id="Placeholder1" Runat="server"></asp:placeholder>
<TABLE id="Table1" cellSpacing="3" cellPadding="3" width="100%">
	<TR>
		<TD><asp:label id="lblError" Visible="False" runat="server" ForeColor="Red">lblError</asp:label></TD>
	</TR>
	<TR>
		<TD><asp:Label id="lblInstructionsText" runat="server">lblInstructionsText</asp:Label></TD>
	</TR>
	<TR>
		<TD><jenzabar:globalizedlabel id="lblPerson" runat="server" TextKey="DMAMessages.TXT_CAN_DMA_USER_SCREEN_DROP_DOWN_LABEL">lblPerson</jenzabar:globalizedlabel><asp:dropdownlist id="ddlPerson" runat="server" DataValueField="GUID" DataTextField="DisplayName"
				AutoPostBack="True" onselectedindexchanged="ddlPerson_SelectedIndexChanged"></asp:dropdownlist></TD>
	<TR>
		<TD><asp:placeholder id="plhJavaScript" Runat="server"></asp:placeholder></TD>
	<TR>
		<TD><FONT face="新細明體">
				<asp:Label id="lblMessage" runat="server" Visible="False" Width="120px">lblMessage</asp:Label></FONT></TD>
	</TR>
	<TR>
		<TD height="84"><asp:datagrid id="ggDivisionMajorCombinedDesc" Width="100%" Runat="server" ShowHeader="True" DataKeyField="DivisionMajorID"
				GridLines="None" AutoGenerateColumns="False" AlternatingItemStyle-CssClass="alt" HeaderStyle-CssClass="header"
				CellPadding="0" CellSpacing="1">
				<Columns>
					<asp:TemplateColumn HeaderStyle-Width="25%" ItemStyle-Width="25%">
						<HeaderTemplate>
							<asp:CheckBox ID="chkSelectAll" Runat="server" AutoPostBack="True" OnClick="javascript: return select_deselectAll (this.checked, this.id);" Text='<%#Jenzabar.Common.Globalization.Globalizer.GetGlobalizedString("TXT_CAN_DMA_USER_SCREEN_CONTROL_SELECT_ALL")%>' />
						</HeaderTemplate>
						<ItemTemplate>
							<asp:CheckBox ID="chkMajor" Runat="server" AutoPostBack="True" OnClick="javascript: return select_deselectAll (this.checked, this.id);" />
						</ItemTemplate>
					</asp:TemplateColumn>
					<asp:BoundColumn DataField="DivisionMajorCombinedDesc" HeaderStyle-Width="75%" ItemStyle-Width="75%" />
				</Columns>
			</asp:datagrid></TD>
	</TR>
	<TR>
		<TD><asp:button id="btnSave" Runat="server" Text="Save" onclick="btnSave_Click"></asp:button>&nbsp;
			<asp:button id="btnReset" runat="server" Text="Reset" onclick="btnReset_Click"></asp:button><FONT face="新細明體">&nbsp;</FONT><asp:button id="btnCancel" runat="server" Text="Cancel" onclick="btnCancel_Click"></asp:button></TD>
	</TR>
</TABLE>
