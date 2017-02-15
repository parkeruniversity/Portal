<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Subscription_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.ForumPortlet.Subscription_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Import namespace="Jenzabar.ICS.Web.Portlets.ForumPortlet" %>

<div class="pSection">
	<table cellpadding="3" cellspacing="0" width="100%">
		<tr>
			<td>
				<asp:label id="lblEmpty" runat="server" Visible="False"></asp:label>
				<jenzabar:groupedgrid id="SubscriptionGrid" runat="server" DataKeyField="ID" GroupKeyField="ID" RenderGroupHeaders="true">
					<TableHeaderTemplate>
						<asp:Literal ID="litCurrSub" Runat="server"></asp:Literal>
					</TableHeaderTemplate>
					<Columns>
						<asp:TemplateColumn>
							<ItemTemplate>
								<asp:CheckBox ID="cbDelete" Runat="server" />
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="Subscription">
							<ItemTemplate>
									<asp:PlaceHolder ID="phSubLinks" Runat="server" />
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="Send me:">
							<ItemTemplate>
								<asp:dropdownlist id="ddSubscribeType" runat="server"></asp:dropdownlist>
								<asp:label id="lblOneThread" runat="server" Visible="False" />
							</ItemTemplate>
						</asp:TemplateColumn>
					</Columns>
					<TableFooterTemplate>
						<asp:LinkButton ID="lnkDelSelected" CommandName="DeleteSelected" Runat="server"></asp:LinkButton>
						|
						<asp:LinkButton ID="lnkDelAll" CommandName="DeleteAll" Runat="server"><%= Globalizer.GetGlobalizedString("TXT_DELETE_ALL") %></asp:LinkButton>
						 
					</TableFooterTemplate>
				</jenzabar:groupedgrid>
			</td>
		</tr>
		<tr>
			<td>
				<asp:Button ID="SaveButton" Runat="server" />
				<asp:Button ID="CancelButton" Runat="server" />
			</td>
		</tr>
	</table>
</div>