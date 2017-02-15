<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SimpleLogin.aspx.cs" Inherits="Jenzabar.ContainedForm.Pages.SimpleLogin" %>
<%@ Import Namespace="Jenzabar.Common.Globalization" %>
<%@ Register TagPrefix="jics" Namespace="Jenzabar.Portal.Web.UI.Controls" Assembly="Jenzabar.Portal.Web" %>
<%@ Register TagPrefix="jics" Namespace="Jenzabar.ICS.Web.Portlets.LoginPortlet" Assembly="Portlet.Login" %>
<asp:Literal ID="litDocType" runat="server" />
<html>
    <head runat="server" >
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= this.Title %></title>
        <asp:Literal id="BasePath" runat="Server" enableviewstate="false" />
    </head>
    <body>
        <div id="siteWrapper">
            <jics:SiteForm id="MAINFORM" enctype="multipart/form-data" method="post" autocomplete="off" runat="server">
                <input type="hidden" id="___BrowserRefresh" runat="server" />
                <div id="mainLayout" class="container">
                    <asp:Label runat="server" ID="msgNoAccess"></asp:Label>
                    <asp:Label runat="server" ID="msgFileDownloadBegin" Visible="False"></asp:Label><br/>
                    <jics:SimpleLogin id="loginControls" runat="server" />
                    <br />
                    <div id="portlets" class="container">
	                    <asp:PlaceHolder id="PORTLETGRID" runat="server" />
                        <div class="portletsFoot containerFoot"></div>
                    </div>
                    <div class="mainLayoutFoot containerFoot"></div>
                </div>
                <asp:PlaceHolder runat="server" ID="plRedirectScript" Visible="False">
                    <script>
                        window.location.href = '<%= RedirectUrl %>';
                    </script>
                </asp:PlaceHolder>
            </jics:SiteForm>
        </div>
    </body>
</html>
