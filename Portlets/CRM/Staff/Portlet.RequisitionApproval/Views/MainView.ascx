<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MainView.ascx.cs" Inherits="Portlet.RequisitionApproval.Views.MainView" %>
<%@ Import Namespace="Jenzabar.CRM.Staff.Web.Portlets.RequisitionApproval" %>
<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register TagPrefix="at" TagName="ApprovalTrack" Src="~/Portlets/CRM/Staff/Portlet.RequisitionsAndOrders/Controls/ApprovalTrackControl.ascx" %>

<style type="text/css">
    #RAMainView
    {
        margin: 10px;
    }
    
    .RAMainViewGrid
    {
       margin-top: 20px;
    }

    .RAMainViewGrid p
    {
        margin-bottom: 5px;
    }
    
    .RAMainViewGrid td img, .RAMainViewGrid td span
    {
        vertical-align: middle;
    }
    
    #RAMainView .RAMainViewGrid .RADefaultViewGridUnderBudget
    {
        background-color: #EFFEE1;
    }
    
    #RAMainView .RAMainViewGrid .RADefaultViewGridOverBudget
    {
        background-color: #FFFFE4;
    }
    
    .RAMainViewGridHeaderAltApprover
    {
        min-width: 90px;
    }
    
    .RAMainViewGridHeaderApprovalTrack
    {
        min-width: 100px;
    }
    .RAMainViewGridHeaderRequestedBy
    {
        min-width: 100px;
    }
    
    #RAMainViewReviewNowButtons input
    {
        margin: 10px 10px 10px 5px;
    }
    
    .RAStatusMessage
    {
        background-color:#FFFFE4;
        padding: 10px;
        border:1px solid #C6C6C6;
        min-width: 300px;
    }
</style>

