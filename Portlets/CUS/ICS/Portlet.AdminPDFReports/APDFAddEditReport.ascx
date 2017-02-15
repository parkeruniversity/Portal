<%@ Register TagPrefix="common" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="APDFAddEditReport.ascx.cs" Inherits="Jenzabar.CUS.ICS.Web.Portlets.AdminPDFReportsPortlet.APDFAddEditReport" %>
<div class="pSection">
	<div>
		<h4>Report Definition</h4>
		<div class="hint"><asp:Label ID="lblHint" runat="server" /></div>
		<table>
			<tr>
				<td width="165">Category:</td>
				<td><asp:dropdownlist id="ddCategory" Runat="server" DataTextField="CategoryName" DataValueField="ID"></asp:dropdownlist></td>
			</tr>
			<tr>
				<td>Report Name:</td>
				<td><asp:textbox id="tbReportName" Runat="server" MaxLength="60"></asp:textbox></td>
			</tr>
			<tr>
				<td>Link Name:</td>
				<td><asp:textbox id="tbLinkName" Runat="server" MaxLength="60"></asp:textbox></td>
			</tr>
			<tr>
				<td>ERP Report Name:</td>
				<td><asp:textbox id="tbERPReportName" Runat="server" MaxLength="60"></asp:textbox></td>
			</tr>
            <tr>
                <td>Allow Subscription:</td>
                <td><asp:CheckBox runat="server" ID="cbxAllowSubscription"/></td>
            </tr>
		</table>
		<div id="divEXSpecific" runat="server" visible="False">
			<table>
				<tr>
					<td width="165">InfoMaker PBL Report Name:</td>
					<td><asp:TextBox ID="tbPBLReportName" Runat="server" Columns="60" MaxLength="255"></asp:TextBox></td>
				</tr>
				<tr>
					<td>ERP Report Description:</td>
					<td><asp:TextBox ID="tbReportDesc" Runat="server" Columns="60" MaxLength="255"></asp:TextBox></td>
				</tr>
			</table>
		</div>
		<table>
			<tr>
				<td width="165">&nbsp;</td>
				<td colspan="3"><asp:button id="btnSaveReport" Text="Save" Runat="server"></asp:button></td>
			</tr>
		</table>
	</div>
	<br>
	<div class="hint">Up to 20 parameters can be used. Enter parameters in the order 
		required for the report specified in your ERP.</div>
	<div>
		<common:GroupedGrid id="dgParameters" runat="server" DataKeyField="ID" RenderTableHeaders="true">
			<TableHeaderTemplate>Report Parameters</TableHeaderTemplate>
			<EmptyTableTemplate>No parameters yet defined</EmptyTableTemplate>
			<Columns>
				<asp:BoundColumn DataField="ParmOrder" HeaderText="Order" />
				<asp:BoundColumn DataField="Display" HeaderText="Display to end user" />
				<asp:BoundColumn DataField="DisplayName" HeaderText="Display name" />
				<common:EditButtonColumn HeaderText="Edit" />
				<common:DeleteButtonColumn HeaderText="Delete" />
			</Columns>
		</common:GroupedGrid>
	</div>
	<div>
		<asp:Button ID="btnAddParameter" Runat="server" Text="Add Parameter" Visible="False" />
	</div>
</div>
