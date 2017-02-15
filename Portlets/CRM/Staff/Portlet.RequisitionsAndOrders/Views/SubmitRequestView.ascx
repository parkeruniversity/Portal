<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SubmitRequestView.ascx.cs"
    Inherits="Portlet.RequisitionsAndOrders.Views.SubmitRequestView" %>
<%@ Import Namespace="EX.Data" %>
<%@ Import Namespace="Portlet.RequisitionsAndOrders" %>
<%@ Register TagPrefix="jenzabar" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="Jenzabar.EX.Feedback" Namespace="Jenzabar.EX.Feedback" TagPrefix="fb" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register TagPrefix="fb" TagName="FeedbackView" Src="~/Portlets/CRM/Common/Jenzabar.EX.Feedback/Controls/FeedbackView.ascx" %>
<%@ Register TagPrefix="ReqAndOrders" TagName="RequestedItemsControl" Src="~/Portlets/CRM/Staff/Portlet.RequisitionsAndOrders/Controls/RequestedItemsControl.ascx" %>
<%@ Register TagPrefix="ReqAndOrders" TagName="RequestSummaryControl" Src="~/Portlets/CRM/Staff/Portlet.RequisitionsAndOrders/Controls/RequestSummaryControl.ascx" %>
<%@ Register TagPrefix="ars" TagName="AgentRequesterSearch" Src="~/Portlets/CRM/Staff/Portlet.RequisitionsAndOrders/Controls/AgentRequesterSearchControl.ascx" %>
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
            <ReqAndOrders:RequestedItemsControl id="RequestedItemsArea" CanAdd="true" CanEdit="true"
                CanDelete="true" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <ReqAndOrders:RequestSummaryControl id="RequestSummaryArea" IsSubmit="true" HideApprovalTrack="false"
                runat="server" />
        </td>
    </tr>   
    <tr>
        <td colspan="2">
            <table class="ROMarginRight ROGreyButtonBox ROStretchWidth RONoMarginPadding">
                <tr class="RONoMarginPadding">
                    <td class="ROBlueButtonBox">
                        <asp:Button ID="btnDone" Text="Submit for approval" CssClass="ROFloatLeft ROMarginLeft"
                            OnClick="btnDone_Click" runat="server" ValidationGroup="vgRequest" OnClientClick="javascript:return ConfirmSubmitNoApprovalTrack();" />
                    </td>
                    <td class="ROPadding5 ROStretchWidth">
                        <asp:LinkButton ID="btnSave" Text="Save, and submit later" OnClick="btnSave_Click"
                            CssClass="ROMarginLeft ROFloatLeft" runat="server" ValidationGroup="vgRequest" /> 

                        <asp:LinkButton ID="btnDeleteRequest" Text="Delete request" CssClass="ROFloatRight ROMarginTop"
                            runat="server" />
                        <img src="<%= GetDeleteIcon()%>" alt="Delete request" class="ROFloatRight ROMarginRight ROMarginTop" />
                    </td>
                </tr>
            </table>
        </td> 
    </tr>
</table>



<ajaxToolkit:ModalPopupExtender ID="ConfirmDeleteRequisitionPopup" runat="server"
    TargetControlID="btnDeleteRequest" PopupControlID="ConfirmDeleteRequisitionModal"
    PopupDragHandleControlID="ConfirmDeleteRequisitionModalHeader" BackgroundCssClass="ROModalPopup"
    BehaviorID="ConfirmDeleteRequisitionPopupBehaviorID" />
<div id="ConfirmDeleteRequisitionModal" runat="server" class="ROModalDiv ROMessageWidthHeight">
    <div class="ROInnerModal">
        <div id="ConfirmDeleteRequisitionModalHeader" class="ROModalHeading">
            <asp:Label runat="server" CssClass="ROHeaderText" Text="Delete request" />
            <asp:ImageButton runat="server" CssClass="ROModalHeadingImg" ImageUrl="<%# GetCloseIcon() %>"
                OnClientClick="$find('ConfirmDeleteRequisitionPopupBehaviorID').hide(); return false;" />
        </div>
        <asp:Label Text="Are you sure?  Once deleted, this requisition cannot be retrieved."
            runat="server" />
        <div>
            <asp:Button ID="btnDeleteRequestYes" Text="Yes" runat="server" />
            <asp:Button ID="btnCancelDeleteRequest" Text="Cancel" runat="server" OnClientClick="$find('ConfirmDeleteRequisitionPopupBehaviorID').hide(); return false;" />
        </div>
    </div>
</div>
<asp:Button ID="btnShowRequisitionPopup" runat="server" Style="display: none" />
<ajaxToolkit:ModalPopupExtender ID="RequisitionPopup" runat="server" TargetControlID="btnShowRequisitionPopup"
    PopupControlID="_divRequisitionModal" PopupDragHandleControlID="RequisitionModalHeader"
    BackgroundCssClass="ROModalPopup" />
<div id="_divRequisitionModal" runat="server" class="ROModalDiv RORequisitionWidthHeight"
    style="display: none;">
    <div class="ROInnerModal">
        <table>
            <tr>
                <td>
                    <div id="RequisitionModalHeader" class="ROModalHeading">
                        <asp:UpdatePanel ID="upRequisitionModalHeader" ChildrenAsTriggers="false" UpdateMode="Conditional"
                            runat="server">
                            <ContentTemplate>
                                <table>
                                    <tr>
                                        <td rowspan="2">
                                            <asp:Image ID="imgReqType" runat="server" />
                                        </td>
                                        <td>
                                            <jenzabar:GlobalizedLabel ID="lblReqMessage1" CssClass="ROHeaderText ROBoldText"
                                                runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <jenzabar:GlobalizedLabel ID="lblReqMessage2" CssClass="ROLabelText ROWrapText" runat="server" />
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div class="RORequisitions">
                        <asp:Table ID="RequisitionsTable" runat="server" CssClass="ROStretchWidth">
                        </asp:Table>
                    </div>
                    <table class="ROStretchWidth">
                        <tr>
                            <td>
                                &nbsp;&nbsp;&nbsp;
                                <asp:LinkButton ID="lnkBackToMain" Text="Close, go back" OnClick="btnCancel_Click"
                                    runat="server" />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:LinkButton ID="lnkAddAnotherReq" OnClick="lnkAddAnotherReq_Click" Text="Add another requisition"
                                    runat="server" />
                                
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
</div>

