<%@ Control Language="c#" AutoEventWireup="True" Codebehind="SearchCriteria.ascx.cs" Inherits="Jenzabar.CRM.Constituent.Web.Portlets.ConstituentSearchPortlet.SearchCriteria" %>
<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<jenzabar:ErrorDisplay ID="error" Runat="server" />
<jenzabar:TabGroup ID="DefaultPageTabs" runat="server">
	<jenzabar:Tab id="tbPersonSearch" runat="server">
		<asp:Table Width="100%">
			<asp:TableRow>
				<asp:TableCell>
					<asp:Label ID="lblErrorPerson" CssClass="PortletError" Runat="server"/>
				</asp:TableCell>
			</asp:TableRow>
		</asp:Table>
		<table width="100%" cellpadding="2" cellspacing="0">
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td width="15%" nowrap>&nbsp;</td>
				<th width="25%">
					<asp:Label ID="lblPersonalInfo" Runat="server"></asp:Label>
				</th>
				<td width="15%" nowrap>&nbsp;</td>
				<th width="45%">
					<asp:Label ID="lblInstitueInfo" Runat="server"></asp:Label>
				</th>
			</tr>
			<tr>
				<td>
					<asp:Label ID="lblLastName" Runat="server"  AssociatedControlID="txtLastName" /></td>
				<td>
					<asp:TextBox ID="txtLastName" Runat="server" /></td>
				<td>
					<asp:Label ID="lblMajor" Runat="server"  AssociatedControlID="lstMajor" /></td>
				<td>
					<asp:ListBox ID="lstMajor" Runat="server" Rows="1" /></td>
			</tr>
			<tr>
				<td>
					<asp:Label ID="lblFirstName" Runat="server" AssociatedControlID="txtFirstName" /></td>
				<td>
					<asp:TextBox ID="txtFirstName" Runat="server" /></td>
				<td>
					<asp:Label ID="lblClassYear" Runat="server"  AssociatedControlID="txtClassYear" /></td>
				<td>
					<asp:TextBox ID="txtClassYear" Runat="server" /></td>
			</tr>
			<tr>
				<td>
					<asp:Label ID="lblMiddleName" Runat="server" AssociatedControlID="txtMiddleName" /></td>
				<td>
					<asp:TextBox ID="txtMiddleName" Runat="server" /></td>
			</tr>
			<tr>
				<td>
					<asp:Label ID="lblCity" Runat="server" AssociatedControlID="txtCity" /></td>
				<td>
					<asp:TextBox ID="txtCity" Runat="server" /></td>
			</tr>
			<tr>
				<td>
					<asp:Label ID="lblState" Runat="server" AssociatedControlID="lstState" /></td>
				<td>
					<asp:ListBox ID="lstState" Runat="server" Rows="1" /></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<!--<tr>
				<td>
					<asp:Button ID="btnCompanySearch" Runat="server" /></td>
				<td>
					<asp:Button ID="btnCompanyReset" Runat="server" /></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>-->
		</table>
		<jenzabar:GroupedGrid id="dgPersonSearchResults" runat="server" DataKeyField="HostID" RenderTableHeaders="true"
			Cellspacing="1" Cellpadding="0">
			<Columns>
				<asp:TemplateColumn>
					<ItemTemplate>
						<asp:LinkButton ID="lnkPersonName" CommandArgument='<%# DataBinder.Eval( Container.DataItem, "HostID" )%>' OnCommand="Constituent_Click" Runat="server">
							<%# DataBinder.Eval( Container.DataItem, "Name" )%>
						</asp:LinkButton>
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn>
					<ItemTemplate>
						<%# DataBinder.Eval( Container.DataItem, "MajorDesc" )%>
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn>
					<ItemTemplate>
						<%# DataBinder.Eval( Container.DataItem, "ClassYear" )%>
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn>
					<ItemTemplate>
						<%# DataBinder.Eval( Container.DataItem, "City" )%>
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn>
					<ItemTemplate>
						<%# DataBinder.Eval( Container.DataItem, "StateCode" )%>
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn>
					<ItemTemplate>
						<a href="mailto:<%# DataBinder.Eval( Container.DataItem, "Email" )%>">
							<%# DataBinder.Eval( Container.DataItem, "Email" )%>
						</a>
					</ItemTemplate>
				</asp:TemplateColumn>
			</Columns>
			<EmptyTableTemplate><%=Globalizer.GetGlobalizedString("TXT_THERE_WAS_NO_DATA_FOR_THE_SPECIFIC_CRITERIA")%></EmptyTableTemplate>
		</jenzabar:GroupedGrid>
	</jenzabar:Tab>
	<jenzabar:Tab id="tbCompanySearch" runat="server">
		<asp:Table Width="100%">
			<asp:TableRow>
				<asp:TableCell>
					<asp:Label ID="lblErrorCompany" CssClass="PortletError" Runat="server"/>
				</asp:TableCell>
			</asp:TableRow>
		</asp:Table>
		<table width="100%" cellpadding="2" cellspacing="0">
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<th>
					<asp:Label ID="lblCompanyInfo" Runat="server" />
				</th>
			</tr>
			<tr>
				<td width="10%">
					<asp:Label ID="lblCompanyName" Runat="server" /></td>
				<td width="90%">
					<asp:TextBox ID="txtCompanyName" Runat="server" /></td>
			</tr>

		</table>
		<jenzabar:GroupedGrid id="dgCompanySearchResults" runat="server" DataKeyField="HostID" RenderTableHeaders="true"
			Cellspacing="1" Cellpadding="0">
			<Columns>
				<asp:TemplateColumn>
					<ItemTemplate>
						<asp:LinkButton ID="lnkCompanyName" CommandArgument='<%# DataBinder.Eval( Container.DataItem, "HostID" )%>' OnCommand="Constituent_Click" Runat="server">
							<%# ((Jenzabar.CRM.Constituent.Web.Portlets.ConstituentSearchPortlet.ConstituentSearchResultsConstituentsConstituent)Container.DataItem).Name[0].Value %>
						</asp:LinkButton>
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn>
					<ItemTemplate>
						<%#  getAddressLines(((Jenzabar.CRM.Constituent.Web.Portlets.ConstituentSearchPortlet.ConstituentSearchResultsConstituentsConstituent)Container.DataItem).Address1[0].Value, ((Jenzabar.CRM.Constituent.Web.Portlets.ConstituentSearchPortlet.ConstituentSearchResultsConstituentsConstituent)Container.DataItem).Address2[0].Value, ((Jenzabar.CRM.Constituent.Web.Portlets.ConstituentSearchPortlet.ConstituentSearchResultsConstituentsConstituent)Container.DataItem).Address3[0].Value)%>
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn>
					<ItemTemplate>
						<%# ((Jenzabar.CRM.Constituent.Web.Portlets.ConstituentSearchPortlet.ConstituentSearchResultsConstituentsConstituent)Container.DataItem).City[0].Value %>
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn>
					<ItemTemplate>
						<%# ((Jenzabar.CRM.Constituent.Web.Portlets.ConstituentSearchPortlet.ConstituentSearchResultsConstituentsConstituent)Container.DataItem).StateCode[0].Value %>
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn>
					<ItemTemplate>
						<%# ((Jenzabar.CRM.Constituent.Web.Portlets.ConstituentSearchPortlet.ConstituentSearchResultsConstituentsConstituent)Container.DataItem).ContactFirstName[0].Value %>&nbsp;
						<%# ((Jenzabar.CRM.Constituent.Web.Portlets.ConstituentSearchPortlet.ConstituentSearchResultsConstituentsConstituent)Container.DataItem).ContactLastName[0].Value %>
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn>
					<ItemTemplate>
						<a href="mailto:'<%# ((Jenzabar.CRM.Constituent.Web.Portlets.ConstituentSearchPortlet.ConstituentSearchResultsConstituentsConstituent)Container.DataItem).ContactEmail[0].Value %>'">
							<%# ((Jenzabar.CRM.Constituent.Web.Portlets.ConstituentSearchPortlet.ConstituentSearchResultsConstituentsConstituent)Container.DataItem).ContactEmail[0].Value%>
						</a>
					</ItemTemplate>
				</asp:TemplateColumn>
			</Columns>
			<EmptyTableTemplate><%=Globalizer.GetGlobalizedString("TXT_THERE_WAS_NO_DATA_FOR_THE_SPECIFIC_CRITERIA")%></EmptyTableTemplate>
		</jenzabar:GroupedGrid>
	</jenzabar:Tab>
</jenzabar:TabGroup>
<table>
			<tr>
				<td>
					<asp:Button ID="btnSearch" Runat="server" /></td>
				<td>
					<asp:Button ID="btnReset" Runat="server" /></td>
			</tr></table>


