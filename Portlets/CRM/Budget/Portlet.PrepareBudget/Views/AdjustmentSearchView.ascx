<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdjustmentSearchView.ascx.cs"
    Inherits="Portlet.PrepareBudget.AdjustmentSearchView" EnableViewState="false" %>
<%@ Import Namespace="Portlet.PrepareBudget" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register TagPrefix="Budget" TagName="WorksheetHeaderControl" Src="~/Portlets/CRM/Budget/Portlet.PrepareBudget/Controls/WorksheetHeaderControl.ascx" %>
<div class="PrepareBudget">
<table class="PBLayoutTable">
    <tr>
        <td class="PBBackToMain">
            <!-- Worksheet Header -->
            <Budget:WorksheetHeaderControl id="WorksheetHeader" LinkToWorksheet="true" runat="server" />
            <!-- RequisitionsAndOrders Header -->
            <div id="RequisitionHeader" class="PBFloatLeft PBPadding5" runat="server">
                <asp:LinkButton ID="BackToRequisition" OnClick="BackToRequisition_Click" runat="server" />
            </div>
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
                            <span class="<%= DeriveStatusTextCSS() %> PBHeaderText PBBoldText PBFloatRight"><%=SelectedWorksheetLineItem.AvailableNow.ToString("C0")%></span>
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
        <td id="AccountsArea" class="PBPadding" runat="server">
            <span class="PBInformativeText">Associated accounts: </span>
            <asp:Label ID="lblAccountCode" runat="server" CssClass="PBInformativeText" />
        </td>
    </tr>
    <tr>
        <td class="PBPadding">
            <div class="PBFloatLeft">
                <span class="PBHeaderText">Requesting more money for</span><span class="PBHeaderText PBBoldText"><%=SelectedWorksheetLineItem.LineItemDescr%></span>
            </div>
            <div>
                <!-- Back-->
                <asp:LinkButton ID="BackToRequestForm" runat="server" Text="Back to your request form" OnClick="backToRequestFormLink_Click"
                    CssClass="PBFloatRight" />
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <div id="divRepeater" style="border-bottom: 1px dashed #6272A8;" />
        </td>
    </tr>    
    <tr>
        <td class="PBPadding">
            
                    <table>
                        <tr>
                            <td colspan="2">
                                <table class="PBSectionMarginBottom">
                                    <tr>
                                        <td rowspan="2">
                                            <img src="<%=GetTransferIconPath()%>" class="PBMarginRight" alt="Where can you find this money?" />
                                        </td>
                                        <td>
                                            <span class="PBHeaderText PBBoldText">Where</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <span class="PBLabelText">can you find this money?</span>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div id="SearchOrBrowseHeader" runat="server">
                                    <span class="PBLabelText">Search or browse for a line item that can spare money for
                                        this transfer to </span><span class="PBLabelText PBBoldText">
                                            <%=SelectedWorksheetLineItem.LineItemDescr%></span>
                                    <asp:LinkButton ID="StartOver" Visible="false" runat="server" Text="Start over" OnClick="startOverLink_Click" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table id="SearchBoxArea" runat="server" class="PBBlueBorder PBMarginRight">
                                    <tr>
                                        <td rowspan="8" class="PBBlueBar">
                                            &nbsp;
                                        </td>
                                        <td colspan="2">
                                            <span class="PBLabelText PBBoldText">Search</span><span class="PBLabelText"> for a line item by</span>
                                        </td>
                                    </tr>
                                    <tr><td colspan="2"><span class="PBInformativeText">Line item name</span></td></tr>
                                    <tr><td colspan="2"><asp:TextBox ID="txtSearchDescr" runat="server" /></td></tr>
                                    <tr>
                                        <td></td>
                                        <td class="PBStretchWidth">
                                            <span class="PBInformativeText">Line item code</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <span class="PBLabelText">and/or </span>
                                        </td>
                                        <td class="PBStretchWidth">
                                            <asp:TextBox ID="txtSearchCode" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>
                                            <span class="PBInformativeText">Minimum available budget</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <span class="PBLabelText">and/or $</span>
                                        </td>
                                        <td class="PBStretchWidth">
                                            <asp:TextBox ID="txtSearchBudget" runat="server" />                                    
                                        </td>
                                    </tr>
                                    <tr><td colspan="2"><asp:Button ID="btnSearchLineItems" Text="Search line items" OnClick="btnSearchLineItems_Click"
                                            runat="server" /></td></tr>
                                </table>
                            </td>
                            <td class="PBVerticalAlignTop">
                                <table id="ComponentWorksheetsArea" class="PBMarginLeft" runat="server">
                                    <tr><td><span class="PBLabelText">Or</span><span class="PBLabelText PBBoldText"> browse </span><span class="PBLabelText">your worksheets for a line item</span></td></tr>
                                    <tr>
                                        <td class="PBPadding">
                                            <table>
                                                <asp:Repeater ID="rComponentWorksheets" runat="server">
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td>
                                                                <asp:LinkButton ID="BrowseWorksheet" Text='<%# Eval("WorksheetName") %>' runat="server"
                                                                    CommandArgument='<%# Eval("WorksheetID") %>'
                                                                    OnClick="browseWorksheetLink_Click" />
                                                                <span class="PBInformativeText"> has </span><span class="PBLabelText PBBoldText"><%# Convert.ToDecimal(Eval("RemainingBudget")).ToString("C0") %></span>
                                                                <span class="PBInformativeText"> remaining budget</span>
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>                        
                    </table>
        </td>
    </tr>
    <tr>
        <td class="PBPadding">
            
                    <table id="SearchResultsArea" visible="false" runat="server">
                        <tr><td id="BrowseWorksheetNameArea" runat="server"><span class="PBLabelText PBFloatLeft">Your </span><asp:Table ID="BrowseWorksheetBreadcrumbTable" CssClass="PBFloatLeft PBNoMarginPadding" runat="server" /><span class="PBLabelText PBFloatLeft"> worksheet</span></td></tr>
                        <tr>
                            <td>
                                <span class="PBInformativeText">Check a box to transfer some money</span>
                            </td>
                        </tr>                        
                        <tr>
                            <td><div id="SearchResultsPlaceholder" runat="server" /></td>
                        </tr>
                    </table>
        </td>
    </tr>
    <tr>
        <td id="TotalTransferAmountArea" class="PBPadding" style="display: none;" runat="server">
            <asp:Label ID="TotalTransferAmount" CssClass="PBLabelText PBBoldText" runat="server" /><span
                class="PBLabelText"> in total transferred from </span>
            <asp:Label ID="NumTransferSources" CssClass="PBLabelText PBBoldText" runat="server" />
        </td>
    </tr>
    <tr>
        <td class="PBPadding">
            <table class="PBMarginRight PBGreyButtonBox PBStretchWidth">
                <tr>
                    <td class="PBBlueButtonBox">
                        <asp:Button ID="btnAddToRequest" runat="server" OnClick="btnAddToRequest_Click"
                            Text="Add to your request" />
                    </td>
                    <%--<td class="PBPadding5">
                        <span class="PBMarginLeft PBLabelText">Don't see what you are looking for?</span>
                        <br />
                        <span class="PBMarginLeft PBLabelText">You can </span><asp:LinkButton ID="lnkViewAllWorksheets" Text="view all of your worksheets again" OnClick="startOverLink_Click" runat="server" /><span class="PBLabelText"> or </span><asp:LinkButton ID="lnkSearchForLineItem" Text="search for a line item" OnClick="startOverLink_Click" runat="server" />            
                    </td>--%>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="PBPadding">
            <!-- Back-->
            <asp:LinkButton ID="CancelBackToRequestForm" runat="server" Text="Cancel and return to the request form"
                OnClick="backToRequestFormLink_Click" />
        </td>
    </tr>
