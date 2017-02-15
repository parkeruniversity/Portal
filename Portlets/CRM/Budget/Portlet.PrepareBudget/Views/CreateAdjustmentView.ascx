<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CreateAdjustmentView.ascx.cs"
    Inherits="Portlet.PrepareBudget.CreateAdjustmentView" EnableViewState="false" %>
<%@ Import Namespace="Portlet.PrepareBudget" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="Jenzabar.EX.Feedback" Namespace="Jenzabar.EX.Feedback" TagPrefix="fb" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register TagPrefix="Budget" TagName="WorksheetHeaderControl" Src="~/Portlets/CRM/Budget/Portlet.PrepareBudget/Controls/WorksheetHeaderControl.ascx" %>
<script type="text/javascript" >

    var postWhenFinished = false;
    var adjustmentElement;

    function AdjustmentRequest(btn) {
        adjustmentElement = btn;
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        if (prm.get_isInAsyncPostBack()) {
            postWhenFinished = true;
            return false;
        }        

        return true;
    }

    function pageLoad() {
        PageRequestManagerEx.init();
    }

    var PageRequestManagerEx =
    {
        _initialized: false,

        init: function () {
            if (!PageRequestManagerEx._initialized) {
                var _prm = Sys.WebForms.PageRequestManager.getInstance();
                var _callQueue = new Array();
                var _executingElement = null;

                _prm = Sys.WebForms.PageRequestManager.getInstance();

                _prm.add_initializeRequest(initializeRequest);
                _prm.add_endRequest(endRequest);

                PageRequestManagerEx._initialized = true;
            }

            function initializeRequest(sender, args) {
                if (_prm.get_isInAsyncPostBack()) {
                    //if we are here that means there already a call pending.

                    //Get the element which cause the postback
                    var postBackElement = args.get_postBackElement();

                    //We need to check this otherwise it will abort the request which we made from the
                    //end request
                    if (_executingElement != postBackElement) {
                        // Grab the event argument value
                        var evArg = $get("__EVENTARGUMENT").value;

                        //Does not match which means it is another control
                        //which request the update, so cancel it temporary and 
                        //add it in the call queue
                        args.set_cancel(true);
                        Array.enqueue(_callQueue, new Array(postBackElement, evArg));
                    }

                    //Reset it as we are done with our matching
                    _executingElement = null;
                }
            }

            function endRequest(sender, args) {
                //Check if we have a pending call
                if (_callQueue.length > 0) {
                    //Get the first item from the call queue and setting it
                    //as current executing item
                    _executingElement = Array.dequeue(_callQueue);

                    var _element = _executingElement[0];
                    var _eventArg = _executingElement[1];

                    //Now Post the from which will also fire the initializeRequest
                    _prm._doPostBack(_element.id, _eventArg);
                }

                else if (postWhenFinished) {
                    if (adjustmentElement) {
                        adjustmentElement.click();
                    }
                }
            }
        }
    }

    if (typeof (Sys) !== "undefined") Sys.Application.notifyScriptLoaded();
