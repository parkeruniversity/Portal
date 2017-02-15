<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MainView.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.LearningToolsPortlet.Views.MainView" %>
<%@ Register TagPrefix="asp" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<div class="pSection">
    <div>
        <div id="AddPageIntroductionContainer" runat="server" class="placeHolderBox">
            <asp:HyperLink ID="AddPageIntroductionLink" runat="server"/>
        </div>
        <div id="PageIntroductionContainer" class="controlContainer" runat="server">
            <asp:Literal ID="PageIntroduction" runat="server" />
            <div id="EditPageIntroductionLinkContainer" runat="server" class="controlContainer" Visible="False">
                <asp:HyperLink ID="EditPageIntroductionLink" runat="server" CssClass="editLink" />
            </div>
        </div>        
    </div>
    <div>
        <table>
            <tr>
                <td>
                    <div id="AddToolLinkContainer" class="addToolLinkContainer" runat="server" Visible="False" >
                        <asp:HyperLink ID="AddNewToolLink" runat="server" CssClass="addLink" />
                    </div>
                </td>
                <td>
                    <div id="ManageYourToolsLinkContainer" runat="server" class="linkContainer" Visible="False">
                        <asp:HyperLink ID="ManageYourToolsLink" runat="server" />
                    </div>
                </td>
                <td>
                    <div id="ManageAllToolsLinkContainer" runat="server" class="linkContainer" Visible="False">
                        <asp:HyperLink runat="server" ID="ManageAllToolsLink" />
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <div>
        <asp:Label ID="_lblNoPlacements" runat="server" />
    </div>
    <asp:Repeater ID="ToolsRepeater" runat="server">
        <ItemTemplate>
            <div class="mainScreenLearningTool">
                <div>
                    <asp:Label ID="ToolNameLabel" runat="server" CssClass="headerText" />
                </div>
                <div id="ManageToolLinksContainer" runat="server" Visible="False" >
                    <div class="linkContainer">
                        <asp:HyperLink ID="EditActivationSettingsLink" runat="server" CssClass="editLink" />
                    </div>
                    <div class="linkContainer">
                        <asp:LinkButton ID="RemoveToolLinkButton" runat="server" CssClass="deleteLink" />
                    </div>
                </div>
                <div class="toolDescriptionContainer">
                    <asp:Label ID="ToolDescriptionLabel" runat="server" />
                </div>
                <asp:HyperLink ID="LaunchToolLink" runat="server" />
            </div>
        </ItemTemplate>
    </asp:Repeater>
    <div>
        <asp:Mirror ID="AddAnotherToolLinkMirror" runat="server" ControlID="AddToolLinkContainer" />
    </div>
</div>