<div id="RAMainView">
    <div class="RASummaryBox">
        <table>
            <tr>
                <td><asp:Image runat="server" ImageUrl='<%# Page.ResolveUrl(RAConstants.GetIconCartGoLarge()) %>' /></td>
                <td colspan="2"><div id="divInfo" runat="server"></div></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td><asp:LinkButton ID="lbSearch" runat="server" Text="Search your requisitions" OnClick="lbSearch_Click" /></td>
            </tr>
        </table>
    </div>

    <asp:Panel ID="pnlReviewNow" runat="server" CssClass="RAMainViewGrid">
        <p class="RAInformativeHeaderText">Review now</p>
        <asp:GridView ID="gvReviewNow" runat="server" AutoGenerateColumns="false" CellPadding="4" GridLines="None" CssClass="RAGridView" 
            HeaderStyle-CssClass="RAGridViewHeader" AlternatingRowStyle-CssClass="alt" OnRowDataBound="gv_RowDataBound">
            <Columns>
                <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                    <HeaderTemplate>
                        <asp:CheckBox ID="chkReviewNowAll" runat="server" OnCheckedChanged="chkReviewNowAll_CheckedChanged" AutoPostBack="true" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="chkReviewNow" Checked='<%# Eval("IsApprovalTrackChanged") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Request" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:LinkButton ID="lbRequest" runat="server" Text='<%# Eval("DispalyText") %>' CommandName="GroupNum" CommandArgument='<%# Eval("RowKey") %>' OnCommand="lbApproveRequest_Command" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="Amount" DataField="Amount" DataFormatString="{0:C2}" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Right" />
                <asp:BoundField HeaderText="Vendor" DataField="Vendor" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                <asp:TemplateField HeaderText="Budget Status" HeaderStyle-HorizontalAlign="Left"
                    ItemStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:Image ID="imgBudgetStatus" runat="server" />
                        <asp:Label ID="lblBudgetStatus" runat="server" Text='<%# Eval("BudgetStatusDescription") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Approving For" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" HeaderStyle-CssClass="RAMainViewGridHeaderRequestedBy" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:ImageButton ID="imgEmailApprovingFor" runat="server" CommandName="ReqNum" CommandArgument='<%# Eval("Number") %>'
                            OnCommand="lbEmailApprovingFor_Command" />
                        <asp:Label ID="lblApprovingFor" runat="server" Text='<%# Eval("OriginalApproverName") %>' Visible="false" />
                        <asp:LinkButton ID="lbApprovingFor" runat="server" Text='<%# Eval("OriginalApproverName") %>' CommandName="ReqNum" CommandArgument='<%# Eval("Number") %>' OnCommand="lbEmailApprovingFor_Command" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="Yours Since" DataField="YoursSince" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                <asp:TemplateField HeaderText="Approval Track" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="RAMainViewGridHeaderApprovalTrack" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkApprovalTrack" runat="server" Text='<%#"reviewer " + Eval("SeqNum") + " of " + Eval("TotalApprovers") %>' CommandName="GroupNum" CommandArgument='<%# Eval("RowKey") %>' OnCommand="viewTrack_Command" CssClass="ROInformativeLink" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Requested By" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" HeaderStyle-CssClass="RAMainViewGridHeaderRequestedBy" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:ImageButton ID="imgEmailRequester" runat="server" CommandName="ReqNum" CommandArgument='<%# Eval("Number") %>'
                            OnCommand="lbEmailRequester_Command" />
                        <asp:Label ID="lblRequesterName" runat="server" Text='<%# Eval("Requester") %>' Visible="false" />
                        <asp:LinkButton ID="lbEmailRequester" runat="server" Text='<%# Eval("Requester") %>' CommandName="ReqNum" CommandArgument='<%# Eval("Number") %>' OnCommand="lbEmailRequester_Command" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <div id="RAMainViewReviewNowButtons">
            <asp:Button ID="btnApprove" runat="server" Text="Approve" OnClick="btnApprove_Click" />
            <asp:Button ID="btnDeny" runat="server" Text="Deny" OnClick="btnDeny_Click" />
            <asp:Button ID="btnReturn" runat="server" Text="Return" OnClick="btnReturn_Click" />
        </div>
    </asp:Panel>

    <div id="StatusDisplay" runat="server" visible="false" class="RAStatusMessage" >
        <asp:Label ID="lblStatus" runat="server" />
    </div>

    <asp:Panel ID="pnlIncoming" runat="server" CssClass="RAMainViewGrid">
        <p class="RAInformativeHeaderText">Coming Soon</p>
        <asp:GridView ID="gvIncoming" runat="server" AutoGenerateColumns="false" CellPadding="4" GridLines="None" CssClass="RAGridView" 
            HeaderStyle-CssClass="RAGridViewHeader" AlternatingRowStyle-CssClass="alt" OnRowDataBound="gv_RowDataBound">
            <Columns>
                <asp:TemplateField HeaderText="Request" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:LinkButton ID="lbRequest" runat="server" Text='<%# Eval("DispalyText") %>' CommandName="GroupNum" CommandArgument='<%# Eval("RowKey") %>' OnCommand="lbViewRequest_Command" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="Amount" DataField="Amount" DataFormatString="{0:C2}" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Right" />
                <asp:TemplateField HeaderText="Budget Status" HeaderStyle-HorizontalAlign="Left"
                    ItemStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:Image ID="imgBudgetStatus" runat="server" />
                        <asp:Label ID="lblBudgetStatus" runat="server" Text='<%# Eval("BudgetStatusDescription") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Approving For" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" HeaderStyle-CssClass="RAMainViewGridHeaderRequestedBy" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:ImageButton ID="imgEmailApprovingFor" runat="server" CommandName="ReqNum" CommandArgument='<%# Eval("Number") %>'
                            OnCommand="lbEmailApprovingFor_Command" />
                        <asp:Label ID="lblApprovingFor" runat="server" Text='<%# Eval("OriginalApproverName") %>' Visible="false" />
                        <asp:LinkButton ID="lbApprovingFor" runat="server" Text='<%# Eval("OriginalApproverName") %>' CommandName="ReqNum" CommandArgument='<%# Eval("Number") %>' OnCommand="lbEmailApprovingFor_Command" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Approval Track" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkApprovalTrack" runat="server" Text='<%#"reviewer " + Eval("SeqNum") + " of " + Eval("TotalApprovers") %>' CommandName="GroupNum" CommandArgument='<%# Eval("RowKey") %>' OnCommand="viewTrack_Command" CssClass="ROInformativeLink" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Under Review By" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:ImageButton ID="imgEmailReviewer" runat="server" CommandName="ReqNum" CommandArgument='<%# Eval("Number") %>'
                            OnCommand="lbEmailReviewer_Command" />
                        <asp:Label ID="lblReviewer" runat="server" Text='<%# Eval("UnderReviewBy") %>' Visible="false" />
                        <asp:LinkButton ID="lbEmailReviewer" runat="server" Text='<%# Eval("UnderReviewBy") %>' CommandName="ReqNum" CommandArgument='<%# Eval("Number") %>' OnCommand="lbEmailReviewer_Command" />
                    </ItemTemplate>
                </asp:TemplateField>                
                <asp:TemplateField HeaderText="Requested By" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left"  ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:ImageButton ID="imgEmailRequester" runat="server" CommandName="ReqNum" CommandArgument='<%# Eval("Number") %>'
                            OnCommand="lbEmailRequester_Command" />
                        <asp:Label ID="lblRequesterName" runat="server" Text='<%# Eval("Requester") %>' Visible="false" />
                        <asp:LinkButton ID="lbEmailRequester" runat="server" Text='<%# Eval("Requester") %>' CommandName="ReqNum" CommandArgument='<%# Eval("Number") %>' OnCommand="lbEmailRequester_Command" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </asp:Panel>

    <asp:Panel ID="pnlApproved" runat="server" CssClass="RAMainViewGrid">
        <p class="RAInformativeHeaderText">Approved by you, pending final approval</p>
        <asp:GridView ID="gvApproved" runat="server" AutoGenerateColumns="false" CellPadding="4" GridLines="None" CssClass="RAGridView" 
            HeaderStyle-CssClass="RAGridViewHeader" AlternatingRowStyle-CssClass="alt" OnRowDataBound="gv_RowDataBound">
            <Columns>
                <asp:TemplateField HeaderText="Request" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:LinkButton ID="lbRequest" runat="server" Text='<%# Eval("DispalyText") %>' CommandName="GroupNum" CommandArgument='<%# Eval("RowKey") %>' OnCommand="lbViewRequest_Command" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="Amount" DataField="Amount" DataFormatString="{0:C2}" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Right" />
                <asp:TemplateField HeaderText="Budget Status" HeaderStyle-HorizontalAlign="Left"
                    ItemStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:Image ID="imgBudgetStatus" runat="server" />
                        <asp:Label ID="lblBudgetStatus" runat="server" Text='<%# Eval("BudgetStatusDescription") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Approving For" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" HeaderStyle-CssClass="RAMainViewGridHeaderRequestedBy" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:ImageButton ID="imgEmailApprovingFor" runat="server" CommandName="ReqNum" CommandArgument='<%# Eval("Number") %>'
                            OnCommand="lbEmailApprovingFor_Command" />
                        <asp:Label ID="lblApprovingFor" runat="server" Text='<%# Eval("OriginalApproverName") %>' Visible="false" />
                        <asp:LinkButton ID="lbApprovingFor" runat="server" Text='<%# Eval("OriginalApproverName") %>' CommandName="ReqNum" CommandArgument='<%# Eval("Number") %>' OnCommand="lbEmailApprovingFor_Command" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Approval Track" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkApprovalTrack" runat="server" Text='<%#"reviewer " + Eval("SeqNum") + " of " + Eval("TotalApprovers") %>' CommandName="GroupNum" CommandArgument='<%# Eval("RowKey") %>' OnCommand="viewTrack_Command" CssClass="ROInformativeLink" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Under Review By" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:ImageButton ID="imgEmailReviewer" runat="server" CommandName="ReqNum" CommandArgument='<%# Eval("Number") %>'
                            OnCommand="lbEmailReviewer_Command" />
                        <asp:Label ID="lblReviewer" runat="server" Text='<%# Eval("UnderReviewBy") %>' Visible="false" />
                        <asp:LinkButton ID="lbEmailReviewer" runat="server" Text='<%# Eval("UnderReviewBy") %>' CommandName="ReqNum" CommandArgument='<%# Eval("Number") %>' OnCommand="lbEmailReviewer_Command" />
                    </ItemTemplate>
                </asp:TemplateField>                
                <asp:TemplateField HeaderText="Requested By" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:ImageButton ID="imgEmailRequester" runat="server" CommandName="ReqNum" CommandArgument='<%# Eval("Number") %>'
                            OnCommand="lbEmailRequester_Command" />
                        <asp:Label ID="lblRequesterName" runat="server" Text='<%# Eval("Requester") %>' Visible="false" />
                        <asp:LinkButton ID="lbEmailRequester" runat="server" Text='<%# Eval("Requester") %>' CommandName="ReqNum" CommandArgument='<%# Eval("Number") %>' OnCommand="lbEmailRequester_Command" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </asp:Panel>
