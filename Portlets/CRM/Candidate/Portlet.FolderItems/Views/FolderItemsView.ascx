<%@ Control Language="c#" AutoEventWireup="True" Codebehind="FolderItemsView.ascx.cs" Inherits="Jenzabar.CRM.Candidate.Web.Portlets.FolderItemsPortlet.FolderItemsView" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<h4><asp:Label ID="lblCandName" Runat="server"></asp:Label></h4>
<div class="pSection">
<table cellSpacing="0" cellPadding="3" width="100%">

		<tr>
			<td noWrap width="100%">
				<asp:label id="lblProgram" Runat="server"></asp:label>
				<asp:dropdownlist id="ddlProgram" Runat="server" AutoPostBack="True"></asp:dropdownlist>
			</td>
		</tr>
</table>
<table id="tblGrids">
<tr>
 <td>
    <jenzabar:GroupedGrid id="dgIncompleteItems" runat="server">
	<TableHeaderTemplate><%=Globalizer.GetGlobalizedString("TXT_FOLDER_ITEM_INCOMPLETE_ITEMS")%></TableHeaderTemplate>
	<Columns>
		<asp:BoundColumn DataField="folder_desc"></asp:BoundColumn>
		<asp:TemplateColumn>
			<ItemTemplate>
				<asp:Image Runat="server" ImageUrl='<%# GetBooleanImage(DataBinder.Eval(Container.DataItem, "rec_sts").ToString())%>' >
				</asp:Image>
			</ItemTemplate>
		</asp:TemplateColumn>
	</Columns>
    </jenzabar:GroupedGrid>
 </td>
</tr>
<tr>
 <td noWrap colspan="2">
    <asp:image id="imgReceived" Runat="server"></asp:image>
	<asp:label id="lblReceived" Runat="server"></asp:label>&nbsp;&nbsp;&nbsp;
    <asp:image id="imgNotReceived" Runat="server"></asp:image>
	<asp:label id="lblNotReceived" Runat="server"></asp:label></td>
 </tr>
 <tr><td>&nbsp</td></tr>
<tr>
<td>
<jenzabar:GroupedGrid id="dgCompleteItems" runat="server" width="100%">
	<TableHeaderTemplate><%=Globalizer.GetGlobalizedString("TXT_FOLDER_ITEM_COMPLETED_ITEMS")%></TableHeaderTemplate>
	
	<Columns>
		<asp:BoundColumn DataField="folder_desc"></asp:BoundColumn>
		<asp:BoundColumn DataField="compl_dte"></asp:BoundColumn>
	</Columns>
</jenzabar:GroupedGrid>
</td>
</tr>
</table>
<table cellSpacing="0" cellPadding="3" width="100%">
			
			<tr>
				<td noWrap><asp:label id="lblFooter" Runat="server"></asp:label></td>
			</tr>
			<tr>
				<td noWrap><asp:label id="lblError" Runat="server" CssClass="PortletError"></asp:label></td>
			</tr>
			<tr>
				<td><asp:linkbutton id="lnkFindCandidate" Runat="server" onclick="lnkFindCandidate_Click"></asp:linkbutton></td>
			</tr>
			<tr>
				<td><asp:linkbutton id="lnkBack" Runat="server"></asp:linkbutton></td>
			</tr>
</table>
</div>
