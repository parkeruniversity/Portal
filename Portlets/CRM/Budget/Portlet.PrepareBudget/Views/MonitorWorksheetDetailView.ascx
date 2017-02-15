<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MonitorWorksheetDetailView.ascx.cs"
    Inherits="Portlet.PrepareBudget.MonitorWorksheetDetailView" EnableViewState="false" %>
<%@ Import Namespace="Portlet.PrepareBudget" %>
<%@ Import Namespace="Portlet.PrepareBudget.Extensions" %>
<%@ Import Namespace="EX.Data.Dtos.Budget" %>
<%@ Import Namespace="System.Data" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="Jenzabar.EX.Feedback" Namespace="Jenzabar.EX.Feedback" TagPrefix="fb" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register TagPrefix="fb" TagName="FeedbackView" Src="~/Portlets/CRM/Common/Jenzabar.EX.Feedback/Controls/FeedbackView.ascx" %>
<%@ Register TagPrefix="Budget" TagName="WorksheetHeaderControl" Src="~/Portlets/CRM/Budget/Portlet.PrepareBudget/Controls/WorksheetHeaderControl.ascx" %>
<cmn:ErrorDisplay id="errDisplay" Runat="server"></cmn:ErrorDisplay>
<table class="PBLayoutTable">
    <tr>
        <td class="PBBackToMain">
            <Budget:WorksheetHeaderControl id="WorksheetHeader" LinkToWorksheet="false" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <table id="PendingAdjustmentsArea" runat="server" class="PBPendingAdjustment PBMarginTop PBMarginBottom">
                <tr>
                    <td class="PBMarginPadding">                
                        <asp:Repeater ID="rPendingAdjustments" runat="server">
                            <HeaderTemplate><div class="PBFloatLeft PBMarginRight"><asp:Image ImageUrl='<%# DerivePendingAdjustmentIcon() %>' CssClass="PBMarginRight"
                                    runat="server" /><span>Pending adjustment requests in:</span></div>
                            </HeaderTemplate>
                            <ItemTemplate><div class="PBFloatLeft"><asp:LinkButton runat="server" Text='<%# Eval("LineItemDescr") %>' CommandArgument='<%# Eval("LineItemID") %>'
                                    CssClass="PBHeaderLink " OnClick="ViewLineItem_Click" /></div></ItemTemplate>
                            <SeparatorTemplate><div class="PBFloatLeft PBMarginRight">,</div></SeparatorTemplate>
                        </asp:Repeater>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblMessage" runat="server" Visible="False"></asp:Label><br />
            <asp:Label ID="lblError" CssClass="PortletError" runat="server" Visible="False"></asp:Label>            

            <div id="divContent" class="pSection" runat="server">                
                <asp:Table ID="WorksheetTable" CssClass="PBHoverGridView" runat="server">
                </asp:Table>

                <table>
                    <tr>
                        <td>
                            <img src="<%=GetOverSpendingIconPath()%>" alt="Over spending - Spent more than the allotted money to-date" class="PBMarginRight" /><span
                                class="PBInformativeGridText">Over spending</span><span class="PBInformativeText"> -
                                    Spent more than the allotted money to-date</span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <img src="<%=GetOverBudgetIconPath()%>" alt="Over budget - Spent more than the total budget"
                                class="PBMarginRight" /><span class="PBInformativeGridText">Over budget</span><span
                                    class="PBInformativeText"> - Spent more than the total budget</span>
                        </td>
                    </tr>
                </table>
            </div>

            <fb:FeedbackView runat="server" ID="feedbackView" />

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