</table>
</div>
<script language="javascript" type="text/javascript">

    function LoadAvailablePeriods(lineItemID, ddlAvailablePeriodsID, hidSelectedPeriodID)
    {
        var ddlAvailablePeriods = document.getElementById(ddlAvailablePeriodsID);

        if (ddlAvailablePeriods.options.length == 0) {
            $.ajax({
                type: "POST",
                data: '{ lineItemID: "' + lineItemID + '", currentWorksheetID:<%= CurrentWorksheet.ID %>, currentWorksheetNumPeriods:<%= CurrentWorksheet.GetNumPeriods() %>, currentWorksheetPeriodType:"<%= CurrentWorksheet.PeriodType %>", currentWorksheetForBudgetYear:"<%= CurrentWorksheet.ForBudgetYear %>", currentWorksheetFromDate:"<%=CurrentWorksheet.FromDate.ToString() %>", endYTDMonthOffset:<%= SelectedWorksheetLineItem.EndYTDMonthOffset %> }',
                dataType: "json",
                url: "<%=GetAvailablePeriodsUrl() %>",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    //add the new children
                    $.each(data.d, function () {
                        try {
                            ddlAvailablePeriods.add(new Option(this['Text'], this['Value']), null);  // standards compliant; doesn't work in IE
                        } catch (ex) {
                            ddlAvailablePeriods.add(new Option(this['Text'], this['Value']));    // IE only
                        }
                    });
                    ddlAvailablePeriods.selectedIndex = 0;

                    var hidSelectedPeriod = document.getElementById(hidSelectedPeriodID);
                    hidSelectedPeriod.value = ddlAvailablePeriods.options[ddlAvailablePeriods.selectedIndex].value;
                },
                error: function (jqX, status, err) { alert('Error: ' + err); }
            });
        }
    }

    function StoreSelectedPeriod(ddlAvailablePeriods, hidSelectedPeriodID) {
        var hidSelectedPeriod = document.getElementById(hidSelectedPeriodID);
        hidSelectedPeriod.value = ddlAvailablePeriods.options[ddlAvailablePeriods.selectedIndex].value;
    }

    function RemoveFromTotalTransferAmount(chkSelectSource, checkboxCellID, txtTransferAmountID, lblTotalTransferAmountID, TotalTransferAmountAreaID, NumTransferSourcesID, transferRowID) {
        var transferRow = document.getElementById(transferRowID);
        transferRow.style.display = (chkSelectSource.checked) ? 'block' : 'none';

        var checkboxCell = document.getElementById(checkboxCellID);

        if (chkSelectSource.checked) {
            checkboxCell.setAttribute("class", "PBBlueBar");
            checkboxCell.setAttribute("className", "PBBlueBar"); // for IE which does not recognize "class"              
        }
        else
        {
            checkboxCell.setAttribute("class", "");
            checkboxCell.setAttribute("className", ""); // for IE which does not recognize "class" 

            var txtTransferAmount = document.getElementById(txtTransferAmountID);
            txtTransferAmount.value = 0;
        }

        RefreshTotalTransferAmount(lblTotalTransferAmountID, TotalTransferAmountAreaID, NumTransferSourcesID);
    }

    function RefreshTotalTransferAmount(lblTotalTransferAmountID, TotalTransferAmountAreaID, NumTransferSourcesID) {
        var total = 0;
        var numSources = 0;
        for (var a = document.getElementsByTagName('input'), i = 0, n = a.length; i < n; i++) {
            if (a[i].id && (a[i].id.indexOf('txtTransferAmount') > -1) && (parseFloat(a[i].value) > 0)) {
                total += parseFloat(a[i].value);
                numSources++;
            }
        }

        if (total > 0) {
            var lblTotalTransferAmount = document.getElementById(lblTotalTransferAmountID);
            lblTotalTransferAmount.innerHTML = '$' + numberWithCommas(total); ;

            var numTransferSources = document.getElementById(NumTransferSourcesID);
            numTransferSources.innerHTML = numSources + ' source';
            if (numSources > 1) {
                numTransferSources.innerHTML += 's';
            }
        }

        var totalTransferAmountArea = document.getElementById(TotalTransferAmountAreaID);
        totalTransferAmountArea.style.display = (total == 0) ? 'none' : 'block';
    }

    function numberWithCommas(x)
    {
        return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }
</script>