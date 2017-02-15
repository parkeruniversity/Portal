<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RequestAndOrderSearchView.ascx.cs"
    Inherits="Portlet.RequisitionsAndOrders.Views.RequestAndOrderSearchView" %>
<%@ Register TagPrefix="jenzabar" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register TagPrefix="vs" TagName="VendorSearch" Src="~/Portlets/CRM/Staff/Portlet.RequisitionsAndOrders/Controls/VendorSearchControl.ascx" %>
<%@ Register TagPrefix="at" TagName="ApprovalTrack" Src="~/Portlets/CRM/Staff/Portlet.RequisitionsAndOrders/Controls/ApprovalTrackControl.ascx" %>
<table class="ROLayoutTable">
    <tr>
        <td class="ROHeaderInstructions">
            <div class="ROFloatLeft ROMarginTop10">
                <span class="ROInformativeText ROMarginLeft">You may search using single or multiple criteria. The
                    more search criteria you choose, the more specific the returned results will be.</span>
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <table class="ROMarginLeft ROMarginTop10 ROSectionMarginBottom">
                <tr>
                    <td>
                        <span class="ROInformativeText">Requisition number</span>
                    </td>
                    <td>
                        <span class="ROInformativeText ROMarginLeft">Requisition name includes</span>
                    </td>
                    <td>
                        <span class="ROInformativeText ROMarginLeft">Requested item text includes</span>
                    </td>
                    <td>
                        <span class="ROInformativeText ROMarginLeft">Status</span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <ajaxToolkit:FilteredTextBoxExtender ID="ReqNumberFilter" runat="server" TargetControlID="ReqNumber"
                            FilterType="Numbers" FilterMode="ValidChars" />
                        <asp:TextBox ID="ReqNumber" runat="server" MaxLength="9" CssClass="RORight" />
                    </td>
                    <td>
                        <asp:TextBox CssClass="ROMarginLeft" ID="ReqName" runat="server" MaxLength="40" />
                    </td>
                    <td>
                        <asp:TextBox CssClass="ROMarginLeft" ID="ReqText" runat="server" MaxLength="40" />
                    </td>
                    <td>
                        <asp:DropDownList ID="Status" CssClass="ROMarginLeft RODropDownMinWidth" runat="server"
                            DataValueField="Key" DataTextField="Value" AutoPostBack="false" />
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
                        <span class="ROInformativeText">Budget account</span>
                    </td>
                    <td>
                        <span class="ROInformativeText ROMarginLeft">Project code</span>
                    </td>
                </tr>
                <tr>
                     <td>
                        <asp:DropDownList ID="Account" runat="server" DataValueField="Key" DataTextField="Value"
                           CssClass="RODropDownMinWidth" AutoPostBack="false" />
                    </td>
                    <td>
                        <asp:DropDownList ID="Project" runat="server" DataValueField="Key"
                            DataTextField="Value" CssClass="ROMarginLeft RODropDownMinWidth" AutoPostBack="false" />
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
                        <span class="ROInformativeText">Request date after</span>
                    </td>
                    <td>
                    </td>
                    <td>
                        <span class="ROInformativeText">Amount over</span>
                    </td>
                    <td>
                        <span class="ROInformativeText ROMarginLeft">Approval track</span>
                    </td>
                </tr>
                <tr>
                   
                    <td>
                        <jenzabar:DatePicker ID="RequestDate" runat="server" />
                    </td>
                    <td>
                        <span class="ROInformativeText ROMarginRight ROMarginLeft">$</span>
                    </td>
                    <td>
                        <ajaxToolkit:FilteredTextBoxExtender ID="AmountFilter" runat="server" TargetControlID="Amount"
                            FilterType="Numbers, Custom" ValidChars=".," FilterMode="ValidChars" />
                        <asp:TextBox ID="Amount" runat="server" MaxLength="16" CssClass="RORight" />
                    </td>
                    <td>
                        <asp:DropDownList ID="ApprovalTrack" runat="server" DataValueField="Key" DataTextField="Value"
                            AutoPostBack="false" CssClass="ROMarginLeft" />
                    </td>
                </tr>
            </table>
            <table class="ROMarginLeft ROSectionMarginBottom">
                <tr>
                    <td>
                        <span class="ROInformativeText">Vendor</span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <ajaxToolkit:FilteredTextBoxExtender ID="VendorFilter" runat="server" TargetControlID="Vendor"
                            FilterType="Numbers" FilterMode="ValidChars" />
                        <asp:TextBox ID="Vendor" runat="server" MaxLength="10" CssClass="ROFloatLeft ROMarginRight RORight" />
                        <asp:Label ID="VendorNotFound" runat="server" CssClass="ROFloatLeft ROErrorText ROMarginTop"
                            Text="No match found." Style="display: none" />
                        <asp:LinkButton ID="SearchVendor" CssClass="ROFloatLeft ROInformativeLink" Text="Search"
                            runat="server" />
                    </td>
                </tr>                    
                <tr>
                    <td>
                        <asp:Label ID="VendorName" CssClass="ROInformativeText" runat="server" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <table class="ROGreyButtonBox ROStretchWidth RONoMarginPadding">
                <tr class="RONoMarginPadding">
                    <td class="ROBlueButtonBox">
                        <asp:Button ID="btnSearch" CssClass="ROFloatLeft ROMarginLeft "
                            Text="Search" OnClick="btnSearch_Click" runat="server" />
                    </td>
                    <td class="ROPadding5 ROStretchWidth">
                        <asp:Button ID="btnNewSearch" CssClass="ROFloatLeft ROMarginLeft " Text="Clear search" OnClick="btnNewSearch_Click"
                            runat="server" />
                        <asp:LinkButton ID="btnCancel" Text="Cancel, go back" OnClick="btnCancel_Click" CssClass="ROFloatRight"
                            runat="server" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <div class="ROMarginPadding">
                <asp:Label ID="lblSearchResults" Visible="false" runat="server" />
                <asp:GridView ID="gvSearchResults" runat="server" AutoGenerateColumns="false" CellPadding="4"
                    GridLines="None" CssClass="ROGridView" AlternatingRowStyle-CssClass="alt" DataKeyNames="SEQ_NUM"
                    AllowSorting="true" OnSorting="gvSearchResults_Sorting" OnRowCreated="gvSearchResults_RowCreated"
                    OnRowDataBound="gvSearchResults_RowDataBound">
                    <Columns>
                        <asp:TemplateField HeaderText="Requisition Description" HeaderStyle-HorizontalAlign="Left"
                            SortExpression="ReqTextNum">
                            <ItemTemplate>
                                <asp:LinkButton ID="OpenReqLink" runat="server" Text='<%# Eval("ReqTextNum") %>'
                                    CommandArgument='<%# Eval("GRP_NUM") %>' OnClick="OpenReqLink_Click" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Amount" HeaderText="Amount" DataFormatString="{0:C2}"
                            ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Left" SortExpression="Amount" />
                        <asp:BoundField DataField="VendorName" HeaderText="Vendor" HeaderStyle-HorizontalAlign="Left"
                            SortExpression="VendorName" />
                        <asp:TemplateField HeaderText="Budget Status" HeaderStyle-HorizontalAlign="Left"
                            SortExpression="BudgetStatusDescription">
                            <ItemTemplate>
                                <asp:Image ID="BudgetStatusIcon" ImageUrl='<%# DeriveBudgetStatusIcon(Eval("BudgetStatus")) %>'
                                    runat="server" />
                                <span>
                                    <%# Eval("BudgetStatusDescription")%></span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="StatusText" HeaderText="Request Status" HeaderStyle-HorizontalAlign="Left"
                            SortExpression="StatusText" />
                        <asp:TemplateField HeaderText="Under Review By" HeaderStyle-HorizontalAlign="Left"
                            SortExpression="UnderReviewBy">
                            <ItemTemplate>
                                <asp:Label ID="NotUnderReview" runat="server" />

                                <div id="Approver" runat="server">
                                    <div id="AlternateApprover" class="ROFloatLeft" runat="server">
                                        <asp:ImageButton runat="server" ImageUrl='<%# GetEmailIcon()%>' CssClass="ROFloatLeft ROMarginRight"
                                            CommandArgument='<%# Eval("AltApproverNameMasterID") + ";" + Eval( "ReqTextNum")%>'
                                            OnClick="EmailIconApprover_Click" />
                                        <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# Eval("AltApproverName") %>' CssClass="ROFloatLeft ROMarginRight"
                                            CommandArgument='<%# Eval("AltApproverNameMasterID") + ";" + Eval("ReqTextNum")%>'
                                            OnClick="EmailApprover_Click" /><span class="ROInformativeText ROFloatLeft ROMarginRight">for</span>
                                    </div>
                                    <asp:ImageButton runat="server" ImageUrl='<%# GetEmailIcon()%>' CssClass="ROFloatLeft ROMarginRight"
                                        CommandArgument='<%# Eval("ApproverNameMasterID") + ";" + Eval( "ReqTextNum")%>'
                                        OnClick="EmailIconApprover_Click" />
                                    <asp:LinkButton ID="EmailApproverLink" runat="server" Text='<%# Eval("ApproverName") %>'
                                        CssClass="ROFloatLeft" CommandArgument='<%# Eval("ApproverNameMasterID") + ";" + Eval( "ReqTextNum")%>'
                                        OnClick="EmailApprover_Click" />
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Track" HeaderStyle-HorizontalAlign="Left">
                            <ItemTemplate>
                                <asp:ImageButton ID="ViewTrack" CommandArgument='<%# Eval("GRP_NUM") %>' runat="server" OnCommand="viewTrack_Command" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="PO Description" HeaderStyle-HorizontalAlign="Left"
                            SortExpression="RefTextNum">
                            <ItemTemplate>
                                <asp:Label ID="PODescription" runat="server" Text='<%# Eval("RefTextNum") %>' />
                                <asp:LinkButton ID="OpenPOLink" runat="server" Text='<%# Eval("RefTextNum") %>'
                                    CommandArgument='<%# Eval("PO_GRP_NUM") %>' OnClick="OpenPOLink_Click" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="PO" HeaderStyle-HorizontalAlign="Left">
                            <ItemTemplate>
                                <asp:HyperLink ID="hlViewPO" runat="server" Target="_blank">
                                    <asp:Image ID="ViewPOIcon" runat="server" />
                                </asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle CssClass="ROGridViewHeader" />
                </asp:GridView>

                
                <asp:Button ID="btnApprovalTrackPopup" runat="server" Style="display: none" />
                <ajaxToolkit:ModalPopupExtender ID="ApprovalTrackPopup" runat="server" TargetControlID="btnApprovalTrackPopup" PopupControlID="approvalTrackModal" 
                    PopupDragHandleControlID="approvalTrackModalHeader" BackgroundCssClass="ROModalPopup" BehaviorID="ApprovalTrackPopupBehaviorID" />
                <div id="approvalTrackModal" runat="server" class="ROModalDiv">
                    <div class="ROInnerModal">
                        <div id="approvalTrackModalHeader" class="ROModalHeading">
                            <asp:Label ID="Label1" runat="server" CssClass="ROHeaderText" Text="Approval Track Details" />
                            <asp:ImageButton runat="server" CssClass="ROModalHeadingImg" ImageUrl="<%# GetCloseIcon() %>"
                                OnClientClick="$find('ApprovalTrackPopupBehaviorID').hide(); return false;" />
                        </div>
                        <div>
                            <at:ApprovalTrack ID="approvalTrackControl" runat="server" ModalBehaviorID="ApprovalTrackPopupBehaviorID" />
                        </div>
                    </div>
                </div>

                <ajaxToolkit:ModalPopupExtender ID="VendorSearchPopup" runat="server" TargetControlID="SearchVendor" PopupControlID="vendorSearchModal" 
                    PopupDragHandleControlID="vendorSearchModalHeader" BackgroundCssClass="ROModalPopup" BehaviorID="VendorSearchPopupBehaviorID" />
                <div id="vendorSearchModal" runat="server" class="ROModalDiv">
                    <div class="ROInnerModal">
                        <div id="vendorSearchModalHeader" class="ROModalHeading">
                            <asp:Label ID="Label2" runat="server" CssClass="ROHeaderText" Text="Vendor Search" />
                            <asp:ImageButton ID="ImageButton2" runat="server" CssClass="ROModalHeadingImg" ImageUrl="<%# GetCloseIcon() %>"
                                OnClientClick="$find('VendorSearchPopupBehaviorID').hide(); return false;" />
                        </div>
                        <div>
                            <vs:VendorSearch ID="vendorSearchControl" runat="server" ModalBehaviorID="VendorSearchPopupBehaviorID" VendorID="<%# Vendor.ClientID %>" VendorNameID="<%# VendorName.ClientID %>" />
                        </div>
                    </div>
                </div>
            </div>
        </td>
    </tr>
</table>
<script language="javascript" type="text/javascript">

    function GetVendor()
    {
        var vendorIdNum = document.getElementById("<%# Vendor.ClientID %>").value;

        if (vendorIdNum == '') {
            document.getElementById("<%# VendorName.ClientID %>").innerHTML = '';
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
                document.getElementById("<%# VendorNotFound.ClientID %>").style.display = (vendor == null) ? 'block' : 'none';
                document.getElementById("<%# VendorName.ClientID %>").innerHTML = (vendor == null) ? '' : vendor.Name;
            },
            error: function (jqX, status, err)
            {
                alert('Error: ' + jqX.responseText);
            }
        });
    }
</script>
