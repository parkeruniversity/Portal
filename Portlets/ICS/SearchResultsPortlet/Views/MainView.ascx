<%@  Control Language="C#" AutoEventWireup="true" EnableViewState="true" CodeBehind="MainView.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.SearchResultsPortlet.Views.MainView" %>
<%@ Register TagPrefix="common" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="portal" Assembly="Jenzabar.Portal.Web" Namespace="Jenzabar.Portal.Web.UI.Controls" %>

<%@ Register Src="../Controls/SearchHelp.ascx" TagName="SearchHelp" TagPrefix="jenz" %>
<%@ Register Src="../Controls/SearchResultsSidebar.ascx" TagName="SearchResultsSidebar" TagPrefix="uc4" %>
<%@ Register Src="../Controls/SearchResultsItemDisplay.ascx" TagName="SearchResultsItemDisplay" TagPrefix="uc5" %>
<%@ Register Src="~/UI/Controls/SearchBox.ascx" TagName="SearchBox" TagPrefix="sb" %>

<div class="pSection">
    <!-- We'll use this as our "container" that the two below sit in --->
    <div id="searchSideBar">
        <!--- This contains everything that is on the right side. Currently it's a minimum of 200px max of 25% of the container. No width set means it'll be as big as it has to to not wrap a text line-->
        <uc4:SearchResultsSidebar ID="srsSidebar" runat="server" />
    </div>
    <div id="searchRightContainer">
        <!-- This contains everything that is on the left side- giving it a width of auto makes it expand to fill what's left of 'pSection' -->
        <div id="resultsbox" class="searchHeader">

            <div class="right">
                <jenz:SearchHelp ID="_searchHelp" runat="server" />
            </div>
            <div class="left">
                <sb:SearchBox runat="server" ID="_searchbox" />
                <br />
                <asp:label runat="server" id="_resultsForSearch" cssclass="searchResultsText" />
                <div id="searchEverywhere" runat="server">
                    <asp:hyperlink id="hlSearchEverywhere" runat="server" />
                </div>
                <div id="divDidYouMean" runat="server" visible="False" class="didYouMean">
                    <asp:label runat="server" id="lblDidYouMean" />
                    <asp:hyperlink runat="server" id="lnkSuggestedSearch" />
                    <asp:Label runat="server" ID="lblQuestionMark" Text="?" CssClass="didYouMeanQuestionMark" />
                </div>
            </div>
        </div>
        
        <div class="pagingContainerSearch" id="divPagingContainer" runat="server" Visible="False">
            <portal:Paging ID="_paging" runat="server" PagingPanelCssClass="pagingPanel" />
        </div>
        
        <div class="noExactResults">
          <asp:Label runat="server" ID="lblNoExactResults" Visible="false" />
        </div>

        <div id="results" class="searchResults">

            <asp:repeater id="_resultsRepeater" runat="server">
                <ItemTemplate>
                    <uc5:SearchResultsItemDisplay ID="sridResults" runat="server" />
                </ItemTemplate>
            </asp:repeater>
            <div class="pagingContainerSearch">
                <common:Mirror ControlID="_paging" runat="server" />
            </div>
        </div>
    </div>
    <div style="clear: both"></div>
</div>


