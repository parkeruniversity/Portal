<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DeletePage.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.CustomizePage.DeletePage" %>
<%@ Import Namespace="Jenzabar.Common.Globalization" %>
<div id="closePopup" class="modalHeadingImg"></div>
<div style="clear: both"></div>
<div class="DeletePagePanel">
   <span class="header"><%= String.Format(Globalizer.GetGlobalizedString("TXT_PAGE_DELETE_HEADER"),"<strong>"+this.PageInfo.DisplayName +"</strong>")  %> </span> 
    <div class="warning-info">
        <header><%= Globalizer.GetGlobalizedString("TXT_PAGE_DELETE_WARNIN_HEADER") %></header>
       <p><%= String.Format(Globalizer.GetGlobalizedString("TXT_PAGE_DELETE_WARNING"),this.PageInfo.DisplayName,"<strong>","</strong>") %> </p>
    </div>
    <div class="hideFromEveryone">
        <header><%= Globalizer.GetGlobalizedString("TXT_PAGE_DELETE_OPTION_HEADER") %></header>
        <p>
            <%= Globalizer.GetGlobalizedString("TXT_PAGE_DELETE_OPTION") %>
        </p>
        <a id="hidePageFromAll" ><%= Globalizer.GetGlobalizedString("TXT_PAGE_DELETE_OPTION_HIDEALL") %></a>
        <span><%= Globalizer.GetGlobalizedString("TXT_PAGE_DELETE_OPTION_HIDEALL_DESCRIPTION") %></span>
    </div>
 
    <div class="deleteButtonPanel">
        <header><%= Globalizer.GetGlobalizedString("TXT_PAGE_DELETE_OPTION_BUTTON_HEADER") %></header>
        <div>
        <a id="deletePage" runat="server"><%= String.Format(Globalizer.GetGlobalizedString("TXT_PAGE_DELETE_OPTION_BUTTON"),this.PageInfo.DisplayName) %></a>    
        </div>
        
    </div>
    
    <a id="closePopupLink" class="closeLInk"><%= Globalizer.GetGlobalizedString("TXT_PAGE_DELETE_OPTIO_CLOSE_BUTTON") %></a>
</div>
    
