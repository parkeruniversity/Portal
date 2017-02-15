<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SelectLearningToolView.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.LearningToolsPortlet.Views.SelectLearningToolView" %>
<%@ Register TagPrefix="asp" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<div class="pSection">
    <div id="Introduction" class="learningToolScreenHeaderContainer">
        <div class="learningToolsIconContainer"></div>
        <div>
            <asp:Label ID="AddLearningToolLabel" runat="server" />
        </div>
        <div class="textContainer">
            <asp:Label ID="ScreenDescriptionLabel" runat="server" />
        </div>
    </div>
    <div>
        <table id="_tblAddTool" runat="server">
            <tr>
                <td>
                    <div class="addToolLinkContainer" id="AddToolLinkContainer" runat="server">
                        <asp:HyperLink ID="AddNewLearningToolLink" runat="server" CssClass="addLink" />
                    </div>
                </td>
                <td>
                    <div class="linkContainer">
                        <asp:Label ID="SelectExistingToolLabel" runat="server" />
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <div>
        <table width="100%">
            <tr>
                <td valign="top" id="_tdYourLearningTools" runat="server">
                    <div id="YourLearningTools" class="yourLearningToolsRepeaterContainer">
                        <asp:Label ID="YourLearningToolsLabel" runat="server" CssClass="headerText" />
                        <div class="textContainer">
                            <asp:Label ID="LearningToolsDescriptionLabel" runat="server" CssClass="descriptiveText" />
                        </div>
                        <asp:Repeater ID="YourLearningToolsRepeater" runat="server">
                            <ItemTemplate>
                                <div class="toolsListRepeaterItemContainer">
                                    <div class="toolListTitle">
                                        <asp:Label ID="YourLearningToolLabel" runat="server" />
                                        <asp:LinkButton ID="YourLearningToolLinkButton" runat="server" />
                                    </div>
                                    <div class="repeaterMoreDetailsContainer">
                                        <asp:HyperLink ID="MoreDetailsLink" runat="server" />
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </td>
                <td valign="top">
                    <div id="FeaturedTools" class="featuredToolsListContainer">
                        <asp:Label ID="FeaturedToolsLabel" runat="server" CssClass="headerText" />
                        <div class="textContainer">
                            <asp:Label ID="FeaturedToolsDescriptionLabel" runat="server" CssClass="descriptiveText" />
                        </div>
                        <asp:Repeater ID="FeaturedToolsRepeater" runat="server">
                            <ItemTemplate>
                                <div class="featuredToolsListRepeaterItemContainer">
                                    <div class="toolListTitle">  <asp:Label ID="FeaturedLearningToolLabel" runat="server" />
                                      <asp:LinkButton ID="FeaturedToolLinkButton" runat="server" />
                                      </div>
                                    <div class="repeaterMoreDetailsContainer">
                                        <asp:HyperLink ID="MoreDetailsLink" runat="server" />
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </td>
            </tr>
        </table>        
    </div>
    <div id="SharedLearningTools" class="sharedLearningToolsListContainer">
        <asp:UpdatePanel ID="SharedLearningToolsUpdatePanel" runat="server">
        <ContentTemplate>
            <div>
                <asp:Label ID="SharedLearningToolsLabel" runat="server" CssClass="headerText" />
            </div>
            <div class="textContainer">
                <asp:Label ID="SharedLearningToolsDescriptionLabel" runat="server" CssClass="descriptiveText" />
            </div>
            <div class="controlContainer">
                <asp:Label ID="ShowLabel" runat="server" />
                <asp:DropDownList ID="CategoriesDropDownList" runat="server" AutoPostBack="True" />
                <asp:DropDownList ID="CreatorsDropDownList" runat="server" AutoPostBack="True" />
            </div>
            <asp:Repeater ID="SharedLearningToolsRepeater" runat="server">
                <ItemTemplate>
                    <div class="sharedToolsListRepeaterItemContainer">
                        <asp:Label ID="SharedToolLabel" runat="server" />
                        <asp:LinkButton ID="SharedToolLinkButton" runat="server" />
                        <asp:Label ID="SharedToolInfoLabel" runat="server" CssClass="descriptiveText" />
                        <div class="repeaterMoreDetailsContainer">
                            <asp:HyperLink ID="MoreDetailsLink" runat="server" />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </ContentTemplate>
        </asp:UpdatePanel>
    </div>
      <div style='clear:both'> </div>
    <div>
        <asp:Mirror runat="server" ID="AddNewToolLinkMirror" ControlID="AddToolLinkContainer" />
    </div>
    <div class="backToMainScreenLinkContainer">
        <asp:HyperLink ID="BackToMainScreenLink" runat="server" CssClass="backLink" />
    </div>
</div>