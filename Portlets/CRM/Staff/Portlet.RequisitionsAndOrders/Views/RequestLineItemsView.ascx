<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RequestLineItemsView.ascx.cs"
    Inherits="Portlet.RequisitionsAndOrders.Views.RequestLineItemsView" %>
<%@ Import Namespace="Jenzabar.Portal.Framework" %>
<%@ Import Namespace="EX.Data" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register TagPrefix="jenzabar" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="ajaxToolkit" Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" %>
<%@ Register TagPrefix="is" TagName="InventorySearchControl" Src="~/Portlets/CRM/Staff/Portlet.RequisitionsAndOrders/Controls/InventorySearchControl.ascx" %>
<%@ Register TagPrefix="au" TagName="AttachmentUploader" Src="~/Portlets/CRM/Common/Jenzabar.EX.Common/Controls/AttachmentUploaderControl.ascx" %>
<script type="text/javascript" src="<%= this.ResolveUrl("../ROScript.js") %>"></script>
<input id="hdnCtlIdNum" type="hidden" runat="server" name="hdnCtlIdNum" />
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
                            <asp:Label ID="lblReqName" CssClass="ROMarginRight ROFloatLeft ROMarginTop ROLabelText"
                                runat="server" />
                            <asp:Label CssClass="ROMarginRight ROFloatLeft ROMarginTop ROInformativeText" Text="has"
                                runat="server" />
                            <asp:Label ID="lblNumItems" CssClass="ROFloatLeft ROMarginTop3 ROMarginRight ROHighlightText"
                                runat="server" />
                            <asp:Label ID="lblItemsAmount" CssClass="ROFloatLeft ROMarginTop ROMarginRight ROLabelText"
                                runat="server" />
                            <asp:Image ID="checkoutIcon" CssClass="ROMarginLeft ROFloatLeft ROMarginRight" ImageUrl='<%# GetCheckoutIconPath()%>'
                                alt="Checkout" runat="server" />
                            <asp:LinkButton ID="Checkout" CssClass="ROInformativeLink ROFloatLeft ROMarginTop"
                                ValidationGroup="vgRequest" OnClick="btnDone_Click" Text="Checkout" runat="server" />
                        </td>
                    </tr>
                </table>
            </div>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <div class="ROMarginTop10 ROGreyBox">
                <table>
                    <tr>
                        <td>
                            <span class="ROInformativeText">Request date</span>
                        </td>
                        <td>
                            <jenzabar:ToggleDatePicker ID="RequestDate" runat="server" />
                            <asp:TextBox ID="RequestDateCopy" style="display:none;" runat="server" />
                            <asp:Label ID="RequestDateRequired" runat="server" CssClass="ROErrorText" Text="*" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorRequestDate" runat="server"
                                ControlToValidate="RequestDateCopy" ErrorMessage="Request date is a required field."
                                CssClass="ROErrorText" Display="Dynamic" ValidationGroup="vgRequest" />
                           <asp:CustomValidator ID="CustomValidatorRequestDate" runat="server" ErrorMessage="Request date may not precede the current fiscal year or exceed the future fiscal year."
                                 ControlToValidate="RequestDateCopy" Display="Dynamic" ValidationGroup="vgRequest" OnServerValidate="CustomValidatorRequestDate_OnServerValidate"/>
                        </td>
                        <td>
                            <table>
                                <tr>
                                    <td>
                                        
                                    </td>
                                    <td>
                                        <span class="ROInformativeText ROMarginTop">The Request date determines the budget to
                                            be used for this request and the projects available.</span><br />
                                        <span class="ROInformativeText">To request items using another budget period or other
                                            projects, you must enter a new request.</span>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr><td colspan="3"><span class="ROInformativeText ROMarginRight">Budget year</span><asp:Label ID="BudgetYearStatus" CssClass="ROInformativeText" runat="server" /></td></tr>
                </table>
            </div>
        </td>
    </tr>
    <tr>
        <td>
        </td>
        <td>
            <table class="ROMarginLeft ROSectionMarginBottom">
                <tr>
                    
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <img class="ROMarginTop10 ROMarginLeft ROMarginRight" src="<%=GetNumber1IconPath()%>"
                alt="1" />
        </td>
        <td>
            <span class="ROHeaderText ROBoldText">Enter the item</span>
        </td>
    </tr>
    <tr>
        <td>
        </td>
        <td>
            <table class="ROMarginLeft ROSectionMarginBottom">
                <tr>
                    <td>
                        <span class="ROInformativeText">Item</span>
                        <asp:TextBox ID="Item" runat="server" MaxLength="40" />
                        <span class="ROErrorText">*</span>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorItem" runat="server" ControlToValidate="Item"
                            ErrorMessage="Item is a required field." CssClass="ROErrorText" Display="Dynamic"
                            ValidationGroup="vgRequest" />
                        <input id="hiddenInvCode" type="hidden" runat="server" />
                        <asp:LinkButton ID="FindItems" CssClass="ROInformativeLink" Text="Find frequently ordered items"
                            runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <span class="ROInformativeText">Quantity</span>                    
                        <asp:TextBox ID="Quantity" runat="server" MaxLength="12" CssClass="RORight" />
                        <span class="ROErrorText">*</span>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorQuantity" runat="server" ControlToValidate="Quantity"
                            ErrorMessage="Quantity is a required field." CssClass="ROErrorText" Display="Dynamic"
                            ValidationGroup="vgRequest" />
                        <asp:RangeValidator ID="RangeQuantity" ControlToValidate="Quantity" MinimumValue="0.01"
                            MaximumValue="999999999.99" Type="Double" Text="Quantity is an invalid amount."
                            CssClass="ROErrorText" Display="Dynamic" ValidationGroup="vgRequest" runat="server" />
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderQuantity" runat="server"
                            TargetControlID="Quantity" FilterType="Numbers, Custom" ValidChars="." FilterMode="ValidChars" />
                    
                        <span class="ROInformativeText ROMarginLeft">Price $</span>                    
                        <asp:TextBox ID="Price" runat="server" MaxLength="12" CssClass="RORight" />
                        <span class="ROErrorText">*</span>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorPrice" runat="server" ControlToValidate="Price"
                            ErrorMessage="Price is a required field." CssClass="ROErrorText" Display="Dynamic"
                            ValidationGroup="vgRequest" />
                        <ajaxToolkit:FilteredTextBoxExtender ID="PriceFilter" runat="server" TargetControlID="Price"
                            FilterType="Numbers, Custom" ValidChars="." FilterMode="ValidChars" />
                        <asp:RangeValidator ID="RangeValidatorPrice" ControlToValidate="Price" MinimumValue="0.0001"
                            MaximumValue="9999999.9999" Type="Double" Text="Price is an invalid amount."
                            CssClass="ROErrorText" Display="Dynamic" ValidationGroup="vgRequest" runat="server" />

                        <span class="ROInformativeText ROMarginLeft">Total $</span>                    
                        <asp:Label CssClass="ROHighlightText" ID="Total" runat="server" />
                        <asp:TextBox ID="TotalCopy" Style="display: none;" runat="server" />
                        <asp:RangeValidator ID="RangeTotal" ControlToValidate="TotalCopy" MinimumValue="0.01"
                            MaximumValue="999999999.99" Type="Double" Text="Total is an invalid amount."
                            CssClass="ROErrorText" Display="Dynamic" ValidationGroup="vgRequest" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <span class="ROInformativeText">Shipment container (box, case, etc.)</span>                   
                        <asp:TextBox ID="ShipContainer" runat="server" MaxLength="10" />
                    
                        <span class="ROInformativeText ROMarginLeft">Catalog #</span>                    
                        <asp:TextBox ID="CatalogNumber" runat="server" MaxLength="12" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="ROVerticalAlignTop">
            <img class="ROMarginLeft ROMarginRight" src="<%=GetNumber2IconPath()%>" alt="2" />
        </td>
        <td>
            <table class="ROSectionMarginBottom">
                <tr>
                    <td>
                        <span class="ROHeaderText ROBoldText">Charge to</span>
                    </td>
                    <td>
                        <asp:LinkButton ID="lnkAcctSelect" runat="server" Text="Search for account" />
                    </td>
                </tr>
                <tr>           
                    <td>
                        <span class="ROMarginLeft ROInformativeText">Budget account</span>
                    </td>
                    <td>
                        <asp:TextBox ID="txtAcctCode" CssClass="ROFloatLeft ROMarginRight" runat="server" />
                        <asp:DropDownList ID="ddlAccount" CssClass="ROFloatLeft ROMarginRight RODropDownMinWidth"
                            runat="server" DataValueField="Key" DataTextField="Value" AutoPostBack="false" />
                        <span class="ROErrorText ROFloatLeft ROMarginRight ">*</span>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorAccount" runat="server" ErrorMessage="Budget account is a required field."
                            CssClass="ROErrorText ROFloatLeft ROMarginRight" Display="Dynamic" ValidationGroup="vgRequest" />
                        <asp:CustomValidator ID="CustomValidatorAcctCode" ControlToValidate="txtAcctCode"
                            ClientValidationFunction="txtAcctCode_BudgetCheck" Display="Dynamic" CssClass="ROErrorText"
                            ErrorMessage="Invalid" ValidationGroup="vgRequest" runat="server" />
                        <asp:Image ID="UnderBudgetIcon" CssClass="ROMarginRight ROFloatLeft"
                            ImageUrl='<%# GetUnderBudgetIconPath()%>' Style="display: none;" alt="under budget after purchase"
                            runat="server" />
                        <asp:Image ID="OverBudgetIcon" CssClass="ROMarginRight ROFloatLeft"
                            ImageUrl='<%# GetOverBudgetIconPath()%>' Style="display: none;" alt="over budget after purchase"
                            runat="server" />
                        <asp:Label ID="AccountBudgetStatus" CssClass="ROFloatLeft ROMarginRight" runat="server" />
                        <asp:LinkButton ID="AdjustBudget" runat="server" Style="display: none;" Text='Adjust budget'
                            ValidationGroup="vgRequest" CssClass="ROOverLink ROMarginRight ROFloatLeft" OnClick="AdjustBudget_Click" />
                        <input id="hiddenWorksheetID" type="hidden" runat="server" />
                        <input id="hiddenLineItemID" type="hidden" runat="server" />
                    </td>
                </tr>

                <tr>
                    <td>
                        <span class="ROMarginLeft ROInformativeText">Project code</span>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlProject" CssClass="ROFloatLeft ROMarginRight RODropDownMinWidth"
                            runat="server" DataValueField="Key" DataTextField="Value" AutoPostBack="false" />
                        <input id="hiddenProjectCode" type="hidden" runat="server" />
                        <asp:Image ID="ProjectUnderBudgetIcon" CssClass="ROMarginRight ROFloatLeft" ImageUrl='<%# GetUnderBudgetIconPath()%>'
                            Style="display: none;" alt="under budget after purchase" runat="server" />
                        <asp:Image ID="ProjectOverBudgetIcon" CssClass="ROMarginRight ROFloatLeft" ImageUrl='<%# GetOverBudgetIconPath()%>'
                            Style="display: none;" alt="over budget after purchase" runat="server" />
                        <asp:Label ID="ProjectBudgetStatus" CssClass="ROFloatLeft ROMarginRight" runat="server" />
                    </td>
                </tr>
                <!--<tr>
                    <span class="OKStateObjectCode" runat="server">
                        <td>
                            <span class="ROMarginLeft ROInformativeText">OK State Object Code</span>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlOKStateCode" CssClass="ROFloatLeft ROMarginRight RODropDownMinWidth"
                                runat="server" DataValueField="Key" DataTextField="Value" AutoPostBack="false"/>
                            <input id="hidden1" type="hidden" runat="server" />
                            <asp:Label ID="Label1" CssClass="ROFloatLeft ROMarginRight" runat="server" />
                        </td>
                    </span>
                </tr>-->
                
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <img class="ROMarginTop10 ROMarginLeft ROMarginRight" src="<%=GetNumber3IconPath()%>"
                alt="3" />
        </td>
        <td>
            <span class="ROHeaderText ROBoldText">More details about the item</span>
        </td>
    </tr>
    <tr>
        <td>
        </td>
        <td>
            <table class="ROMarginLeft ROSectionMarginBottom">
                <tr>
                    <td>
                        <p class="ROMarginTop ROInformativeText RONoWrap">Detailed description</p>
                    </td>
                    <td>
                        <asp:TextBox ID="Description" TextMode="MultiLine" Rows="3" Width="470px" runat="server" />
                    </td>
                    <td>                                
                        <table id="SupportingDocArea" runat="server" class="ROSupportingDocArea ROMarginBottom">
                            <tr>
                                <td>
                                    <asp:Label ID="SupportingDocCustomText" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: center; margin: 5px;">
                                    <au:AttachmentUploader ID="auFiles" runat="server" AttachmentUploaderType="MultiUpload" AttachmentUseCode="PO_PROCESS" AttachmentTypeCode="RQ_SUPPORT" HeaderTextOverride="Add Supporting Document" DisplayTextOverride="Add supporting documentation" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr><td></td><td><span class="ROFloatRight ROErrorText">* Required, please fill these out.</span></td></tr>
    <tr>
        <td colspan="2">
            <table class="ROMarginRight ROGreyButtonBox ROStretchWidth RONoMarginPadding">
                <tr class="RONoMarginPadding">                    
                    <td id="DoneProceedToCheckoutArea" runat="server" class="ROBlueButtonBox ROBlueButtonBoxWidth">
                        <img class="ROFloatLeft" src="<%=GetNumber4IconPath()%>" alt="4" /><asp:Button ID="btnDone"
                            CssClass="ROFloatLeft ROMarginLeft  ROMarginTop ROVerticalAlignCenter " Text="Done, proceed to checkout"
                            ValidationGroup="vgRequest" OnClick="btnDone_Click" runat="server" />
                    </td>
                    <td class="ROPadding5">
                        <asp:LinkButton ID="btnSave" Text="Save, add another" ValidationGroup="vgRequest"
                            OnClick="btnSave_Click" CssClass="ROMarginLeft" runat="server" /><asp:Label ID="ValidationMessage" Visible="false"
                                CssClass="ROErrorText" runat="server" />
                        <asp:LinkButton ID="lnkCancelProceedToCheckout" Text="Cancel, proceed to checkout"
                            CssClass="ROFloatRight ROMarginRight" runat="server"
                            OnClick="lnkCancelProceedToCheckout_Click" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

