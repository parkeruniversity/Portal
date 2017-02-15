<%@ Control Language="c#" AutoEventWireup="True" CodeBehind="WorksheetDetailView.ascx.cs"
    Inherits="Jenzabar.CRM.Budget.Web.Portlets.PrepareBudgetPortlet.WorksheetDetailView" %>
<%@ Import Namespace="Jenzabar.Common.Globalization" %>
<%@ Import Namespace="Portlet.PrepareBudget" %>
<%@ Import Namespace="EX.Data.Dtos.Budget" %>
<%@ Import Namespace="System" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="Jenzabar.EX.Feedback" Namespace="Jenzabar.EX.Feedback" TagPrefix="fb" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register TagPrefix="fb" TagName="FeedbackView" Src="~/Portlets/CRM/Common/Jenzabar.EX.Feedback/Controls/FeedbackView.ascx" %>

<table class="PBLayoutTable">
    <tr>
        <td class="PBBackToMain">
            <div class="PBFloatRight">
                <img src="<%=GetBackIconPath()%>" alt="Back" />
                <asp:LinkButton ID="CancelGoBack" Text="Cancel, go back" runat="server" />
            </div>
        </td>
    </tr>
    <tr>
        <td>       
<div class="PBSection PBClearRight">
    <!-- Worksheet Header -->
    <div class="PBTopStretch PBSectionMarginBottom">
        <table>
            <tr>
                <td>
                    <span class="PBBoldText PBHeader1Text">
                        <%=CurrentWorksheet.Name%>
                    </span><span class="PBHeader1Text">Worksheet</span>
                </td>
                <td id="RootWorksheetInfo" runat="server">
                    <span class="PBInformativeText">for</span> <span class="PBLabelText PBBoldText">
                        <%=CurrentWorksheet.ForBudgetYear%>
                    </span>
                </td>
            </tr>
            <tr>
                <td id="ParentWorksheetInfo" runat="server">
                    <span class="PBInformativeText">Part of the</span>
                    <img src="<%=GetParentStatusIconPath()%>" alt="Status" />
                    <span id="ParentNameLabel" runat="server" class="PBLabelText PBBoldText">
                        <%=CurrentWorksheet.GetParentName()%>
                    </span>
                    <asp:LinkButton ID="ParentNameLink" CssClass="PBHeaderLink" runat="server" />
                    <span class="PBInformativeText">
                        <%=CurrentWorksheet.GetParentDescription()%>
                    </span><span class="PBLabelText PBBoldText">
                        <%=CurrentWorksheet.ForBudgetYear%>
                    </span>
                </td>
            </tr>
        </table>
    </div>

    <!-- Worksheet summary-->
    <div class="PBFloatLeft PBMarginRight PBMarginTop">
        <span class="PBInformativeText PBMarginTop">Worksheet summary</span>
        <table class="PBNoMarginPadding">
            <tr>
                <td colspan="2" class="PBNoMarginPadding">
                    <div class="<%=CurrentWorksheet.GetBudgetAmountStyle()%>">
                        <asp:UpdatePanel ID="upRequestedBudget" ChildrenAsTriggers="true" UpdateMode="Conditional"
                            runat="server">
                            <ContentTemplate>  
                                <table>
                                    <tr>
                                        <td>
                                            <span class="PBBoldText PBHeader1Text">
                                                <%=CurrentWorksheet.RequestedBudget.ToString("C0")%>
                                            </span><span class="PBHeader1Text">
                                                <%=CurrentWorksheet.GetRequestedBudgetDescription()%>
                                            </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <span class="PBInformativeText">
                                                <%=CurrentWorksheet.BudgetPercentChangeLabel %>
                                            </span>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="_btnSave" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                </td>
            </tr>
            <tr id="ApproverPreparerRow" runat="server">
                <td class="PBNoMarginPadding">
                    <div class="<%=CurrentWorksheet.GetPreparerStyle()%>">
                        <div class="preparerWedgeOutline">
                        </div>
                        <div class="<%=CurrentWorksheet.GetPreparerWedgeStyle()%>">
                        </div>
                        <table>
                            <tr>
                                <td>
                                    <img src="<%=GetPreparerIconPath()%>" alt="Status" />
                                </td>
                                <td>
                                    <span id="PreparerName" runat="server">
                                        <%=CurrentWorksheet.PreparerName%>
                                    </span>
                                    <asp:LinkButton ID="WorksheetPreparersLink" Text="Worksheet Preparers" runat="server" />
                                </td>
                                <td>
                                    <asp:ImageButton ID="PreparerEmail" OnClick="PreparerEmail_Click" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td colspan="2">
                                    <div class="<%=DerivePreparerActionStyle()%>">
                                        <%=GetPreparerAction()%>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
                <td class="PBNoMarginPadding">
                    <div class="<%=CurrentWorksheet.GetApproverStyle()%>">
                        <table>
                            <tr>
                                <td>
                                    <img src="<%=GetApproverIconPath()%>" alt="Status" />
                                </td>
                                <td>
                                    <span id="ApproverName" runat="server">
                                        <%=CurrentWorksheet.ApproverName%>
                                    </span>
                                    <asp:LinkButton ID="WorksheetApproversLink" Text="Worksheet Approvers" runat="server" />
                                </td>
                                <td>
                                    <asp:ImageButton ID="ApproverEmail" OnClick="ApproverEmail_Click" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td colspan="2">
                                    <div class="<%=DeriveApproverActionStyle()%>">
                                        <%=GetApproverAction()%>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
        </table>
    </div>

    <!-- Your Action-->
    <div runat="server" id="YourActionColumn" class="PBFloatLeft PBMarginRight PBMarginLeft PBMarginTop">
        <span class="PBInformativeText PBMarginTop">Your Action</span><br />
        <div class="PBActiveHighlightBorder">
            <div id="PreparerActionArea" class="PBActionSubArea" runat="server">
                <table>
                    <tr>
                        <td rowspan="2">
                            <img src="<%=GetPreparerActionIconPath()%>" alt="Submit" />
                        </td>
                        <td>
                            <asp:LinkButton ID="SubmitLink" Text="Submit for approval" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span id="SubmitTo" class="PBInformativeText" runat="server">to</span> <span class="PBInformativeText">
                                <%=CurrentWorksheet.ApproverName%>
                            </span>
                        </td>
                    </tr>
                </table>
            </div>
            <table id="ApproverActionArea" runat="server">
                <tr>
                    <td id="ApproveActionArea" class="PBActionSubArea PBSplitWidth" runat="server">
                        <table>
                            <tr>
                                <td>
                                    <asp:ImageButton ID="ApproveActionButton" runat="server" AlternateText="Approve" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span class="PBLabelText PBBoldText">Approve</span>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td id="DenyActionArea" class="PBActionSubArea PBSplitWidth" runat="server">
                        <table>
                            <tr>
                                <td>
                                    <asp:ImageButton ID="DenyActionButton" runat="server" AlternateText="Deny" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span class="PBLabelText PBBoldText">Deny</span>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </div>

    <!-- Component Worksheets-->
    <div id="ComponentWorksheetsColumn" runat="server" class="PBFloatLeft PBMarginRight PBMarginLeft PBMarginTop">
        <asp:Label ID="ComponentWorksheetTitle" runat="server" CssClass="PBInformativeText PBMarginTop"
            Text="Component Worksheets" /><br />
        <div class="PBGraySolidBorder">
            <table class="PBLayoutTable">
                <asp:Repeater ID="rComponentWorksheets" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td class='<%# Eval("WorksheetStatus").ToString() %>'>
                                <asp:Image ID="ChildWorksheetStatusIcon" ImageUrl='<%# DeriveWorksheetStatusIcon(Eval("WorksheetStatus"), Eval("ParentWorksheetID")) %>'
                                    runat="server" />
                            </td>
                            <td class='<%# Eval("WorksheetStatus").ToString() %>'>
                                <asp:Label ID="ChildWorksheetName" Text='<%# Eval("WorksheetName") %>' runat="server"
                                    Visible='<%# !CanOpenWorksheet(Eval("WorksheetID")) %>' CssClass="PBLabelText" />
                                <asp:LinkButton ID="OpenChildWorksheet" Text='<%# Eval("WorksheetName") %>' runat="server"
                                    Visible='<%# CanOpenWorksheet(Eval("WorksheetID")) %>' CommandArgument='<%# Eval("WorksheetID") %>'
                                    OnClick="openWorksheetLink_Click" />
                                <asp:Label ID="ChildWorksheetStatusDate" Text='<%# DeriveChildWorksheetStatusDate(Eval("WorksheetStatus"), Eval("LatestWorksheetStatusDate")) %>'
                                    runat="server" CssClass="PBInformativeText" />
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
        </div>
    </div>
