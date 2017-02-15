<%@ Register TagPrefix="cmn" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="DefaultView.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.CourseNeedsPortlet.DefaultView" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<cmn:errordisplay id="errDisplay" Runat="server"></cmn:errordisplay><br>
<div class="pSection">
<div id="divMain" runat="server">
	<h5><asp:Literal ID="litCurrentUser" Runat="server" /></h5>
	<cmn:GroupedGrid id="dgSummary" runat="server" RenderGroupHeaders="true">
		<TableHeaderTemplate>
			<%# Globalizer.GetGlobalizedString("TXT_REQUIREMENTS_SUMMARY") %>
		</TableHeaderTemplate>
		<Columns>
			<cmn:GlobalizedBoundColumn HeaderText="NAME" DataField="Description" />
			<asp:TemplateColumn HeaderText="STATUS">
				<ItemTemplate>
					<asp:Literal id="litSummary" runat="server" />
				</ItemTemplate>
			</asp:TemplateColumn>
		</Columns>
	</cmn:GroupedGrid>
	<table width="100%">
		<tr>
			<td noWrap width="100%"><cmn:GlobalizedLinkButton id="glinkButtonClickHere" runat="server" TextKey="TXT_CLICK_HERE" />&nbsp;<asp:literal id="litClickToViewCNFor" Runat="server" /></td>
		</tr>
	</table>
</div>
</div>
