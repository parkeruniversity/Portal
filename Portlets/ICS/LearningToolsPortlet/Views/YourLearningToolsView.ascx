<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="YourLearningToolsView.ascx.cs"
    Inherits="Jenzabar.ICS.Web.Portlets.LearningToolsPortlet.Views.YourLearningToolsView" %>
<div class="pSection">
    <div id="Introduction" class="learningToolScreenHeaderContainer">
        <div class="learningToolsIconContainer">
        </div>
        <div>
            <asp:Label ID="YourLearningToolsLabel" runat="server" CssClass="headerText" />
            <div class="textContainer">
                <asp:Label ID="YourLearningToolsDescriptionLabel" runat="server" CssClass="descriptiveText" />
            </div>
        </div>
    </div>
    <div class="yourLearningToolsRepeaterContainer">
        <asp:Repeater ID="LearningToolsRepeater" runat="server">
            <ItemTemplate>
                <div class="toolsListRepeaterItemContainer">
                    <div class="toolListTitle"><asp:HyperLink ID="LearningToolLink" runat="server" /></div>
                    <div class="repeaterMoreDetailsContainer">
                        <asp:HyperLink ID="MoreDetailsLink" runat="server" />
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <div>
        <div class="addToolLinkContainer">
            <asp:HyperLink ID="AddNewLearningToolLink" runat="server" CssClass="addLink" />
        </div>
        <div class="backToMainScreenLinkContainer">
            <asp:HyperLink ID="BackToMainScreenLink" runat="server" CssClass="backLink" />
        </div>
    </div>
</div>