<asp:Button ID="btnShowOverBudgetPopup" runat="server" Style="display: none" />
<ajaxToolkit:ModalPopupExtender ID="OverBudgetPopup" runat="server" TargetControlID="btnShowOverBudgetPopup"
    PopupControlID="OverBudgetModal" PopupDragHandleControlID="OverBudgetModalHeader"
    BackgroundCssClass="ROModalPopup" BehaviorID="OverBudgetPopupBehaviorID" />
<div id="OverBudgetModal" runat="server" class="ROModalDiv ROMessageWidthHeight">
    <div class="ROInnerModal">
        <div id="OverBudgetModalHeader" class="ROModalHeading">
            <asp:Label runat="server" CssClass="ROHeaderText" />
            <asp:ImageButton runat="server" CssClass="ROModalHeadingImg" ImageUrl="<%# GetCloseIcon() %>"
                OnClientClick="$find('OverBudgetPopupBehaviorID').hide(); return false;" />
        </div>
        <asp:Label Text="You may not submit this request due to an over-budget condition.  You may edit this request to correct the over-budget state now, or save this request and submit later once the over-budget state is resolved."
            runat="server" />
    </div>
</div>

<asp:Button ID="btnShowSubmitErrorPopup" runat="server" Style="display: none" />
<ajaxToolkit:ModalPopupExtender ID="SubmitErrorPopup" runat="server" TargetControlID="btnShowSubmitErrorPopup"
    PopupControlID="SubmitErrorModal" PopupDragHandleControlID="SubmitErrorModalHeader"
    BackgroundCssClass="ROModalPopup" BehaviorID="SubmitErrorPopupBehaviorID" />
<div id="SubmitErrorModal" runat="server" class="ROModalDiv ROMessageWidthHeight">
    <div class="ROInnerModal">
        <asp:UpdatePanel ID="upSubmitError" ChildrenAsTriggers="false" UpdateMode="Conditional"
            runat="server">
            <ContentTemplate>
                <div id="SubmitErrorModalHeader" class="ROModalHeading">
                    <asp:Label ID="SubmitErrorHeaderText" runat="server" CssClass="ROHeaderText" />
                    <asp:ImageButton runat="server" CssClass="ROModalHeadingImg" ImageUrl="<%# GetCloseIcon() %>"
                        OnClientClick="$find('SubmitErrorPopupBehaviorID').hide(); return false;" />
                </div>
        
                <table>
                    <tr>
                        <td><asp:Label ID="SubmitErrorText" CssClass="ROErrorText" runat="server" /></td>
                    </tr>                    
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</div>

<asp:Button ID="btnShowSaveErrorPopup" runat="server" Style="display: none" />
<ajaxToolkit:ModalPopupExtender ID="SaveErrorPopup" runat="server" TargetControlID="btnShowSaveErrorPopup"
    PopupControlID="SaveErrorModal" PopupDragHandleControlID="SaveErrorModalHeader"
    BackgroundCssClass="ROModalPopup" BehaviorID="SaveErrorPopupBehaviorID" />
<div id="SaveErrorModal" runat="server" class="ROModalDiv ROMessageWidthHeight">
    <div class="ROInnerModal">
        <asp:UpdatePanel ID="upSaveError" ChildrenAsTriggers="false" UpdateMode="Conditional"
            runat="server">
            <ContentTemplate>
                <div id="SaveErrorModalHeader" class="ROModalHeading">
                    <asp:Label ID="SaveErrorHeaderText" runat="server" CssClass="ROHeaderText" />
                </div>
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="SaveErrorText" CssClass="ROErrorText" runat="server" />
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
        <table class="ROStretchWidth">
            <tr>
                <td>
                    <asp:LinkButton ID="lnkCloseGoBack" Text="Close, go back" OnClick="btnCancel_Click"
                        runat="server" />
                </td>
            </tr>
        </table>
    </div>
</div>

<script language="javascript" type="text/javascript">
 
    var el;
    function showHideOthers(link1, link2, lblAndOthers, othersPanel)
    {
        showHide(link1);

        el = document.getElementById(link2);
        showHide(el);

        el = document.getElementById(lblAndOthers);
        showHide(el);

        var el = document.getElementById(othersPanel);
        showHide(el);
    }

    function showHide(el)
    {
        el.style.display = (el.style.display == "block") ? "none" : "block";
    }

    function ConfirmSubmitNoApprovalTrack()
    {
        //Test client side IsValid 
        if (typeof (Page_ClientValidate) == 'function') {
            Page_ClientValidate();
        }

        if (Page_IsValid) {
            if ((document.getElementById("<%# ApprovalTrackClientID %>") != null)
                && (document.getElementById("<%# ApprovalTrackClientID %>").selectedIndex < 1)
                && (document.getElementById("<%# ApprovalTrackClientID %>").value == '')) {
                return confirm("No approval track is selected. Do you wish to proceed?");
            }
            return true;
        }
    }
</script>