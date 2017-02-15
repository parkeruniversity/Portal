<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MonitorWorksheetSearchView.ascx.cs" Inherits="Portlet.PrepareBudget.Views.MonitorWorksheetSearchView" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<table class="PBLayoutTable">
    <tr>
        <td class="PBBoldText PBHeader2Text">This Year's Active Budget</td>
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
        </td>
    </tr>
    <tr>
        <td>
            <table class="PBMarginLeft PBMarginTop10 PBSectionMarginBottom">
                <tr>
                    <td>
                        <span class="PBInformativeText">Monitor activity by</span>
                    </td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                     <td>
                        <asp:DropDownList ID="MonitorAmount" runat="server"
                            DataValueField="Key" DataTextField="Value" AutoPostBack="false" />
                    </td>
                    <td>
                        <span class="PBInformativeText PBMarginLeft">Range</span></td>
                    <td>
                        <span class="PBInformativeText PBMarginLeft">$</span>
                        <asp:TextBox ID="FromAmount" runat="server" MaxLength="17" CssClass="PBRight"/>
                        <span class="PBInformativeText PBMarginLeft">To</span>
                        <span class="PBInformativeText PBMarginLeft">$</span>
                        <asp:TextBox ID="ToAmount" runat="server" MaxLength="17" CssClass="PBRight"/>

                        <ajaxtoolkit:filteredtextboxextender id="FromAmountFilter" runat="server" targetcontrolid="FromAmount"
                                                             filtertype="Numbers, Custom" validchars=".-," filtermode="ValidChars"/>
                        <ajaxtoolkit:filteredtextboxextender id="ToAmountFilter" runat="server" targetcontrolid="ToAmount"
                                                             filtertype="Numbers, Custom" validchars=".,-" filtermode="ValidChars"/>
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
                        <asp:Button ID="btnSearch" CssClass="PBFloatLeft PBMarginLeft"
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
                              DataKeyNames="WorksheetID" AllowSorting="true" OnSorting="gvSearchResults_Sorting"
                              OnRowCreated="gvSearchResults_RowCreated" OnRowCommand="gvSearchResults_RowCommand">
                    <Columns>
                        <asp:TemplateField HeaderText="Worksheet" HeaderStyle-HorizontalAlign="Left" SortExpression="WorksheetName">
                            <ItemTemplate>
                                <asp:LinkButton ID="WorksheetDetailLink" runat="server" Text='<%# Eval("WorksheetName") %>'
                                                CommandArgument='<%# Eval("WorksheetID") %>' OnClick="MonitorWorksheetDetail_Click"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Worksheet" Visible="false" HeaderStyle-HorizontalAlign="Left" SortExpression="NamePath">
                            <ItemTemplate>
                                <asp:LinkButton ID="WorksheetDetailLink2" runat="server" Text='<%# Eval("NamePath") %>'
                                                CommandArgument='<%# Eval("WorksheetID") %>' OnClick="MonitorWorksheetDetail_Click"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Status" HeaderStyle-HorizontalAlign="Left" SortExpression="Status">
                            <ItemTemplate>
                                <asp:Image ID="StatusIcon" ImageUrl='<%# DeriveStatusIcon(Eval("Status")) %>' Visible='<%# DeriveStatusIconVisibility(Eval("Status")) %>'
                                           runat="server"/>
                                <asp:LinkButton ID="StatusLink" runat="server" Text='<%# Eval("Status") %>'
                                                CommandArgument='<%# Eval("WorksheetID") + ";" + Eval("NumPendingAdjustments") %>'
                                                OnClick="ViewPendingAdjustment_Click" Visible='<%# DeriveStatusLinkVisibility(Eval("NumPendingAdjustments")) %>'/>
                                <asp:Label runat="server" Text='<%# Eval("Status") %>' Visible='<%# DeriveStatusTextVisibility(Eval("Status"), Eval("NumPendingAdjustments")) %>'/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="AvailableNow" HeaderText="Available Now" DataFormatString="{0:C0}"
                                        ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Left" SortExpression="AvailableNow"/>
                        <asp:BoundField DataField="ComingLater" HeaderText="Future Budget" DataFormatString="{0:C0}"
                                        ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Left" SortExpression="ComingLater"/>
                        <asp:BoundField DataField="Spending" HeaderText="Spending" DataFormatString="{0:C0}"
                                        ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Left" SortExpression="Spending"/>
                        <asp:BoundField DataField="TotalBudget" HeaderText="Total Budget" DataFormatString="{0:C0}"
                                        ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Left" SortExpression="TotalBudget"/>

                    </Columns>
                    <HeaderStyle CssClass="PBGridViewHeader"/>
                </asp:GridView>


                <br/>
            </div>
        </td>
    </tr>
</table>
