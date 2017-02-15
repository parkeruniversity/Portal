<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Default_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.BookmarkPortlet.Default_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Import namespace="Jenzabar.ICS.Web.Portlets.BookmarkPortlet" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="web" Assembly="Jenzabar.Portal.Framework.Web" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" %>
<div class="pSection">
<div><asp:LinkButton ID="lnkAddBookmark" Runat= "server"></asp:LinkButton></div>
	<jenzabar:groupedgrid id=BookmarkGrid runat="server" CellPadding="0" DataKeyField="ID">
		<GroupHeaderTemplate>
			<%# DataBinder.Eval( Container.DataItem, "Name" )%>
		</GroupHeaderTemplate>
		<GroupSubHeaderTemplate>
			<%# DataBinder.Eval( Container.DataItem, "Description" )%>
		</GroupSubHeaderTemplate>
		<SubGroupHeaderTemplate>
			<%= "Inactive" %>
		</SubGroupHeaderTemplate>
		<EmptyTableTemplate><%=Globalizer.GetGlobalizedString("MSG_NO_BOOKMARKS_FOR_PORTLET")%></EmptyTableTemplate>
		<Columns>
			<asp:TemplateColumn HeaderText="link">
				<ItemTemplate>
				    <span id="spanProtectedItemLink" runat="server">
					    <a href='Portlets/ICS/bookmarkportlet/viewhandler.ashx?id=<%# Server.UrlEncode(DataBinder.Eval( Container.DataItem, "Id" ).ToString()) %>' target="_blank"><%# DataBinder.Eval( Container.DataItem, "Name" )%></a>
					</span>
					<web:LockedContent ID="lockedContent" runat="server" Visible="false" />
					<asp:Label ID="lblViews" Runat="server">
						(Viewed: <%# DataBinder.Eval( Container.DataItem, "Views" ) %> times)
					</asp:Label>
					<br>
					<%# DataBinder.Eval( Container.DataItem, "Description" )%>
				</ItemTemplate>
			</asp:TemplateColumn>
		</Columns>
	</jenzabar:groupedgrid>
</div>
<div class="buttonBar">
	<asp:LinkButton ID="lnkGoToMain" Runat="server" />
</div>
<a href="http://www.adobe.com/products/acrobat/readstep2.html" target="_blank">
<span class="accessibility">Adobe Acrobat Reader is required to view and print PDF files.</span>
</a>

