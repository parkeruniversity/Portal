<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RequestSummaryControl.ascx.cs" Inherits="Portlet.RequisitionsAndOrders.Controls.RequestSummaryControl" %>
<%@ Import Namespace="EX.Data" %>
<%@ Import Namespace="Portlet.RequisitionsAndOrders" %>
<%@ Register TagPrefix="jenzabar" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="Jenzabar.EX.Feedback" Namespace="Jenzabar.EX.Feedback" TagPrefix="fb" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register TagPrefix="fb" TagName="FeedbackView" Src="~/Portlets/CRM/Common/Jenzabar.EX.Feedback/Controls/FeedbackView.ascx" %>
<%@ Register TagPrefix="at" TagName="ApprovalTrack" Src="~/Portlets/CRM/Staff/Portlet.RequisitionsAndOrders/Controls/ApprovalTrackControl.ascx" %>
<%@ Register TagPrefix="vs" TagName="VendorSearch" Src="~/Portlets/CRM/Staff/Portlet.RequisitionsAndOrders/Controls/VendorSearchControl.ascx" %>
<%@ Register TagPrefix="ars" TagName="AgentRequesterSearch" Src="~/Portlets/CRM/Staff/Portlet.RequisitionsAndOrders/Controls/AgentRequesterSearchControl.ascx" %>
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
                        <span class="ROInformativeText ROMarginRight">Request name</span>
                    </td>
                    <td>
                        <asp:TextBox ID="RequestName" runat="server" MaxLength="40" />
                    </td>
                    <td>
                        <span class="ROInformativeText ROMarginLeft ROMarginRight">Purchasing Agent</span>
                    </td>
                    <td>
                        <asp:TextBox ID="PurchasingAgent" runat="server" MaxLength="10" CssClass="ROFloatLeft ROMarginRight RORight" />
                        <ajaxtoolkit:filteredtextboxextender id="PurchasingAgentFilter" runat="server" targetcontrolid="PurchasingAgent"
                            filtertype="Numbers" filtermode="ValidChars" />
                        <asp:CustomValidator ID="CustomValidatorPurchasingAgent" ControlToValidate="PurchasingAgent"
                            ClientValidationFunction="GetPurchasingAgentName" Display="Dynamic" CssClass="ROFloatLeft ROErrorText ROMarginTop"
                            ErrorMessage="No match found." ValidationGroup="vgRequest" runat="server" />
                        <asp:LinkButton ID="SearchPurchasingAgent" CssClass="ROFloatLeft ROInformativeLink"
                            Text="Search" runat="server" OnClick="SearchPurchasingAgent_Click" />
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                    <td class="ROVerticalAlignTop">
                        <asp:Label ID="PurchasingAgentName" CssClass="ROInformativeText ROFloatLeft" runat="server" />
                    </td>
                </tr>
            </table>
            <table class="ROMarginLeft ROSectionMarginBottom">
                <tr>
                    <td>
                        <span class="ROInformativeText ROMarginRight">Request date</span>
                    </td>
                    <td>
                        <asp:Label ID="RequestDate" runat="server" />
                    </td>
                    <td>
                        <span class="ROInformativeText ROMarginLeft ROMarginRight">Need by date</span>
                    </td>
                    <td>
                        <jenzabar:datepicker id="NeedByDate" runat="server" />
                        <asp:TextBox ID="NeedByDateCopy" Style="display: none;" runat="server" />
                        <asp:CustomValidator ID="CustomValidatorNeedByDate" runat="server" ErrorMessage="Need by date cannot be prior to today's date."
                                 ControlToValidate="NeedByDateCopy" Display="Dynamic" ValidationGroup="vgRequest" OnServerValidate="CustomValidatorNeedByDate_OnServerValidate"/>

                    </td>
                    <td>
                        <asp:Label id="lblApprovalTrack" CssClass="ROInformativeText ROMarginLeft ROMarginRight" Text="Approval track" runat="server" />
                    </td>
                    <td>
                        <div id="ApprovalTrackDesc" runat="server" class="ROFloatLeft ROReadOnlyField"><%=Requisition.ApprovalTrackDesc%>&nbsp;</div>
                        <asp:DropDownList ID="ApprovalTrack" runat="server" DataValueField="Key" DataTextField="Value" />
                        <asp:LinkButton ID="PreviewApprovalTrack" CssClass="ROInformativeLink" Text="Preview"
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
                        <asp:TextBox ID="Vendor" runat="server" MaxLength="10" CssClass="ROFloatLeft ROMarginRight RORight" />
                        <ajaxtoolkit:filteredtextboxextender id="VendorFilter" runat="server" targetcontrolid="Vendor"
                            filtertype="Numbers" filtermode="ValidChars" />                        
                        <asp:CustomValidator ID="CustomValidatorVendor" ControlToValidate="Vendor" ClientValidationFunction="GetVendor"
                            Display="Dynamic" CssClass="ROFloatLeft ROErrorText ROMarginTop" ErrorMessage="No match found."
                            ValidationGroup="vgRequest" runat="server" />
                        <asp:LinkButton ID="SearchVendor" CssClass="ROFloatLeft ROInformativeLink" Text="Search"
                            runat="server" OnClick="SearchVendor_Click" />
                    </td>
                    <td>
                        <span class="ROInformativeText ROMarginLeft ROMarginRight">Ship order here</span>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlShipAddresses" runat="server" DataValueField="Key" DataTextField="Value"
                            AutoPostBack="false" />
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td>
                        <asp:Label ID="VendorName" CssClass="ROInformativeText" runat="server" />
                        <input type="hidden" id="hiddenVendorAddressCode" value="" runat="server" />
                    </td>
                    <td>
                    </td>
                    <td>
                        <asp:Label ID="ShipAddress" CssClass="ROInformativeText" runat="server" />
                    </td>
                    <td>
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
    <tr>
        <td>
            <asp:Label id="RequestingForHeader" class="ROHeaderText" runat="server" Text="Requesting for someone else?" />
        </td>
    </tr>
    <tr>
        <td>
            <table class="ROMarginLeft ROSectionMarginBottom">
                <tr>
                    <td>
                        <asp:Label id="RequestingForInstructions" class="ROInformativeText" runat="server" Text="To grant your colleague access to this requisition,
                            select his/her name from the drop-down options or click Search" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label id="lblRequestingFor" class="ROInformativeText ROMarginRight ROFloatLeft" runat="server" Text="Requesting for" />
                        <asp:Label id="lblRequestedFor" class="ROInformativeText ROMarginRight ROFloatLeft" runat="server" Text="Requested for" />
                        <asp:DropDownList ID="ddlRequestingFor" runat="server" DataValueField="Key" DataTextField="Value"
                            AutoPostBack="false" CssClass="ROFloatLeft ROMarginRight" />
                        <asp:LinkButton ID="SearchRequestingFor" CssClass="ROInformativeLink ROFloatLeft"
                            Text="Search" runat="server" OnClick="SearchRequestingFor_Click" />
                        <asp:TextBox ID="RequestingForIDNum" runat="server" Style="display: none" />
                        <asp:Label ID="RequestingForName" Style="display: none" runat="server" />
                    </td>
                    <td>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
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
            <asp:Label runat="server" CssClass="ROHeaderText" Text="Approval Track Details" />
            <asp:ImageButton runat="server" CssClass="ROModalHeadingImg" ImageUrl="<%# GetCloseIcon() %>"
                OnClientClick="$find('ApprovalTrackPopupBehaviorID').hide(); return false;" />
        </div>
        <div>
            <at:ApprovalTrack ID="approvalTrackControl" runat="server" ModalBehaviorID="ApprovalTrackPopupBehaviorID" />
        </div>
    </div>
