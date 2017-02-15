<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ApproveRequestView.ascx.cs" Inherits="Portlet.RequisitionsAndOrders.Views.ApproveRequestView" %>
<%@ Import Namespace="EX.Data" %>
<%@ Import Namespace="Portlet.RequisitionsAndOrders" %>
<%@ Register TagPrefix="jenzabar" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="Jenzabar.EX.Feedback" Namespace="Jenzabar.EX.Feedback" TagPrefix="fb" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register TagPrefix="fb" TagName="FeedbackView" Src="~/Portlets/CRM/Common/Jenzabar.EX.Feedback/Controls/FeedbackView.ascx" %>
<%@ Register TagPrefix="at" TagName="ApprovalTrack" Src="~/Portlets/CRM/Staff/Portlet.RequisitionsAndOrders/Controls/ApprovalTrackControl.ascx" %>
<%@ Register TagPrefix="ReqAndOrders" TagName="RequestedItemsControl" Src="~/Portlets/CRM/Staff/Portlet.RequisitionsAndOrders/Controls/RequestedItemsControl.ascx" %>
<%@ Register TagPrefix="ReqAndOrders" TagName="RequestSummaryControl" Src="~/Portlets/CRM/Staff/Portlet.RequisitionsAndOrders/Controls/RequestSummaryControl.ascx" %>

<script type="text/javascript" src="<%= this.ResolveUrl("../ROScript.js") %>"></script>
<table class="ROLayoutTable">
    <tr>
        <td class="ROBackToMain">
            <!-- Req Header -->
            <div class="ROFloatLeft">
                <asp:LinkButton ID="BackToMain" CssClass="ROFloatLeft ROMarginTop ROMarginLeft" Text="Cancel, go back"
                    OnClick="btnCancel_Click" runat="server" />
            </div>
            <div class="ROFloatRight">
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="lblReqName" Text="<%# Requisition.ReqTextNum %>" CssClass="ROMarginRight ROFloatLeft ROMarginTop"
                                runat="server" />
                            <asp:Label CssClass="ROMarginRight ROFloatLeft ROMarginTop" Text="<%# Requisition.StatusText %>"
                                ID="lblReqStatus" runat="server" />
                        </td>
                    </tr>
                </table>
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <ReqAndOrders:RequestedItemsControl id="RequestedItemsArea" CanAdd="false" CanEdit="true"
                CanDelete="false" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <ReqAndOrders:RequestSummaryControl id="RequestSummaryArea" HideApprovalTrack="true" IsSubmit="false" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <table id="RequestStatusArea" class="ROStretchWidth" runat="server">
                <tr>
                    <td>
                        <span class="ROHeaderText ROMarginLeft">Request status</span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="ROMarginLeftDouble ROSectionMarginBottom ROFloatLeft">
                            <asp:Repeater ID="rPendingApproversRepeater" OnItemDataBound="rPendingApproversRepeater_ItemDataBound"
                                runat="server">
                                <ItemTemplate>
                                    <div id="ApprovedByClause" class="ROFloatLeft" runat="server">
                                        <asp:Label ID="ApprovedByLabel" CssClass="ROFloatLeft ROMarginRight ROInformativeText"
                                            Text="Approved by" runat="server" />
                                    </div>
                                    <div id="PendingClause" class="ROFloatLeft" runat="server">
                                        <asp:Label ID="PendingLabel" CssClass="ROInformativeText ROFloatLeft ROMarginRight"
                                            Text="pending approval by" runat="server" />
                                    </div>
                                    <div id="AndClause" class="ROFloatLeft" runat="server">
                                        <span class="ROInformativeText ROFloatLeft ROMarginRight">and</span>
                                    </div>
                                    <div id="PendingAlternateApprover" class="ROFloatLeft" runat="server">
                                        <asp:ImageButton runat="server" ID="PAEmailIconAltApproverLink" ImageUrl='<%# GetEmailIcon()%>' CssClass="ROFloatLeft ROMarginRight"
                                            CommandArgument='<%# Eval("AltApproverIdNum")%>' OnClick="EmailIconApprover_Click" />
                                        <asp:LinkButton ID="PAEmailAltApproverLink" runat="server" Text='<%# Eval("AltApproverName") %>'
                                            CssClass="ROFloatLeft ROMarginRight" CommandArgument='<%# Eval("AltApproverIdNum")%>'
                                            OnClick="EmailApprover_Click" /><asp:Label ID="AltPendingYou" Text="you" CssClass="ROInformativeText ROFloatLeft"
                                                runat="server" /><span class="ROInformativeText ROFloatLeft ROSpace ROMarginRight">for</span>
                                    </div>
                                    <asp:ImageButton ID="PAEmailIconApproverLink" runat="server" ImageUrl='<%# GetEmailIcon()%>'
                                        CssClass="ROFloatLeft ROMarginRight" CommandArgument='<%# Eval("ApproverIdNum")%>'
                                        OnClick="EmailIconApprover_Click" />
                                    <asp:LinkButton ID="PAEmailApproverLink" runat="server" Text='<%# Eval("ApproverName") %>'
                                        CssClass="ROFloatLeft" CommandArgument='<%# Eval("ApproverIdNum")%>' OnClick="EmailApprover_Click" /><asp:Label
                                            ID="PendingYou" Text="you" CssClass="ROInformativeText ROFloatLeft" runat="server" />
                                        
                                    <div id="EndingPeriod" class="ROFloatLeft" runat="server">
                                        <span class="ROMarginRight ROInformativeText">.</span>
                                    </div>
                                </ItemTemplate>
                                <SeparatorTemplate>
                                    <div class="ROFloatLeft ROMarginRight ROInformativeText">,</div>
                                </SeparatorTemplate>
                            </asp:Repeater>
                        </div>
                        <div id="ReqStatusApprovalTrackArea" runat="server" class="ROFloatRight ROMarginRight">                        
                            <asp:LinkButton ID="ViewApprovalTrack" CssClass="ROInformativeLink ROFloatRight"
                                runat="server" OnClick="ViewApprovalTrack_Click" /><span class="ROFloatRight ROMarginRight ROInformativeText">Approval
                                    track</span>
                        </div>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <table class="ROMarginRight ROGreyButtonBox ROStretchWidth RONoMarginPadding">
                <tr class="RONoMarginPadding">
                    <td class="ROBlueButtonBox">
                        <asp:Button ID="btnApprove" Text="Approve" CssClass="ROFloatLeft ROMarginLeft ROVerticalAlignCenter"
                            OnClick="btnApprove_Click" ValidationGroup="vgRequest" runat="server" />
                    </td>
                    <td class="ROPadding5 ROStretchWidth">
                        <asp:Button ID="btnReturn" Text="Return" OnClick="btnReturn_Click" CssClass="ROMarginLeft ROVerticalAlignCenter"
                            runat="server" />
                            
                        <asp:LinkButton ID="lnkDeny" Text="Deny request" CssClass="ROInformativeLink ROFloatRight ROMarginRight ROMarginTop"
                            runat="server" OnClick="lnkDeny_Click" OnClientClick="javascript:return ConfirmDeny();" />
                        <asp:Image ID="imgDeny" runat="server" CssClass="ROFloatRight ROMarginTop" />
                    </td>
                </tr>
            </table>
        </td> 
    </tr>
