<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ViewAddresses.ascx.cs" Inherits="Jenzabar.CRM.AdmissionsOfficer.Web.Portlets.ViewCandidatePortlet.ViewAddresses" %>
<TABLE id="Table1" cellSpacing="3" cellPadding="3" width="100%" border="0">
	<TR>
		<TD><asp:label id="lblError" runat="server" ForeColor="#ff0000"></asp:label></TD>
	</TR>
	<TR>
		<TD><asp:label id="lblAddressesForTitle" runat="server" Font-Bold="True"></asp:label>&nbsp;&nbsp;
			<asp:label id="lblCandidateName" runat="server" Font-Bold="True"></asp:label>
		</TD>
	</TR>
	<tr>
		<td>
			<asp:datagrid id="dgAddresses" runat="server" GridLines="Horizontal" AutoGenerateColumns="False"
				Width="100%" FooterStyle-CssClass="header" HeaderStyle-CssClass="header" AlternatingItemStyle-CssClass="alt"
				ShowHeader="False">
				<Columns>
					<asp:BoundColumn DataField="AddrCode">
						<ItemStyle Wrap="False" Width="20%"></ItemStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="AddrDesc">
						<ItemStyle Wrap="False" Width="30%"></ItemStyle>
					</asp:BoundColumn>
					<asp:TemplateColumn>
						<ItemTemplate>
							<asp:Label ID="lblAddress" Runat="server"></asp:Label>
						</ItemTemplate>
						<ItemStyle Wrap="False" Width="40%"></ItemStyle>
					</asp:TemplateColumn>
					<asp:TemplateColumn>
						<ItemStyle Wrap="False" Width="10%"></ItemStyle>
						<ItemTemplate>
							<asp:Button Visible="False" ID="btnEditAddress" Runat="server" CommandName="EditAddress" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"AddressKey")+";"+
							DataBinder.Eval(Container.DataItem,"AddrCode")+";"+DataBinder.Eval(Container.DataItem,"AddrDesc")
							+";"+DataBinder.Eval(Container.DataItem,"AddrLine1")+";"+DataBinder.Eval(Container.DataItem,"AddrLine2")
							+";"+DataBinder.Eval(Container.DataItem,"City")+";"+DataBinder.Eval(Container.DataItem,"StateCode")
							+";"+DataBinder.Eval(Container.DataItem,"Zip")+";"+DataBinder.Eval(Container.DataItem,"CountryCode")
							+";"+DataBinder.Eval(Container.DataItem,"Phone") %>'>
							</asp:Button>
							<asp:ImageButton ID="imgbtnEditAddress" Runat="server" ImageUrl="" CommandName="EditAddress" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"AddressKey")+";"+
							DataBinder.Eval(Container.DataItem,"AddrCode")+";"+DataBinder.Eval(Container.DataItem,"AddrDesc")
							+";"+DataBinder.Eval(Container.DataItem,"AddrLine1")+";"+DataBinder.Eval(Container.DataItem,"AddrLine2")
							+";"+DataBinder.Eval(Container.DataItem,"City")+";"+DataBinder.Eval(Container.DataItem,"StateCode")
							+";"+DataBinder.Eval(Container.DataItem,"Zip")+";"+DataBinder.Eval(Container.DataItem,"CountryCode")
							+";"+DataBinder.Eval(Container.DataItem,"Phone") %>'>
							</asp:ImageButton>
						</ItemTemplate>
					</asp:TemplateColumn>
				</Columns>
			</asp:datagrid></td>
	</tr>
	<tr>
		<td>
			<asp:Label id="lblEmailTitle" runat="server" Font-Bold="True"></asp:Label></td>
	</tr>
	<tr>
		<td>
			<asp:datagrid id="dgEmail" runat="server" GridLines="Horizontal" AutoGenerateColumns="False" Width="100%"
				FooterStyle-CssClass="header" HeaderStyle-CssClass="header" AlternatingItemStyle-CssClass="alt"
				ShowHeader="False">
				<Columns>
					<asp:BoundColumn DataField="AddrCode">
						<ItemStyle Wrap="False" Width="20%"></ItemStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="AddrDesc">
						<ItemStyle Wrap="False" Width="30%"></ItemStyle>
					</asp:BoundColumn>
					<asp:TemplateColumn>
						<ItemStyle Wrap="False" Width="40%"></ItemStyle>
						<ItemTemplate>
							<asp:HyperLink ID="hlkEmailAddress" Runat="server" NavigateUrl='<%# "mailto:"+DataBinder.Eval(Container.DataItem,"EmailAddress") %>'>
								<%# DataBinder.Eval(Container.DataItem,"EmailAddress") %>
							</asp:HyperLink>
						</ItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn>
						<ItemStyle Wrap="False" Width="10%"></ItemStyle>
						<ItemTemplate>
							<asp:Button Visible="False" ID="btnEditEmail" Runat="server" CommandName="EditEmail" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"EmailAddressKey")+";"+DataBinder.Eval(Container.DataItem,"AddrCode")
							+";"+DataBinder.Eval(Container.DataItem,"AddrDesc")+";"+DataBinder.Eval(Container.DataItem,"EmailAddress") %>'>
							</asp:Button>
							<asp:ImageButton ID="imgbtnEditEmail" Runat="server" ImageUrl="" CommandName="EditEmail" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"EmailAddressKey")+";"+DataBinder.Eval(Container.DataItem,"AddrCode")
							+";"+DataBinder.Eval(Container.DataItem,"AddrDesc")+";"+DataBinder.Eval(Container.DataItem,"EmailAddress") %>'>
							</asp:ImageButton>
						</ItemTemplate>
					</asp:TemplateColumn>
				</Columns>
			</asp:datagrid></td>
	</tr>
	<tr>
		<td></td>
	</tr>
	<tr>
		<td><p></p>
			<asp:LinkButton id="lnkCandidateDetail" runat="server"></asp:LinkButton></td>
	</tr>
</TABLE>