</div>
<asp:Button ID="btnVendorSearchPopup" runat="server" Style="display: none" />
<ajaxToolkit:ModalPopupExtender ID="VendorSearchPopup" runat="server" TargetControlID="btnVendorSearchPopup"
    PopupControlID="vendorSearchModal" PopupDragHandleControlID="vendorSearchModalHeader"
    BackgroundCssClass="ROModalPopup" BehaviorID="VendorSearchPopupBehaviorID" />
<div id="vendorSearchModal" runat="server" class="ROModalDiv">
    <div class="ROInnerModal">
        <div id="vendorSearchModalHeader" class="ROModalHeading">
            <asp:Label runat="server" CssClass="ROHeaderText" Text="Vendor Search" />
            <asp:ImageButton runat="server" CssClass="ROModalHeadingImg" ImageUrl="<%# GetCloseIcon() %>"
                OnClientClick="$find('VendorSearchPopupBehaviorID').hide(); return false;" />
        </div>
        <div>
            <vs:VendorSearch ID="vendorSearchControl" runat="server" ModalBehaviorID="VendorSearchPopupBehaviorID"
                VendorID="<%# Vendor.ClientID %>" VendorInfoID="<%# VendorName.ClientID %>" VendorAddressCodeID="<%# hiddenVendorAddressCode.ClientID %>"
                ValidatorID="<%# CustomValidatorVendor.ClientID %>" />
        </div>
    </div>
