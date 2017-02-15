<%@ Control Language="c#" AutoEventWireup="false" Codebehind="WorkWithForms.ascx.cs" Inherits="Jenzabar.CRM.Common.Web.Portlets.FormBuilderPortlet.WorkWithForms" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<jenzabar:SubHeader id="hrdSettings" TextKey="TXT_PORTAL_SETTINGS" runat="server"/>
<div id="divMessage" class="psection" runat="server" visible="False">
	<TABLE width="100%" cellpadding="3">
		<TR>
			<TD width="100%" align="left" valign="top">
				<asp:Label id="lblScreenMessage" runat="server" Visible="False"></asp:Label></TD>
		</TR>
	</TABLE>
</div>
<div id="divData" class="pSection" runat="server" visible="False">
	<jenzabar:hint id="hntChangeSettings" runat="server" TextKey="TXT_PORTAL_SETTINGS_HINT"></jenzabar:hint>
	<TABLE width="100%" cellpadding="3">
		<TR>
			<TD align="left" nowrap valign="top">
				<asp:LinkButton id="lnkReturnTo" runat="server" Visible="False"></asp:LinkButton></TD>
		</TR>
		<tr>
			<td class="header" width="100%">
				<asp:Label ID="lblFormHeader" Runat="server"></asp:Label>
				<asp:ImageButton ID="imgNewForm" Runat="server"></asp:ImageButton>
			</td>
		</tr>
	</TABLE>
	<jenzabar:GroupedGrid ID="dgForms" Runat="server" Width="100%" BorderWidth="0" AlternatingItemStyle-CssClass="alt"
		CssClass="groupedGrid" DataKeyField="ID" OnItemCommand="dgForms_ItemCommand">
		<Columns>
			<asp:BoundColumn DataField="FormName" ItemStyle-Width="98%"></asp:BoundColumn>
			<asp:TemplateColumn ItemStyle-Width="1%">
				<ItemTemplate>
					<asp:ImageButton ID="btnEdit" CommandName="EditItem" Runat="server"></asp:ImageButton>
				</ItemTemplate>
			</asp:TemplateColumn>
			<asp:TemplateColumn ItemStyle-Width="1%">
				<ItemTemplate>
					<asp:ImageButton ID="btnDelete" CommandName="DeleteItem" Runat="server"></asp:ImageButton>
				</ItemTemplate>
			</asp:TemplateColumn>
		</Columns>
	</jenzabar:GroupedGrid>
</div>
