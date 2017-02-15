<%@ Control Language="c#" AutoEventWireup="false" Codebehind="MainView.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.RssNewsReaderPortlet.MainView" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="uc1" TagName="SideBar" Src="SideBar.ascx" %>
<div id="divTable" runat="server">
<table width="100%" cellpadding="0" cellspacing="0" >
    <tr>
      <td class="rssSideBarCell">
        
        <uc1:SideBar ID="sidebar" runat="server" />
       
      </td>
      <td class="rssMainViewRightCell">
        <div id="divWelcome" runat="server" visible="false">
        <div class="rssWelcomeHeader"> 
          <asp:Label ID="lblWelcomeHeader" Runat="server" Visible="false" />
        </div>
        <br />
        <div class="pSection">
          <asp:Label ID="lblIntro" Runat="server" Visible="false" class="rssLightText" />
        </div>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        </div>
      </td>
    </tr>
  </table>  
  </div>
  <div id="divNoContent" runat="server">
    <div class="pSection">
      <asp:Label ID="lblNoContent" Runat="server" />
    </div>
  </div>