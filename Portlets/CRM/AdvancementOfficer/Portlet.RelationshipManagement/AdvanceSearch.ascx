<%@ Control Language="c#" AutoEventWireup="false" Codebehind="AdvanceSearch.ascx.cs" Inherits="Jenzabar.CRM.AdvancementOfficer.Web.Portlets.RelationshipManagementPortlet.AdvanceSearch" %>
<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<script>
function go(n) {
    var url = "<%=this.ParentPortlet.GetNextScreenURL("LinkRel//")%>";
	url = url.substring(0, url.length - 16);
	url = url + n + "&screenType=next";
	location = url;
}
</script>
<jenzabar:ErrorDisplay ID="errDisplay" Runat="server"/>
<input type="hidden" name="AllowPostback" value="true" />
<div class="breadcrumbs" style="font-weight:bold;"><asp:Label ID="lbResultsCount" Runat="server" Visible="False" /></div>
<h4><jenzabar:GlobalizedLiteral id="litHeader" TextKey="TXT_REL_MGMT_ADVANCE_CONST_SEARCH" runat="server"></jenzabar:GlobalizedLiteral></h4>
<jenzabar:ContentTabGroup ID="DefaultPageTabs" runat="server">
	<jenzabar:ContentTab id="tbPersonSearch" runat="server">
		<table width="100%" cellpadding="2" cellspacing="0">
			<tr>
				<td width="10%" nowrap>&nbsp;</td>
				<th width="25%">
					<asp:Label ID="lblPersonalInfo" Runat="server"></asp:Label></th>
				<td width="10%" nowrap>&nbsp;</td>
				<th width="55%">&nbsp;</th>

			</tr>
			<tr>
				<td>
					<asp:Label ID="lblLastName" Runat="server" /></td>
				<td>
					<asp:TextBox ID="txtLastName" Runat="server" /></td>
									<td>
					<asp:Label ID="lblFirstName" Runat="server" /></td>
				<td>
					<asp:TextBox ID="txtFirstName" Runat="server" /></td>

			</tr>

			<tr>
				<td>
					<asp:Label ID="lblMiddleName" Runat="server" /></td>
				<td>
					<asp:TextBox ID="txtMiddleName" Runat="server" /></td>
									<td>
					<asp:Label ID="lblCity" Runat="server" /></td>
				<td>
					<asp:TextBox ID="txtCity" Runat="server" /></td>

			</tr>
						<tr>
				<td>
					<asp:Label ID="lblState" Runat="server" /></td>
				<td>
					<asp:ListBox ID="lstState" Runat="server" Rows="1" /></td>
									<td>
					<asp:Label ID="lblZipCode" Runat="server" /></td>
				<td>
					<asp:TextBox ID="txtZipCode" Runat="server" /></td>

			</tr>

			<tr>
				<td>
					<asp:Label ID="lblTelephone" Runat="server" /></td>
				<td>
					<asp:TextBox ID="txtTelephone" Runat="server" /></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>

			<tr>
				<td width="10%" nowrap>&nbsp;</td>
				<th width="25%">
					<asp:Label ID="lblInstitueInfo" Runat="server"></asp:Label></th>
				<td width="10%" nowrap>&nbsp;</td>
				<th width="55%">&nbsp;</th>
			</tr>
			<tr>
				<td>
					<asp:Label ID="lblID" Runat="server" /></td>
				<td>
					<asp:TextBox ID="txtID" Runat="server" /></td>
				<td>
					<asp:Label ID="lblMajor" Runat="server" /></td>
				<td>
					<asp:ListBox ID="lstMajor" Runat="server" Rows="1" /></td>
			</tr>
			<tr>
				<td>
					<asp:Label ID="lblClassYear" Runat="server" /></td>
				<td>
					<asp:TextBox ID="txtClassYear" Runat="server" /></td>
				<td>
					<asp:Label ID="lblSSN" Runat="server" /></td>
				<td>
					<asp:TextBox ID="txtSSN" Runat="server" /></td>
			</tr>
			<tr>
				<td>
					<asp:Label ID="lblStatus" Runat="server" /></td>
				<td>
					<asp:ListBox ID="lstStatus" Runat="server" Rows="1" /></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>

			<tr>
				<td>
					<asp:Button ID="btnSearch" Runat="server" /></td>
				<td>
					<asp:Button ID="btnReset" Runat="server" /></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			
			<tr>
				<td colspan="4"><asp:Label ID="lblPersSearchResults" Visible="False" Runat="server"></asp:Label></td>
			</tr>
		</table>
		<asp:Label ID="lblPersValidationError" CssClass="PortletError" Runat="server"></asp:Label>
		
		
		<jenzabar:GroupedGrid ID="dgPersonSearchResults" runat="server" DataKeyField="HostID" RenderTableHeaders="true">
			<EmptyTableTemplate>
				<jenzabar:GlobalizedLiteral id="glitNoRecordsPer" runat="server" TextKey="TXT_NO_RESULTS_FOUND"></jenzabar:GlobalizedLiteral>
			</EmptyTableTemplate>
			<Columns>
				
				<asp:TemplateColumn>
					<ItemTemplate>
						<a href='JavaScript:go(<%# DataBinder.Eval( Container.DataItem, "HostID" )%>);'>
							<%# Server.HtmlEncode(DataBinder.Eval( Container.DataItem, "FirstName" ).ToString()) + ' ' %>
							<%# Server.HtmlEncode(DataBinder.Eval( Container.DataItem, "MiddleName" ).ToString()) + ' ' %>
							<%# Server.HtmlEncode(DataBinder.Eval( Container.DataItem, "LastName").ToString())%>
						</a>
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn>
					<ItemTemplate>
						<%# DataBinder.Eval( Container.DataItem, "HostID" )%>
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn>
					<ItemTemplate>
						
						<%# Server.HtmlEncode(((Jenzabar.CRM.AdvancementOfficer.Web.Portlets.RelationshipManagementPortlet.ConstituentSearchResultsConstituentsConstituent)Container.DataItem).Spouse[0].SpFirstName)%>
						<%# Server.HtmlEncode(((Jenzabar.CRM.AdvancementOfficer.Web.Portlets.RelationshipManagementPortlet.ConstituentSearchResultsConstituentsConstituent)Container.DataItem).Spouse[0].SpMiddleName)%>
						<%# Server.HtmlEncode(((Jenzabar.CRM.AdvancementOfficer.Web.Portlets.RelationshipManagementPortlet.ConstituentSearchResultsConstituentsConstituent)Container.DataItem).Spouse[0].SpLastName)%>						
						
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn>
					<ItemTemplate>
						<%# Server.HtmlEncode(DataBinder.Eval( Container.DataItem, "MajorDesc" ).ToString())%>
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn>
					<ItemTemplate>
						<%# DataBinder.Eval( Container.DataItem, "ClassYear" )%>
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn>
					<ItemTemplate>
						<%# Server.HtmlEncode(DataBinder.Eval( Container.DataItem, "City").ToString())%>
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn>
					<ItemTemplate>
						<%# Server.HtmlEncode(DataBinder.Eval( Container.DataItem, "StateCode").ToString())%>
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn>
					<ItemTemplate>
						<%# Server.HtmlEncode(DataBinder.Eval( Container.DataItem, "Zip").ToString())%>
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn>
					<ItemTemplate>
						<%# Server.HtmlEncode(DataBinder.Eval( Container.DataItem, "Telephone").ToString())%>
						<%# Server.HtmlEncode(DataBinder.Eval( Container.DataItem, "TelephoneExt").ToString())%>
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn>
					<ItemTemplate>
						<%# Server.HtmlEncode(DataBinder.Eval( Container.DataItem, "Email").ToString())%>
					</ItemTemplate>
				</asp:TemplateColumn>
			
			</Columns>
		</jenzabar:GroupedGrid>
	</jenzabar:ContentTab>
	<jenzabar:ContentTab id="tbCompanySearch" runat="server">
		<table width="100%" cellpadding="2" cellspacing="0">
			<tr>
				<td>&nbsp;</td>
				<th><asp:Label ID="lblCompanyInfo" Runat="server" /></th>
			</tr>
			<tr>
				<td width="10%">
					<asp:Label ID="lblCompanyName" Runat="server" /></td>
				<td width="90%">
					<asp:TextBox ID="txtCompanyName" Runat="server" /></td>
			</tr>
			<tr>
				<td>
					<asp:Label ID="lblCompanyID" Runat="server" /></td>
				<td>
					<asp:TextBox ID="txtCompnayID" Runat="server" /></td>
			</tr>
			<tr>
				<td>
					<asp:Label ID="lblCompanyCity" Runat="server" /></td>
				<td>
					<asp:TextBox ID="txtCompanyCity" Runat="server" /></td>
			</tr>
			<tr>
				<td>
					<asp:Label ID="lblCompanyState" Runat="server" /></td>
				<td>
					<asp:ListBox ID="lstCompanyState" Rows="1" Runat="server" /></td>
			</tr>
			<tr>
				<td>
					<asp:Label ID="lblCompanyZipCode" Runat="server" /></td>
				<td>
					<asp:TextBox ID="txtCompanyZipCode" Runat="server" /></td>
			</tr>
			<tr>
				<td>
					<asp:Label ID="lblCompanyPhone" Runat="server" /></td>
				<td>
					<asp:TextBox ID="txtCompanyPhone" Runat="server" /></td>
			</tr>
			<tr>
				<td>
					<asp:Button ID="btnCompanySearch" Runat="server" /></td>
				<td>
					<asp:Button ID="btnCompanyReset" Runat="server" /></td>
			</tr>
			<tr>
				<td colspan="2"><asp:Label ID="lblCompSearchResults" Visible="False" Runat="server"></asp:Label></td>
			</tr>
		</table>
		<asp:Label ID="lblCompValidationError" CssClass="PortletError" Runat="server"></asp:Label>
		<jenzabar:GroupedGrid id="dgCompanySearchResults" runat="server" DataKeyField="HostID" RenderTableHeaders="true">
			<EmptyTableTemplate>
				<jenzabar:GlobalizedLiteral id="glitNoRecordsComp" runat="server" TextKey="TXT_NO_RESULTS_FOUND"></jenzabar:GlobalizedLiteral>
			</EmptyTableTemplate>
			<Columns>
				<asp:TemplateColumn>
					<ItemTemplate>
						<asp:LinkButton ID="Linkbutton1" CommandArgument='<%# DataBinder.Eval( Container.DataItem, "HostID" )%>' OnCommand="Constituent_Click" Runat="server">
							<%# DataBinder.Eval( Container.DataItem, "Name" )%>
						</asp:LinkButton>
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn>
					<ItemTemplate>
						<%# DataBinder.Eval( Container.DataItem, "HostID" )%>
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
						<%# DataBinder.Eval( Container.DataItem, "Zip" )%>
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn>
					<ItemTemplate>
						<%# DataBinder.Eval( Container.DataItem, "ContactPhone" )%>
						<%# DataBinder.Eval( Container.DataItem, "ContactPhoneExt" )%>
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn>
					<ItemTemplate>
						<%# DataBinder.Eval( Container.DataItem, "ContactFirstName" )%>
						<%# DataBinder.Eval( Container.DataItem, "ContactLastName" )%>
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn>
					<ItemTemplate>
						<a href="mailto:<%# DataBinder.Eval( Container.DataItem, "ContactEmail" )%>">
						<%# DataBinder.Eval( Container.DataItem, "ContactEmail" )%></a>
					</ItemTemplate>
				</asp:TemplateColumn>
			
			</Columns>
		</jenzabar:GroupedGrid>
	</jenzabar:ContentTab>
</jenzabar:ContentTabGroup>


