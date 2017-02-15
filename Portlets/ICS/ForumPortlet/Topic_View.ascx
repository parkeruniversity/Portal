<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Topic_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.ForumPortlet.Topic_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<div class="pSection">
	<p>
		<jenzabar:groupedgrid id="ThreadGrid" runat="server" AllowSorting="true" CellPadding="0" DataKeyField="ID"
			GroupKeyField="ID" RenderGroupHeaders="true">
			<GroupHeaderTemplate>
				<table width="100%">
					<tr>
						<td>
							<span><b>
									<%# DataBinder.Eval( Container.DataItem, "Name" )%>
								</b></span>
						</td>
						<td align="right">
							<span style="right: 10px;">
								<asp:LinkButton ID="lnkAddThread" CommandName="AddThread" Runat="server" Font-Size="80%" />
								<asp:Label ID="lblSubscribe" Runat="server" Font-Size="80%">|</asp:Label>
								<asp:LinkButton ID="lnkSubscribe" CommandName="Subscribe" Runat="server" Font-Size="80%"></asp:LinkButton>
							</span>
						</td>
					</tr>
				</table>
			</GroupHeaderTemplate>
			<EmptyGroupTemplate>
				<%= "There are no threads under this topic" %>
			</EmptyGroupTemplate>
			<Columns>
				<asp:TemplateColumn>
					<ItemTemplate>
						<asp:CheckBox ID="cbPrintView" Runat="server" />
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="Subject" SortExpression="Message.Subject">
					<ItemTemplate>
						<asp:LinkButton ID="ViewThreadLink" CommandName="ViewThread" Runat="server">
							<%# DataBinder.Eval( Container.DataItem, "Message.Subject" )%>
						</asp:LinkButton>
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="Author" SortExpression="User.NameDetails, LastPost desc">
					<ItemTemplate>
						<asp:PlaceHolder ID="phUserName" Runat="server">
							<%# DataBinder.Eval( Container.DataItem, "User.NameDetails" ).ToString()%>
						</asp:PlaceHolder>
						<asp:Label ID="lblAnon" Runat="server" Visible="False" />
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="Last Message" SortExpression="LastPost desc">
					<ItemTemplate>
						<%# DataBinder.Eval( Container.DataItem, "LastPost" ).ToString()%>
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="Views" ItemStyle-HorizontalAlign="Center" SortExpression="Views desc, LastPost desc">
					<ItemTemplate>
						<%# DataBinder.Eval( Container.DataItem, "Views" ).ToString()%>
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="Replies" ItemStyle-HorizontalAlign="Center" SortExpression="Replies desc, LastPost desc">
					<ItemTemplate>
						<%# DataBinder.Eval( Container.DataItem, "Replies" ).ToString()%>
					</ItemTemplate>
				</asp:TemplateColumn>
			</Columns>
			<TableFooterTemplate>
				<asp:LinkButton ID="lnkPrintView" CommandName="PrintView" Runat="server" Font-Size="80%" />
				<asp:Label ID="lblDelete" Runat="server" Font-Size="80%">|</asp:Label>
				<asp:LinkButton ID="lnkDelete" CommandName="Delete" Runat="server" Font-Size="80%"></asp:LinkButton>
			</TableFooterTemplate>
		</jenzabar:groupedgrid>
	</p>
</div>
