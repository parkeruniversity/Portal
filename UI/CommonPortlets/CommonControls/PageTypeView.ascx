<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PageTypeView.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.Controls.PageTypeView" %>
<%@ Import Namespace="Jenzabar.Common.Globalization" %>
<%@ Import Namespace="Jenzabar.Portal.Framework" %>
<%@ Import Namespace="Jenzabar.Portal.Framework.DTO.PageType" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI.WebControls" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31BF3856AD364E35" %>
<%@ Register TagPrefix="ajaxToolkit" Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" %>



<asp:Panel ID="addPagePanel" CssClass="addPageSection" runat="server">
    <asp:ListView ID="topList" runat="server" OnItemDataBound="OnLoadHandler">
        <LayoutTemplate>
            <ul class="MainGroupListings">
                <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
            </ul>
        </LayoutTemplate>
        <ItemTemplate>
            <li>
            <div class="header">
                <strong><%# ((PageTypeGroupDisplay)Container.DataItem).DisplayName %></strong>
            </div>
            <div class="footer">
                <%# ((PageTypeGroupDisplay)Container.DataItem).Description %>
            </div>    
            <asp:ListView ID="PageMainList" runat="server" OnItemDataBound="OnPageListLoad">
                <LayoutTemplate>
                    <ul class="pageList">
                        <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                    </ul>
                </LayoutTemplate>
                <ItemTemplate>
                    <li class="pageLinkPanel">
                        <a class= <%# "availablePage " + ((PageForDisplay)Container.DataItem).CssClass %>  id="mybuttona" runat="server">
                            <div  class="icon"></div>
                            <asp:Label ID="pageTypeID" Text="<%# ((PageForDisplay)Container.DataItem).PageTypeID %>" runat="server" Visible="false"></asp:Label>
                            <h2><span class="pageType"><strong><%# ((PageForDisplay)Container.DataItem).PageName %></strong></span> <span class="hoverHint">(click to add)</span></h2>
                            <asp:Label CssClass="pageDescript" runat="server" ID="templateDescription" Text="<%# ((PageForDisplay)Container.DataItem).Description %>"></asp:Label>
                        </a>
                    </li>
                </ItemTemplate>
            </asp:ListView>
           </li>
        </ItemTemplate>
    </asp:ListView>
    <div style="clear: both;"></div>
    <div class="moreOptionsPanel">
        <div class="optionsHeader">
            <span class="optionsTitle"><%= Globalizer.GetGlobalizedString("TXT_ADD_PAGE_PAGE_OPTIONS_TITLE") %></span>
        </div>
        <asp:ListView ID="listViewMoreOptions" runat="server" OnItemDataBound="OnLoadHandler">
            <LayoutTemplate>
                <ul>
                    <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                </ul>
            </LayoutTemplate>
            <ItemTemplate>
                <li class= "<%# "groupItem "+ ((PageTypeGroupDisplay)Container.DataItem).CssClass %>">
                    <div>
                        <asp:Panel ID="expandListOfPages" CssClass="CollapsablePanel" runat="server">
                            <span><%# ((PageTypeGroupDisplay)Container.DataItem).DisplayName %> </span>
                            <asp:Label ID="lblText" CssClass="ExpandablePanel" Text="[+]" runat="server" />
                        </asp:Panel>
                        <asp:Panel ID="detailsPanel" runat="server">
                            <asp:ListView ID="PageTypesListView" runat="server" OnItemDataBound="OnPageListLoad">
                                <LayoutTemplate>
                                    <ul class="PageGroupListView">
                                        <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                                    </ul>
                                </LayoutTemplate>
                                <ItemTemplate>
                                    <li>
                                        <a id="mybuttona" class=<%# "availablePage " + ((PageForDisplay)Container.DataItem).CssClass %> runat="server">
                                            <asp:Label ID="pageTypeID" Text="<%# ((PageForDisplay)Container.DataItem).PageTypeID %>" runat="server" Visible="false"></asp:Label>
                                            <h2><span class="pageName"><%# ((PageForDisplay)Container.DataItem).PageName %></span> <span class="hoverHint">(click to add)</span></h2>
                                            <asp:Label CssClass="pageDescript" runat="server" ID="templateDescription" Text="<%# ((PageForDisplay)Container.DataItem).Description %>"></asp:Label>
                                        </a>
                                    </li>
                                </ItemTemplate>
                            </asp:ListView>
                        </asp:Panel>


                        <ajaxToolkit:CollapsiblePanelExtender Collapsed="True" ID="cpe" runat="server"
                            TextLabelID="lblText"
                            ExpandControlID="expandListOfPages"
                            ExpandedText="[-] "
                            CollapseControlID="expandListOfPages"
                            TargetControlID="detailsPanel" />
                    </div>
                </li>
            </ItemTemplate>
        </asp:ListView>
    </div>
    <div class="moreOptionsPanel">

        <div class="optionsHeader">
            <span class="optionsTitle"><%= Globalizer.GetGlobalizedString("TXT_SPECILIZED_PAGES")  %> &nbsp;</span>
            <span class="optionsTitleDescription"><%= Globalizer.GetGlobalizedString("TXT_SPECILIZED_PAGES_PRIMARY")  %></span>
        </div>
        <asp:ListView ID="listViewSpecializedOptions" runat="server" OnItemDataBound="OnLoadHandler">
            <LayoutTemplate>
                <ul>
                    <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                </ul>
            </LayoutTemplate>
            <ItemTemplate>
                <li class="<%# "groupItem "+ ((PageTypeGroupDisplay)Container.DataItem).CssClass %>">
                    <div>
                        <asp:Panel ID="expandListOfPages" CssClass="CollapsablePanel" runat="server">
                            <span><%# ((PageTypeGroupDisplay)Container.DataItem).DisplayName %></span>
                            <asp:Label ID="lblText" CssClass="ExpandablePanel" Text="[+]" runat="server" />
                        </asp:Panel>
                        <%--<asp:LinkButton ID="expandListOfPages" Text="Expand to view the list of pages" OnClientClick="return false" runat="server"></asp:LinkButton>--%>
                        <asp:Panel ID="detailsPanel" runat="server">
                            <asp:ListView ID="PageTypesListView" runat="server" OnItemDataBound="OnPageListLoad">
                                <LayoutTemplate>
                                    <ul class="PageGroupListView">
                                        <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                                    </ul>
                                </LayoutTemplate>
                                <ItemTemplate>
                                    <li>
                                        <a id="mybuttona" class=<%# "availablePage " + ((PageForDisplay)Container.DataItem).CssClass %> runat="server">
                                            <asp:Label ID="pageTypeID" Text="<%# ((PageForDisplay)Container.DataItem).PageTypeID %>" runat="server" Visible="false"></asp:Label>
                                            <h2><span class="pageName"><%# ((PageForDisplay)Container.DataItem).PageName %></span> <span class="hoverHint">(click to add)</span></h2>
                                            <asp:Label CssClass="pageDescript" runat="server" ID="templateDescription" Text="<%# ((PageForDisplay)Container.DataItem).Description %>"></asp:Label>
                                        </a>
                                    </li>
                                </ItemTemplate>
                            </asp:ListView>
                        </asp:Panel>
                        <ajaxToolkit:CollapsiblePanelExtender Collapsed="true" ID="cpe" runat="server"
                            TextLabelID="lblText"
                            ExpandControlID="expandListOfPages"
                            ExpandedText="[-] "
                            CollapseControlID="expandListOfPages"
                            TargetControlID="detailsPanel" />
                    </div>
                </li>
            </ItemTemplate>
        </asp:ListView>
    </div>
  
</asp:Panel>

<asp:Panel ID="NoPagesPanel" runat="server" Visible="False" CssClass="NoPagesPanel">

    <h2><%= Globalizer.GetGlobalizedString("TXT_NO_PORTLETS_AVAILABLE_HEADER")%></h2>
    <p>
        <%= Globalizer.GetGlobalizedString("TXT_NO_PORTLETS_AVAILABLE") %>
    </p>
    
</asp:Panel>



