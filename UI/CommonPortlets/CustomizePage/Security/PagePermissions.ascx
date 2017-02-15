<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PagePermissions.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.CustomizePage.PagePermissions" EnableViewState="True" %>
<%@ Import Namespace="Jenzabar.Common.Globalization" %>
<%@ Import Namespace="Jenzabar.Portal.Framework" %>
<%@ Import Namespace="Jenzabar.Portal.Framework.Security" %>

<asp:UpdatePanel ID="actionsUpdatePanel" runat="server" UpdateMode="Conditional">
    <contenttemplate>
        <div class="permissionsTitle">
            <asp:Label  CssClass="pa-title" runat="server" ID="permissionsTitle"></asp:Label>
       </div>
        <div  id="pageAccessRoleMenu" runat="server" class="pageAccessRoleMenu">
            <ul id="pageAccessRolesList" runat="server" class="pa-roleContentMenu">
               <li class="heading"> <%= Globalizer.GetGlobalizedString("TXT_PAGE_ACCESS_ROLE_MENU")%></li>    
                <asp:ListView ID="rolesList" runat="server" OnItemDataBound="OnRoleListDataBind">
                    <LayoutTemplate>
                            <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                    </LayoutTemplate>
                    <ItemTemplate>
                        <li>
                            <a id="roleLinkButton" runat="server"  class="allowedButton">
                            <%= Mode == PermissionsMode.Global ? "<span class=\"contextName\">" + String.Format(Globalizer.GetGlobalizedString("TXT_PAGE_ACCESS_ROLE_LIST_ITME_PREFIX"), this.PortalName) + "</span>" : string.Empty%>
                            <span class="roleName"><%= Mode == PermissionsMode.Global ? "<strong>" : string.Empty%>  <%# ((PortalGroup)Container.DataItem).DisplayName%> <%= Mode == PermissionsMode.Global ? "</strong>" : string.Empty%></span>
                            <asp:Label runat="server" ID="roleID"  Visible="false" Text="<%# ((PortalGroup)Container.DataItem).ID.AsGuid%>"></asp:Label>
                            <span class="pointer"></span>
                            <span class="pointerBorder"></span>
                            </a>
                        </li>
                    </ItemTemplate>
                </asp:ListView>
            </ul>
            <div id="addRoleContainer" runat="server" class="AddRoleContainer">
            <span id="norolesTitle" runat="server" Visible="false" class="pa-title"><%= Globalizer.GetGlobalizedString("TXT_PAGE_ACCESS_EMPTY_PAGE_NEW_ROLE_DESCRIPTION")%></span>    
            <span><%= this.GetAddRoleLinkPrefix%></span>
                <a id="addRole" runat="server"><%= Globalizer.GetGlobalizedString("TXT_PAGE_ACCESS_NEW_ROLE_LINK")%></a>
            </div> 
       </div>
                          
        <asp:Panel runat="server" CssClass="accessActions adminPanel" ID="adminPanel" Visible="false">
            <p>
               <header>
                <span><%= this.SelectedRole.DisplayName%> <%= String.Format(Globalizer.GetGlobalizedString("TXT_PAGE_ACCESS_ADMIN_TITLE"), "<span style=\"color: green\">", "</span>")%></span>
               </header>
              <div class="exclamation">
                <p><span><%= String.Format(Globalizer.GetGlobalizedString("TXT_PAGE_ACCESS_ADMIN_FIRST_PARAGRAPH"), this.SelectedRole.DisplayName, this.PageInfo.Context.DisplayName)%></span></p>
                   <p>
                       <span>
                           <%= String.Format(Globalizer.GetGlobalizedString("TXT_PAGE_ACCESS_ADMIN_SECOND_PARAGRAPH"), this.SelectedRole.DisplayName)%>
                           <a  id="fullPermissionsLInk" runat="server"  href="javascript:__doPostBack('SideBar','fullPermisssions')"><%= Globalizer.GetGlobalizedString("TXT_PAGE_ACCESS_FULL_ADMIN_LINK")%></a>
                       </span>
                   </p>
              </div>
              <p><span><a id="editRole" runat="server"><%= String.Format(Globalizer.GetGlobalizedString("TXT_PAGE_ACCESS_EDIT_ROLE_LINK"), this.SelectedRole.DisplayName)%></a></span></p>
          </p>
        </asp:Panel>
        
        <asp:Panel  CssClass="accessActions noSelection" Visible="False" runat="server" ID="globalNoSelectionPanel">
             <p><span><%= String.Format(Globalizer.GetGlobalizedString("TXT_PAGE_ACCESS_ADMIN_NO_SELECTION"), this.PortalName)%></span></p>
            <span class="pointer"></span>
            <p><span><%= Globalizer.GetGlobalizedString("TXT_PAGE_ACCESS_ADMIN_NO_SELECTION_SECOND_P")%></span></p>
            <p class="warning"><span><%= String.Format(Globalizer.GetGlobalizedString("TXT_PAGE_ACCESS_ADMIN_NO_SELECTION_SECOND_WARNING"), this.PortalName)%></span></p>
        </asp:Panel>

        <asp:Panel  CssClass="accessActions noSelection" runat="server" Visible="False" ID="contextNoSelectionPanel">
            <p><span><%= Globalizer.GetGlobalizedString("TXT_PAGE_ACCESS_ADMIN_NO_SELECTION_CONTEXT_FIRST_P")%></span></p>
            <span class="pointer"></span>
            <p><span><%= Globalizer.GetGlobalizedString("TXT_PAGE_ACCESS_ADMIN_NO_SELECTION_CONTEXT_SECOND_P")%></span></p>
        </asp:Panel>

        <div id="accessActions" runat="server" class="accessActions">
            <p>
                <asp:Label ID="pageAcessTitle" Text="" CssClass="pageAccessTitle" runat="server" ></asp:Label>
            </p>
            <p id="filteringActions" Visible="False" runat="server">
                <asp:DropDownList ID="filteringDropDown" AutoPostBack="True" OnSelectedIndexChanged="ChangeFilteringIndex" runat="server"/>
            </p>
            <div id="byInheritanceAccess"  runat="server"  Visible="false" class="byInheritanceAccess">
                <p>
                    <%= Globalizer.GetString("TXT_PAGE_ACCESS_INHERETED_PARAGRAPH1")%>
                     <a id="mainRoleLink" runat="server"> "<%= this.ParentRole%>"</a>
                     <%= Globalizer.GetString("TXT_PAGE_ACCESS_INHERETED_PARAGRAPH2")%>
                    <a id="mainRoleLink2" runat="server">"<%= this.ParentRole%>"</a>
                    <%= String.Format(Globalizer.GetString("TXT_PAGE_ACCESS_INHERETED_PARAGRAPH3"), this.SelectedRole.DisplayName)%> 
                    
                </p>
                <p> <%= String.Format(Globalizer.GetString("TXT_PAGE_ACCESS_INHERETED_ENABLE_LINK"), this.SelectedRole.DisplayName)%></p>

            </div>
            <p id="portletAccessDescription" runat="server"  class="portletAccessDescription"></p>
             <a ID="makeRoleAdminOfPage" Visible="False" runat="server" class="permissionChangeOfRoleForPage enable" OnServerClick="makeRoleAdminOfPage_OnServerClick">
                 <span><%= Globalizer.GetGlobalizedString("TXT_MAKE_ROLE_PAGE_ADMIN") %></span>
                  <p class="portletAccessDescription">  <%= Globalizer.GetGlobalizedString("TXT_MAKE_ROLE_PAGE_ADMIN_DESCRIPTION")%></p>
             </a>
            <a ID="removeAdminPermissonsForPage" Visible="False" runat="server" class="permissionChangeOfRoleForPage disable" OnServerClick="removeAdminPermissonsForPage_OnServerClick">
                 <span><%= Globalizer.GetGlobalizedString("TXT_REMOVE_PAGE_ADMIN_TO_ROLE") %></span>
                  <p class="portletAccessDescription">  <%= Globalizer.GetGlobalizedString("TXT_MAKE_ROLE_PAGE_ADMIN_DESCRIPTION")%></p>
             </a>
             <asp:ListView runat="server" ID="portletsActions" OnItemDataBound="OnPortletsDataBind">
                 <LayoutTemplate>
                     <ul class="portletsActions">
                            <asp:PlaceHolder runat="server" ID="itemPlaceholder"></asp:PlaceHolder>
                    </ul>
                 </LayoutTemplate>
                 <ItemTemplate>
                     <span class="pa-title"> <%# String.Format(Globalizer.GetGlobalizedString("TXT_PAGE_OPTIONS_PORTLET_TITLE"), GetNameForPermissions((PortletDisplay)Container.DataItem))%></span>
                      <asp:ListView runat="server" ID="portletActionsList"  OnItemDataBound="OnPortletActionsListDataBind">
                    <LayoutTemplate>
                        <ul class="portletActions">
                            <asp:PlaceHolder runat="server" ID="itemPlaceholder"></asp:PlaceHolder>
                        </ul>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <li>
                            <a id="portletActionLink" class="portletAction enabled" runat="server">
                                <asp:Label runat="server" ID="text"></asp:Label><%# ((SecuredActiveDirectoryObject)Container.DataItem).DisplayName%>
                                <asp:Label runat="server" ID="objectID"  Visible="false" Text="<%# ((SecuredActiveDirectoryObject)Container.DataItem).ID.AsPath%>"></asp:Label>
                            </a>
                            <asp:Label runat="server" CssClass="portletAccessDescription" ID="description"></asp:Label>
                        </li>
                    </ItemTemplate>
                </asp:ListView>
                 </ItemTemplate>
             </asp:ListView>
            <div id="noOperationsPanel" runat="server"  Visible="false" class="no-operations info">
                    <span class="icon"></span>
                    <span class="pa-title"> The following feature(s) don’t have any permissions, so they aren’t listed above:</span>
                    <span class="items"><%= this.GetPortletsWithNoOperations()%></span>
            </div>
               <asp:Label ID="pageAccessActionTitle" CssClass="pageAccessActionTitle" Text="" runat="server"></asp:Label>
                <div class="pageActions">
                    <a ID="canViewButton" runat="server" class="pageAction"   OnServerClick="OnPermissionSave" >There are no roles available. </a>
                    <a id="editRole2" class="ChangePermissions" runat="server" ><%= this.GetSelectedRoleLinkText()%></a>
                    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="actionsUpdatePanel" DisplayAfter="0">
                        <ProgressTemplate>
                            <div style="position: absolute; width: 100%; height: 100%;">Updating....</div>
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                </div>
            </div>
        <div style="clear: both"></div>
</contenttemplate>
<triggers>
    
    <asp:AsyncPostBackTrigger ControlID="mainRoleLink"/>
  <asp:AsyncPostBackTrigger ControlID="fullPermissionsLInk"/>
  <asp:AsyncPostBackTrigger ControlID="canViewButton"/>
</triggers>
</asp:UpdatePanel>