</table>
<asp:Button ID="btnApprovalTrackPopup" runat="server" Style="display: none" />
<ajaxToolkit:ModalPopupExtender ID="ApprovalTrackPopup" runat="server" TargetControlID="btnApprovalTrackPopup"
    PopupControlID="approvalTrackModal" PopupDragHandleControlID="approvalTrackModalHeader"
    BackgroundCssClass="ROModalPopup" BehaviorID="ApprovalTrackPopupBehaviorID" />
<div id="approvalTrackModal" runat="server" class="ROModalDiv">
    <div class="ROInnerModal">
        <div id="approvalTrackModalHeader" class="ROModalHeading">
            <asp:Label ID="Label1" runat="server" CssClass="ROHeaderText" Text="Approval Track Details" />
            <asp:ImageButton ID="ImageButton1" runat="server" CssClass="ROModalHeadingImg" ImageUrl="<%# GetCloseIcon() %>"
                OnClientClick="$find('ApprovalTrackPopupBehaviorID').hide(); return false;" />
        </div>
        <div>
            <at:ApprovalTrack ID="approvalTrackControl" runat="server" ModalBehaviorID="ApprovalTrackPopupBehaviorID" />
        </div>
    </div>
</div>

<asp:Button ID="btnApprovalTrackWarningPopup" runat="server" Style="display: none" />
<ajaxtoolkit:modalpopupextender id="ApprovalTrackWarningPopup" behaviorid="ApprovalTrackWarningPopup"
    runat="server" targetcontrolid="btnApprovalTrackWarningPopup" popupcontrolid="_divApprovalTrackWarningModal"
    popupdraghandlecontrolid="approvalTrackWarningModalHeader"
    backgroundcssclass="ROModalPopup" />
<div id="_divApprovalTrackWarningModal" runat="server" class="ROModalDiv ROMessageWidthHeight"
    style="display: none;">
    <div class="ROInnerModal">
        <div id="ApprovalTrackWarningHeader" class="ROModalHeading">
            <asp:ImageButton ID="_imgApprovalTrackWarningClose" CssClass="ROModalHeadingImg" runat="server" />
            <asp:Label ID="_lblApprovalTrackWarningHeading" CssClass="ROHeaderText" Text="Warning"
                runat="server" />
        </div>
        <div class="ROMarginPadding">
            <span class="ROLabelText">This item cannot be approved because the updates impact the approval track.</span><br /> 
            <span class="ROLabelText">To adjust your updates so they no longer impact the approval track and continue the
                approval process, click the <b>Modify changes and approve</b> button.</span>
            <span class="ROLabelText">To save your updates and return this item to the requester for additional action without approving, click
                the <b>Return to requester</b> button.</span>
        </div>
        <div class="ROModalButtons ROCentered">
            <asp:Button ID="btnATWApprove" runat="server" Text="Modify changes and approve" UseSubmitBehavior="false" /><br /><br />
            <asp:Button ID="btnATWReturn" runat="server" Text="Return to requester" OnClick="btnReturn_Click" />
        </div>
    </div>
</div>

<script language="javascript" type="text/javascript">
function ConfirmDeny() { 
    return confirm("If a request is denied, it is permanently inactive and cannot be reactivated for further processing. To inactivate the request, click OK. To modify or return this item back to the requester for additional processing, click Cancel.");
}
</script>
