<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PortletViewHead.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.Controls.PortletViewHead" %>
<%@ Import namespace="Jenzabar.Common.Configuration" %>
    <style type="text/css">
        body{ min-width : 0px; }
        #mainLayout { margin-left: 8px; width: 98%; }
        #simpleLogin { float: left; }
        #portletOnlyClose { float: right; }
    </style>
<%if (ConfigSettings.Current.HtmlProviderType == ConfigSettings.HtmlProviderTypes.DIV){%>
    <style type="text/css">
        #portlets { float: left; margin-left: 8px; width: 98%; }
    </style>
<%}%> 
