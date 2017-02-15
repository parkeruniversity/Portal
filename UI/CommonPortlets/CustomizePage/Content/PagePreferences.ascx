<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PagePreferences.ascx.cs" Inherits="Jenzabar.Portal.Framework.Web.UI.PagePreferences" %>
<%@ Import Namespace="Jenzabar.Common.Globalization" %>
<script type="text/javascript" >

    $(document).ready(function () {
        var ls = $(".preferencesPanel");
        if (ls.length != 0) {
            $(".portlet").addClass("pageSettings");
        }
    });
</script>
<div class="preferencesPanel">
    <div class="popupBox">
        <div class="modalHeading">
            <a id="backButtonTop" runat="server" class="closeWindow"><%= Globalizer.GetGlobalizedString("TXT_BACK_LINK") + "<b>"+ this.PageInfo.DisplayName +"</b>" %></a>
            <p class="title"><%= Globalizer.GetGlobalizedString("TXT_PAGE_PREFERENCES_TITLE") %></p>
            <p id="description" runat="server" class="description">
                <%= Globalizer.GetGlobalizedString("TXT_PAGE_PREFERENCES_TITLE_DESCRIPTION") %>
            </p>
        </div>
        <div style="clear: both"></div>
        <asp:UpdatePanel ID="SettingsPanel" runat="server" >
          <ContentTemplate>
            <div  id="portletSelection" runat="server" class="portletSelection">
                <span>
                    <%= Globalizer.GetGlobalizedString("TXT_PREFERENCES_PORTLETS_TITLE") %>
                </span>
                <span>
                    <%= Globalizer.GetGlobalizedString("TXT_PREFERENCES_PORTLETS_SUB_TITLE") %>
                </span>
                <asp:DropDownList runat="server" ID="portletDropDownList" AutoPostBack="true" OnSelectedIndexChanged="OnSelectedPortletChanged" DataTextField="Name" DataValueField="ID">
                </asp:DropDownList>
            </div>
        
            <div id="innerContet" runat="server" class="innerModal">
                 <asp:PlaceHolder runat="server" ID="preferenceHolder"></asp:PlaceHolder>    
            </div>
              <div id="noSettingsMessage" class="NoSettingsScreen" runat="server">
                    <span id="settingsMessage" runat="server"></span>
          </div>
              <div id="modalbuttons" runat="server" class="modalButtons">
            <div class="saveButtonContainer">
                <asp:Button ID="saveSettingsButton" runat="server" Text="Save Changes"></asp:Button>
            </div>
            <div class="cancelButtonContainer">
                <asp:Button ID="cancelSettingsButton" runat="server" Text="Cancel" OnClick="Cancel_Button"></asp:Button>
            </div>
        </div>
          </ContentTemplate>
        </asp:UpdatePanel>   
        
        
        <a id="backButtonButtom" runat="server" class="closeWindow"><%= Globalizer.GetGlobalizedString("TXT_BACK_LINK") + "<b>" +this.PageInfo.DisplayName+"</b>"  %></a>
    </div>
</div>
