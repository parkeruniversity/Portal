<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdjustmentHistoryView.ascx.cs"
    Inherits="Portlet.PrepareBudget.AdjustmentHistoryView" EnableViewState="false" %>
<%@ Import Namespace="Portlet.PrepareBudget" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
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
                        <span class="PBInformativeText">Associated accounts: </span>
                        <asp:Label ID="lblAccountCode" runat="server" CssClass="PBInformativeText" />
                    </td>
                </tr>               
                <tr><td><asp:Table ID="AdjustmentsPlaceholder" runat="server" /></td></tr>
                <tr>
                    <td>
                        <asp:LinkButton ID="BackToLineItemDetailBottom" runat="server" Text="Back to the line item detail"
                            OnClick="openLineItemLink_Click" CommandArgument="<%# SelectedLineItemID.ToString() %>"
                            CssClass="PBFloatRight" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
