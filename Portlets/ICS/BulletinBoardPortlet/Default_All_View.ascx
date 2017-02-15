<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Default_All_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.BulletinBoardPortlet.Default_All_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Import namespace="Jenzabar.Portal.Framework.Web.Configuration" %>
<div class="pSection">
<p>
	<jenzabar:groupedgrid id=TopicGrid runat="server" CellPadding="0" DataKeyField="ID" GroupKeyField="ID" RenderGroupHeaders="true">
<GroupHeaderTemplate>
			<%# DataBinder.Eval( Container.DataItem, "Label" )%>	
</GroupHeaderTemplate>
<GroupSubHeaderTemplate>
	<%# DataBinder.Eval( Container.DataItem, "Description" )%>
</GroupSubHeaderTemplate>
<Columns>
	<asp:TemplateColumn HeaderText="Name" SortExpression="Message.Name">
		<ItemTemplate>
			<asp:LinkButton ID="ViewLink" CommandName="ViewTopic" Runat="server" ><img alt="" src="<%= this.ResolveUrl(Settings.Current.PortletIconImagesPath) + "folder.gif" %>"><%# DataBinder.Eval( Container.DataItem, "Name" )%></asp:LinkButton>		
			<br>
			<%# DataBinder.Eval( Container.DataItem, "Description" )%>				
		</ItemTemplate>
	</asp:TemplateColumn>
	<asp:TemplateColumn HeaderText="Messages" ItemStyle-HorizontalAlign="Center" SortExpression="Messages desc, LastPost desc">
		<ItemTemplate>
			<%# DataBinder.Eval( Container.DataItem, "ForumThreads.Length" ).ToString()%>
		</ItemTemplate>
	</asp:TemplateColumn>
	<asp:TemplateColumn HeaderText="Last Message" SortExpression="LastPost desc">
		<ItemTemplate>
			<%# DataBinder.Eval( Container.DataItem, "LastPost" ).ToString()%>
		</ItemTemplate>
	</asp:TemplateColumn>
</Columns>
</jenzabar:groupedgrid>
</p>
</div>
<div class="buttonBar">
	<asp:LinkButton ID="lnkGoToMain" Runat="server" />
</div>
