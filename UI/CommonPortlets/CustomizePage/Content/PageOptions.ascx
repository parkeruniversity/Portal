<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PageOptions.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.Controls.UserControls.PageOptions" %>
<%@ Import Namespace="Jenzabar.Common.Globalization" %>
<%@ Import Namespace="Jenzabar.LMS.CourseContent.IMS.LOM.CartridgeMetadata" %>
<%@ Import Namespace="Jenzabar.Portal.Framework" %>

<%@ Register TagPrefix="ajax" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit, Version=3.5.50731.0, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e" %>
<%@ Register Src="~/UI/CommonPortlets/CustomizePage/Content/ShowPageThorughLink.ascx" TagPrefix="jics" TagName="ShowPageThorughLink" %>
<%@ Register Src="~/UI/CommonPortlets/CustomizePage/Content/DeletePage.ascx" TagPrefix="jics" TagName="DeletePage" %>
<%@ Register Src="~/UI/CommonPortlets/CustomizePage/Content/PageBrowseForPortletPage.ascx" TagPrefix="jics" TagName="PageBrowseForPortletPage" %>
<%@ Register Src="~/UI/CommonPortlets/CustomizePage/Content/PageAddPortletShortcut.ascx" TagPrefix="jics" TagName="PageAddPortletShortcut" %>
<%@ Register Src="~/UI/CommonPortlets/CommonControls/PageTypeView.ascx" TagPrefix="jics" TagName="PageTypeView" %>


