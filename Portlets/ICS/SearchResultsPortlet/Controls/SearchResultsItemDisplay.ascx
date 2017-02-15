<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SearchResultsItemDisplay.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.SearchResultsPortlet.Controls.SearchResultsItemDisplay" %>

<div class="searchResultItem" id="_parentdiv">
    <div id="divIcon" runat="server">
        <asp:Image ID="_userImage" runat="server" Width="32px" Height="32px" AlternateText="User image" />
        <span></span>
    </div>
    <div class="searchResultsDetails">
        <asp:HyperLink runat="server" ID="_lnkResultLink"></asp:HyperLink>
        <div id="subtitleDiv" class="searchResultsSubtitle" runat="server">
            <asp:Label ID="_subTitle" runat="server" CssClass="searchResultsSubtitle" />
        </div>
        <div id="descriptionDiv" runat="server" class="searchResultsDescription">
            <asp:Label ID="_description" runat="server" />
        </div>
        <div id="breakcrumbDiv" runat="server" class="searchResultsDescription">
            <asp:Label ID="_locationInfo" runat="server" CssClass="searchResultsBreadcrumbLink" />
        </div>
    </div>
    <div style="clear: both"></div>
</div>