</div>
<asp:Button ID="btnSearchPurchasingAgentPopup" runat="server" Style="display: none" />
<ajaxToolkit:ModalPopupExtender ID="SearchPurchasingAgentPopup" runat="server" TargetControlID="btnSearchPurchasingAgentPopup"
    PopupControlID="agentRequesterSearchModal" PopupDragHandleControlID="agentRequesterSearchModalHeader"
    BackgroundCssClass="ROModalPopup" BehaviorID="SearchPurchasingAgentPopupBehaviorID" />
<div id="agentRequesterSearchModal" runat="server" class="ROModalDiv ROMessageWidthHeight">
    <div class="ROInnerModal">
        <div id="agentRequesterSearchModalHeader" class="ROModalHeading">
            <asp:Label runat="server" CssClass="ROHeaderText" Text="Purchasing Agent Search" />
            <asp:ImageButton runat="server" CssClass="ROModalHeadingImg" ImageUrl="<%# GetCloseIcon() %>"
                OnClientClick="$find('SearchPurchasingAgentPopupBehaviorID').hide(); return false;" />
        </div>
        <div>
            <ars:AgentRequesterSearch ID="agentRequesterSearchControl" runat="server" ModalBehaviorID="SearchPurchasingAgentPopupBehaviorID"
                AgentRequesterID="<%# PurchasingAgent.ClientID %>" AgentRequesterName="<%# PurchasingAgentName.ClientID %>"
                ValidatorID="<%# CustomValidatorPurchasingAgent.ClientID %>" />
        </div>
    </div>
</div>

<asp:Button ID="btnRequestingForSearchPopup" runat="server" Style="display: none" />
<ajaxToolkit:ModalPopupExtender ID="RequestingForSearchPopup" runat="server" TargetControlID="btnRequestingForSearchPopup"
    PopupControlID="RequestingForSearchModal" PopupDragHandleControlID="RequestingForSearchModalHeader"
    BackgroundCssClass="ROModalPopup" BehaviorID="RequestingForSearchPopupBehaviorID" />
<div id="RequestingForSearchModal" runat="server" class="ROModalDiv ROMessageWidthHeight">
    <div class="ROInnerModal">
        <div id="RequestingForSearchModalHeader" class="ROModalHeading">
            <asp:Label runat="server" CssClass="ROHeaderText" Text="Requester Search" />
            <asp:ImageButton runat="server" CssClass="ROModalHeadingImg" ImageUrl="<%# GetCloseIcon() %>"
                OnClientClick="$find('RequestingForSearchPopupBehaviorID').hide(); return false;" />
        </div>
        <div>
            <ars:AgentRequesterSearch ID="RequestingForSearchControl" runat="server" ModalBehaviorID="RequestingForSearchPopupBehaviorID"
                AgentRequesterID="<%# RequestingForIDNum.ClientID %>" AgentRequesterName="<%# RequestingForName.ClientID %>"
                OnClickJS="javascript:setSelectedRequestor();" />
        </div>
    </div>
</div>

