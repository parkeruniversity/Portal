<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="EditNotificationView.ascx.cs" Inherits="Jenzabar.CRM.Candidate.Web.Portlets.AccountNotificationPortlet.EditNotification" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<input type="hidden" value="0" name="isChanged">
<asp:placeholder id="plhJavaScript" Runat="server"></asp:placeholder>
<jenzabar:tabgroup id="AccountTabs" runat="server">
	<jenzabar:Tab id="tbActive" runat="server">
		<br>
		<jenzabar:GroupedGrid ID="dgActive" ShowHeader="True" RenderTableHeaders="True" DataKeyField="ID" Runat="server">
			<Columns>
				<asp:TemplateColumn HeaderStyle-Width="15%" ItemStyle-Width="15%" >
					<HeaderTemplate>
						<asp:CheckBox ID="chkSelectAllActive" runat="server" OnClick="javascript: return select_deselectAllActive (this.checked, this.id);" AutoPostBack="True" Text='<%#Jenzabar.Common.Globalization.Globalizer.GetGlobalizedString("TXT_ACC_NOT_SELECT_ALL")%>' />
					</HeaderTemplate>
					<ItemTemplate>
						<asp:CheckBox ID="chkActive" Runat="server" />
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:BoundColumn DataField="FirstName"></asp:BoundColumn>
				<asp:BoundColumn DataField="LastName"></asp:BoundColumn>
				<asp:BoundColumn DataField="Email"></asp:BoundColumn>
			</Columns>
		</jenzabar:GroupedGrid>
		<br>
		<table cellSpacing="0" cellPadding="3" width="100%" border="0">
			<tr>
				<td noWrap align="left" width="10%">
					<asp:label id="lblTemplate" runat="server"></asp:label></td>
				<td align="left" width="90%">
					<asp:dropdownlist id="ddlTemplate" runat="server"></asp:dropdownlist>&nbsp;
					<asp:Button id="btnSend" runat="server" Text="Send"></asp:Button></td>
			</tr>
			<tr>
				<td colspan="2">
					<asp:Button ID="btnMoveToHeld" Runat="server"></asp:Button>&nbsp;
					<asp:Button ID="btnActiveCancel" Runat="server"></asp:Button>
				</td>
			</tr>
		</table>
	</jenzabar:Tab>
	<jenzabar:Tab id="tbHeld" runat="server">
		<br>
		<jenzabar:GroupedGrid ID="dgHeld" ShowHeader="True" RenderTableHeaders="True" DataKeyField="ID" Runat="server">
			<Columns>
				<asp:TemplateColumn HeaderStyle-Width="15%" ItemStyle-Width="15%">
					<HeaderTemplate>
						<asp:CheckBox ID="chkSelectAllHeld" Runat="server" OnClick="javascript: return select_deselectAllHeld (this.checked, this.id);" AutoPostBack="True" Text='<%#Jenzabar.Common.Globalization.Globalizer.GetGlobalizedString("TXT_ACC_NOT_SELECT_ALL")%>' />
					</HeaderTemplate>
					<ItemTemplate>
						<asp:CheckBox ID="chkHeld" Runat="server" />
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:BoundColumn DataField="FirstName"></asp:BoundColumn>
				<asp:BoundColumn DataField="LastName"></asp:BoundColumn>
				<asp:BoundColumn DataField="Email"></asp:BoundColumn>
			</Columns>
		</jenzabar:GroupedGrid>
		<br>
		<table cellSpacing="0" cellPadding="3" width="100%" border="0">
			<tr>
				<td>
					<asp:button id="btnCancelNotification" runat="server" Text="Cancel Notification"></asp:button></td>
			</tr>
			<tr>
				<td align="left" nowrap>
					<asp:button id="btnMoveToActive" runat="server" Text="Save"></asp:button>&nbsp;
					<asp:button id="btnHeldCancel" runat="server" Text="Cancel"></asp:button>&nbsp;
				</td>
			</tr>
		</table>
	</jenzabar:Tab>
</jenzabar:tabgroup>
<jenzabar:ErrorDisplay id="errDisplay" Runat="server"></jenzabar:ErrorDisplay>
