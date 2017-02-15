<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DefaultView.ascx.cs" Inherits="Portlet.RequisitionApproval.Views.DefaultView" %>
<%@ Import Namespace="Jenzabar.CRM.Staff.Web.Portlets.RequisitionApproval" %>
<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>

<style type="text/css">
    #RADefaultView
    {
        margin: 10px;
    }
    
    #RADefaultViewGrid
    {
        margin-top: 20px;
    }

    #RADefaultViewGrid p
    {
        margin-bottom: 5px;
    }    
    
    #RADefaultViewGrid td img, #RADefaultViewGrid td span
    {
        vertical-align: middle;
    }    
    
    #RADefaultViewGrid .RADefaultViewGridUnderBudget
    {
        background-color: #EFFEE1;
    }
    
    #RADefaultViewGrid .RADefaultViewGridOverBudget
    {
        background-color: #FFFFE4;
    }
    
    .RADefaultViewGridHeaderAltApprover
    {
        min-width: 90px;
    }
</style>

<div id="RADefaultView">
    <div class="RASummaryBox">
        <table>
            <tr>
                <td><asp:Image runat="server" ImageUrl="<%# Page.ResolveUrl(RAConstants.GetIconCartGoLarge()) %>" /></td>
                <td colspan="2"><div id="divInfo" runat="server"></div></td>
            </tr>
            <tr>
                <td></td>
                <td><asp:LinkButton ID="lbDetails" runat="server" Text="Go to details" OnClick="lbDetails_Click" /></td>
                <td><asp:LinkButton ID="lbSearch" runat="server" Text="Search your requisitions" OnClick="lbSearch_Click" /></td>
            </tr>
        </table>
    </div>

    <asp:Panel ID="pnlReviewNow" runat="server">
        <div id="RADefaultViewGrid">
            <p class="RAInformativeHeaderText">Review now</p>
            <asp:GridView ID="gvReviewNow" runat="server" AutoGenerateColumns="false" CellPadding="4" GridLines="None" CssClass="RAGridView" 
                HeaderStyle-CssClass="RAGridViewHeader" AlternatingRowStyle-CssClass="alt" OnRowDataBound="gvReviewNow_RowDataBound">
                <Columns>
                    <asp:TemplateField HeaderText="Request" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbRequest" runat="server" Text='<%# Eval("DispalyText") %>' CommandName="GroupNum"
                                CommandArgument='<%# Eval("RowKey") %>' OnCommand="lbRequest_Command" />
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
                    <asp:BoundField HeaderText="Amount" DataField="Amount" DataFormatString="{0:C2}" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Right" />
                    <asp:TemplateField HeaderText="Budget Status" HeaderStyle-HorizontalAlign="Left"
                        ItemStyle-HorizontalAlign="Left">
                        <ItemTemplate>
                            <asp:Image ID="imgBudgetStatus" runat="server" />
                            <asp:Label ID="lblBudgetStatus" runat="server" Text='<%# Eval("BudgetStatusDescription") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </asp:Panel>    
</div>