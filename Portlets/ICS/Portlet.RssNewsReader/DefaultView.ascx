<%@ Register TagPrefix="uc1" TagName="SideBar" Src="SideBar.ascx" %>
<%@ Register TagPrefix="common" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="DefaultView.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.RssNewsReaderPortlet.DefaultView" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
  <div id="divNoContent" runat="server" visible="false">
    <div class="pSection">
      <asp:Label ID="lblNoContent" Runat="server" />
    </div>
  </div>  
  
  <div id="divTable" runat="server" style="padding: 0; margin= 0; width: 100%;">  
  <table width="100%" cellpadding="0" cellspacing="0">
    <tr>
      <td width="25%" runat="server" id="tdSideBar" class="rssDefaultViewSideBarCell" >
        
        <uc1:SideBar ID="SideBarDefault" runat="server" />
       
      </td>
      <td width="75%" valign="top">
        <div id="divWelcome" runat="server" Visible="false">
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
        </div>  <!-- End of divWelcome -->
      </td>
    </tr>
  </table>
  </div>  <!-- End of divTable -->
   
  

