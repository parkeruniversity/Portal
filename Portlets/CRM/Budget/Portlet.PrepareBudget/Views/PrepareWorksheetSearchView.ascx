<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PrepareWorksheetSearchView.ascx.cs" Inherits="Portlet.PrepareBudget.Views.PrepareWorksheetSearchView" %>

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
                        <span class="PBInformativeText PBMarginLeft">Worksheet name includes</span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:DropDownList ID="Budget" runat="server"
                                          DataValueField="Key" DataTextField="Value" AutoPostBack="false"/>
                    </td>
                    <td>
                        <asp:TextBox ID="WorksheetName" CssClass="PBMarginLeft" runat="server" MaxLength="255"/>
                    </td>
                </tr>
            </table>
            <table class="PBMarginLeft PBMarginTop10 PBSectionMarginBottom">
                <tr>
                    <td>
                        <span class="PBInformativeText PBMarginLeft">Budget request Range</span></td>
                    <td>
                        <span class="PBInformativeText">$</span></td>
                    <td>
                        <asp:TextBox ID="FromAmount" runat="server" MaxLength="17" CssClass="PBRight"/>
                        <span class="PBInformativeText PBMarginLeft">To</span>
                        <span class="PBInformativeText PBMarginLeft">$</span>
                        <asp:TextBox ID="ToAmount" runat="server" MaxLength="17" CssClass="PBRight"/>

                        <ajaxToolkit:FilteredTextBoxExtender ID="FromAmountFilter" runat="server" TargetControlID="FromAmount"
                                                             FilterType="Numbers, Custom" ValidChars=".,-" FilterMode="ValidChars"/>
                        <ajaxToolkit:FilteredTextBoxExtender ID="ToAmountFilter" runat="server" TargetControlID="ToAmount"
                                                             FilterType="Numbers, Custom" ValidChars=".,-" FilterMode="ValidChars"/>
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
                                    Text="Search" OnClick="btnSearch_Click" runat="server"/>
                    </td>
                    <td class="PBPadding5 PBStretchWidth">
                        <asp:Button ID="btnNewSearch" CssClass="PBFloatLeft PBMarginLeft " Text="Clear search" OnClick="btnNewSearch_Click"
                                    runat="server"/>
                        <asp:LinkButton ID="btnCancel" Text="Cancel, go back" OnClick="btnCancel_Click" CssClass="PBFloatRight"
                                        runat="server"/>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <div class="PBMarginPadding">
                <asp:Label ID="lblSearchResults" Visible="false" runat="server"/>

                <asp:GridView ID="gvSearchResults" runat="server" AutoGenerateColumns="false"
                              CellPadding="4" GridLines="None" CssClass="PBGridView" AlternatingRowStyle-CssClass="alt"
                              DataKeyNames="WorksheetLineItemID" AllowSorting="true" OnSorting="gvSearchResults_Sorting"
                              OnRowCreated="gvSearchResults_RowCreated" OnRowCommand="gvSearchResults_RowCommand" >
                    <Columns>
                        <asp:TemplateField HeaderText="Worksheet" HeaderStyle-HorizontalAlign="Left" SortExpression="WorksheetName">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" Text='<%# Eval("WorksheetName") %>'
                                                CommandArgument='<%# Eval("WorksheetID") %>' OnClick="WorksheetDetail_Click"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Worksheet" Visible="false" HeaderStyle-HorizontalAlign="Left" SortExpression="NamePath">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" Text='<%# Eval("NamePath") %>'
                                                CommandArgument='<%# Eval("WorksheetID") %>' OnClick="WorksheetDetail_Click"/>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField DataField="LineItemCode" HeaderText="Line item code"
                                        ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" SortExpression="LineItemCode"/>
                        <asp:TemplateField HeaderText="Line item name" HeaderStyle-HorizontalAlign="Left" SortExpression="LineItemDescr">
                            <ItemTemplate>
                                <asp:LinkButton ID="LineItemLink" runat="server" Text='<%# Eval("LineItemDescr") %>'
                                                CommandArgument='<%# Eval("WorksheetID") %>' OnClick="WorksheetDetail_Click"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="RequestedBudget" HeaderText="Request" DataFormatString="{0:C0}"
                                        ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Left" SortExpression="RequestedBudget"/>
                        <asp:BoundField DataField="WorksheetStatusDescr" HeaderText="Worksheet Status"
                                        ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" SortExpression="WorksheetStatusDescr"/>
                    </Columns>
                    <HeaderStyle CssClass="PBGridViewHeader"/>
                </asp:GridView>
                <br/>
                <asp:GridView ID="gvFutureWorksheets" runat="server" AutoGenerateColumns="false"
                              CellPadding="4" GridLines="None" CssClass="PBGridView" AlternatingRowStyle-CssClass="alt"
                              DataKeyNames="ID" AllowSorting="true" OnSorting="FutureWorksheets_Sorting" OnRowCreated="gvFutureWorksheets_RowCreated" OnRowCommand="gvFutureWorksheets_RowCommand">
                    <Columns>

                        <asp:TemplateField HeaderText="Worksheet" HeaderStyle-HorizontalAlign="Left" SortExpression="Name">
                            <ItemTemplate>
                                <asp:LinkButton ID="WorksheetDetailLink" runat="server" Text='<%# Eval("Name") %>'
                                                CommandArgument='<%# Eval("ID") %>' OnClick="WorksheetDetail_Click"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Worksheet" Visible="false" HeaderStyle-HorizontalAlign="Left" SortExpression="NamePath">
                            <ItemTemplate>
                                <asp:LinkButton ID="WorksheetDetailLink2" runat="server" Text='<%# Eval("NamePath") %>'
                                                CommandArgument='<%# Eval("ID") %>' OnClick="WorksheetDetail_Click"/>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField DataField="RequestedBudget" HeaderText="Request" DataFormatString="{0:C0}"
                                        ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Left" SortExpression="RequestedBudget"/>

                        <asp:TemplateField HeaderText="Your Action" HeaderStyle-HorizontalAlign="Left" SortExpression="YourAction">
                            <ItemTemplate>
                                <asp:Image ID="YourActionIcon"
                                           ImageUrl='<%# DeriveCurrentYourActionIcon(Eval("EntityActionInternalName"), Eval("WorksheetStatus")) %>'
                                           runat="server"/>
                                <asp:LinkButton ID="YourActionDetailLink" runat="server" Text='<%# Eval("YourAction") %>'
                                                CommandArgument='<%# Eval("ID") %>' OnClick="WorksheetDetail_Click"/>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Yours Since" HeaderStyle-HorizontalAlign="Left" SortExpression="YoursSince">
                            <ItemTemplate>
                                <asp:Label ID="YoursSince" runat="server" Text='<%# DeriveYourSince(Eval("EntityActionInternalName"), Eval("YoursSince")) %>'/>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                    <HeaderStyle CssClass="PBGridViewHeader"/>
                </asp:GridView>
                <br/>
                <asp:Label ID="lblFutureWorksheetsNone" CssClass="PBLabelText PBMarginTop PBMarginBottom"
                           runat="server"/>

                <asp:Label ID="lblPendingComplete" Visible="false" CssClass="PBInformativeText" runat="server" Text="Pending and complete worksheets"/>
                <asp:GridView ID="gvPendingCompleteWorksheets" Visible="false" runat="server" AutoGenerateColumns="false"
                              DataKeyNames="ID" CellPadding="4" GridLines="None" CssClass="PBGridView" AlternatingRowStyle-CssClass="alt"
                              AllowSorting="true" OnSorting="PendingCompleteWorksheets_Sorting" OnRowCreated="gvPendingCompleteWorksheets_RowCreated" OnRowCommand="gvPendingCompleteWorksheets_RowCommand">
                    <Columns>

                        <asp:TemplateField HeaderText="Worksheet" HeaderStyle-HorizontalAlign="Left" SortExpression="Name">
                            <ItemTemplate>
                                <asp:LinkButton ID="WorksheetDetailLink" runat="server" Text='<%# Eval("Name") %>'
                                                CommandArgument='<%# Eval("ID") %>' OnClick="WorksheetDetail_Click"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Worksheet" Visible="false" HeaderStyle-HorizontalAlign="Left" SortExpression="NamePath">
                            <ItemTemplate>
                                <asp:LinkButton ID="WorksheetDetailLink2" runat="server" Text='<%# Eval("NamePath") %>'
                                                CommandArgument='<%# Eval("ID") %>' OnClick="WorksheetDetail_Click"/>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField DataField="RequestedBudget" HeaderText="Request" DataFormatString="{0:C0}"
                                        HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Right" SortExpression="RequestedBudget"/>

                        <asp:TemplateField HeaderText="Your Action" HeaderStyle-HorizontalAlign="Left" SortExpression="ActionStatus">
                            <ItemTemplate>
                                <asp:Image ID="YourActionIcon" ImageUrl='<%# DerivePendingCompleteYourActionIcon(Eval("EntityActionInternalName"), Eval("WorksheetStatus")) %>'
                                           runat="server"/>
                                <asp:Label ID="YourActionDetailText" runat="server" Text='<%# Eval("ActionStatus") %>'/>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Worksheet status" HeaderStyle-HorizontalAlign="Left"
                                           SortExpression="WorksheetStatusText">
                            <ItemTemplate>
                                <asp:Image ID="WorksheetStatusIcon" ImageUrl='<%# DerivePendingCompleteWorksheetStatusIcon(Eval("EntityActionInternalName"), Eval("WorksheetStatus"), Eval("MasterBudgetStatus")) %>'
                                           runat="server"/>
                                <asp:Label ID="WorksheetStatusText" runat="server" Text='<%# Eval("WorksheetStatusText") %>'/>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle CssClass="PBGridViewHeader"/>
                </asp:GridView>


            </div>
        </td>
    </tr>
</table> 
