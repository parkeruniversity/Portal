<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ShowPageThorughLink.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.CustomizePage.ShowPageThorughLink" %>
<%@ Import Namespace="Jenzabar.Common.Globalization" %>



<div id="closePageOptionsPopup" class="modalHeadingImg"></div>
<div style="clear: both"></div>
<div class="directLinkContainer">
    <span class="pheader"><%= String.Format(Globalizer.GetGlobalizedString("TXT_PAGE_DIRECT_LINK_HEADER"),this.PortalName) %> </span>
    <p> <%= String.Format(Globalizer.GetGlobalizedString("TXT_PAGE_DIRECT_LINK_DESCRIPTION"),this.PortalName) %></p>
      
    <p><%= Globalizer.GetGlobalizedString("TXT_PAGE_DIRECT_LINK_DESCRIPTION2") %></p>
          
    <p id="link">
        <%= this.GetURL() %>
    </p>
    <div style="position: relative" class="actions">
        <a target="_blank" href="<%= this.GetURL() %>"><%= Globalizer.GetGlobalizedString("TXT_PAGE_DIRECT_LINK_PREVIEW_LINK") %></a>
        <a id="copyLinkToClipBoard"><%= Globalizer.GetGlobalizedString("TXT_PAGE_DIRECT_LINK_COPY_LIK") %></a>    
    </div>
    
    <p><%= Globalizer.GetGlobalizedString("TXT_PAGE_DIRECT_LINK_HTML_DESCRIPTION") %></p>
    <asp:TextBox  Width="100%" Wrap="true" TextMode=MultiLine runat="server" ID="txtIframeHtml" />  
    <a id="copyHTMLToClipart"><%= Globalizer.GetGlobalizedString("TXT_PAGE_DIRECT_LINK_COPY_HTML_LINK") %></a>    
    <p class="link-info">
        <%= String.Format(Globalizer.GetGlobalizedString("TXT_PAGE_DIRECT_LINK_INFO"),"<a href=\"javascript:__doPostBack('adminBar$pageAccessLink','')\">"+Globalizer.GetGlobalizedString("TXT_PAGE_DIRECT_LINK_INFO_LINK") + "</a>") %>
    </p>
    <a id="closeDirectLinkPopup" ><%= Globalizer.GetGlobalizedString("TXT_PAGE_DIRECT_LINK_BACK_BUTTON") %></a>
</div>