</div>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblMessage" runat="server" Visible="False"></asp:Label><br />
            <asp:Label ID="lblError" CssClass="PortletError" runat="server" Visible="False"></asp:Label>

            <fb:FeedbackView runat="server" ID="feedbackView" />

            <div id="divContent" class="pSection" runat="server">
                <asp:UpdatePanel ID="upWorksheet" ChildrenAsTriggers="true" UpdateMode="Conditional"
                    runat="server">
                    <ContentTemplate>
                        <asp:Table ID="WorksheetTable" CssClass="PBGridView" runat="server">
                        </asp:Table>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="_btnSave" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>

            <div>                
                <asp:Button ID="btnShowPopup" runat="server" Style="display: none" />
                <ajaxToolkit:ModalPopupExtender ID="EditLineItemPopup" runat="server" TargetControlID="btnShowPopup"
                    PopupControlID="_divModal" PopupDragHandleControlID="LineItemDetailModalHeader"
                    BackgroundCssClass="PBModalPopup" />
                <div id="_divModal" runat="server" class="PBModalDiv PBLineItemDetail" style="display: none;">
                    <div class="PBInnerModal">
                        <div id="LineItemDetailModalHeader" class="PBModalHeading">
                            <asp:ImageButton ID="_imgClose" CssClass="PBModalHeadingImg" runat="server" />
                            <asp:Label ID="_lblHeading" CssClass="PBHeaderText" Text="Line Item Detail" runat="server" />
                        </div>

                        <asp:UpdatePanel ID="upLineItemDetail" ChildrenAsTriggers="false" UpdateMode="Conditional"
                            runat="server">
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="_btnSave" />
                                <asp:AsyncPostBackTrigger ControlID="_btnCancel" />
                            </Triggers>
                            <ContentTemplate>
                                <table class="PBMarginPadding">
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblPoolCodeDesc" runat="server" CssClass="PBBoldText PBHeaderText" />
                                            <span class="PBHeaderText">line item</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblAccountCodes" runat="server" CssClass="PBInformativeText" /><br />
                                        </td>
                                    </tr>
                                    <tr runat="server" id="JustificationLabelRow">
                                        <td>
                                            <asp:Label ID="lblJustification" runat="server" CssClass="PBLabelText" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>                                   
                                            <asp:Table ID="LineItemAmountsTable" CssClass="PBGridView" runat="server">
                                            </asp:Table>
                                        </td>
                                    </tr>
                                    <tr runat="server" id="JustificationEditRow">
                                        <td>
                                            <br />
                                            <div>Justification (Optional)</div>
                                            <asp:TextBox ID="txtJustification" runat="server" Width="100%" />
                                        </td>
                                    </tr>
                                </table>

                                <div class="PBModalButtons">
                                    <asp:Button ID="_btnSave" Text="Save" runat="server" />
                                    <asp:Button ID="_btnCancel" Text="Cancel" runat="server" UseSubmitBehavior="false" />
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>

                <asp:Button ID="btnShowLineItemFeedbackPopup" runat="server" Style="display: none" />
                
                <ajaxToolkit:ModalPopupExtender ID="LineItemFeedbackPopup" runat="server" TargetControlID="btnShowLineItemFeedbackPopup"
                    PopupControlID="_divFeedbackModal" PopupDragHandleControlID="LineItemFeedbackModalHeader"
                    BackgroundCssClass="PBModalPopup" />
                <div id="_divFeedbackModal" runat="server" class="PBModalDiv PBFeedbackWidthHeight"
                    style="display: none;">
                    <div class="PBInnerModal">
                        
                        <div id="LineItemFeedbackModalHeader" class="PBModalHeading">
                            <asp:ImageButton ID="_imgFeedbackClose" CssClass="PBModalHeadingImg" runat="server" />

                            <asp:UpdatePanel ID="upFeedbackModalHeader" ChildrenAsTriggers="false" UpdateMode="Conditional"
                                runat="server">
                                <ContentTemplate>
                                    <asp:Label ID="_lblFeedbackName" CssClass="PBHeaderText PBBoldText" runat="server" />
                                    <asp:Label ID="_lblFeedbackType" CssClass="PBHeaderText" runat="server" />
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>

                        <fb:FeedbackView runat="server" ID="modalFeedbackView" />
                    </div>
                </div>
                <asp:Button ID="btnShowDrillDownPopup" runat="server" Style="display: none" />
                <ajaxToolkit:ModalPopupExtender ID="DrillDownPopup" runat="server" TargetControlID="btnShowDrillDownPopup"
                    PopupControlID="_divDrillDownModal" PopupDragHandleControlID="DrillDownModalHeader"
                    CancelControlID="_btnDrillDownClose" BackgroundCssClass="PBModalPopup" />
                <div id="_divDrillDownModal" runat="server" class="PBModalDiv"
                    style="display: none;">
                    <div class="PBInnerModal">
                        <div id="DrillDownModalHeader" class="PBModalHeading">
                            <asp:ImageButton ID="_imgDrillDownClose" CssClass="PBModalHeadingImg" runat="server" />
                            <asp:Label ID="_lblDrillDownHeading" CssClass="PBHeaderText" Text="Actuals" runat="server" />
                        </div>

                        <div id="LineItemDrillDownPlaceholder" runat="server" />

                        <div class="PBModalButtons">
                            <asp:Button ID="_btnDrillDownClose" Text="Close" runat="server" UseSubmitBehavior="false" />
                        </div>
                    </div>
                </div>

                <ajaxToolkit:ModalPopupExtender ID="WorksheetPreparersPopup" runat="server" TargetControlID="WorksheetPreparersLink"
                    PopupControlID="_divWorksheetPreparersModal" PopupDragHandleControlID="WorksheetPreparersModalHeader"
                    CancelControlID="_btnWorksheetPreparersClose" BackgroundCssClass="PBModalPopup" />
                <div id="_divWorksheetPreparersModal" runat="server" class="PBModalDiv PBModelMinMaxWidthHeight"
                    style="display: none;">
                    <div class="PBInnerModal">
                        <div id="WorksheetPreparersModalHeader" class="PBModalHeading">
                            <asp:ImageButton ID="_imgWorksheetPreparersClose" CssClass="PBModalHeadingImg" runat="server" />
                            <asp:Label ID="_lblWorksheetPreparersHeading" CssClass="PBHeaderText" Text="Worksheet Preparers"
                                runat="server" />
                        </div>
                        <div class="PBPadding5">
                            <ul class="PBUsersList">
                                <asp:Repeater ID="rPreparers" OnItemDataBound="UsersList_ItemDataBound" runat="server">
                                    <ItemTemplate>
                                        <li>
                                            <asp:ImageButton ID="btnEmail" CssClass="PBMarginRight" ImageUrl='<%# GetEmailIcon()%>'
                                                CommandArgument='<%# Eval("NameMasterID")%>' OnClick="PreparersEmail_Click" runat="server" />
                                            <span class="PBLabelText">
                                                <%# Eval("DisplayName")%></span> </li>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </ul>
                        </div>
                    </div>
                </div>

                <ajaxToolkit:ModalPopupExtender ID="WorksheetApproversPopup" runat="server" TargetControlID="WorksheetApproversLink"
                    PopupControlID="_divWorksheetApproversModal" PopupDragHandleControlID="WorksheetApproversModalHeader"
                    CancelControlID="_btnWorksheetApproversClose" BackgroundCssClass="PBModalPopup" />
                <div id="_divWorksheetApproversModal" runat="server" class="PBModalDiv PBModelMinMaxWidthHeight"
                    style="display: none;">
                    <div class="PBInnerModal">
                        <div id="WorksheetApproversModalHeader" class="PBModalHeading">
                            <asp:ImageButton ID="_imgWorksheetApproversClose" CssClass="PBModalHeadingImg" runat="server" />
                            <asp:Label ID="_lblWorksheetApproversHeading" CssClass="PBHeaderText" Text="Worksheet Approvers"
                                runat="server" />
                        </div>
                        <div class="PBPadding5">
                            <ul class="PBUsersList">
                                <asp:Repeater ID="rApprovers" OnItemDataBound="UsersList_ItemDataBound" runat="server">
                                    <ItemTemplate>
                                        <li>
                                            <asp:ImageButton ID="btnEmail" CssClass="PBMarginRight" ImageUrl='<%# GetEmailIcon()%>' CommandArgument='<%# Eval("NameMasterID")%>'
                                                OnClick="ApproversEmail_Click" runat="server" />
                                            <span class="PBLabelText">
                                                <%# Eval("DisplayName")%></span> </li>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </td>
    </tr>
</table>
<script language="javascript" type="text/javascript">
    var clientid;
    function fnSetFocus(txtClientId) {
        clientid = txtClientId;
        setTimeout("fnFocus()", 3000);

    }

    function fnFocus() {
        eval("document.getElementById('" + clientid + "').focus()");
    }
</script>
