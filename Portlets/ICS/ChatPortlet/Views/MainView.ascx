<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MainView.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.ChatPortlet.Views.MainView" %>
<%@ Import Namespace="System.Web.Optimization" %>
<%@ Import Namespace="Jenzabar.Common.Globalization" %>

<%: Styles.Render("~/UI/Common/Styles/glyphicon-bundle.css") %>

<div id="errorMessage" data-portlet-id="<%= this.ParentPortlet.Portlet.ID.AsGuid %>">
    <ul id="errorMessageContainer"></ul>
</div>
<div id="container" class="chatPortlet" data-container="chatContainer" data-isAvailable="<%= this.IsAvailable %>" data-portlet-id="<%= this.ParentPortlet.Portlet.ID.AsGuid %>">

    <div class="chat-portlet chat-wrapper" data-container="session" data-isAvailable="<%= this.IsAvailable %>">
        <div id="chatSession" runat="server" class="chat-table" data-container="conversation" >
            <div id="chatNotAvailableMessage" runat="server">
                <%= GetAvailabilityMessage() %>
            </div>
            <table class="table">
                <tbody>
                    <tr>
                        <td colspan="3" class="no-padding">
                            <table class="table session-info">
                                <tbody data-container="sessionActivity">
                                </tbody>
                            </table>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="user-info" data-container="usersInSession" data-isAvailable="<%= this.IsAvailable %>">
            <table id="chatAdmin" runat="server" class="table options">
                <tbody>
                    <tr>
                       <th><%= Globalizer.GetString("TXT_CHAT_ADMIN_TITLE") %></th> 
                    </tr>
                    <tr>
                       
                        <td>
                            <a id="adminAvailability"  runat="server"><%= Globalizer.GetString("TXT_MANAGE_CHAT_AVAILABILITY") %></a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a id="adminPageLink"  runat="server"><%= Globalizer.GetString("TXT_CHAT_ADMIN_LOGS") %></a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div id="chatSessionMessageCenter" runat="server" data-container="messageSender" class="messaging">
            <label for="<%= this.ParentPortlet.Portlet.ID.AsGuid %>inputMessage" class="label"><%= Globalizer.GetString("TXT_CHAT_MESSAGE_INPUT_DESCRIPTION_TEXT") %></label>
            <textarea id="<%= this.ParentPortlet.Portlet.ID.AsGuid %>inputMessage" data-id="messageTextEditor" placeholder="<%= Globalizer.GetString("TXT_CHAT_INPUT_HELPER_TXT") %>"></textarea>
            <label for="<%= this.ParentPortlet.Portlet.ID.AsGuid %>sendmessage" class="label"><%= Globalizer.GetString("TXT_CHAT_PUBLIC_MESSAGE_DESCRIPTION_TEXT") %></label>
            <input type="button" id="<%= this.ParentPortlet.Portlet.ID.AsGuid %>sendmessage" class="btn btn-send-message" value="Send" data-action="sendPublicMessage" />
        </div>
    </div>
</div>

