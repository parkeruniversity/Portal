<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GeneralHelp.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.MeetingPortlet.Views.Controls.GeneralHelp" %>
<%@ Register Src="Modal.ascx" TagName="Modal" TagPrefix="JICS" %>

<div class="generalHelpLinkDiv">
    <asp:Image runat="server" ID="imgLinkImage" />
    <div class="generalHelpLinkTextDiv">
        <span id="headerline"><asp:Literal runat="server" ID="litLinkHeader"></asp:Literal></span><br />
        <asp:Literal runat="server" ID="litLinkBody"></asp:Literal><br />
        <asp:HyperLink runat="server" ID="_openModal">
            <asp:Literal runat="server" ID="litLinkText"></asp:Literal></asp:HyperLink>
    </div>
    
</div>

<JICS:Modal Id="_modal" runat="server">
    <contentarea>
        <div class="MeetingGeneralHelpPopup"><asp:Literal runat="server" ID="GeneralHelpPopupMainText"></asp:Literal>
            <br />
            <div id="adminButtons" class="generalHelpAdminButtons" runat="server">
                <div id="schedulenow">
                    <asp:Literal runat="server" ID="litStartNowText"></asp:Literal><br/>
                <asp:HyperLink runat="server" ID="startNow"/>
                </div>
                <div id="schedulelater">
                    or<br/>
                <asp:Image runat="server" ID="scheduleimage"/>&nbsp;<asp:HyperLink runat="server" ID="schedule"></asp:HyperLink>
                </div>
                <br id="clearfloat"/>
            </div>
            
        </div>
    </contentarea>
</JICS:Modal>

