<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ContextAddPage.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.Controls.ContextAddPage" %>
<%@ Import Namespace="Jenzabar.Common.Globalization" %>
<%@ Import Namespace="Jenzabar.Portal.Framework" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI.WebControls" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31BF3856AD364E35" %>
<%@ Register TagPrefix="ajaxToolkit" Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" %>
<%@ Register tagPrefix="cmn" src="../CommonControls/PageTypeView.ascx" tagName="PageTypeView" %>
<asp:Panel ID="addPagePanel" CssClass="addPageSecion" runat="server">
    <div id="pageheader" runat="server" class="AddPageHeader">
            <span class="header">
                <%= Globalizer.GetGlobalizedString(AddPageGlobalkey) %> 
            </span>
        <div>
            <span>in <b><%= this.ContextToCustomize.DisplayName %> </b>
            </span>
            <a class="bottomBackButton" href="<%= this.ContextToCustomize.URL %>">Back to <b><%=  this.ParentPortlet.PortalPage.PageInfo.Context.DisplayName %> </b></a>
        </div>
        <p>
            <%= Globalizer.GetGlobalizedString("TXT_ADD_PAGE_TITLE")  %>
        </p>
    </div>
    <cmn:PageTypeView ID="pageTypeView" runat="server"></cmn:PageTypeView>
    <a  class="bottomBackButton" href="<%= this.ContextToCustomize.URL %>">Back to <b><%=  this.ParentPortlet.PortalPage.PageInfo.Context.DisplayName %> </b></a>
    
  </asp:Panel>