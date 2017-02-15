<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ManageAvailabilityView.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.ChatPortlet.Views.ManageAvailabilityView" %>
<%@ Import Namespace="System.Web.Optimization" %>
<%@ Import Namespace="Jenzabar.Common.Globalization" %>
<%@ Register Src="ChatAvailabilityMesageEditor.ascx" TagPrefix="chat" TagName="ChatAvailabilityMesageEditor" %>
<%: Styles.Render("~/UI/Common/Styles/glyphicon-bundle.css") %>

<div class="chat-portlet chat-availability">
    <div class="header">
        <a id="backToMainView" class="backButton" runat="server" ><%= string.Format(Globalizer.GetString("TXT_CHAT_BACK_TO_MAIN_VIEW"),ParentPortlet.Portlet.DisplayName) %></a>
        <span class="availabilityTitle"><%= Globalizer.GetString("TXT_CHAT_AVAILABILITY_EDIT_TITLE") %></span>      
    </div>

    <chat:ChatAvailabilityMesageEditor id="chatMessageEditor" runat="server"></chat:ChatAvailabilityMesageEditor>
    <div id="chatAvailabilityScheduler" data-portletid="<%= this.ParentPortlet.Portlet.ID.AsGuid %>"></div>
</div>
