<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Default.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.NewsPortlet.Default" %>
<%@ Register src="Controls/NewsPost.ascx" tagname="NewsPost" tagprefix="JICS" %>
<%@ Register src="Controls/DynamicStyle.ascx" tagname="DynamicStyle" tagprefix="JICS" %>
<div class=pSection>
    <JICS:DynamicStyle ID="_dynamicStyle" runat="server" />
    <asp:PlaceHolder ID="_phLightbox" runat="server" />
    <asp:PlaceHolder ID="_phMySub" runat="server"></asp:PlaceHolder>
    <asp:Repeater ID="_rptPost" runat="server" EnableViewState="false">
        <ItemTemplate>
            <JICS:NewsPost ID="_newsPost" RenderDiscussion="true" runat="server" />
        </ItemTemplate>
    </asp:Repeater>
    <asp:PlaceHolder ID="_phLinks" runat="server"></asp:PlaceHolder>
</div>

