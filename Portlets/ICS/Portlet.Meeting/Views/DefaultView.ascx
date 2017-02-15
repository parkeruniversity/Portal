<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DefaultView.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.MeetingPortlet.Views.DefaultView" %>
<%@ Register TagPrefix="jics" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="jics" TagName="GeneralHelp" Src="Controls/GeneralHelp.ascx" %>
<%@ Register TagPrefix="jics" TagName="MeetingLauncher" Src="Controls/MeetingLauncher.ascx" %>

<div class="pSection">
    <div id="defaultlauncher">
        <jics:MeetingLauncher runat="server" ID="meetingLauncher"></jics:MeetingLauncher>
    </div>
    <div id="clearfloat"></div>
    <div id="defaultcreatelink" class="meetingDefaultCreateLinkContainer">
        <jics:ImageAndHyperLink ID="CreateMeetingLink" runat="server" 
            ></jics:ImageAndHyperLink>
    </div>
    <div id="defaulthelp" runat="server">
        <jics:GeneralHelp ID="GeneralHelp" runat="server" />
    </div>
    <div>
        <asp:Hyperlink id="FullViewLink" runat="server"></asp:Hyperlink>
    </div>
</div>
