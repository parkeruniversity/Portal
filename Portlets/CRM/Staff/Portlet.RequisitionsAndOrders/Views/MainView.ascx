<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MainView.ascx.cs" Inherits="Portlet.RequisitionsAndOrders.Views.MainView" %>
<%@ Import Namespace="EX.Data" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<script language="javascript" type="text/javascript">    function initIETOC() { }; function resizeTheDiv() { }</script>
<div class="pSection" id="divHint" visible="False" runat="server">
    <cmn:Hint ID="lblHint" runat="server" />
</div>
<table id="content" runat="server" class="ROLayoutTable">
    <tr>
        <td>
            <table class="ROLayoutTable">
                <tr>
                    <td colspan="2">
                        <table class="ROLayoutTable">
                            <tr>
                                <td>
                                    <div id="OrderSummaryBox" class="ROOrderSummaryBox" runat="server">
                                        <table>
                                            <tr>
                                                <td>
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <img src="<%=GetCartIconPath()%>" alt="Cart" />
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="OrderSummary" runat="server" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:LinkButton ID="SearchReqsLink" runat="server" Text='Search your requisitions'
                                                        OnClick="SearchReqsLink_Click" CssClass="ROOrderSummaryLink" />
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </td>
                                <td class="RORight">
                                    <table>
                                        <tr>
                                            <td class="ROInformativeHeaderText">
                                                When you need to order something,
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <img src="<%=GetAddIconPath()%>" alt="Cart" class="ROFloatLeft"/>
                                                <asp:LinkButton ID="MakeNewRequestLink" runat="server" Text='Make new request' OnClick="MakeNewRequestLink_Click"
                                                    CssClass="ROFloatLeft ROOrderSummaryLink" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="ROVerticalAlignTop">
                        <table class="ROLayoutTable">
                            <tr>
                                <td id="UnsubmittedBox" runat="server">
                                    <div class="SectionBox">
                                        <table class="ROCellPadding">
                                            <asp:Repeater ID="rUnsubmitted" runat="server" OnItemDataBound="rUnsubmitted_ItemDataBound">
                                                <HeaderTemplate>
                                                    <tr>
                                                        <td colspan="3" class="ROVerticalAlignCenter">
                                                            <img src='<%# GetUnsubmittedIcon() %>' alt="Unsubmitted" class="ROFloatLeft ROMarginRight"
                                                                runat="server" /><span class="ROFloatLeft ROMarginTop ROVerticalAlignCenter ROInformativeHeaderText">Unsubmitted</span>
                                                        </td>
                                                    </tr>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr>
                                                        <td>
                                                            <asp:LinkButton ID="lnkUnsubmittedReq" runat="server" Text='<%# Eval("ReqTextNum") %>'
                                                                CommandArgument='<%# Eval("GroupNum") %>' CssClass="ROHeaderLink" OnClick="lnkUnsubmittedReq_Click" />
                                                        </td>
                                                        <td class="ROInformativeText">
                                                            <%# Eval("Amount", "{0:C2}")%>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="UnsubmittedActionText" Text='<%# Eval("ActionDate", "{0:C2}")%>'
                                                                CssClass="ROInformativeText" runat="server" />
                                                            <asp:Repeater ID="rUnsubmittedApproversRepeater" DataSource='<%# Eval("ApprovalTrackDetails") %>'
                                                                OnItemDataBound="rUnsubmittedApproversRepeater_ItemDataBound" runat="server">
                                                                <ItemTemplate>
                                                                    <div id="UnsubmittedApproversHeader" class="ROFloatLeft" runat="server">
                                                                        <asp:Label ID="UnsubmittedApproversHeaderLabel" CssClass="ROFloatLeft ROMarginRight"
                                                                            runat="server" /><span class="ROFloatLeft ROMarginRight ROInformativeText">Changes requested
                                                                                by</span>
                                                                    </div>
                                                                    <div id="UnsubmittedAlternateApprover" class="ROFloatLeft" runat="server">                                                                        
                                                                        <asp:ImageButton CssClass="ROFloatLeft ROMarginRight" OnClick="EmailIconApprover_Click"
                                                                            ImageUrl='<%# GetEmailIcon()%>' CommandArgument='<%# Eval("AltApproverIdNum") + ";" + DataBinder.Eval(Container.Parent.Parent, "DataItem.ReqTextNum")%>'
                                                                            runat="server" />
                                                                        <asp:LinkButton runat="server" Text='<%# Eval("AltApproverName") %>'
                                                                            CssClass="ROFloatLeft ROMarginRight" 
                                                                            CommandArgument='<%# Eval("AltApproverIdNum") + ";" + DataBinder.Eval(Container.Parent.Parent, "DataItem.ReqTextNum")%>'
                                                                            OnClick="EmailApprover_Click" /><span class="ROInformativeText ROFloatLeft ROMarginRight">for</span>
                                                                    </div>
                                                                    <asp:ImageButton CssClass="ROFloatLeft ROMarginRight" OnClick="EmailIconApprover_Click"
                                                                        ImageUrl='<%# GetEmailIcon()%>' CommandArgument='<%# Eval("ApproverIdNum") + ";" + DataBinder.Eval(Container.Parent.Parent, "DataItem.ReqTextNum")%>'
                                                                        runat="server" />
                                                                    <asp:LinkButton ID="SUEmailApproverLink" runat="server" Text='<%# Eval("ApproverName") %>'
                                                                        CssClass="ROFloatLeft" CommandArgument='<%# Eval("ApproverIdNum") + ";" + DataBinder.Eval(Container.Parent.Parent, "DataItem.ReqTextNum")%>'
                                                                        OnClick="EmailApprover_Click" />
                                                                </ItemTemplate>
                                                            </asp:Repeater>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                       <td colspan="2">
                                                           <asp:Image ID="BudgetStatusIcon" Visible='<%# IsBudgetStatusIconVisible(Eval("BudgetStatus")) %>'
                                                               ImageUrl='<%# DeriveBudgetStatusIcon(Eval("BudgetStatus")) %>' runat="server" />
                                                           <asp:Label runat="server" Visible="<%# GLConfig.CallBudgetChecking %>" Text='<%# Eval("BudgetStatusDescription")%>' />
                                                       </td>
                                                       <td>
                                                           <asp:HyperLink ID="btnReqShowExpiredMessagePopup" Text='<%# Eval("ActionText") %>'
                                                               CssClass="ROHoverBlackLink" NavigateUrl="javascript:ShowExpiredMessagePopup()"
                                                               runat="server" />
                                                           <asp:LinkButton ID="lnkUnsubmittedAction" runat="server" Text='<%# Eval("ActionText") %>'
                                                               CommandArgument='<%# Eval("GroupNum") %>' OnClick="lnkUnsubmittedReq_Click" />
                                                       </td>
                                                    </tr>
                                                </ItemTemplate>
                                                <SeparatorTemplate>
                                                    <tr>
                                                        <td colspan="3">
                                                            <div class="ROSeparator" />
                                                        </td>
                                                    </tr>
                                                </SeparatorTemplate>
                                            </asp:Repeater>
                                        </table>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td id="ApprovedNotPOBox" runat="server">
                                    <div class="SectionBox">
                                        <table class="ROCellPadding">
                                            <asp:Repeater ID="rApprovedNotPO" runat="server">
                                                <HeaderTemplate>
                                                    <tr>
                                                        <td colspan="3" class="ROVerticalAlignCenter">
                                                            <img src='<%# GetApprovedNotPOIcon() %>' alt="Requisition approved, not a purchase order"
                                                                class="ROFloatLeft ROMarginRight" runat="server" /><span class="ROFloatLeft ROMarginTop ROVerticalAlignCenter ROInformativeHeaderText">Requisition
                                                                    approved, not a purchase order</span>
                                                        </td>
                                                    </tr>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr>
                                                        <td>
                                                            <asp:LinkButton runat="server" Text='<%# Eval("ReqTextNum") %>'
                                                                CommandArgument='<%# Eval("GroupNum") %>' CssClass="ROHeaderLink" OnClick="ViewRequest_Click" />
                                                        </td>
                                                        <td>
                                                            <%# Eval("Amount", "{0:C2}")%>
                                                        </td>
                                                        <td class="ROInformativeText">
                                                            <%# Eval("ActionDate", "{0:C2}")%>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="3">
                                                            <asp:Repeater ID="rApprovedNotPOApproversRepeater" DataSource='<%# Eval("ApprovalTrackDetails") %>'
                                                                OnItemDataBound="rApprovedNotPOApproversRepeater_ItemDataBound" runat="server">
                                                                <ItemTemplate>
                                                                    <div id="ApprovedNotPOApproversHeader" class="ROFloatLeft" runat="server">
                                                                        <asp:Label ID="ApprovedNotPOApproversHeaderLabel" CssClass="ROFloatLeft ROMarginRight ROInformativeText"
                                                                            runat="server" Text="Approved by" />
                                                                    </div>
                                                                    <div id="AndClause" class="ROFloatLeft" runat="server">
                                                                        <span class="ROInformativeText ROFloatLeft ROMarginRight">and</span>
                                                                    </div>
                                                                    <asp:ImageButton CssClass="ROFloatLeft ROMarginRight" OnClick="EmailIconApprover_Click"
                                                                        ImageUrl='<%# GetEmailIcon()%>' CommandArgument='<%# Eval("ApproverIdNum") + ";" + DataBinder.Eval(Container.Parent.Parent, "DataItem.ReqTextNum")%>'
                                                                        runat="server" />
                                                                    <asp:LinkButton ID="ANPOEmailApproverLink" runat="server" Text='<%# Eval("ApproverName") %>'
                                                                        CssClass="ROFloatLeft" CommandArgument='<%# Eval("ApproverIdNum") + ";" + DataBinder.Eval(Container.Parent.Parent, "DataItem.ReqTextNum")%>'
                                                                        OnClick="EmailApprover_Click" />
                                                                </ItemTemplate>
                                                                <SeparatorTemplate>
                                                                    <div class="ROFloatLeft ROMarginRight ROInformativeText">
                                                                        ,</div>
                                                                </SeparatorTemplate>
                                                            </asp:Repeater>
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                                <SeparatorTemplate>
                                                    <tr>
                                                        <td colspan="3">
                                                            <div class="ROSeparator" />
                                                        </td>
                                                    </tr>
                                                </SeparatorTemplate>
                                            </asp:Repeater>
                                        </table>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td class="ROVerticalAlignTop">
                        <table class="ROLayoutTable">
                            <tr>
                                <td id="RecentlyDeniedBox" runat="server">
                                    <div class="SectionBox">
                                        <table class="ROCellPadding">
                                            <asp:Repeater ID="rRecentlyDenied" runat="server">
                                                <HeaderTemplate>
                                                    <tr>
                                                        <td colspan="3" class="ROVerticalAlignCenter">
                                                            <img src='<%# GetRecentlyDeniedIcon() %>' alt="Recently Denied" class="ROFloatLeft ROMarginRight"
                                                                runat="server" /><span class="ROFloatLeft ROMarginTop ROVerticalAlignCenter ROInformativeHeaderText">Recently
                                                                    Denied</span>
                                                        </td>
                                                    </tr>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr>
                                                        <td>
                                                            <asp:LinkButton runat="server" Text='<%# Eval("ReqTextNum") %>' CommandArgument='<%# Eval("GroupNum") %>'
                                                                CssClass="ROHeaderLink" OnClick="ViewRequest_Click" />
                                                        </td>
                                                        <td>
                                                            <%# Eval("Amount", "{0:C2}")%>
                                                        </td>
                                                        <td>
                                                            <%# Eval("ActionDate", "{0:C2}")%>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="3">
                                                            <asp:Repeater ID="rRecentlyDeniedApproversRepeater" DataSource='<%# Eval("ApprovalTrackDetails") %>'
                                                                OnItemDataBound="rRecentlyDeniedApproversRepeater_ItemDataBound" runat="server">
                                                                <ItemTemplate>
                                                                    <div id="RecentlyDeniedApproversHeader" class="ROFloatLeft" runat="server">
                                                                        <asp:Label ID="RecentlyDeniedApproversHeaderLabel" CssClass="ROFloatLeft ROMarginRight"
                                                                            runat="server" /><span class="ROFloatLeft ROMarginRight ROInformativeText"> by</span>
                                                                    </div>
                                                                    <div id="ButDenied" class="ROFloatLeft" runat="server">
                                                                        <span class="ROInformativeText ROFloatLeft ROMarginRight">but</span><span class="ROInformativeRedText ROFloatLeft ROMarginRight">denied</span><span
                                                                            class="ROInformativeText ROFloatLeft ROMarginRight">by</span>
                                                                    </div>
                                                                    <asp:ImageButton CssClass="ROFloatLeft ROMarginRight" OnClick="EmailIconApprover_Click"
                                                                        ImageUrl='<%# GetEmailIcon()%>' CommandArgument='<%# Eval("ApproverIdNum") + ";" + DataBinder.Eval(Container.Parent.Parent, "DataItem.ReqTextNum")%>'
                                                                        runat="server" />                                                   
                                                                    <asp:LinkButton ID="RDEmailApproverLink" runat="server" Text='<%# Eval("ApproverName") %>'
                                                                        CssClass="ROFloatLeft" CommandArgument='<%# Eval("ApproverIdNum") + ";" + DataBinder.Eval(Container.Parent.Parent, "DataItem.ReqTextNum")%>'
                                                                        OnClick="EmailApprover_Click" />
                                                                </ItemTemplate>
                                                                <SeparatorTemplate>
                                                                    <div class="ROFloatLeft ROMarginRight ROInformativeText">
                                                                        ,</div>
                                                                </SeparatorTemplate>
                                                            </asp:Repeater>
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                                <SeparatorTemplate>
                                                    <tr>
                                                        <td colspan="3">
                                                            <div class="ROSeparator" />
                                                        </td>
                                                    </tr>
                                                </SeparatorTemplate>
                                            </asp:Repeater>
                                        </table>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td id="PendingApprovalBox" runat="server">
                                    <div class="SectionBox">
                                        <table class="ROCellPadding">
                                            <asp:Repeater ID="rPendingApproval" runat="server">
                                                <HeaderTemplate>
                                                    <tr>
                                                        <td colspan="3" class="ROVerticalAlignCenter">
                                                            <img src='<%# GetPendingApprovalIcon() %>' alt="Pending Approval" class="ROFloatLeft ROMarginRight"
                                                                runat="server" /><span class="ROFloatLeft ROMarginTop ROVerticalAlignCenter ROInformativeHeaderText">Pending
                                                                    Approval</span>
                                                        </td>
                                                    </tr>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr>
                                                        <td>
                                                            <asp:LinkButton runat="server" Text='<%# Eval("ReqTextNum") %>'
                                                                CommandArgument='<%# Eval("GroupNum") %>' CssClass="ROHeaderLink" OnClick="ViewRequest_Click" />
                                                        </td>
                                                        <td>
                                                            <%# Eval("Amount", "{0:C2}")%>
                                                        </td>
                                                        <td>
                                                            <%# Eval("ActionDate", "{0:C2}")%>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="3">
                                                            <asp:Repeater ID="rPendingApproversRepeater" DataSource='<%# Eval("ApprovalTrackDetails") %>'
                                                                OnItemDataBound="rPendingApproversRepeater_ItemDataBound" runat="server">
                                                                <ItemTemplate>
                                                                    <div id="PendingApproversHeader" class="ROFloatLeft" runat="server">
                                                                        <asp:Label ID="PendingApproversHeaderLabel" CssClass="ROFloatLeft ROMarginRight ROInformativeText"
                                                                            runat="server" />
                                                                    </div>
                                                                    <div id="PendingClause" class="ROFloatLeft" runat="server">
                                                                        <span class="ROInformativeText ROFloatLeft ROMarginRight">pending</span>
                                                                    </div>
                                                                    <div id="AndClause" class="ROFloatLeft" runat="server">
                                                                        <span class="ROInformativeText ROFloatLeft ROMarginRight">and</span>
                                                                    </div>
                                                                    <div id="PendingAlternateApprover" class="ROFloatLeft" runat="server">
                                                                        <asp:ImageButton CssClass="ROFloatLeft ROMarginRight" OnClick="EmailIconApprover_Click"
                                                                            ImageUrl='<%# GetEmailIcon()%>' CommandArgument='<%# Eval("AltApproverIdNum") + ";" + DataBinder.Eval(Container.Parent.Parent, "DataItem.ReqTextNum")%>'
                                                                            runat="server" />
                                                                        <asp:LinkButton ID="PAEmailAltApproverLink" runat="server" Text='<%# Eval("AltApproverName") %>'
                                                                            CssClass="ROFloatLeft ROMarginRight" CommandArgument='<%# Eval("AltApproverIdNum") + ";" + DataBinder.Eval(Container.Parent.Parent, "DataItem.ReqTextNum")%>'
                                                                            OnClick="EmailApprover_Click" /><span class="ROInformativeText ROFloatLeft ROMarginRight">for</span>
                                                                    </div>
                                                                    <asp:ImageButton CssClass="ROFloatLeft ROMarginRight" OnClick="EmailIconApprover_Click"
                                                                        ImageUrl='<%# GetEmailIcon()%>' CommandArgument='<%# Eval("ApproverIdNum") + ";" + DataBinder.Eval(Container.Parent.Parent, "DataItem.ReqTextNum")%>'
                                                                        runat="server" />
                                                                    <asp:LinkButton ID="PAEmailApproverLink" runat="server" Text='<%# Eval("ApproverName") %>'
                                                                        CssClass="ROFloatLeft" CommandArgument='<%# Eval("ApproverIdNum") + ";" + DataBinder.Eval(Container.Parent.Parent, "DataItem.ReqTextNum")%>'
                                                                        OnClick="EmailApprover_Click" />
                                                                </ItemTemplate>
                                                                <SeparatorTemplate>
                                                                    <div class="ROFloatLeft ROMarginRight ROInformativeText">
                                                                        ,</div>
                                                                </SeparatorTemplate>
                                                            </asp:Repeater>
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                                <SeparatorTemplate>
                                                    <tr>
                                                        <td colspan="3">
                                                            <div class="ROSeparator" />
                                                        </td>
                                                    </tr>
                                                </SeparatorTemplate>
                                            </asp:Repeater>
                                        </table>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div class="ROMarginPadding">
                            <asp:Label ID="lblPOsActionNeeded" CssClass="ROInformativeHeaderText"
                                runat="server" Text="Purchase Orders - action needed" /><br />
                            <asp:GridView ID="gvPOsActionNeeded" runat="server" AutoGenerateColumns="false" CellPadding="4"
                                GridLines="None" CssClass="ROGridView" AlternatingRowStyle-CssClass="alt" DataKeyNames="GRP_NUM"
                                AllowSorting="true" OnSorting="POsActionNeededs_Sorting" OnRowCreated="gvPOsActionNeeded_RowCreated"
                                OnRowDataBound="gvPOsActionNeeded_RowDataBound">
                                <Columns>
                                    <asp:TemplateField HeaderText="Order Name" HeaderStyle-HorizontalAlign="Left" SortExpression="RefTextNum">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="POActionNeededLink" runat="server" Text='<%# Eval("RefTextNum") %>'
                                                CommandArgument='<%# Eval("GRP_NUM") %>' OnClick="POActionNeeded_Click" CssClass="ROHoverBlackLink" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Amount" HeaderText="Amount" DataFormatString="{0:C2}"
                                        ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Left" SortExpression="Amount" />
                                    <asp:BoundField DataField="VendorName" HeaderText="Vendor"
                                        HeaderStyle-HorizontalAlign="Left" SortExpression="VendorName" />
                                    <asp:TemplateField HeaderText="Budget Status" HeaderStyle-HorizontalAlign="Left"
                                        SortExpression="BudgetStatus">
                                        <ItemTemplate>
                                            <asp:Image ID="BudgetStatusIcon" Visible='<%# IsBudgetStatusIconVisible(Eval("BudgetStatus")) %>'
                                                ImageUrl='<%# DeriveBudgetStatusIcon(Eval("BudgetStatus")) %>' runat="server" />
                                            <span><%# Eval("BudgetStatusDescription")%></span> 
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Purchase Order Date" HeaderStyle-HorizontalAlign="Left"
                                        SortExpression="PO_DTE">
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# DerivePurchaseOrderDateText(Eval("PO_DTE"))%>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Action" HeaderStyle-HorizontalAlign="Left" SortExpression="ActionText">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="YourActionDetailLink" runat="server" Text='<%# Eval("ActionText") %>'
                                                CommandArgument='<%# Eval("GRP_NUM") %>' OnClick="POActionNeeded_Click" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <HeaderStyle CssClass="ROGridViewHeader" />
                            </asp:GridView>
                        </div>

                        <asp:Button ID="btnExpiredMessagePopup" runat="server" Style="display: none" />
                        <ajaxtoolkit:modalpopupextender id="ExpiredMessagePopup" behaviorid="ExpiredMessagePopup"
                            runat="server" targetcontrolid="btnExpiredMessagePopup" popupcontrolid="_divExpiredMessageModal"
                            popupdraghandlecontrolid="ExpiredMessageModalHeader"
                            backgroundcssclass="ROModalPopup" />
                        <div id="_divExpiredMessageModal" runat="server" class="ROModalDiv ROMessageWidthHeight"
                            style="display: none;">
                            <div class="ROInnerModal">
                                <div id="ExpiredMessageModalHeader" class="ROModalHeading">
                                    <asp:ImageButton ID="_imgExpiredMessageClose" CssClass="ROModalHeadingImg" runat="server" />
                                    <asp:Label ID="_lblExpiredMessageHeading" CssClass="ROHeaderText" Text="Action needed"
                                        runat="server" />
                                </div>
                                <asp:Label Text="This item was created in the prior fiscal year and related budget information may be inaccurate. Contact your Business Office to resolve."
                                    runat="server" />
                                <div class="ROModalButtons">
                                    <asp:Button ID="_btnExpiredMessageClose" Text="Close" runat="server" UseSubmitBehavior="false" />
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

<script type="text/javascript">
    function ShowExpiredMessagePopup() {
        $find('ExpiredMessagePopup').show();
    }
</script>
