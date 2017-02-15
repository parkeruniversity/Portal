<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ViewRequestView.ascx.cs" Inherits="Portlet.RequisitionsAndOrders.Views.ViewRequestView" %>
<%@ Import Namespace="EX.Data" %>
<%@ Import Namespace="Portlet.RequisitionsAndOrders" %>
<%@ Import Namespace="Portlet.RequisitionsAndOrders.Controls" %>
<%@ Register TagPrefix="jenzabar" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="Jenzabar.EX.Feedback" Namespace="Jenzabar.EX.Feedback" TagPrefix="fb" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register TagPrefix="fb" TagName="FeedbackView" Src="~/Portlets/CRM/Common/Jenzabar.EX.Feedback/Controls/FeedbackView.ascx" %>
<%@ Register TagPrefix="ReqAndOrders" TagName="RequestedItemsControl" Src="~/Portlets/CRM/Staff/Portlet.RequisitionsAndOrders/Controls/RequestedItemsControl.ascx" %>
<%@ Register TagPrefix="ReqAndOrders" TagName="ApprovalTrack" Src="~/Portlets/CRM/Staff/Portlet.RequisitionsAndOrders/Controls/ApprovalTrackControl.ascx" %>
<script type="text/javascript" src="<%= this.ResolveUrl("../ROScript.js") %>"></script>
<table class="ROLayoutTable">
    <tr>
        <td class="ROBackToMain" colspan="2">
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
            <ReqAndOrders:RequestedItemsControl id="RequestedItemsArea" CanAdd="false" CanEdit="false"
                CanDelete="false" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <table class="ROMarginLeft">
                <tr>
                    <td>
                        <span class="ROHeaderText">Request summary</span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table class="ROMarginLeft ROSectionMarginBottom">
                            <tr>
                                <td>
                                    <div class="ROInformativeText ROMarginRight">Request name</div>
                                </td>
                                <td>
                                    <div class="ROReadOnlyField"><%=Requisition.RequisitionText%>&nbsp;</div>
                                </td>
                                <td>
                                    <span class="ROInformativeText ROMarginLeft ROMarginRight">Purchasing Agent</span>
                                </td>
                                <td>
                                    <div class="ROReadOnlyField"><span><%=Requisition.PurchasingAgentDisplay%> &nbsp;</span></div>
                                </td>
                            </tr>
                        </table>
                        <table class="ROMarginLeft ROSectionMarginBottom">
                            <tr>
                                <td>
                                    <span class="ROInformativeText ROMarginRight">Request date</span>
                                </td>
                                <td>
                                    <div class="ROReadOnlyField"><%=Requisition.RequestDate.ToString("MM/dd/yyyy")%></div>
                                </td>
                                <td>
                                    <span class="ROInformativeText ROMarginLeft ROMarginRight">Need by date</span>
                                </td>
                                <td>
                                    <div class="ROReadOnlyField"><%=Requisition.NeedByDateFormatted%>&nbsp;</div>
                                </td>
                                <td>
                                    <span class="ROInformativeText ROMarginLeft ROMarginRight">Approval track</span>
                                </td>
                                <td>
                                    <div class="ROFloatLeft ROReadOnlyField"><%=Requisition.ApprovalTrackDesc%>&nbsp;</div>
                                    <asp:LinkButton ID="PreviewApprovalTrack" CssClass="ROFloatLeft ROMarginTop ROInformativeLink" Text="Preview"
                                        runat="server" OnClick="PreviewApprovalTrack_Click" />
                                </td>
                            </tr>
                        </table>
                        <table class="ROMarginLeft ROSectionMarginBottom">
                            <tr>
                                <td>
                                    <span class="ROInformativeText ROMarginRight">Vendor</span>
                                </td>
                                <td>
                                    <div class="ROReadOnlyField"><%=Requisition.VendorInfoDisplay%>&nbsp;</div>
                                </td>
                                <td>
                                    <span class="ROInformativeText ROMarginRight">Ship order here</span>
                                </td>
                                <td>
                                    <div class="ROReadOnlyField"><%=Requisition.ShipTo.FormattedShipToPointAddress%>&nbsp;</div>
                                </td>
                            </tr>
                        </table>
                        <table class="ROMarginLeft ROSectionMarginBottom">
                            <tr>
                                <td>
                                    <span class="ROInformativeText ROMarginRight">Requesting for</span>
                                </td>
                                <td>
                                    <div class="ROReadOnlyField"><%=Requisition.AltRequestorDisplay%>&nbsp;</div>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table class="ROMarginLeft ROSectionMarginBottom">
                            <tr>
                                <td>
                                    <fb:FeedbackView ID="feedbackView" runat="server" FeedbackGOID="<%# Requisition.GOID %>"
                                        GlobalObjectType="<%# EX.Data.Constants.StaffConstants.REQ_HEADER %>" IsModalFeedback="<%# false %>"
                                        AttachmentUseCde="<%# ROConstants.PO_PROCESS %>" AttachmentTypeCde="<%# ROConstants.RQ_SUPPORT %>" />
                                </td>
                            </tr>
                        </table>
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
            <asp:Label ID="Label3" runat="server" CssClass="ROHeaderText" Text="Approval Track Details" />
            <asp:ImageButton runat="server" CssClass="ROModalHeadingImg" ImageUrl="<%# GetCloseIcon() %>"
                OnClientClick="$find('ApprovalTrackPopupBehaviorID').hide(); return false;" />
        </div>
        <div>
            <ReqAndOrders:ApprovalTrack ID="approvalTrackControl" runat="server" ModalBehaviorID="ApprovalTrackPopupBehaviorID" />
        </div>
    </div>
</div>