<asp:Panel runat="server" ID="pageOptionsPanel" CssClass="pageOptionsPanel">
    <div class="popupBox">
        <div class="PageOptionsHeader">
            <a id="backButtonTop" runat="server" class="backButton"></a>
            <span id="preTitle" runat="server" class="preTitle"></span>
            <span id="preTitleDescription" runat="server" class="description"></span>
            <div id="titleContainer" runat="server">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <span class="title" style="font-weight: normal">
                        <%= this.PageSubTitle() %> 
                    </span>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="renameButton" />
                </Triggers>
            </asp:UpdatePanel>
            <span class="description">
                <%= this.PageInfo.Description %>
                <%= this.MultiPortletMessage() %>
                 <div id="emptyPageContainer" class="emptyPageContainer" Visible="false" runat="server">
                    <span class="addFeature">
                        <%=Globalizer.GetGlobalizedString("TXT_PAGE_OPTIONS_EMPTY_PAGE_ADD_MULTI_PORTLET_PREFIX") %>
                        <a id="addNewPortlet" runat="server"><%= Globalizer.GetGlobalizedString("TXT_PAGE_OPTIONS_EMPTY_PAGE_ADD_MULTI_PORTLET_LINK") %></a>
                    </span>
                </div>
            </span>  
            </div>
        </div>
        <div style="clear: both"></div>
        <div class="PageOptionsBody">
                <div id="AddPageContainer"></div>
                <div id="AddPortletContainer">
                    <jics:PageTypeView runat="server" id="PageTypeView"  Visible="False"/>
                </div>
                <div id="AddShortCutContainer">
                    <jics:PageAddPortletShortcut runat="server"  Visible="False" ID="PageAddPortletShortcut"  ShowExitButton="False"/>
                    <jics:PageBrowseForPortletPage runat="server" Visible="False" ID="PageBrowseForPortletPage" ShowExitButton="False" />    
                </div>   
                <div id="pageOptionsContainer" runat="server">
                     <div class="PageOptionsInnerBody">
                        
                         <div id="PageCustomizationContainer" runat="server">
                                <div class="layoutDescription" >
                                   <%-- TODO:figure out if the text here is supposed to show for the page with one portlet --%>
                                    <div id="singlePageDescription" runat="server">
                                        <h2><%= Globalizer.GetGlobalizedString("TXT_LAYOUT_DESCRIPTION_TITLE") %></h2>
                                        <p><%= Globalizer.GetGlobalizedString("TXT_LAYOUT_DESCRIPTION") %></p>
                                    </div>
                                    <div id="editPortlets" runat="server" class="layout">
                                        <div ID="pagePortlets"  runat="server">
                                            <asp:ListView ID="listOfPortlets" runat="server">
                                            <LayoutTemplate>
                                                <ul class="pagePortlets">
                                                    <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                                                </ul>
                                            </LayoutTemplate>
                                            <ItemTemplate>
                                                <li>
                                                    <a class="portletDisplayName" data-showDirectLink="<%# CanSeeDirectLink(((PortletDisplay)Container.DataItem))  %>" data-PortletType="portlet" data-URL="<%# PrepareDirectLinkUrl(((PortletDisplay)Container.DataItem).URL)%>" data-PortletID="<%# ((PortletDisplay)Container.DataItem).ID.AsGuid.ToString()%>"><%# ((PortletDisplay)Container.DataItem).DisplayName %></a>
                                                    <span class="portletType">  <%# string.Format(Globalizer.GetGlobalizedString("TXT_PAGE_OPTIONS_PORTLET_ITEM"),this.GetAAnPrefix(((PortletDisplay)Container.DataItem).PortletTemplate.DisplayName),this.GetDisplayName((PortletDisplay)Container.DataItem))%> </span>
                                                </li>
                                            </ItemTemplate>
                                        </asp:ListView>
                                        </div>
                                        <div id="pageShortcuts" runat="server">
                                            <span class="description shortucts"><%= Globalizer.GetGlobalizedString("TXT_PAGE_OPTIONS_SHARED_FEATURES_DESCRIPTION") %></span>
                                            <asp:ListView  ID="listOfShortcuts" runat="server" >
                                                <LayoutTemplate>
                                                    <ul class="pagePortlets shortcuts">
                                                    <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                                                </ul>
                                                </LayoutTemplate>
                                                <ItemTemplate>
                                                 <li>
                                                     <a class="portletDisplayName"  data-PortletType="shortcut" data-PortletID="<%# ((PortletDisplay)Container.DataItem).ID.AsGuid.ToString()%>"> <%# ((PortletDisplay)Container.DataItem).DisplayName%></a>
                                                     <span class="portletType">  <%# string.Format(Globalizer.GetGlobalizedString("TXT_PAGE_OPTIONS_PORTLET_ITEM"),this.GetAAnPrefix(this.GetDisplayName((PortletDisplay)Container.DataItem)),this.GetDisplayName((PortletDisplay)Container.DataItem))%> </span>
                                                    <div>
                                                        <span>from</span>
                                                        <div class="shareFrom">
                                                            <a class="contextURL" href="<%# ((PortletShortcut)Container.DataItem).Portlet.Context.URL%>"><%# ((PortletShortcut)Container.DataItem).Portlet.Context.Text %></a><span class="linkDevider">/</span>
                                                            <a class="shortucUrl" href="<%# ((PortletShortcut)Container.DataItem).Portlet.ParentPage.URL%>"><%# ((PortletShortcut)Container.DataItem).Portlet.ParentPage.Text %></a>    
                                                        </div>
                                                    </div>
                                                </li>
                                                </ItemTemplate>
                                            </asp:ListView>
                                        </div>
                                    </div>
                                </div>
            
                                <div class="pageOptionsLinks">
                                    <span class="title"> <%=  Globalizer.GetGlobalizedString("TXT_PAGE_OPTIONS_PAGE_OPTIONS_ADD_PORTLET_TITLE")%></span>
                                    <a id="addPortlet" class="addPortlet" runat="server"><%= this.AddFeatureText() %></a>
                                    <a id="shortcut" class="shortuct" runat="server"><%= this.ShareFeatureText() %></a>
                                    <p id="addPageOnItsOwn" runat="server" class="addNewPage">
                                        <span><%= Globalizer.GetGlobalizedString("TXT_ADD_NEW_PAGE_PARAGRAPH") %></span>
                                        <a id="addPage" runat="server" onclick="javascript:__doPostBack('SideBar','addPage')"><%= Globalizer.GetGlobalizedString("TXT_ADD_NEW_PAGE_LINK") %></a>
                                    </p>    
                                </div>
                             
                                <asp:Panel id="LayoutOptions" runat="server">
                                    <div class="layoutOptions">
                                        <span class="title"><%= String.Format(Globalizer.GetGlobalizedString("TXT_PAGE_OTPIONS_LAYOUT_OPTIONS_TITLE"),this.PageInfo.DisplayName) %></span>
                                        <div class= "<%= "content " + this.PageInfo.Layout.CssClass %>">
                                            <span class="portletType"> <%= this.PageInfo.Layout.DisplayName %></span>
                                            <span class="description"> <%= this.PageInfo.Layout.Description %></span>
	                                        <ul id="layoutActions" runat="server" class="layoutLinks">
                                                <li><a href="javascript:__doPostBack('adminBar$pageLayoutLink','')" class="changeLayout"><%= Globalizer.GetGlobalizedString("TXT_PAGE_OPTIONS_CHANGE_LAYOUT_LINK") %></a></li>
                                                <li><a href="<%= this.PageInfo.URL %>" class="rearrangePages"><%= Globalizer.GetGlobalizedString("TXT_PAGE_OPTIONS_REARRANGE_LINK") %></a></li>
	                                        </ul>
                                        </div>
                                    </div>
                                </asp:Panel>
                         </div>

                         <div class="pageRenaming">
                             <span class="title"><%= String.Format(Globalizer.GetGlobalizedString("TXT_PAGE_OPTIONS_PAGE_OPTIONS_TITLE"),this.PageInfo.DisplayName) %></span>                              
                                    <div class="content">
                                    <asp:ValidationSummary ID="valSummary"  ValidationGroup="RenamePage" CssClass="PortletError" Runat="server"></asp:ValidationSummary>                                    
                                    
                                    <span class="description"><%= Globalizer.GetGlobalizedString("TXT_PAGE_NAME") %></span>
                                    <asp:Label runat="server" style="display: none;" Text="Rename Page Button"  ID="accesibilitynewName" AssociatedControlID="newPageName"></asp:Label>

                                    <asp:TextBox ID="newPageName" runat="server"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="vldName2" CssClass="validator" ValidationGroup="RenamePage"  Text="*" ControlToValidate="newPageName" Runat="server"></asp:RegularExpressionValidator>                    
                                    <asp:RequiredFieldValidator ID="vldName" CssClass="validator" Text="*" ValidationGroup="RenamePage"  ControlToValidate="newPageName" Runat="server"></asp:RequiredFieldValidator>
				                    

                                    <asp:Label runat="server" style="display: none;" Text="Rename Page Button"  ID="renamePageButton" AssociatedControlID="renameButton"></asp:Label>
                                    <asp:Button  ID="renameButton" runat="server" CausesValidation="true"  ValidationGroup="RenamePage" CssClass="renameButton" Text="Use this name" />
                                    <div style="clear: both;"></div>    
                                    </div>

                                   <asp:UpdatePanel runat="server">
                                    <ContentTemplate>
                                    <asp:Panel runat="server" ID="notDefaultPage" CssClass="notDefaultPage">
                                        <div class="homePage">
                                            <a id="defaultLayoutLink" runat="server"><%= Globalizer.GetGlobalizedString("TXT_DEFAULT_LINK") %></a> <span>for <%= this.PageInfo.Context.DisplayName %></span>
                                            <p><%= String.Format(Globalizer.GetGlobalizedString("TXT_NOT_DEFAULT_DESCRIPTION"),this.PageInfo.Context.DisplayName) %>
                                                <a id="todefaultPage" runat="server">"<%= this.PageInfo.Context.DefaultPage.DisplayName %>"</a>
                                            </p>
                                        </div>
                                    </asp:Panel>

                                    <asp:Panel runat="server" ID="defaultPage" CssClass="DefaultPage">
                                        <p class="title"><%= String.Format(Globalizer.GetGlobalizedString("TXT_DEFAULT_PAGE"),this.PageInfo.Context.DisplayName) %></p>
                                        <p><%= String.Format(Globalizer.GetGlobalizedString("TXT_DEFAULT_DESCRIPTION"),this.PageInfo.Context.DisplayName) %></p>
                                    </asp:Panel>
                                    
                                    <asp:CheckBox runat="server" ID="showTitle" AutoPostBack="True"/>    
                                </ContentTemplate>
                                </asp:UpdatePanel>
                                    
                                    <a id="directLink" runat="server" class="outsidePortal"><%= String.Format(Globalizer.GetGlobalizedString("TXT_OUTSIDE_PORTAL"),this.PortalName) %></a>  
                          </div>

                         <div id="devider" runat="server" class="devider"></div>
                         <div id="actions" runat="server" class="actions">
                             <asp:UpdatePanel runat="server">
                                 <ContentTemplate>
                                    <asp:LinkButton id="deleteButton" runat="server" CssClass="deletePage" OnClientClick="return false;"></asp:LinkButton>        
                                 </ContentTemplate>
                             </asp:UpdatePanel>
                              <div style="clear: both"></div>
                        </div>
                    </div>
                </div> 
        </div>
        <div class="PageOptionsFooter">
            <a id="backtoOptions" class="backButton" Visible="false" runat="server"></a>
            <a id="backButton" runat="server" class="backButton"></a>
        </div>

    </div>
    

</asp:Panel>

<!-- Popups for the page options -->
<div id="deletePagePopup">
    <jics:DeletePage runat="server" id="DeletePage" />     
</div>
<div ID="directLinkPopup">   
    <jics:ShowPageThorughLink runat="server" id="ShowPageThorughLink" />    
</div>