<ajaxToolkit:ModalPopupExtender ID="FindItemsPopup" runat="server" TargetControlID="FindItems" PopupControlID="findItemsModal" 
    PopupDragHandleControlID="findItemsModalHeader" BackgroundCssClass="ROModalPopup" BehaviorID="FindItemsPopupBehaviorID" />
<div id="findItemsModal" runat="server" class="ROModalDiv">
    <div class="ROInnerModal">
        <div id="findItemsModalHeader" class="ROModalHeading">
            <asp:Label runat="server" CssClass="ROHeaderText" Text="Inventory Search" />
            <asp:ImageButton runat="server" CssClass="ROModalHeadingImg" ImageUrl="<%# GetCloseIcon() %>"
                OnClientClick="$find('FindItemsPopupBehaviorID').hide(); return false;" />
        </div>
        <div>
            <is:InventorySearchControl ID="inventorySearch" runat="server" InvCodeID="<%# hiddenInvCode.ClientID %>"
                DescriptionID="<%# Item.ClientID %>" UnitCostID="<%# Price.ClientID %>" UnitID="<%# ShipContainer.ClientID %>"
                CatalogID="<%# CatalogNumber.ClientID %>" ModalBehaviorID="FindItemsPopupBehaviorID"
                OnClickJS="javascript:CalculateTotal();ProjectBudgetCheck();BudgetCheck();" />
        </div>
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
            <contenttemplate>
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
            </contenttemplate>
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

    function SyncRequestDateCopy(RequestDate, RequestDateCopyID)
    {
        var RequestDateCopy = document.getElementById(RequestDateCopyID);
        RequestDateCopy.value = RequestDate.value;
    }

    function BudgetYearStatus()
    {
        var requestDate = document.getElementById("<%# RequestDateCopy.ClientID %>").value;

        if (requestDate == '') {
            return;
        }

        $.ajax({
            type: "POST",
            data: '{ requestDate: "' + requestDate + '" }',
            dataType: "json",
            url: '<%# ResolveUrl("../WebService/FiscalYearWebService.asmx/GetBudgetYearStatus") %>',
            contentType: "application/json; charset=utf-8",
            success: function (data)
            {
                var status = data.d;
                document.getElementById("<%# BudgetYearStatus.ClientID %>").innerHTML = status;
            },
            error: function (jqX, status, err)
            {
                alert('Error: ' + jqX.responseText); 
            }
        });
    }

    function CalculateTotal()
    {
        var quan = document.getElementById("<%# Quantity.ClientID %>").value;
        var pric = document.getElementById("<%# Price.ClientID %>").value;

        if (quan == '') {
            quan = 0;
        }

        if (pric == '') {
            pric = 0;
        }

        var calc = (parseFloat(quan) * parseFloat(pric));
        calc = calc.toFixed(2);

        document.getElementById("<%# Total.ClientID %>").innerHTML = numberWithCommas(calc);
        document.getElementById("<%# TotalCopy.ClientID %>").value = calc;
    }

    function ProjectBudgetCheck()
    {
        var requestDate = document.getElementById("<%# RequestDateCopy.ClientID %>").value;
        var ddlProject = document.getElementById("<%# ddlProject.ClientID %>");

        var hasSelected = ddlProject.selectedIndex > -1;

        var selectedValue = '';

        if (hasSelected) {
            selectedValue = ddlProject.options[ddlProject.selectedIndex].value;
        }

        ddlProject.options.length = 0;

        var lineItemAmount = document.getElementById("<%# Total.ClientID %>").innerHTML;

        if (lineItemAmount != "&nbsp;") {
            lineItemAmount = lineItemAmount.replace(/,/g, "");
        }

        lineItemAmount = parseFloat(lineItemAmount);
        
        $.ajax({
            type: "POST",
            data: '{ groupNum: <%= Requisition.GroupNum %>, transKeyLineNum: <%= RequestLineItem.TransKeyLineNum %>, idNum:<%= Convert.ToInt32(PortalUser.Current.HostID) %>, requestDate: "' + requestDate + '", amount: ' + lineItemAmount + ' }',
            dataType: "json",
            url: '<%# ResolveUrl("../WebService/ProjectWebService.asmx/GetProjects") %>',
            contentType: "application/json; charset=utf-8",
            success: function (data)
            {
                //add the new children
                $.each(data.d, function ()
                {
                    try {
                        ddlProject.add(new Option(this['Text'], this['Value']), null);  // standards compliant; doesn't work in IE
                    } catch (ex) {
                        ddlProject.add(new Option(this['Text'], this['Value']));    // IE only
                    }
                });
                ddlProject.selectedIndex = 0;

                if (hasSelected) {
                    setSelectedProject(ddlProject, selectedValue);
                    ShowSelectedProjectStatus();
                }
            },
            error: function (jqX, status, err)
            {
                //alert('Error: ' + jqX.responseText); 
            }
        });
    }

    function setSelectedProject(ddl, val)
    {
        var valSep = val.split(";");
        var projectCode = valSep[0];

        for (var i = 0; i < ddl.options.length; i++) {
            var dllSep = ddl.options[i].value.split(";");

            if (projectCode == dllSep[0]) {
                ddl.options[i].selected = true;
                return;
            }
        }
    }

    function ShowSelectedProjectStatus() {
        var ddlProject = document.getElementById("<%# ddlProject.ClientID %>");
        var selectedProject = ddlProject.options[ddlProject.selectedIndex].value;

        var separated = selectedProject.split(";");

        document.getElementById("<%# hiddenProjectCode.ClientID %>").value = separated[0];

        var overUnder = '';
        var projectStatus = '';

        if (separated[1] != '') {
            overUnder += separated[1];
        }

        if (separated[2] != '') {
            projectStatus = separated[2];
        }
    
        document.getElementById("<%# ProjectBudgetStatus.ClientID %>").innerHTML = projectStatus;

        if ('O' == overUnder) {
            document.getElementById("<%# ProjectUnderBudgetIcon.ClientID %>").style.display = "none";
            document.getElementById("<%# ProjectOverBudgetIcon.ClientID %>").style.display = "block";
        }
        else if ('U' == overUnder) {
            document.getElementById("<%# ProjectUnderBudgetIcon.ClientID %>").style.display = "block";
            document.getElementById("<%# ProjectOverBudgetIcon.ClientID %>").style.display = "none";
        }
        else
        {
            document.getElementById("<%# ProjectUnderBudgetIcon.ClientID %>").style.display = "none";
            document.getElementById("<%# ProjectOverBudgetIcon.ClientID %>").style.display = "none";
        }
    }

    function txtAcctCode_BudgetCheck(source, arguments)
    {
        BudgetCheck(source, arguments);
    }

    function BudgetCheck(source, validationArguments)
    {
        if ('<%# GLConfig.CallBudgetChecking %>' == 'True') {
            var isCustomValidator = false;
            if (arguments.length == 2) {
                isCustomValidator = true;
            }

            var accountCode = '';

            if (document.getElementById("<%# txtAcctCode.ClientID %>") != null) {
                accountCode = document.getElementById("<%# txtAcctCode.ClientID %>").value;
            }
            else {
                var ddlAccount = document.getElementById("<%# ddlAccount.ClientID %>");

                if (ddlAccount.selectedIndex > -1) {
                    accountCode = ddlAccount.options[ddlAccount.selectedIndex].value;
                }
            }

            var lineItemAmount = document.getElementById("<%# Total.ClientID %>").innerHTML;

            if (lineItemAmount != "&nbsp;") {
                lineItemAmount = lineItemAmount.replace(/,/g, "");
            }

            lineItemAmount = parseFloat(lineItemAmount);

            var requestDate = document.getElementById("<%# RequestDateCopy.ClientID %>").value;

            if ((requestDate == '') || (accountCode == '') || (lineItemAmount == 0)) {
                document.getElementById("<%# AccountBudgetStatus.ClientID %>").style.display = "none";
                document.getElementById("<%# UnderBudgetIcon.ClientID %>").style.display = "none";
                document.getElementById("<%# OverBudgetIcon.ClientID %>").style.display = "none";
                document.getElementById("<%# AdjustBudget.ClientID %>").style.display = "none";
                return;
            }

            $.ajax({
                type: "POST",
                async: !isCustomValidator,
                data: '{ groupNum: <%= Requisition.GroupNum %>, transKeyLineNum: <%= RequestLineItem.TransKeyLineNum %>, requestDate: "' + requestDate + '", accountCode: "' + accountCode + '", lineItemAmount: "' + lineItemAmount + '" }',
                dataType: "json",
                url: '<%# ResolveUrl("../WebService/LineItemBudgetCheckWebService.asmx/BudgetCheck") %>',
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    if (document.getElementById("<%# txtAcctCode.ClientID %>") != null) {
                        document.getElementById("<%# txtAcctCode.ClientID %>").value = data.d.AccountCode;
                    }

                    document.getElementById("<%# hiddenWorksheetID.ClientID %>").value = data.d.WorksheetID;
                    document.getElementById("<%# hiddenLineItemID.ClientID %>").value = data.d.LineItemID;

                    if (data.d.IsValid && ('<%# GLConfig.CallBudgetChecking %>' == 'True')) {
                        if (isCustomValidator) {
                            validationArguments.IsValid = true;
                        }

                        document.getElementById("<%# AccountBudgetStatus.ClientID %>").innerHTML = data.d.BudgetStatusDescription;
                        document.getElementById("<%# AccountBudgetStatus.ClientID %>").style.display = "block";

                        if (data.d.IsOverBudget) {
                            document.getElementById("<%# UnderBudgetIcon.ClientID %>").style.display = "none";
                            document.getElementById("<%# OverBudgetIcon.ClientID %>").style.display = "block";

                            document.getElementById("<%# AdjustBudget.ClientID %>").style.display = (data.d.WorksheetID > -1) ? "block" : "none";
                        }
                        else if (data.d.IsUnderBudget) {
                            document.getElementById("<%# UnderBudgetIcon.ClientID %>").style.display = "block";
                            document.getElementById("<%# OverBudgetIcon.ClientID %>").style.display = "none";
                            document.getElementById("<%# AdjustBudget.ClientID %>").style.display = "none";
                        }
                        else {
                            document.getElementById("<%# UnderBudgetIcon.ClientID %>").style.display = "none";
                            document.getElementById("<%# OverBudgetIcon.ClientID %>").style.display = "none";
                            document.getElementById("<%# AdjustBudget.ClientID %>").style.display = "none";
                        }
                    }
                    else if (!data.d.IsValid) {
                        if (isCustomValidator) {
                            validationArguments.IsValid = false;
                            source.innerHTML = data.d.ErrorText;
                            document.getElementById("<%# AccountBudgetStatus.ClientID %>").style.display = "none";
                        }
                        else {
                            document.getElementById("<%# AccountBudgetStatus.ClientID %>").innerHTML = data.d.BudgetStatusDescription;
                            document.getElementById("<%# AccountBudgetStatus.ClientID %>").style.display = "block";
                        }

                        document.getElementById("<%# UnderBudgetIcon.ClientID %>").style.display = "none";
                        document.getElementById("<%# OverBudgetIcon.ClientID %>").style.display = "none";
                        document.getElementById("<%# AdjustBudget.ClientID %>").style.display = "none";
                    }
                },
                error: function (jqX, status, err) {
                    //alert('Error: ' + jqX.responseText); 
                }
            });
        }
    }

    function GetAcctInfo(strCtlNum, hdnCtlIdNumID)
    {
        document.getElementById(hdnCtlIdNumID).value = strCtlNum; 
        var url = '<%= Request.ApplicationPath %>/Portlets/<%= ParentPortlet.PortletDisplay.PortletTemplate.Application.BasePath %>/Staff/Portlet.RequisitionsAndOrders/Controls/AccountLookup.aspx';
 
        mywindow = open(url, "RequisitionsAndOrders", config = 'height=550, width=750, location=no, menubar=no, status=no, toolbar=no, scrollbars=yes, resizable=yes');
        
        if (mywindow.opener == null) 
        {
            mywindow.opener = self; 
        }

        return false;
    }

    function setAccountID(acctID)
    {
        var myCtl = document.getElementById("<%# hdnCtlIdNum.ClientID %>").value;
        document.getElementById(myCtl).value = acctID;
        document.getElementById(myCtl).focus();
        BudgetCheck();
    }
</script>
