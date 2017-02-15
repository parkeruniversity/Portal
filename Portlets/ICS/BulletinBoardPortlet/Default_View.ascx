<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Default_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.BulletinBoardPortlet.Default_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>

<LINK href="Portlets/ICS/BulletinBoardPortlet/BulletinBoardStyle.css" type="text/css" rel="stylesheet">
<div class="pSection">
<p>
<jenzabar:groupedgrid id=ThreadGrid runat="server" CellPadding="0" DataKeyField="ID" GroupKeyField="ID" RenderGroupHeaders="true">
	<GroupHeaderTemplate>
				<b><%# DataBinder.Eval( Container.DataItem, "Name" )%></b>
	</GroupHeaderTemplate>
	<Columns>
		<asp:TemplateColumn HeaderText="Subject" SortExpression="Message.Subject">
			<ItemTemplate>
				<asp:LinkButton ID="ViewThreadLink" CommandName="ViewThread" Runat="server">
					<%# DataBinder.Eval( Container.DataItem, "Message.Subject" )%>
				</asp:LinkButton>
			</ItemTemplate>
		</asp:TemplateColumn>
		<asp:TemplateColumn HeaderText="Author" SortExpression="User.NameDetails, LastPost desc">
			<ItemTemplate>
				<%# DataBinder.Eval( Container.DataItem, "User.NameDetails" ).ToString()%>
			</ItemTemplate>
		</asp:TemplateColumn>
		<asp:TemplateColumn HeaderText="Last Message" SortExpression="LastPost desc">
			<ItemTemplate>
				<%# DataBinder.Eval( Container.DataItem, "LastPost" ).ToString()%>
			</ItemTemplate>
		</asp:TemplateColumn>
	</Columns>
	<TableFooterTemplate>
		<asp:LinkButton ID="lnkViewAllTopics" CommandName="ViewAllTopics" Runat="server" Font-Size="80%"></asp:LinkButton>
	</TableFooterTemplate>
</jenzabar:groupedgrid>
</p>
</div>
<div class="buttonBar">
	<asp:LinkButton ID="lnkGoToMain" Runat="server" />
</div>


