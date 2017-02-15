<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DefaultView.ascx.cs" Inherits="Portlet.RequisitionsAndOrders.Views.DefaultView" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<script language="javascript" type="text/javascript">    function initIETOC() { }; function resizeTheDiv() { }</script>
<div class="pSection" id="divHint" visible="False" runat="server">
    <cmn:Hint ID="lblHint" runat="server" />
</div>

<div id="divContent" class="pSection" runat="server" visible="true">
    <div id="OrderSummaryBox" class="ROOrderSummaryBox" runat="server">
        <table>
            <tr>
                <td colspan="2">
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
                    <asp:LinkButton ID="GoToMain" runat="server" Text='Go to details' OnClick="GoToMain_Click"
                        CssClass="ROOrderSummaryLink" />
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:LinkButton ID="SearchReqsLink" runat="server" Text='Search your requisitions'
                        OnClick="SearchReqsLink_Click" CssClass="ROOrderSummaryLink" />
                </td>
                <td class="RORight">
                    <img src="<%=GetAddIconPath()%>" alt="Cart" />
                    <asp:LinkButton ID="MakeNewRequestLink" runat="server" Text='Make new request' OnClick="MakeNewRequestLink_Click"
                        CssClass="ROOrderSummaryLink" />
                </td>
            </tr>
        </table>
    </div>

    <asp:Label ID="lblPOsActionNeeded" CssClass="ROInformativeHeaderText" runat="server"
        Text="Purchase Orders - action needed" /><br />
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
            <asp:TemplateField HeaderText="Action" HeaderStyle-HorizontalAlign="Left" SortExpression="ActionText">
                <ItemTemplate>
                    <asp:LinkButton ID="YourActionDetailLink" runat="server" Text='<%# Eval("ActionText") %>'
                        CommandArgument='<%# Eval("GRP_NUM") %>' OnClick="POActionNeeded_Click" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <HeaderStyle CssClass="ROGridViewHeader" />
    </asp:GridView>
    <br />

    <asp:Label ID="lblReturnedReqs" CssClass="ROInformativeHeaderText" runat="server"
        Text="Returned Requisitions" />
    <asp:GridView ID="gvReturnedReqs" runat="server" AutoGenerateColumns="false" CellPadding="4"
        GridLines="None" CssClass="ROGridView" AlternatingRowStyle-CssClass="alt" DataKeyNames="GRP_NUM"
        AllowSorting="true" OnSorting="ReturnedReqs_Sorting" OnRowCreated="gvReturnedReqs_RowCreated"
        OnRowDataBound="gvReturnedReqs_RowDataBound">
        <Columns>
            <asp:TemplateField HeaderText="Request Name" HeaderStyle-HorizontalAlign="Left" SortExpression="ReqTextNum">
                <ItemTemplate>
                    <asp:LinkButton ID="ReviseAndResubmitLink" runat="server" Text='<%# Eval("ReqTextNum") %>'
                        CommandArgument='<%# Eval("GRP_NUM") %>' OnClick="ReviseAndResubmit_Click" CssClass="ROHoverBlackLink" />
                </ItemTemplate>
            </asp:TemplateField>            
            <asp:BoundField DataField="Amount" HeaderText="Amount" DataFormatString="{0:C2}"
                ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Left" SortExpression="Amount" />
            <asp:TemplateField HeaderText="Action" HeaderStyle-HorizontalAlign="Left" SortExpression="ActionText">
                <ItemTemplate>
                    <asp:HyperLink ID="btnReqShowExpiredMessagePopup" Text='<%# Eval("ActionText") %>' CssClass="ROHoverBlackLink"
                        NavigateUrl="javascript:ShowExpiredMessagePopup()" runat="server" />
                    <asp:LinkButton ID="YourActionDetailLink" runat="server" Text='<%# Eval("ActionText") %>'
                        CommandArgument='<%# Eval("GRP_NUM") %>' OnClick="ReviseAndResubmit_Click" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <HeaderStyle CssClass="ROGridViewHeader" />
    </asp:GridView>

    <br />
    <asp:Label ID="lblPOsActionNeededsNone" CssClass="ROLabelText ROMarginTop ROMarginBottom"
        runat="server" />
    <br />

    <asp:Button ID="btnExpiredMessagePopup" runat="server" Style="display: none" />
    <ajaxToolkit:ModalPopupExtender ID="ExpiredMessagePopup" BehaviorID="ExpiredMessagePopup" runat="server"
        TargetControlID="btnExpiredMessagePopup" PopupControlID="_divExpiredMessageModal" PopupDragHandleControlID="ExpiredMessageModalHeader"
        BackgroundCssClass="ROModalPopup" />
    <div id="_divExpiredMessageModal" runat="server" class="ROModalDiv ROMessageWidthHeight"
        style="display: none;">
        <div class="ROInnerModal">
            <div id="ExpiredMessageModalHeader" class="ROModalHeading">
                <asp:ImageButton ID="_imgExpiredMessageClose" CssClass="ROModalHeadingImg" runat="server" />
                <asp:Label ID="_lblExpiredMessageHeading" CssClass="ROHeaderText" Text="Action needed" runat="server" />
            </div>
            <asp:Label Text="This item was created in the prior fiscal year and related budget information may be inaccurate. Contact your Business Office to resolve."
                runat="server" />
            <div class="ROModalButtons">
                <asp:Button ID="_btnExpiredMessageClose" Text="Close" runat="server" />
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    function ShowExpiredMessagePopup() {
        $find('ExpiredMessagePopup').show();
    }
</script>