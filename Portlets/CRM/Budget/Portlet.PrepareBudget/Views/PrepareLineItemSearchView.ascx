<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PrepareLineItemSearchView.ascx.cs" Inherits="Portlet.PrepareBudget.Views.PrepareLineItemSearchView" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<table class="PBLayoutTable">
    <tr>
        <td class="PBBoldText PBHeader2Text">Budget to Prepare for Next Year</td>
    </tr>
    <tr>
        <td class="PBHeaderInstructions">
            <div class="PBFloatLeft PBMarginTop10">
                <span class="PBInformativeText PBMarginLeft">You may search using single or multiple criteria. The
                    more search criteria you choose, the more specific the returned results will be.</span>
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <table class="PBMarginLeft PBMarginTop10 PBSectionMarginBottom">
                <tr>
                    <td>
                        <span class="PBInformativeText">Budget</span>
                    </td>
                    <td>
                        <span class="PBInformativeText PBMarginLeft">Line item name includes</span>
                    </td>
                    <td>
                        <span class="PBInformativeText PBMarginLeft">Line item code includes</span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:DropDownList ID="Budget" runat="server"
                            DataValueField="Key" DataTextField="Value" AutoPostBack="false" />
                    </td>
                    <td>
                        <asp:TextBox ID="LineItemName" CssClass="PBMarginLeft" runat="server" MaxLength="255" />
                    </td>
                    <td>
                        <asp:TextBox ID="LineItemCode" CssClass="PBMarginLeft" runat="server" MaxLength="50" />
                    </td>                   
                </tr>
            </table>
            <table class="PBMarginLeft PBMarginTop10 PBSectionMarginBottom">
                <tr>

                    <td></td>
                    <td>
                        <span class="PBInformativeText">Budget request range</span>
                    </td>
                </tr>
                <tr>
                    <td><span class="PBInformativeText">$</span></td>
                    <td>
                        <asp:TextBox ID="FromAmount" runat="server" MaxLength="17" CssClass="PBRight" />
                        <span class="PBInformativeText PBMarginLeft">To</span>
                        <span class="PBInformativeText PBMarginLeft">$</span>
                        <asp:TextBox ID="ToAmount" runat="server" MaxLength="17" CssClass="PBRight" />

                        <ajaxToolkit:FilteredTextBoxExtender ID="FromAmountFilter" runat="server" TargetControlID="FromAmount"
                            FilterType="Numbers, Custom" ValidChars=".,-" FilterMode="ValidChars" />
                        <ajaxToolkit:FilteredTextBoxExtender ID="ToAmountFilter" runat="server" TargetControlID="ToAmount"
                            FilterType="Numbers, Custom" ValidChars=".,-" FilterMode="ValidChars" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <table class="PBGreyButtonBox PBStretchWidth PBNoMarginPadding">
                <tr class="PBNoMarginPadding">
                    <td class="PBBlueButtonBox">
                        <asp:Button ID="btnSearch" CssClass="PBFloatLeft PBMarginLeft "
                            Text="Search" OnClick="btnSearch_Click" runat="server" />
                    </td>
                    <td class="PBPadding5 PBStretchWidth">
                        <asp:Button ID="btnNewSearch" CssClass="PBFloatLeft PBMarginLeft " Text="Clear search" OnClick="btnNewSearch_Click"
                            runat="server" />
                        <asp:LinkButton ID="btnCancel" Text="Cancel, go back" OnClick="btnCancel_Click" CssClass="PBFloatRight"
                            runat="server" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <div class="PBMarginPadding">
                <asp:Label ID="lblSearchResults" Visible="false" runat="server" />

                <asp:GridView ID="gvSearchResults" runat="server" AutoGenerateColumns="false"
                    CellPadding="4" GridLines="None" CssClass="PBGridView" AlternatingRowStyle-CssClass="alt"
                    DataKeyNames="WorksheetLineItemID" AllowSorting="true" OnSorting="gvSearchResults_Sorting"
                    OnRowCreated="gvSearchResults_RowCreated" OnRowCommand="gvSearchResults_RowCommand" OnRowDataBound="gvSearchResults_RowDataBound">
                    <Columns>
                        <asp:TemplateField HeaderText="Worksheet" HeaderStyle-HorizontalAlign="Left" SortExpression="WorksheetName">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" Text='<%# Eval("WorksheetName") %>'
                                    CommandArgument='<%# Eval("WorksheetID") +";"+ Eval("LineItemCode") %>' OnClick="WorksheetDetail_Click" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Worksheet" Visible="false" HeaderStyle-HorizontalAlign="Left" SortExpression="NamePath">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" Text='<%# Eval("NamePath") %>'
                                    CommandArgument='<%# Eval("WorksheetID") +";"+ Eval("LineItemCode") %>' OnClick="WorksheetDetail_Click" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:BoundField DataField="LineItemCode" HeaderText="Line item code"
                            ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" SortExpression="LineItemCode" />
                        <asp:TemplateField HeaderText="Line item name" HeaderStyle-HorizontalAlign="Left" SortExpression="LineItemDescr">
                            <ItemTemplate>
                                <asp:LinkButton ID="LineItemLink" runat="server" Text='<%# Eval("LineItemDescr") %>'
                                    CommandArgument='<%# Eval("WorksheetID") +";"+ Eval("LineItemCode") %>' OnClick="WorksheetDetail_Click" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="RequestedBudget" HeaderText="Request" DataFormatString="{0:C0}"
                            ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Left" SortExpression="RequestedBudget" />
                        <asp:BoundField DataField="WorksheetStatusDescr" HeaderText="Worksheet Status"
                            ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" SortExpression="WorksheetStatusDescr" />
                    </Columns>
                    <HeaderStyle CssClass="PBGridViewHeader" />
                </asp:GridView>
                <br />
            </div>
        </td>
    </tr>
</table>
