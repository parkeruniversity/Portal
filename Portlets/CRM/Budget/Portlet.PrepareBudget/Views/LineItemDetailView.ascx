<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LineItemDetailView.ascx.cs"
    Inherits="Portlet.PrepareBudget.LineItemDetailView" EnableViewState="false" %>
<%@ Import Namespace="Portlet.PrepareBudget" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="Jenzabar.EX.Feedback" Namespace="Jenzabar.EX.Feedback" TagPrefix="fb" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register TagPrefix="fb" TagName="FeedbackView" Src="~/Portlets/CRM/Common/Jenzabar.EX.Feedback/Controls/FeedbackView.ascx" %>
<%@ Register TagPrefix="Budget" TagName="WorksheetHeaderControl" Src="~/Portlets/CRM/Budget/Portlet.PrepareBudget/Controls/WorksheetHeaderControl.ascx" %>
<cmn:ErrorDisplay id="errDisplay" Runat="server"></cmn:ErrorDisplay>
<table class="PBLayoutTable PBNoMarginPadding" cellpadding="0" cellspacing="0">
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
                            <!-- Left arrow-->
                            <asp:ImageButton ID="PrevLineItemImageButton" runat="server" OnClick="ViewLineItem_Click"
                                CssClass="PBMarginRight PBMarginTop PBMarginBottom" />
                    
                            <!--Line Item Status-->
                            <img class="PBMarginRight" src='<%= DeriveStatusIcon(SelectedWorksheetLineItem.RequestedBudget, SelectedWorksheetLineItem.Spending, SelectedWorksheetLineItem.AvailableNow) %>' 
                                alt="Status"/>
                        </div>
                        
                        <div class="PBFloatLeft">
                            <!-- Line Item Description-->
                            <span class="PBHeaderText"><%=SelectedWorksheetLineItem.LineItemDescr%></span><br />
                            <!-- Line Item Code -->
                            <span class="PBInformativeText"><%=SelectedWorksheetLineItem.LineItemCode%></span>
                        </div>
                    
                        <div class="PBFloatRight">
                            <!--Available Now-->
                            <asp:Label ID="lidAvailableNowText" runat="server" CssClass="PBInformativeText" /><br />
                            <span class="<%= DeriveStatusTextCSS() %> PBHeaderText PBBoldText PBFloatRight"><%=SelectedWorksheetLineItem.AvailableNow.ToString("C0")%></span>
                        </div>
                    </asp:TableCell>
                    <asp:TableCell ID="FutureBudgetCell" runat="server">
                        <asp:Label ID="lidFutureMoneyText" runat="server" Text="Future budget" CssClass="PBInformativeText PBFloatRight" /><br />
                        <span class="PBHeaderText PBFloatRight"><%=SelectedWorksheetLineItem.ComingLater.ToString("C0")%></span>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="lidSpendingText" runat="server" Text="Spending" CssClass="PBInformativeText PBFloatRight" /><br />
                        <asp:LinkButton ID="lidSpendingLink" OnClick="lidActualYTDLink_Click" CssClass="PBHeaderText PBHoverLink PBFloatRight"
                            runat="server"><%=SelectedWorksheetLineItem.Spending.ToString("C2")%></asp:LinkButton>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="lidBudgetText" runat="server" Text="Total budget" CssClass="PBInformativeText PBFloatRight" /><br />
                        <span class="PBHeaderText PBFloatRight"><%=SelectedWorksheetLineItem.RequestedBudget.ToString("C0")%></span>
                    </asp:TableCell>
                    <asp:TableCell>
                        <!-- Right arrow -->
                        <asp:ImageButton ID="NextLineItemImageButton" runat="server" OnClick="ViewLineItem_Click"
                            CssClass="PBFloatRight PBMarginLeft  PBMarginTop PBMarginBottom" />
                        <!-- Next Line Item-->
                        <asp:LinkButton ID="NextLineItemLink" runat="server" OnClick="ViewLineItem_Click"
                            CssClass="PBFloatRight" />
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </td>
    </tr>
    <tr>
        <td id="AccountsArea" class="PBPadding" runat="server">
            <span class="PBInformativeText">Associated accounts: </span><asp:Label ID="lblAccountCode" runat="server" CssClass="PBInformativeText" />
        </td>
    </tr>
    <tr>
        <td class="PBPadding">
            <asp:Table ID="PendingAdjustmentPlaceholder" runat="server" Visible="false" />
        </td>
    </tr>
    <tr>
        <td class="PBPadding">
            <table>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lblPeriodBreakdown" runat="server" CssClass="PBInformativeText" />
                    </td>
                </tr>
                <tr>
                    <td>                       
                        <asp:Table ID="LineItemAmountsTable" CssClass="PBOutlineGridView" runat="server">
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
                    <td class="PBVerticalAlignTop">
                        <table class="PBAdjustmentLinkBox" cellpadding="5">
                            <tr>
                                <td rowspan="2">
                                    <asp:Image ID="adjustmentIcon" CssClass="PBMarginRight PBFloatLeft" runat="server" />
                                </td>
                                <td>
                                    <asp:LinkButton ID="createAdjustment" OnClick="createAdjustment_Click" Text="Add to this budget" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:LinkButton ID="viewAdjustmentHistory" OnClick="viewAdjustmentHistory_Click" Text="View adjustment history"
                                        runat="server" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>

            <fb:FeedbackView runat="server" ID="feedbackView" />
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

    var el;
    function showHideBudgetStatuses(link1, link2, budgetStatusesOuterTable) {
        showHide(link1);

        el = document.getElementById(link2);
        showHide(el);


        var el = document.getElementById(budgetStatusesOuterTable);
        showHide(el);
    }

    function showHide(el) {
        el.style.display = (el.style.display == "block") ? "none" : "block";
    }
</script>
