<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Jenzabar.Portal.Web.StaticPages.SAML.IdentityProvider.Login" %>
<%@ Import Namespace="Jenzabar.Common.Globalization"%>
<%@ Register TagPrefix="jics" TagName="CustomSamlHeader" Src="~/ClientConfig/Controls/CustomSamlHeader.ascx" %>
<%@ Register TagPrefix="jics" TagName="CustomSamlFooter" Src="~/ClientConfig/Controls/CustomSamlFooter.ascx" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
    <head>
        <title><%= Globalizer.GetGlobalizedString("TXT_JICS_SSO") %></title>
        <link rel="stylesheet" type="text/css" href="../../../UI/Common/Styles/siteStyle.css" /> 
    </head>
    <body>
		<jics:CustomSamlHeader id="customSamlHeader" runat="server" />
        <form id="form1" method="post" action="login.aspx">
            <div class="pSection">
	            <fieldset>
				    <p class="ApplicationError">
					    <asp:Literal ID="message" runat="server" />
					</p>
			        <asp:PlaceHolder runat="server" ID="phLogin">
			            <div class="samlLoginHeader"><%= Globalizer.GetGlobalizedString("MSG_SAML_LOGIN_SCREEN") %></div>
					    <div style=""><span class="samlLoginLabel" ><%= Globalizer.GetGlobalizedString("LBL_USERNAME") %></span>
					    <span><input type="text" id="Username" name="Username" class="samlLoginInput" /></span></div>
					    <div><span class="samlLoginLabel"><%= Globalizer.GetGlobalizedString("LBL_PASSWORD") %></span>
					    <span><input type="password" id="Password" name="Password" class="samlLoginInput" /></span></div>
					    <div class="samlLoginButton"><input type="submit" class="samlLoginButtonInput" value="<%= Globalizer.GetGlobalizedString("TXT_LOGIN") %>" /></div>
			        </asp:PlaceHolder>
	            </fieldset>
	        </div>
            <input id="SAMLRequest" runat="server" type="hidden" />
            <input id="RelayState" runat="server" type="hidden" />
            <input id="UseBase64" runat="server" type="hidden" />
        </form>
		<jics:CustomSamlFooter id="customSamlFooter" runat="server" />
    </body>
</html>
