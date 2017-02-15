<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="DetailCompany.ascx.cs" Inherits="Jenzabar.CRM.Constituent.Web.Portlets.ConstituentSearchPortlet.DetailCompany" %>
<%@ Register TagPrefix="cmn" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<cmn:errordisplay id="error" Runat="server" />
<cmn:subheader id="lblCompanyProfile" Runat="server" />
<table cellSpacing="0" cellPadding="0" width="100%">
	<tr>
		<th align="left" width="10%">
			<asp:label id="lblName" Runat="server"></asp:label>
		</th>
		<td noWrap align="left" width="35%">
			<asp:label id="lblNameText" Runat="server"></asp:label>
		</td>
		<th align="left" width="15%">
			<asp:label id="lblContact" Runat="server"></asp:label>
		</th>
		<td noWrap align="left" width="40%">
			<asp:label id="lblContactText" Runat="server"></asp:label>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<th align="left">
			<asp:label id="lblEmail" Runat="server"></asp:label>
		</th>
		<td noWrap align="left">
			<asp:label id="lblEmailText" Runat="server"></asp:label>
		</td>
	</tr>
	<tr>
		<th vAlign="top" align="left">
			<asp:label id="lblAddress" Runat="server"></asp:label>
		</th>
		<td noWrap align="left">
			<asp:label id="lblAddressText" Runat="server"></asp:label>
		</td>
		<th vAlign="top" align="left">
			<asp:label id="lblPhone" Runat="server"></asp:label>
		</th>
		<td vAlign="top" noWrap align="left">
			<asp:label id="lblPhoneText" Runat="server"></asp:label>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td noWrap align="left">
			<asp:label id="lblCityStateZipText" Runat="server"></asp:label>
		</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
</table>
<cmn:GroupedGrid ID="ggEmployees" Runat="server" DataKeyField="HostID" RenderTableHeaders="true">
	<Columns>
		<cmn:GlobalizedBoundColumn DataField="Name" HeaderTextKey="TXT_NAME" />
		<cmn:GlobalizedBoundColumn DataField="Major" HeaderTextKey="TXT_MAJOR" />
		<cmn:GlobalizedBoundColumn DataField="ClassYear" HeaderTextKey="TXT_CLASSYEAR" />
		<cmn:GlobalizedBoundColumn DataField="City" HeaderTextKey="TXT_CITY" />
		<cmn:GlobalizedBoundColumn DataField="State" HeaderTextKey="TXT_STATE" />
		<asp:TemplateColumn>
			<ItemTemplate>
				<a href='mailto:<%# DataBinder.Eval( Container.DataItem, "Email" )%>'>
					<%# DataBinder.Eval( Container.DataItem, "Email" )%>
				</a>
			</ItemTemplate>
		</asp:TemplateColumn>
	</Columns>
</cmn:GroupedGrid>
<table cellSpacing="0" cellPadding="0" width="100%">
	<tr>
		<td noWrap align="left" height="40">
			<asp:button id="btnBack" Runat="server"></asp:button>
		</td>
	</tr>
</table>
