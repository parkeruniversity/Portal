<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="AdminSets_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.MyInfoPortlet.AdminSets_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="framework" namespace="Jenzabar.Portal.Framework.Web.UI.Controls" assembly="Jenzabar.Portal.Framework.Web" %>
<div class="pSection">
	<table cellSpacing="0" cellPadding="5" border="0">
		<TR>
			<TD align="right"><asp:label id="SetNameLabel" Runat="server"></asp:label></TD>
			<TD><asp:textbox id="SetName" Runat="server" MaxLength="250" Columns="30"></asp:textbox></TD>
		</TR>
		<TR id="SetOrderRow" runat="server">
			<TD align="right"><asp:label id="SetOrderLabel" Runat="server"></asp:label></TD>
			<TD><asp:listbox id="SetOrder" Runat="server" Rows="1"></asp:listbox></TD>
		</TR>
		<asp:placeholder id="ReorderPlaceHolder" Runat="server" Visible="False">
			<TR>
				<TD></TD>
				<TD>
					<common:GroupedGrid id="UserInfoGrid" runat="server" GroupKeyField="ID" DataKeyField="ID">
						<GroupHeaderColumns>
							<common:ExpandCollapseGroupedGridColumn SeparatorAfter="False" SeparatorBefore="True" />
						</GroupHeaderColumns>
						<GroupHeaderTemplate>
							<b>
								<asp:Label ID="SetContentsLabel" Runat="server"></asp:Label>
								"<%# DataBinder.Eval(Container.DataItem, "Name") %>"</b>
							<asp:ImageButton ID="AddUserInfoButton" CommandName="AddUserInfo" Runat="server" />
						</GroupHeaderTemplate>
						<Columns>
							<asp:TemplateColumn>
								<ItemTemplate>
									<asp:CheckBox id="IsSelected" Runat="server"></asp:CheckBox>
								</ItemTemplate>
							</asp:TemplateColumn>
							<asp:TemplateColumn>
								<ItemTemplate>
									<INPUT id=OldOrder type=hidden value='<%# DataBinder.Eval(Container.DataItem, "Order") %>' name=OldOrder runat="server">
									<asp:TextBox id=NewOrder Runat="server" MaxLength="3" Text='<%# DataBinder.Eval(Container.DataItem, "Order") %>' Width="25px" />
								</ItemTemplate>
							</asp:TemplateColumn>
							<asp:TemplateColumn>
								<ItemTemplate>
									<%# DataBinder.Eval(Container.DataItem, "Name") %>
								</ItemTemplate>
							</asp:TemplateColumn>
							<asp:TemplateColumn>
								<ItemTemplate>
									<asp:ImageButton ID="EditUserInfoButton" CommandName="EditUserInfo" Runat="server" />
									<asp:ImageButton ID="DeleteUserInfoButton" CommandName="DeleteUserInfo" Runat="server" />
								</ItemTemplate>
							</asp:TemplateColumn>
						</Columns>
					</common:GroupedGrid></TD>
			</TR>
			<TR>
				<TD></TD>
				<TD>
					<common:MoveCopyDelete id="MultipleSelect" runat="server" HideSubmitButton="true"></common:MoveCopyDelete></TD>
			</TR>
		</asp:placeholder>
		<tr>
			<td></td>
			<td>
				<asp:button id="SaveButton" Runat="server" />
				<asp:button id="DeleteButton" Runat="server" Visible="False" />
				<asp:button id="CancelButton" Runat="server" />
			</td>
		</tr>
	</table>
</div>