</div>

<asp:Button ID="btnApprovalTrackPopup" runat="server" Style="display: none" />
<ajaxToolkit:ModalPopupExtender ID="ApprovalTrackPopup" runat="server" TargetControlID="btnApprovalTrackPopup" PopupControlID="approvalTrackModal" 
    PopupDragHandleControlID="approvalTrackModalHeader" BackgroundCssClass="RAModalPopup" BehaviorID="ApprovalTrackPopupBehaviorID" />
<div id="approvalTrackModal" runat="server" class="RAModalDiv">
    <div class="RAInnerModal">
        <div id="approvalTrackModalHeader" class="RAModalHeading">
            <asp:Label runat="server" CssClass="RAHeaderText" Text="Approval Track Members" />
            <asp:ImageButton runat="server" CssClass="RAModalHeadingImg" ImageUrl="<%# Page.ResolveUrl(RAConstants.GetIconClose()) %>" OnClientClick="$find('ApprovalTrackPopupBehaviorID').hide(); return false;" />
        </div>
        <div>
            <at:ApprovalTrack ID="approvalTrackControl" runat="server" />
        </div>
    </div>
</div>

<asp:Button ID="btnApprovalTrackWarningPopup" runat="server" Style="display: none" />
<ajaxToolkit:ModalPopupExtender ID="ApprovalTrackWarningPopup" BehaviorID="ApprovalTrackWarningPopupBehaviorID"
    runat="server" TargetControlID="btnApprovalTrackWarningPopup" PopupControlID="_divApprovalTrackWarningModal"
    PopupDragHandleControlID="approvalTrackWarningModalHeader" BackgroundCssClass="RAModalPopup" />
<div id="_divApprovalTrackWarningModal" runat="server" class="RAModalDiv RAMessageWidthHeight"
    style="display: none;">
    <div class="RAInnerModal">
        <div id="ApprovalTrackWarningHeader" class="RAModalHeading">
            <asp:Label ID="_lblApprovalTrackWarningHeading" CssClass="RAHeaderText" Text="Warning"
                runat="server" />
            <asp:ImageButton runat="server" CssClass="RAModalHeadingImg" ImageUrl="<%# Page.ResolveUrl(RAConstants.GetIconClose()) %>"
                OnClientClick="$find('ApprovalTrackWarningPopupBehaviorID').hide(); return false;" />            
        </div>
        <div class="RAMarginPadding">
            <asp:Label ID="lblApprovalTrackWarningText" class="RALabelText" runat="server" />
        </div>
    </div>
</div>
