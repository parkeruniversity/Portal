<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DrillDownView.ascx.cs" Inherits="Portlet.PrepareBudget.DrillDownView" EnableViewState="false"%>
<%@ Import Namespace="Portlet.PrepareBudget" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register TagPrefix="cmn" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>

<asp:UpdatePanel ID="upDrillDown" ChildrenAsTriggers="false" UpdateMode="Conditional"
    runat="server">
    <ContentTemplate>
        <table class="PBMarginPadding">
            <tr>
                <td>
                    <span class="PBHeaderText">Historical actuals for</span>
                    <asp:Label ID="lblDrillDownPoolCodeDesc" runat="server" CssClass="PBBoldText PBHeaderText" />
                </td>
            </tr>
            <tr>
                <td>
                    <span class="PBLabelText">for</span>
                    <asp:Label ID="lblDrillDownForBudgetYear" runat="server" CssClass="PBLabelText PBBoldText" />
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td>
                    <table>
                        <tr>
                            <td>
                                <span class="PBMarginRight PBInformativeText">Actual</span>
                            </td>
                            <td>
                                <span id="TotalBudgetHeader" class="PBMarginLeft PBInformativeText" runat="server">Budget</span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblDrillDownActualTotal" runat="server" CssClass="PBMarginRight PBBoldText PBHeaderText" />
                            </td>
                            <td>
                                <asp:Label ID="lblDrillDownBudgetTotal" runat="server" CssClass="PBMarginLeft PBBoldText PBHeaderText" />
                            </td>
                        </tr>
                    </table>
                    <br />
                </td>
            </tr>
            <tr>
                <td>
                    <div class="PBFixedTableWidth">
                        <asp:Table ID="TransactionsTableHeader" CssClass="PBGridView PBFixedTableWidth" runat="server">
                            <asp:TableHeaderRow>
                                <asp:TableHeaderCell CssClass="PBColumnWidth1">
                                    <asp:Label Text="Date" CssClass="PBLabelText  PBFloatLeft" runat="server" />
                                </asp:TableHeaderCell>
                                <asp:TableHeaderCell CssClass="PBColumnWidth2">
                                    <asp:Label Text="Item" CssClass="PBLabelText PBFloatLeft" runat="server" />
                                </asp:TableHeaderCell>
                                <asp:TableHeaderCell CssClass="PBColumnWidth3">
                                    <asp:Label Text="Account" CssClass="PBLabelText PBFloatLeft" runat="server" />
                                </asp:TableHeaderCell>
                                <asp:TableHeaderCell ID="TransactionVendorHeader" CssClass="PBColumnWidth4">
                                    <asp:Label Text="Vendor" CssClass="PBLabelText PBFloatLeft" runat="server" />
                                </asp:TableHeaderCell>
                                <asp:TableHeaderCell ID="TransactionProjectHeader" CssClass="PBColumnWidth5">
                                    <asp:Label Text="Project" CssClass="PBLabelText PBFloatLeft" runat="server" />
                                </asp:TableHeaderCell>
                                <asp:TableHeaderCell CssClass="PBColumnWidth6">
                                    <asp:Label Text="Amount" CssClass="PBLabelText PBFloatLeft" runat="server" />
                                </asp:TableHeaderCell>
                            </asp:TableHeaderRow>
                        </asp:Table>
                    </div>
                    <div class="PBTransactions">
                        <asp:Table ID="TransactionsTable" CssClass="PBGridView PBFixedTableWidth" runat="server">
                        </asp:Table>
                    </div>
                    <div class="PBFixedTableWidth">
                        <asp:Table ID="TransactionsTableFooter" CssClass="PBGridView PBFixedTableWidth" runat="server">
                            <asp:TableFooterRow>
                                <asp:TableCell CssClass="PBColumnWidthSpan5">
                                    <asp:Label Text="Total:" CssClass="PBLabelText PBFloatRight" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell CssClass="PBColumnWidth6">
                                    <asp:Label ID="lblDrillDownTransactionsTotal" CssClass="PBLabelText PBFloatRight"
                                        runat="server" />
                                </asp:TableCell>
                            </asp:TableFooterRow>
                        </asp:Table>
                    </div>
                </td>
            </tr>
        </table>
    </ContentTemplate>
</asp:UpdatePanel>