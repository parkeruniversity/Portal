<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SamlLogin.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.LoginPortlet.SamlLogin" %>
<%@ Import Namespace="Jenzabar.Common.Globalization" %>
<%@ Register TagPrefix="ajaxToolkit" Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" %> 
<asp:Panel ID="loginPanel" runat="server" Width="80%">
   <div class="DialogWindow_OuterFrame">
        <div class="DialogWindow_InnerFrame">
            <div class="DialogWindow_Title">
                <asp:ImageButton CssClass="CloseIcon" ID="imgClose" runat="server" ImageUrl="~\UI\Common\Images\PortletImages\Titlebar\close.gif"  />                        
                <%= Globalizer.GetGlobalizedString("TXT_LOGIN") %>
            </div>                        
            <div class="DialogWindow_Body">
                <iframe id="ifrmSaml" runat="server" title="Login form" height="500px" width="100%" frameborder="0" src="./StaticPages/SAML/ServiceProvider/Request.aspx" />
            </div>
        </div>
    </div>
</asp:Panel>
  
<ajaxToolkit:ModalPopupExtender ID="mpe" runat="server" TargetControlId="btnLogin" PopupControlID="loginPanel" OkControlID="imgClose" BackgroundCssClass="DialogWindow_Background" />

<div>
    <asp:Button ID="btnLogin" runat="server"  CssClass="saml-login-button" style="display:none" Text="Login" />
</div>