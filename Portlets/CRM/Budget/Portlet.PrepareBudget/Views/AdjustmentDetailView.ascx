<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdjustmentDetailView.ascx.cs"
    Inherits="Portlet.PrepareBudget.AdjustmentDetailView" EnableViewState="false" %>
<%@ Import Namespace="Portlet.PrepareBudget" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="Jenzabar.EX.Feedback" Namespace="Jenzabar.EX.Feedback" TagPrefix="fb" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register TagPrefix="Budget" TagName="WorksheetHeaderControl" Src="~/Portlets/CRM/Budget/Portlet.PrepareBudget/Controls/WorksheetHeaderControl.ascx" %>
<table class="PBLayoutTable">
    <tr>
        <td class="PBBackToMain">
            <!-- Worksheet Header -->
            <Budget:WorksheetHeaderControl id="WorksheetHeader" LinkToWorksheet="true" runat="server" />
        </td>
    </tr>
    <tr class="PBNoMarginPadding">
        <td class="PBNoMarginPadding">
            <!-- Line Item Header -->
            <asp:Table ID="LineItemDetailTable" runat="server">
                <asp:TableRow CssClass="PBNoMarginPadding">
                    <asp:TableCell CssClass="PBNoMarginPadding">
                        <div class="PBFloatLeft">
                            <!--Line Item Status-->
                            <img class="PBMarginRight" src='<%= DeriveStatusIcon(SelectedWorksheetLineItem.RequestedBudget, SelectedWorksheetLineItem.Spending, SelectedWorksheetLineItem.AvailableNow) %>'
                                alt="Status" />
                        </div>
                        <div class="PBFloatLeft">
                            <!-- Line Item Description-->
                            <asp:LinkButton ID="OpenLineItem" runat="server" OnClick="openLineItemLink_Click"
                                CommandArgument="<%# SelectedLineItemID.ToString() %>" CssClass="PBHeader1Text PBHeaderLink"><%= SelectedWorksheetLineItem.LineItemDescr.ToString()%></asp:LinkButton><br />
                            <!-- Line Item Code -->
                            <span class="PBInformativeText">
                                <%=SelectedWorksheetLineItem.LineItemCode%></span>
                        </div>
                        <div class="PBFloatRight">
                            <!--Available Now-->
                            <asp:Label ID="lidAvailableNowText" runat="server" CssClass="PBInformativeText" />
                            <br />
                            <span class="<%= DeriveStatusTextCSS() %> PBHeaderText PBBoldText PBFloatRight">
                                <%=SelectedWorksheetLineItem.AvailableNow.ToString("C0")%></span>
                        </div>
                    </asp:TableCell>
                    <asp:TableCell ID="FutureBudgetCell" runat="server">
                        <asp:Label ID="lidFutureMoneyText" runat="server" Text="Future budget" CssClass="PBInformativeText PBFloatRight" /><br />
                        <span class="PBHeaderText PBFloatRight">
                            <%=SelectedWorksheetLineItem.ComingLater.ToString("C0")%></span>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="lidSpendingText" runat="server" Text="Spending" CssClass="PBInformativeText PBFloatRight" /><br />
                        <asp:LinkButton ID="lidSpendingLink" OnClick="lidActualYTDLink_Click" CssClass="PBHeaderText PBHoverLink PBFloatRight"
                            runat="server"><%=SelectedWorksheetLineItem.Spending.ToString("C2")%></asp:LinkButton>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="lidBudgetText" runat="server" Text="Total budget" CssClass="PBInformativeText PBFloatRight" /><br />
                        <span class="PBHeaderText PBFloatRight">
                            <%=SelectedWorksheetLineItem.RequestedBudget.ToString("C0")%></span>
                    </asp:TableCell>
                    <asp:TableCell>
                        <!-- Back-->
                        <asp:LinkButton ID="BackToLineItem" runat="server" Text="Back" OnClick="openLineItemLink_Click"
                            CommandArgument="<%# SelectedLineItemID.ToString() %>" CssClass="PBFloatRight" />
                    </asp:TableCell>
                    </asp:TableRow>
                    </asp:Table>
                    <asp:Button ID="btnShowDrillDownPopup" runat="server" Style="display: none" />
            <ajaxToolkit:ModalPopupExtender ID="DrillDownPopup" runat="server" TargetControlID="btnShowDrillDownPopup"
                PopupControlID="_divDrillDownModal" PopupDragHandleControlID="DrillDownModalHeader"
                CancelControlID="_btnDrillDownClose" BackgroundCssClass="PBModalPopup" />
            <div id="_divDrillDownModal" runat="server" class="PBModalDiv" style="display: none;">
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
        </td>
    </tr>
    <tr>
        <td class="PBPadding">
            <table>
                <tr>
                    <td id="AccountsArea" runat="server">
                        <span class="PBInformativeText">Associated accounts: </span><asp:Label ID="lblAccountCode" runat="server" CssClass="PBInformativeText" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <span class="PBItalicText PBHeaderText PBFloatLeft">Adjustment Request Detail</span><asp:LinkButton ID="BackToLineItemDetail" runat="server" Text="Back to the line item detail" OnClick="openLineItemLink_Click" CommandArgument="<%# SelectedLineItemID.ToString() %>" CssClass="PBFloatRight" />            
                    </td>
                </tr>
                <tr>
                    <td><span class="PBInformativeText">Requested by </span><span class="PBLabelText"><%=Adjustment.Submitter  %></span><span class="PBInformativeText">on <%=Adjustment.RequestDate.ToString("g") %></span></td></tr><tr>
                    <td>
                        <asp:UpdatePanel ID="upTransferTarget" ChildrenAsTriggers="false" UpdateMode="Conditional"
                            runat="server">
                            <ContentTemplate>
                                <table>
                                    <tr>
                                        <td class="PBVerticalAlignTop">
                                            <div id="TransferTargetTotalArea" class="PBBlueButtonBox PBCentered" runat="server"><asp:Label ID="lblTransferTargetTotal" CssClass="PBHeaderText PBAvailableText PBBoldText"
                                                    runat="server" /></div>
                                        </td>
                                        <td>
                                            <table>
                                                <asp:Repeater ID="rTransferTargets" runat="server">
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td>
                                                                <span class="PBLabelText PBBoldText PBAvailableText"><%# Convert.ToDecimal(Eval("TransferAmount")).ToString("C0")%></span><span class="PBLabelText"> to </span><span class="PBLabelText PBBoldText"><%# Eval("WorksheetLineItem.LineItemDescr")%></span><span class="PBLabelText">in </span><span class="PBLabelText PBBoldText"><%# Eval("PeriodText")%></span></td></tr></ItemTemplate></asp:Repeater></table><br /><asp:LinkButton ID="ViewBudgetStatuses" Text="View the resulting statuses" runat="server" />
                                            
                                            <ajaxToolkit:ModalPopupExtender ID="ViewBudgetStatusesPopup" runat="server" TargetControlID="ViewBudgetStatuses"
                                                PopupControlID="_divViewBudgetStatusesModal" PopupDragHandleControlID="ViewBudgetStatusesModalHeader"
                                                CancelControlID="_btnViewBudgetStatusesClose" BackgroundCssClass="PBModalPopup" />
                                            <div id="_divViewBudgetStatusesModal" runat="server" class="PBModalDiv" style="display: none;">
                                                <div class="PBInnerModal">
                                                    <div id="ViewBudgetStatusesModalHeader" class="PBModalHeading">
                                                        <asp:ImageButton ID="_imgViewBudgetStatusesClose" CssClass="PBModalHeadingImg" runat="server" />
                                                        <asp:Label ID="_lblViewBudgetStatusesHeading" CssClass="PBHeaderText" Text="Post-Transfer Budget Statuses"
                                                            runat="server" />
                                                    </div>
                                                    <asp:Table ID="LineItemViewBudgetStatusesPlaceholder" runat="server" />
                                                    <div class="PBModalButtons">
                                                        <asp:Button ID="_btnViewBudgetStatusesClose" Text="Close" runat="server" UseSubmitBehavior="false" />
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td id="AdjustedBudgetArea" runat="server">
                                            <span class="PBInformativeText">Resulting </span><asp:Label ID="TransferTargetLineItemDescr" CssClass="PBInformativeText PBBoldText" runat="server" /><span class="PBInformativeText"> budget status</span> <br /><asp:Table ID="AdjLineItemDetailTable" CssClass="PBOutlineGridView" runat="server">
                                                <asp:TableRow>
                                                    <asp:TableCell ID="adjAvailableNowCell" runat="server"> <asp:Label ID="adjAvailableNowText" runat="server" Text="Available now" CssClass="PBInformativeText PBFloatRight" /><br />
                                                        <asp:Label ID="adjAvailableNowAmount" runat="server" />
                                                    </asp:TableCell>
                                                    <asp:TableCell ID="adjFutureBudgetCell" runat="server">
                                                        <asp:Label ID="adjFutureMoneyText" runat="server" Text="Future budget" CssClass="PBInformativeText PBFloatRight" /><br />
                                                        <asp:Label ID="adjFutureMoneyAmount" runat="server" CssClass="PBHeaderText PBFloatRight" />
                                                    </asp:TableCell>
                                                    <asp:TableCell> <asp:Label ID="adjSpendingText" runat="server" Text="Spending" CssClass="PBInformativeText PBFloatRight" /><br />
                                                        <asp:LinkButton ID="adjSpendingLink" OnClick="lidActualYTDLink_Click" CssClass="PBHeaderText PBHoverLink PBFloatRight"
                                                            runat="server" />
                                                    </asp:TableCell>
                                                    <asp:TableCell> <asp:Label ID="adjBudgetText" runat="server" Text="Total budget" CssClass="PBInformativeText PBFloatRight" /><br />
                                                        <asp:Label ID="adjBudgetAmount" CssClass="PBHeaderText PBFloatRight" runat="server" />
                                                    </asp:TableCell>
                                                    <asp:TableCell> <asp:Image ID="adjStatus" runat="server" />
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                            </asp:Table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>
                                            <asp:CheckBox ID="atPermanent" Text="This need is permanent. Include this increase in next year's budget."
                                                AutoPostBack="true" Checked='<%# Adjustment.IsPermanent %>' runat="server" />
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="feedbackDisplayList">
                            <div class="feedbackDisplay">
                                <img class="feedbackImage" src="<%= GetSubmitterPictureURL() %>" alt="Justification" style="border-width: 0px;" /> <div class="feedbackWedge"></div>
                                <div class="feedbackWedgeOutline"></div>
                                <div class="feedbackEntry">
                                    <div class="content">
                                        <div class="wysiwygtext">
                                            <span><%= Adjustment.Justification%></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:UpdatePanel ID="upUnsourcedMoney" ChildrenAsTriggers="false" UpdateMode="Conditional"
                            runat="server">
                            <ContentTemplate>
                                <table id="UnsourcedMoneyArea" class="PBSectionMarginBottom PBDarkBlueBorder" runat="server">
                                    <tr>
                                        <td rowspan="2" class="PBDarkBlueBar">
                                            &nbsp; </td><td rowspan="2" class="PBVerticalAlignTop">
                                            <img src='<%= GetMoneyBagIcon() %>' alt="Unsourced Money" />
                                        </td>
                                        <td>
                                            <span class="PBLabelText">This request includes </span><span class="PBLabelText PBBoldText"><%= Adjustment.UnsourcedMoney.ToString("C0")%></span><span class="PBLabelText">in unsourced
                                                    money</span> </td></tr><tr>
                                        <td id="UnsourcedMoneyPlaceholder" runat="server">
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:UpdatePanel ID="upTransferSources" ChildrenAsTriggers="false" UpdateMode="Conditional"
                            runat="server">
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="_btnEditTransferSourcesClose" />
                                <asp:AsyncPostBackTrigger ControlID="_btnCancel" />
                            </Triggers>
                            <ContentTemplate>
                                <table class="PBSectionMarginBottom">
                                    <tr>
                                        <td>
                                            <img src='<%= GetTransferIconPath() %>' alt="Transfers" />
                                        </td>
                                        <td>
                                            <span class="PBLabelText PBBoldText">Transfers: <%= Adjustment.TransferSourcesTotalAmount.ToString("C0")%></span><br /><span class="PBInformativeText">Transfer sources and their budgets after this transfer </span><asp:LinkButton ID="addTransferSource" OnClick="addSource_Click" Text="Add a transfer source" runat="server" />
                                        </td>                                        
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>                                    
                                            <asp:Table ID="TransferSourcesPlaceholder" runat="server" />

                                            <asp:Button ID="btnShowEditTransferSourcesPopup" runat="server" Style="display: none" />
                                            <ajaxToolkit:ModalPopupExtender ID="EditTransferSourcesPopup" runat="server" TargetControlID="btnShowEditTransferSourcesPopup"
                                                PopupControlID="_divEditTransferSourcesModal" PopupDragHandleControlID="EditTransferSourcesModalHeader"
                                                CancelControlID="_btnEditTransferSourcesClose" BackgroundCssClass="PBModalPopup" />
                                            <div id="_divEditTransferSourcesModal" runat="server" class="PBModalDiv" style="display: none;">
                                                <div class="PBInnerModal">
                                                    <div id="EditTransferSourcesModalHeader" class="PBModalHeading">
                                                        <asp:ImageButton ID="_imgEditTransferSourcesClose" CssClass="PBModalHeadingImg" runat="server" />
                                                        <asp:Label ID="_lblEditTransferSourcesHeading" CssClass="PBHeaderText" Text="Transfer Source Detail"
                                                            runat="server" />
                                                    </div>
                                                    <asp:Table ID="LineItemEditTransferSourcesPlaceholder" runat="server" CssClass="PBMarginPadding">
                                                        <asp:TableRow>
                                                            <asp:TableCell ColumnSpan="4"> <asp:Label ID="lblEditTransferLIDesc" runat="server" CssClass="PBBoldText PBHeaderText" />
                                                                <span class="PBHeaderText">line item</span> </asp:TableCell></asp:TableRow><asp:TableRow>
                                                            <asp:TableCell ColumnSpan="4"> <asp:Label ID="lblEditTransferSourceLICode" runat="server" CssClass="PBInformativeText" /><br />
                                                            </asp:TableCell>
                                                        </asp:TableRow>
                                                        <asp:TableRow>
                                                            <asp:TableCell> <span class="PBLabelText">Transfer $</span> </asp:TableCell><asp:TableCell> <asp:TextBox ID="txtTransferAmount" runat="server" />
                                                            </asp:TableCell>
                                                            <asp:TableCell> <span class="PBLabelText">from </span></asp:TableCell><asp:TableCell> <div ID="EditAvailablePeriods" runat="server" /></asp:TableCell></asp:TableRow></asp:Table><div class="PBModalButtons">
                                                        <asp:Button ID="_btnEditTransferSourcesClose" Text="Update" runat="server" UseSubmitBehavior="false" />
                                                        <asp:Button ID="_btnCancel" Text="Cancel" runat="server" UseSubmitBehavior="false" />
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table class="PBStretchWidth PBMarginRight">
                            <tr>
                                <td class="PBBlueButtonBox" id="ResubmitRequestArea" runat="server">
                                    <asp:Button ID="btnResubmitRequest" OnClick="btnResubmitRequest_Click" Text="Resubmit my request" runat="server" />
                                </td>
                                <td class="PBApproveArea PBBlueBorder" id="ApproveArea" runat="server">
                                    <img src='<%= GetApproveIconPath() %>' class="PBMarginLeft PBFLoatLeft" alt="Approve" /><asp:Button Text="Approve this request" OnClick="approveAdjustmentLink_Click" CssClass="PBMarginRight PBMarginTop PBFloatRight" runat="server" />
                                </td>
                                <td class="PBDenyArea PBBlueBorder" id="DenyArea" runat="server">
                                    <img src='<%= GetDenyIconPath() %>' class="PBMarginLeft PBFLoatLeft" alt="Deny" /><asp:Button Text="Deny this request" OnClick="denyAdjustmentLink_Click" CssClass="PBMarginRight PBMarginTop PBFloatRight" runat="server" />
                                </td>
                                <td class="PBDenyArea PBBlueBorder" id="CancelRequestArea" runat="server">
                                    <img src='<%= GetCancelIconPath() %>' class="PBMarginLeft" alt="Cancel this request" /><asp:Button Text="Cancel this request" OnClick="deleteAdjustmentLink_Click" CssClass="PBMarginRight PBMarginTop"
                                        runat="server" />
                                </td>
                                <td class="PBGreyBox" id="NoDecisionArea" runat="server">
                                    <div class="PBFloatLeft">
                                        <asp:LinkButton ID="lnkNoDecision" CssClass="PBMarginLeft PBMarginRight" OnClick="openLineItemLink_Click"
                                            runat="server" />
                                    </div>
                                    <div class="PBFloatLeft">
                                        <asp:Label ID="ValidationMessage" Visible="false" CssClass="PBErrorText" runat="server" />
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>