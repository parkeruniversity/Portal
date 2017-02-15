<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ManagePostOption.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.ForumPortlet.Views.Controls.ManagePostOption" %>
<%@ Register TagPrefix="cmn" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register src="DateSelector.ascx" tagname="DateSelector" tagprefix="JICS" %>
 <div class="manageArea">
    <asp:Label id="_lblDisplay" CssClass="selTitle" runat="server" />
    <div class="manageSelection">
        <asp:Panel ID="_panPruning" CssClass="feedbackMessage" runat="server">
            <asp:Label ID="_lblCatPrun" runat="server" />
            <br />
            <asp:Label ID="_lblCatPrunInfo" runat="server" />
            <asp:Image ID="_imgEditCat" runat="server" />
            <asp:HyperLink ID="_hypEditCat" runat="server" />
        </asp:Panel>
        <JICS:DateSelector id="_dateSelector" runat="server" />
    </div>
</div>
 <div class="manageArea">
    <asp:Label id="_lblPostReplyType" CssClass="selTitle" runat="server" />
    <div class="manageSelection">
        <asp:RadioButtonList ID="_rblReplyType" runat="server"  />
    </div>
</div>
 <div class="manageArea">
    <asp:Label id="_lblReplyDisplay" CssClass="selTitle" runat="server" />
    <div class="manageSelection">
        <cmn:displayindicator id="_diReplies" runat="server" ShowTime="True" ></cmn:displayindicator>
    </div>
</div>
 <div class="manageArea" style="clear:both;">
    <asp:Label ID="_lblModeration" CssClass="selTitle" runat="server" />
    <asp:Panel ID="_panModeration" runat="server" CssClass="manageSelection">
        <div>
            <asp:Label ID="_lblModerationInfo" CssClass="moderationInfo" runat="server" />
            <asp:Image ID="_imgEditTopic" runat="server" />
            <asp:HyperLink ID="_hypEditTopic" runat="server" />
        </div>
        <asp:Panel ID="_panModerators" runat="server">
            <asp:Label ID="_lblModerator" runat="server" Font-Bold="true" />
            <asp:Label ID="_lblModeratorList" runat="server" />
        </asp:Panel>
    </asp:Panel>
</div>                    