<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DefaultView.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.TextMessagingAdministrationPortlet.Views.DefaultView" %>
<%@ Import Namespace="System.Web.Optimization" %>

<script type="text/javascript">
    jenzabar.textMessagingAdmin = jenzabar.textMessagingAdmin || {};


    (function (textMessagingAdmin, $) {
        'use strict';

        var rootUrl = jenzabar.framework.portalSettings.webApiRootUrl;

        textMessagingAdmin.settings = {
            globWebServiceUrl: rootUrl + 'textMessagingAdminGlobalization/'
        };

        var viewData = {};
        // Portlet ID is an important key for web service communication.
        viewData.portletId = '<%= GetPortletId() %>';


        $(function () {
            textMessagingAdmin.initDefaultView(viewData);
        });
    }(jenzabar.textMessagingAdmin, jQuery));
</script>

<%: Scripts.Render("~/Portlets/ICS/TextMessagingAdministrationPortlet/Scripts/text-messaging-administration-default-view-bundle.js") %>

<div class="default-view">
    <div id="ViewContainer" runat="server">
        <h4>Default View</h4>
        <div>
            <asp:HyperLink runat="server" ID="phoneNumberTypesLink">Manage Phone Number Types</asp:HyperLink>
        </div>
        

        <div>
            (<asp:TextBox runat="server" ID="areaCodeField" MaxLength="3" Width="30"/>)<asp:TextBox runat="server" ID="exchangeCodeField" MaxLength="3" Width="30"/> - <asp:TextBox runat="server" ID="lineNumberField" MaxLength="4" Width="40" />    
        </div>
        <div>
            Phone Type: <asp:DropDownList runat="server" ID="phoneTypesList"/>
        </div>
        <div>
            <div>
                <asp:CheckBox runat="server" ID="useForTextMessagingCheckBox"/> &nbsp; Use For Text Messaging 
            </div>
            <div>
                <asp:CheckBox runat="server" ID="useForVoiceCallingCheckBox"/> &nbsp; Use For Voice Calling 
            </div>
            <div>
                <asp:CheckBox runat="server" ID="isPreferredPhoneNumberCheckBox"/> &nbsp; Is Preferred Phone Number 
            </div>
        </div>
        <div>
            <asp:Button runat="server" ID="btnTest" Text="Save User PhoneNumber"/>    
        </div>
    </div> 
</div>