</script>
<div class="PrepareBudget">
    <table class="PBLayoutTable">
    <tr>
        <td class="PBBackToMain">
            <!-- Worksheet Header -->
            <Budget:WorksheetHeaderControl id="WorksheetHeader" LinkToWorksheet="true" runat="server" />
            <!-- RequisitionsAndOrders Header -->
            <div id="RequisitionHeader" class="PBFloatLeft PBPadding5" runat="server">
                <asp:LinkButton ID="BackToRequisition" OnClick="btnCancel_Click" runat="server" />
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
                            <img class="PBMarginRight" src='<%= DeriveStatusIcon(SelectedWorksheetLineItem.RequestedBudget, SelectedWorksheetLineItem.Spending, SelectedWorksheetLineItem.AvailableNow) %>' alt="Status" />
                        </div>
                        <div class="PBFloatLeft">
                            <!-- Line Item Description-->
                            <asp:LinkButton ID="OpenLineItem" runat="server"
                                OnClick="openLineItemLink_Click" CommandArgument="<%# SelectedLineItemID.ToString() %>"
                                CssClass="PBHeader1Text PBHeaderLink"><%= SelectedWorksheetLineItem.LineItemDescr.ToString()%></asp:LinkButton><br />
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
        <td id="AccountsArea" class="PBPadding" runat="server">
            <span class="PBInformativeText">Associated accounts: </span>
            <asp:Label ID="lblAccountCode" runat="server" CssClass="PBInformativeText" />
        </td>
    </tr>

    <tr>
        <td class="PBPadding">
            <!-- Line Item Header -->            
            <div class="PBFloatLeft">
                <!-- Line Item -->
                <asp:Label ID="CreateAdjustmentHeader" CssClass="PBHeaderText" runat="server"/><span class="PBHeaderText PBBoldText"><%=SelectedWorksheetLineItem.LineItemDescr%></span>                
            </div>
        </td>
    </tr>
    <tr>
        <td class="PBPadding PBSectionMarginBottom">
            <table>
                <tr>
                    <td>
                        <table class="PBSectionMarginBottom">
                            <tr>
                                <td rowspan="2">
                                    <img src="<%=GetMoneyIconPath()%>" class="PBMarginRight" alt="How much money do you need?" />
                                </td>
                                <td><span class="PBHeaderText PBBoldText">How much</span></td>
                            </tr>
                            <tr>
                                <td><span class="PBLabelText">money do you need?</span></td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <asp:UpdatePanel ID="upHowMuch" ChildrenAsTriggers="false" UpdateMode="Conditional"
                            runat="server">
                            <ContentTemplate>
                                <span class="PBHeaderText PBBoldText">$</span><asp:TextBox ID="txtHowMuch" AutoPostBack="true"
                                    OnTextChanged="txtHowMuch_TextChanged" runat="server" /><asp:Label ID="lblHowMuchHelpText" Visible="false" CssClass="PBInformativeText PBItalicText" Text="If you don't know exactly, just start suggesting transfers below" runat="server" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td>
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
                    <td>
                        <table id="AddAnotherSourceArea" runat="server" class="PBMarginLeft PBNoMarginPadding">
                            <tr>
                               <td>
                                   <asp:UpdatePanel ID="upTransferSources" ChildrenAsTriggers="false" UpdateMode="Conditional"
                                       runat="server">
                                       <Triggers>
                                           <asp:AsyncPostBackTrigger ControlID="_btnEditTransferSourcesClose" />
                                           <asp:AsyncPostBackTrigger ControlID="_btnCancel" />
                                       </Triggers>
                                       <ContentTemplate>
                                           <table>
                                               <asp:Repeater ID="rTransferSources" OnItemDataBound="rTransferSources_ItemDataBound"
                                                   runat="server">
                                                   <ItemTemplate>
                                                       <tr>
                                                           <td>
                                                               <span class="PBLabelText PBBoldText"><%# Convert.ToDecimal(Eval("TransferAmount")).ToString("C0")%></span><span class="PBInformativeText"> from </span><span class="PBLabelText"><%# Eval("WorksheetLineItem.LineItemDescr")%> (<%# Eval("PeriodText")%>)</span><span class="PBInformativeText">Account # <%# Eval("WorksheetLineItem.LineItemCode")%></span><asp:Label
                                                                       ID="TSValidationMessage" Text="*" CssClass="PBErrorText PBMarginLeft PBMarginRight"
                                                                       runat="server" />
                                                               <asp:ImageButton ID="EditSource" runat="server" CommandArgument='<%# Eval("UniqueID") %>'
                                                                   OnClick="editTransferSource_Click" ImageUrl='<%# GetEditIconPath() %>' />
                                                               <asp:ImageButton ID="DeleteSource" runat="server" CommandArgument='<%# Eval("UniqueID") %>'
                                                                   OnClick="deleteTransferSource_Click" ImageUrl='<%# GetDeleteIconPath() %>' />
                                                           </td>
                                                       </tr>
                                                   </ItemTemplate>
                                               </asp:Repeater>
                                           </table>

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
                                                           <asp:TableCell ColumnSpan="4">
                                                               <asp:Label ID="lblEditTransferLIDesc" runat="server" CssClass="PBBoldText PBHeaderText" />
                                                               <span class="PBHeaderText">line item</span>
                                                           </asp:TableCell>
                                                       </asp:TableRow>
                                                       <asp:TableRow>
                                                           <asp:TableCell ColumnSpan="4">
                                                               <asp:Label ID="lblEditTransferSourceLICode" runat="server" CssClass="PBInformativeText" /><br />
                                                           </asp:TableCell>
                                                       </asp:TableRow>
                                                       <asp:TableRow>
                                                           <asp:TableCell>
                                                                        <span class="PBLabelText">Transfer $</span>
                                                           </asp:TableCell>
                                                           <asp:TableCell>
                                                               <asp:TextBox ID="txtTransferAmount" runat="server" />
                                                           </asp:TableCell>
                                                           <asp:TableCell>
                                                                        <span class="PBLabelText"> from </span>
                                                           </asp:TableCell>
                                                           <asp:TableCell>
                                                               <div id="EditAvailablePeriods" runat="server" />
                                                           </asp:TableCell>
                                                       </asp:TableRow>
                                                   </asp:Table>
                                                   <div class="PBModalButtons">
                                                       <asp:Button ID="_btnEditTransferSourcesClose" Text="Update" runat="server" UseSubmitBehavior="false" />
                                                       <asp:Button ID="_btnCancel" Text="Cancel" runat="server" UseSubmitBehavior="false" />
                                                   </div>
                                               </div>
                                           </div>
                                       </ContentTemplate>
                                   </asp:UpdatePanel>
                               </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:UpdatePanel ID="upUnsourcedMoney" ChildrenAsTriggers="false" UpdateMode="Conditional"
                                        runat="server">
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="txtHowMuch" EventName="TextChanged" />
                                        </Triggers>
                                        <ContentTemplate>
                                            <div id="UnsourcedMoneyArea" runat="server" visible="false">
                                                <span class="PBInformativeText">which leaves</span>
                                                <br />
                                                <asp:Label ID="UnsourcedMoney" runat="server" CssClass="PBLabelText PBBoldText" /><span class="PBInformativeText"> to be added or transferred by an approver</span>
                                            </div>
                                         </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:LinkButton ID="addSource" OnClick="addSource_Click" Text="Suggest another transfer"
                                        runat="server" />
                                </td>
                            </tr>
                        </table>
                        <table id="AddFirstSourceArea" runat="server">
                            <tr>
                                <td>         
                                    <asp:LinkButton ID="addFirstSource" OnClientClick="return AdjustmentRequest(this)" OnClick="addSource_Click" runat="server" /><asp:Label ID="lblAddFirstSource" CssClass="PBLabelText" runat="server" />       
                                </td>
                            </tr>
                            <tr><td><asp:Label ID="lblTransferRequestHelpText" Visible="false" CssClass="PBInformativeText PBItalicText" Text="If you can't find the money, the approver may be able to find a source (or just increase this budget), but that makes approval less likely than if you can cover the full increase with transfers from other line items." runat="server"/></td></tr>
                        </table>                 
                    </td>
                </tr>
                <tr>
                    <td>
                        <table class="PBSectionMarginBottom">
                            <tr>
                                <td rowspan="2">
                                    <img src="<%=GetCalendarIconPath()%>" class="PBMarginRight" alt="When do you need this money?" />
                                </td>
                                <td>
                                    <span class="PBHeaderText PBBoldText">When</span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span class="PBLabelText">do you need this money?</span>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <div class="PBMarginBottom">
                            <table>
                                <tr>
                                    <td>
                                        <div id="AvailablePeriodsPlaceholder" class="PBMarginBottom" runat="server" />
                                    </td>
                                    <td>
                                        <asp:UpdatePanel ID="upTargetPeriodValidationMessage" ChildrenAsTriggers="false"
                                            UpdateMode="Conditional" runat="server">
                                            <ContentTemplate>
                                                <asp:Label ID="lblTargetPeriodValidationMessage" Text=" Cannot add money to a period that money is also being transferred from."
                                                    Visible="false" CssClass="PBErrorText" runat="server" />
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:UpdatePanel ID="upAdjustmentType" ChildrenAsTriggers="false" UpdateMode="Conditional"
                                            runat="server">
                                            <ContentTemplate>
                                                <asp:CheckBox ID="atPermanent" Text="This need is permanent. Include this increase in next year's budget."
                                                    AutoPostBack="true" OnCheckedChanged="atPermanent_CheckedChanged" runat="server" />
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table class="PBSectionMarginBottom">
                            <tr>
                                <td rowspan="2">
                                    <img src="<%=GetQuestionIconPath()%>" class="PBMarginRight" alt="Why do you need this money?" />
                                </td>
                                <td>
                                    <span class="PBHeaderText PBBoldText">Why</span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span class="PBLabelText">do you need this money?</span>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                         <asp:UpdatePanel ID="upJustification" ChildrenAsTriggers="false" UpdateMode="Conditional"
                            runat="server">
                            <ContentTemplate>
                                <table width="100%">
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtJustification" runat="server" Width="100%" MaxLength="511" OnTextChanged="txtJustification_TextChanged"
                                                AutoPostBack="true" />
                                        </td>
                                        <td>
                                            <asp:Label ID="JustificationValidationMessage" Visible="false" Text="  * Required"
                                                CssClass="PBErrorText" runat="server" />
                                        </td>
                                    </tr>
                                </table>
                                
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="PBPadding">
            <table>               
                <tr>
                    <td>
                        <asp:UpdatePanel ID="upAdjustedBudget" ChildrenAsTriggers="false" UpdateMode="Conditional"
                            runat="server">
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="txtHowMuch" EventName="TextChanged" />
                            </Triggers>
                            <ContentTemplate>
                                <table class="PBBlueBorder">
                                    <tr>
                                        <td rowspan="5" class="PBBlueBar"> &nbsp;</td>
                                        <td>
                                            <span class="PBHeaderText PBBoldText">Review your request</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <span class="PBInformativeText">This request is for a</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="PBMarginBottom">
                                                <span class="PBLabelText PBBoldText"><%=Adjustment.Amount.ToString("C2")%></span><span class="PBLabelText">increase to the </span><span class="PBLabelText PBBoldText"><%=Adjustment.TargetLineItemAmount.PeriodText%></span><span class="PBLabelText"> allotment for </span><span class="PBHeaderText PBBoldText"><%=SelectedWorksheetLineItem.LineItemDescr%></span>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <span class="PBInformativeText">This would result in an adjusted </span><span class="PBInformativeText PBBoldText"><%=SelectedWorksheetLineItem.LineItemDescr%></span><span class="PBInformativeText">budget of</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>                                    
                                            <asp:Table ID="AdjLineItemDetailTable" CssClass="PBOutlineGridView" runat="server">
                                                <asp:TableRow>
                                                    <asp:TableCell ID="adjAvailableNowCell" runat="server">
                                                        <asp:Label ID="adjAvailableNowText" runat="server" Text="Available now" CssClass="PBInformativeText PBFloatRight" /><br />
                                                        <asp:Label ID="adjAvailableNowAmount" runat="server" />
                                                    </asp:TableCell>
                                                    <asp:TableCell ID="adjFutureBudgetCell" runat="server">
                                                        <asp:Label ID="adjFutureMoneyText" runat="server" Text="Future budget" CssClass="PBInformativeText PBFloatRight" /><br />
                                                        <asp:Label ID="adjFutureMoneyAmount" runat="server" CssClass="PBHeaderText PBFloatRight" />
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:Label ID="adjSpendingText" runat="server" Text="Spending" CssClass="PBInformativeText PBFloatRight" /><br />
                                                        <asp:LinkButton ID="adjSpendingLink" OnClick="lidActualYTDLink_Click" CssClass="PBHeaderText PBHoverLink PBFloatRight"
                                                            runat="server" />
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:Label ID="adjBudgetText" runat="server" Text="Budget" CssClass="PBInformativeText PBFloatRight" /><br />
                                                        <asp:Label ID="adjBudgetAmount" CssClass="PBHeaderText PBFloatRight" runat="server" />
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:Image ID="adjStatus" runat="server" />
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                            </asp:Table>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="PBPadding">
            <asp:UpdatePanel ID="upFooter" ChildrenAsTriggers="false" UpdateMode="Conditional"
                runat="server">
                <Triggers>
                    <asp:PostBackTrigger ControlID="btnMakeRequest" />
                    <asp:PostBackTrigger ControlID="btnCancel" />
                </Triggers>
                <ContentTemplate>
                    <table class="PBMarginRight PBGreyButtonBox PBStretchWidth">
                        <tr>
                            <td class="PBBlueButtonBox">
                                <asp:Button ID="btnMakeRequest" OnClientClick="return AdjustmentRequest(this)" OnClick="btnMakeRequest_Click" runat="server" />
                            </td>
                            <td class="PBPadding5">
                                <asp:Button ID="btnCancel" Text="Cancel" OnClientClick="return AdjustmentRequest(this)"
                                    OnClick="btnCancel_Click" 
                                    CssClass="PBMarginLeft" runat="server" /><asp:Label
                                    ID="ValidationMessage" Visible="false" CssClass="PBErrorText" runat="server" />
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>            
        </td>
    </tr>
</table>
</div>