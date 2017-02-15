<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UsersHelp.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.MeetingPortlet.Views.Controls.UsersHelp" %>
<%@ Register Src="Modal.ascx" TagName="Modal" TagPrefix="JICS" %>

<style>
    
    .userHelpLinkDiv a{
        text-decoration: underline;
        color: blue;
        cursor: pointer;
    }

</style>
<div class="userHelpLinkDiv">
    <asp:Image runat="server" ID="imgLinkImage" />

        <asp:HyperLink runat="server" ID="_openModal">
            <asp:Literal runat="server" ID="litLinkText"></asp:Literal></asp:HyperLink>
    
    
</div>
<JICS:Modal Id="_modal" runat="server">
    <contentarea>
        <div class="MeetingUserHelpPopup"><asp:Literal runat="server" ID="UserHelpPopupMainText"></asp:Literal>
            
        </div>
    </contentarea>
</JICS:Modal>