<script language="javascript" type="text/javascript">

    function SyncNeedByDateCopy(NeedByDate, NeedByDateCopyID)
    {
        var NeedByDateCopy = document.getElementById(NeedByDateCopyID);
        NeedByDateCopy.value = NeedByDate.value;
    }
    
    // variable to keep result of the last call to web service
    var VendorValidationResult;
    // variable to keep information about vendor which was validated in the last call
    var VendorValidatorLastCheckValue;

    function GetVendor(source, args)
    {
        var vendorIdNum = document.getElementById("<%# Vendor.ClientID %>").value;

        // Check if vendor changed
        if (VendorValidatorLastCheckValue == vendorIdNum) {
            args.IsValid = VendorValidationResult;
            return;
        }

        var hiddenVendorAddressCode = document.getElementById("<%# hiddenVendorAddressCode.ClientID %>").value;

        if (vendorIdNum == '') {
            document.getElementById("<%# VendorName.ClientID %>").innerHTML = '';
            document.getElementById("<%# hiddenVendorAddressCode.ClientID %>").value = '';
            return;
        }

        $.ajax({
            type: "POST",
            data: '{ vendorIdNum: "' + vendorIdNum + '" }',
            dataType: "json",
            url: '<%# ResolveUrl("../WebService/VendorWebService.asmx/GetVendor") %>',
            contentType: "application/json; charset=utf-8",
            success: function (data)
            {
                var vendor = data.d;

                document.getElementById("<%# VendorName.ClientID %>").innerHTML = (vendor == null) ? '' : vendor.FormattedNameAddress;
                document.getElementById("<%# hiddenVendorAddressCode.ClientID %>").value = (vendor == null) ? '' : vendor.AddressCode;

                VendorValidatorLastCheckValue = vendorIdNum;
                VendorValidationResult = (vendor != null);

                source.isvalid = VendorValidationResult;
                ValidatorUpdateDisplay(source);
                ValidatorUpdateIsValid();
            },
            error: function (jqX, status, err)
            {
                //alert('Error: ' + jqX.responseText);
            }
        });
    }

    // variable to keep result of the last call to web service
    var PurchasingAgentValidationResult;
    // variable to keep information about PurchasingAgent which was validated in the last call
    var PurchasingAgentValidatorLastCheckValue;

    function GetPurchasingAgentName(source, args)
    {
        var idNum = document.getElementById("<%# PurchasingAgent.ClientID %>").value;

        // Check if PurchasingAgent changed
        if (PurchasingAgentValidatorLastCheckValue == idNum) {
            args.IsValid = PurchasingAgentValidationResult;
            return;
        }

        if (idNum == '') {
            document.getElementById("<%# PurchasingAgentName.ClientID %>").innerHTML = '';
            return;
        }

        $.ajax({
            type: "POST",
            data: '{ idNum: "' + idNum + '" }',
            dataType: "json",
            url: '<%# ResolveUrl("../WebService/DisplayNameWebService.asmx/GetDisplayName") %>',
            contentType: "application/json; charset=utf-8",
            success: function (data)
            {
                document.getElementById("<%# PurchasingAgentName.ClientID %>").innerHTML = (data.d == null) ? '' : data.d;

                PurchasingAgentValidatorLastCheckValue = idNum;
                PurchasingAgentValidationResult = (data.d != null);

                source.isvalid = PurchasingAgentValidationResult;
                ValidatorUpdateDisplay(source);
                ValidatorUpdateIsValid();
            },
            error: function (jqX, status, err)
            {
                //alert('Error: ' + jqX.responseText);
            }
        });
    }

    function ClearVendorName()
    {
        var vendorIdNum = document.getElementById("<%# Vendor.ClientID %>").value;
        
        if (vendorIdNum == '') {
            document.getElementById("<%# VendorName.ClientID %>").innerHTML = '';
            document.getElementById("<%# hiddenVendorAddressCode.ClientID %>").value = '';
            return;
        }
    }

    function ClearPurchasingAgentName()
    {
        var idNum = document.getElementById("<%# PurchasingAgent.ClientID %>").value;

        if (idNum == '') {
            document.getElementById("<%# PurchasingAgentName.ClientID %>").innerHTML = '';
            return;
        }
    }

    function TogglePreviewApprovalTrack()
    {
        var ddlApprovalTrack = document.getElementById("<%# ApprovalTrack.ClientID %>");

        if (ddlApprovalTrack.selectedIndex > -1) {
            document.getElementById("<%# PreviewApprovalTrack.ClientID %>").style.visibility = "visible";
        }
        else {
            document.getElementById("<%# PreviewApprovalTrack.ClientID %>").style.visibility = "hidden";
        }
    }

    function setSelectedRequestor()
    {
        var ddlRequestingFor = document.getElementById("<%# ddlRequestingFor.ClientID %>");
        var RequestingForIDNum = document.getElementById("<%# RequestingForIDNum.ClientID %>");
        var RequestingForName = document.getElementById("<%# RequestingForName.ClientID %>");

        var idNum = RequestingForIDNum.value;
        var name = RequestingForName.innerHTML;

        for (var i = 0; i < ddlRequestingFor.options.length; i++) {
            var option = ddlRequestingFor.options[i].value;

            if (idNum == option) {
                ddlRequestingFor.options[i].selected = true;
                return;
            }
        }

        ddlRequestingFor.add(new Option(idNum + ' - ' + name, idNum, false, true));
    }

    function SetRequestingForIDNum()
    {
        var ddlRequestingFor = document.getElementById("<%# ddlRequestingFor.ClientID %>");

        document.getElementById("<%# RequestingForIDNum.ClientID %>").value = ddlRequestingFor.options[ddlRequestingFor.selectedIndex].value;
    }
</script>
