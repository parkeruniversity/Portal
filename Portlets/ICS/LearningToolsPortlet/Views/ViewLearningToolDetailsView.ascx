<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ViewLearningToolDetailsView.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.LearningToolsPortlet.Views.ViewLearningToolDetailsView" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register TagPrefix="fwk" TagName="Modal" Src="~/UI/Controls/UserControls/Modal.ascx" %>
<%@ Register Src="Controls/ConfirmDeleteLearningTool.ascx" TagName="ConfirmDeleteLearningTool" TagPrefix="JICS" %>
<asp:UpdatePanel ID="_updatePanel" runat="server">
    <ContentTemplate>
        <div class="pSection">
            <div id="Introduction" class="learningToolScreenHeaderContainer">
                <div class="learningToolsIconContainer">
                </div>
                <div>
                    <asp:Label ID="LearningToolNameLabel" runat="server" />
                    <div>
                        <asp:Label ID="AddedByLabel" runat="server" />
                    </div>
                </div>
            </div>
            <div class="editDeleteToolSettingsContainer" id="_divEditAndDeleteTool" runat="server">
                <div class="editToolSettingsContainer">
                    <asp:HyperLink ID="EditToolSettingsLink" runat="server" CssClass="editLink" />
                </div>
                <div class="deleteToolSettingsContainer">
                    <asp:LinkButton ID="DeleteToolLinkButton" runat="server" CssClass="deleteLink" Visible="False" />
                    <asp:HyperLink ID="DisabledDeleteLink" runat="server" CssClass="disabledDeleteButton" Visible="False" />
                </div>
            </div>
            <div id="DescriptionContainer" runat="server" class="learningToolFormSubCategoryContainer">
                <div>
                    <asp:Label ID="DescriptionLabel" runat="server" CssClass="descriptiveText" />
                </div>
                <div class="textContainer">
                    <asp:Label ID="DescriptionValueLabel" runat="server" />
                </div>
            </div>
            <div class="toolDetialsDisplayAndPreviewContainer">
                <div id="DisplayValue" class="toolDetailsDisplayValueContainer">
                    <div id="ToolDisplayIconContainer" runat="server">
                    </div>
                    <div class="toolDetailsToolDisplayContainer">
                        <div>
                            <asp:Label ID="ToolDisplayLabel" runat="server" />
                        </div>
                        <div>
                            <strong>
                                <asp:Label ID="ToolDisplayValueText" runat="server" />
                            </strong>
                        </div>
                    </div>
                </div>
                <div id="Preview" class="toolDetialsPreviewContainer">
                    <div>
                        <asp:Label ID="PreviewLabel" runat="server" CssClass="descriptiveText" />
                    </div>
                    <div>
                        <asp:HyperLink ID="LaunchPreviewLink" runat="server" CssClass="previewLink" />
                    </div>
                </div>
            </div>
            <div id="Sharing" class="toolDetailsSharingContainer">
                <div class="textContainer">
                    <asp:Label ID="SharingLabel" runat="server" CssClass="descriptiveText" />
                </div>
                <div>
                    <div id="sharingIcon" runat="server">
                    </div>
                    <asp:Label ID="SharingValueLabel" runat="server" />
                </div>
            </div>
            <div id="Connection">
                <asp:Label ID="ConnectionLabel" runat="server" CssClass="headerText" />
            </div>
            <div id="Location">
                <asp:Label ID="LocationLabel" runat="server" CssClass="descriptiveText" />
                <div>
                    <asp:Label ID="LocationValueLabel" runat="server" />
                </div>
            </div>
            <div id="KeyAndSecret">
                <div id="Key" class="toolDetailsKeyContainer">
                    <div>
                        <asp:Label ID="KeyLabel" runat="server" CssClass="descriptiveText" />
                    </div>
                    <div>
                        <asp:Label ID="KeyValueLabel" runat="server" />
                    </div>
                </div>
                <div id="Secret" class="toolDetailsSecretContainer">
                    <div>
                        <asp:Label ID="SecretLabel" runat="server" CssClass="descriptiveText" />
                    </div>
                    <div>
                        <asp:Label ID="SecretValueLabel" runat="server" />
                    </div>
                </div>
            </div>
            <div id="CurrentUsage">
                <asp:Label ID="CurrentUsageLabel" runat="server" CssClass="headerText" />
                <div class="textContainer">
                    <asp:Label ID="CurrentUsageDescriptionLabel" runat="server" CssClass="descriptiveText" />
                </div>
                <asp:Repeater ID="CurrentUsageRepeater" runat="server">
                    <ItemTemplate>
                        <div class="textContainer">
                            <asp:Label ID="PortalContextNameLabel" runat="server" />
                            >
                            <asp:HyperLink ID="PortletLink" runat="server" />
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:Repeater ID="_rptrCurrentUsageAssignments" runat="server">
                    <ItemTemplate>
                        <div class="textContainer">
                            <asp:Label ID="_lblCourseName" runat="server" /> > 
                            <asp:HyperLink ID="_hlnkAssignmentName" runat="server" />
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>    
            <div id="BackToMainScreenLinkContainer" runat="server" class="backToMainScreenLinkContainer" Visible="False" >
                <asp:HyperLink ID="BackToMainScreenLink" runat="server" CssClass="backLink" />
            </div>    
           <div id="ButtonsContainer" runat="server" class="saveCancelButtonContainer" Visible="False">
                <div class="saveButtonContainer" id="_divActivateBtn" runat="server">
                    <asp:Button ID="UseThisToolButton" runat="server" Width="200" />
                </div>
                <div class="cancelButtonContainer">
                    <asp:HyperLink ID="BackToToolsListLink" runat="server" />
                </div>
            </div>
        </div>
        <asp:Hyperlink ID="_hypModalConfirmDeleteLearningTool" runat="server" style="display: none;" />
        <fwk:Modal ID="_modalConfirmDeleteLearningTool" runat="server" TargetControlID="_hypModalConfirmDeleteLearningTool">
            <ContentArea>
                <JICS:ConfirmDeleteLearningTool ID="_confirmDeleteLearningTool" runat="server" />
            </ContentArea>
        </fwk:Modal>
    </ContentTemplate>
</asp:UpdatePanel>