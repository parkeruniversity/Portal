<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MainView.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.MeetingPortlet.Views.MainView" %>
<%@ Register TagPrefix="jics" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="jics" TagName="MeetingList" Src="Controls/MeetingList.ascx" %>
<%@ Register TagPrefix="jics" TagName="GeneralHelp" Src="Controls/GeneralHelp.ascx" %>
<%@ Register TagPrefix="jics" TagName="UsersHelp" Src="Controls/UsersHelp.ascx" %>
<%@ Register TagPrefix="jics" TagName="MeetingLauncher" Src="Controls/MeetingLauncher.ascx" %>
<!DOCTYPE html>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<asp:UpdatePanel id='MainUpdate' runat="server" UpdateMode="Conditional">
    <contenttemplate>
<div class="pSection">
    
    <div class="adminHeader">
        <div id="divAdminHeaderLeftCell" runat="server" class="meetingAdminHeaderLeftCell">
            <jics:MeetingLauncher runat="server" ID="meetingLauncher" />
        </div>
        <div id="divAdminHeaderRightCell" runat="server" class="meetingAdminHeaderRightCell">
            <jics:ImageAndHyperLink id="QuickLaunchLink" runat="server"></jics:ImageAndHyperLink><br /><strong><jics:ImageAndHyperLink id="CreateMeetingLink" runat="server"></jics:ImageAndHyperLink></strong><jics:UsersHelp ID="UsersHelp" runat="server" />
        </div>
        <div id="clearFloat"></div>
    </div><br />
    
    
    <div id="AddPageIntroductionContainer" runat="server" class="meetingAddEditIntro" Visible="False">
            <asp:HyperLink ID="AddPageIntroductionLink" runat="server"/>
        </div>
    <div id="PageIntroductionContainer" class="meetingPageIntroContainer" runat="server">
            <asp:Literal ID="litPageIntroduction" runat="server" />
            <div id="EditPageIntroductionLinkContainer" runat="server" class="meetingAddEditIntro" Visible="False">
                <asp:HyperLink ID="EditPageIntroductionLink" runat="server" CssClass="editLink" />
            </div>
        </div>        
    
    <div class="meetingMeetingListContainer">
    <jics:MeetingList id="MeetingList" runat="server" />
        </div>
    
    <asp:HyperLink runat="server" ID="lnkViewAllPreviousMeetings" />
    
    <div id="divOnlineHelp" runat="server" class="meetingOnlineHelpContainer">
    <jics:GeneralHelp ID="GeneralHelp" runat="server" />
    </div>
    <asp:Timer id="Timer1" runat="server"
      Interval="60000" 
      OnTick="Timer1_Tick">
    </asp:Timer>
        
      
    <div>
        <jics:ImageAndHyperLink ID="GlobalMeetingLink" runat="server"/>
    </div>
</div> 
        </contenttemplate>
</asp:UpdatePanel> 

