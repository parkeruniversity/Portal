<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SearchResultsSidebar.ascx.cs"
    Inherits="Jenzabar.ICS.Web.Portlets.SearchResultsPortlet.Controls.SearchResultsSidebar" %>
<style type="text/css">
    #searchContentFilters {
        list-style: none;
        display: block;
        margin: 0;
        padding: 0;
    }

        #searchContentFilters li {
            display: block;
            margin: 0;
            padding: 0;
        }

            #searchContentFilters li a {
                display: block;
                text-decoration: none;
                padding: 3px 0 4px 21px;
                color: #808080;
                overflow: hidden;
            }

                #searchContentFilters li a span {
                    background-image: url(./UI/Common/Images/PortletImages/Icons/search-filter-icons.png);
                    margin-left: -21px;
                    background-repeat: no-repeat;
                    height: 17px;
                    width: 17px;
                    display: block;
                    float: left;
                }

                #searchContentFilters li a:hover {
                    text-decoration: underline;
                    color: black;
                }

                #searchContentFilters li a.sf-selected {
                    font-weight: bold;
                    color: black;
                }

                    #searchContentFilters li a.sf-selected:hover {
                        text-decoration: none;
                    }

        #searchContentFilters .sf-groupTop {
            margin-top: 10px;
        }
    /* styles for individual content types inactive, then hovered and selected */
    .sf-everything span {
        background-position: -20px -3px;
    }

    .sf-everything:hover span, .sf-everything a.sf-selected span {
        background-position: 0 -3px;
    }

    .sf-people span {
        background-position: -20px -30px;
    }

    .sf-people:hover span, .sf-people a.sf-selected span {
        background-position: 0 -30px;
    }

    .sf-courses span {
        background-position: -20px -56px;
    }

    .sf-courses:hover span, .sf-courses a.sf-selected span {
        background-position: 0 -56px;
    }

    .sf-pages span {
        background-position: -20px -82px;
    }

    .sf-pages:hover span, .sf-pages a.sf-selected span {
        background-position: 0 -82px;
    }

    .sf-blogs span {
        background-position: -20px -108px;
    }

    .sf-blogs:hover span, .sf-blogs a.sf-selected span {
        background-position: 0 -108px;
    }

    .sf-bookmarks span {
        background-position: -20px -134px;
    }

    .sf-bookmarks:hover span, .sf-bookmarks a.sf-selected span {
        background-position: 0 -134px;
    }

    .sf-calendars span {
        background-position: -20px -160px;
    }

    .sf-calendars:hover span, .sf-calendars a.sf-selected span {
        background-position: 0 -160px;
    }

    .sf-coursework span {
        background-position: -20px -186px;
    }

    .sf-coursework:hover span, .sf-coursework a.sf-selected span {
        background-position: 0 -186px;
    }

    .sf-forms span {
        background-position: -20px -212px;
    }

    .sf-forms:hover span, .sf-forms a.sf-selected span {
        background-position: 0 -212px;
    }

    .sf-forums span {
        background-position: -20px -238px;
    }

    .sf-forums:hover span, .sf-forums a.sf-selected span {
        background-position: 0 -238px;
    }

    .sf-gradebooks span {
        background-position: -20px -264px;
    }

    .sf-gradebooks:hover span, .sf-gradebooks a.sf-selected span {
        background-position: 0 -264px;
    }

    .sf-handouts span {
        background-position: -20px -290px;
    }

    .sf-handouts:hover span, .sf-handouts a.sf-selected span {
        background-position: 0 -290px;
    }

    .sf-other span {
        background-position: -20px -316px;
    }

    .sf-other:hover span, .sf-other a.sf-selected span {
        background-position: 0 -316px;
    }

    .suggestHint {
        color: black;
        font-size: 11px;
        line-height: 16px;
        font-style: italic;
    }

    .searchResultsLabels {
        text-align: left;
        clear: both;
        color: #808080;
    }

    .searchResultsCBText {
        color: black;
        font-size: 11px;
        line-height: 16px;
        margin-top: 5px;
        display: inline-block;
    }

    .highlightOn, .highlightOff {
        width: auto;
        clear: both;
    }

    .highlightdiv a {
        color: Black;
        text-decoration: none;
    }

    .highlightOn {
        background-color: #c9d7e4;
        font-weight: bold;
        border: 1px solid #b8cae0;
    }

    .highlightOff {
        background-color: transparent;
        margin: 1px;
        border: none;
    }

        .highlightOn span.icon, .highlightOff span.icon {
            background-image: url(./UI/Common/Images/PortletImages/Icons/highlight-on-off.png);
            background-repeat: no-repeat;
            height: 17px;
            width: 17px;
            margin-right: 5px;
            display: block;
            float: left;
        }


    .wherediv {
        clear: both;
        padding-bottom: 20px;
    }

    .highlightdiv {
        margin: 5px 0 20px 0;
        padding: 5px 10px;
        display: inline-block;
    }
</style>
<script language="javascript">
    jQuery(document).ready(function () {
        searchControlBoxOnLoad();
    });
    function searchControlBoxOnLoad() {

        var searchParam = getQueryStringVariable("query");

        var show = false;
        var whereParam = getQueryStringVariable("where");
        if (whereParam != null) {
            var dd = document.getElementById("<%=ddlWhere.ClientID%>");
            for (var i = 0; i < dd.options.length; i++) {
                if (dd.options[i].value === whereParam) {
                    dd.selectedIndex = i;
                    break;
                }
            }
        }
        var includeparam = getQueryStringVariable("includePastFutureCourses");
        if (includeparam != null) {
            var cb = document.getElementById("<%=cbIncludePast.ClientID%>");
            cb.checked = true;
        }

    }

</script>
<div id="highlightdiv" runat="server" class="highlightdiv">
    <asp:HyperLink ID="hlHighlight" runat="server">
        <span class="icon"></span>Highlighting
        <asp:Label ID="lblHighlight" runat="server" Text="off" />
    </asp:HyperLink>
</div>
<div id="wherediv" runat="server" class="wherediv">

    <label for="<%=ddlWhere.ClientID %>">
        <span class="searchResultsLabels">Where:</span>
    </label>
    <br />
    <asp:DropDownList ID="ddlWhere" runat="server" Width="170" AutoPostBack="true" />
    <br />
    <asp:CheckBox ID="cbIncludePast" runat="server" CssClass="searchResultsCBText" AutoPostBack="true" />
</div>
<asp:Repeater ID="rptWhat" runat="server">
    <HeaderTemplate>
        <div>
            <span class="searchResultsLabels">What:</span>
        </div>
        <ul id="searchContentFilters">
    </HeaderTemplate>
    <ItemTemplate>
        <li id="dvItem" runat="server">
            <asp:HyperLink ID="aLink" runat="server" NavigateUrl="#">
                <span></span>
                <asp:Literal ID="litText" runat="server" />
            </asp:HyperLink>
        </li>
    </ItemTemplate>
    <FooterTemplate>
        </ul>
    </FooterTemplate>
</asp:Repeater>
<p class="suggestHint">
    <asp:Literal ID="litWhatHelp" runat="server" />
</p>
