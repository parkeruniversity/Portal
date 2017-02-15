<%@ Control Language="c#" AutoEventWireup="True" Codebehind="MainView.ascx.cs" Inherits="Jenzabar.CRM.Budget.Web.Portlets.PrepareBudgetPortlet.MainView" %>
<%@ Import Namespace="Jenzabar.CRM.Budget.Web.Portlets.PrepareBudgetPortlet" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<script language="javascript" type="text/javascript">function initIETOC(){};function resizeTheDiv(){}</script>
<div id="divError" class="pSection" runat="server" visible="false">
	<asp:label id="lblError" CssClass="PortletError" Runat="server"></asp:label>
</div>
<div class="pSection" id="divHint" visible="False" runat="server">
    <cmn:hint id="lblHint" runat="server" />
</div>
<div id="divContent" class="pSection" runat="server" visible="true">
    <asp:Label ID="lblFutureWorksheets" CssClass="PBInformativeText" runat="server"
        Text="Worksheets to Prepare for Next Year" />
    <asp:LinkButton ID="PrepareLineItemSearchLink" runat="server"
        OnClick="PrepareLineItemSearchLink_Click" CssClass="PBHeaderLink">Search next year's line items</asp:LinkButton>
	<asp:GridView ID="gvFutureWorksheets" runat="server" AutoGenerateColumns="false"
        CellPadding="4" GridLines="None" CssClass="PBGridView" AlternatingRowStyle-CssClass="alt"
        DataKeyNames="ID" AllowSorting="true" OnSorting="FutureWorksheets_Sorting" OnRowCreated="gvFutureWorksheets_RowCreated" OnRowCommand="gvFutureWorksheets_RowCommand">
        <Columns>

            <asp:TemplateField HeaderText="Worksheet" HeaderStyle-HorizontalAlign="Left" SortExpression="Name">
                <ItemTemplate>
                    <asp:LinkButton ID="WorksheetDetailLink" runat="server" Text='<%# Eval("Name") %>'
                        CommandArgument='<%# Eval("ID") %>' OnClick="WorksheetDetail_Click" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Worksheet" Visible="false" HeaderStyle-HorizontalAlign="Left" SortExpression="NamePath">
                <ItemTemplate>
                    <asp:LinkButton ID="WorksheetDetailLink2" runat="server" Text='<%# Eval("NamePath") %>'
                        CommandArgument='<%# Eval("ID") %>' OnClick="WorksheetDetail_Click" />
                </ItemTemplate>
            </asp:TemplateField>
            
            <asp:BoundField DataField="RequestedBudget" HeaderText="Request" DataFormatString="{0:C0}"
                ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Left" SortExpression="RequestedBudget" />
            
            <asp:TemplateField HeaderText="Your Action" HeaderStyle-HorizontalAlign="Left" SortExpression="YourAction">
                <ItemTemplate>                    
                    <asp:Image ID="YourActionIcon"
                        ImageUrl='<%# DeriveCurrentYourActionIcon(Eval("EntityActionInternalName"), Eval("WorksheetStatus")) %>'
                        runat="server" />
                    <asp:LinkButton ID="YourActionDetailLink" runat="server" Text='<%# Eval("YourAction") %>'
                        CommandArgument='<%# Eval("ID") %>' OnClick="WorksheetDetail_Click" />
                </ItemTemplate>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="Yours Since" HeaderStyle-HorizontalAlign="Left" SortExpression="YoursSince">
                <ItemTemplate>
                    <asp:Label ID="YoursSince" runat="server" Text='<%# DeriveYourSince(Eval("EntityActionInternalName"), Eval("YoursSince")) %>' />
                </ItemTemplate>
            </asp:TemplateField>
               
        </Columns>
        <HeaderStyle CssClass="PBGridViewHeader" />
    </asp:GridView>
    <br />
    <asp:Label ID="lblFutureWorksheetsNone" CssClass="PBLabelText PBMarginTop PBMarginBottom"
        runat="server" />    
    <asp:UpdatePanel ID="upPendingComplete" ChildrenAsTriggers="false" UpdateMode="Conditional"
        runat="server">
        <ContentTemplate>
            <asp:LinkButton ID="lnkViewPendingComplete" Text="View pending and complete worksheets"
                OnClick="lnkViewPendingComplete_Click" runat="server" />
            <asp:Label ID="lblPendingComplete" Visible="false" CssClass="PBInformativeText" runat="server" Text="Pending and complete worksheets" />
            <asp:GridView ID="gvPendingCompleteWorksheets" Visible="false" runat="server" AutoGenerateColumns="false"
                DataKeyNames="ID" CellPadding="4" GridLines="None" CssClass="PBGridView" AlternatingRowStyle-CssClass="alt"
                AllowSorting="true" OnSorting="PendingCompleteWorksheets_Sorting" OnRowCreated="gvPendingCompleteWorksheets_RowCreated" OnRowCommand="gvPendingCompleteWorksheets_RowCommand">
                <Columns>

                    <asp:TemplateField HeaderText="Worksheet" HeaderStyle-HorizontalAlign="Left" SortExpression="Name">
                        <ItemTemplate>
                            <asp:LinkButton ID="WorksheetDetailLink" runat="server" Text='<%# Eval("Name") %>'
                                CommandArgument='<%# Eval("ID") %>' OnClick="WorksheetDetail_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Worksheet" Visible="false" HeaderStyle-HorizontalAlign="Left" SortExpression="NamePath">
                        <ItemTemplate>
                            <asp:LinkButton ID="WorksheetDetailLink2" runat="server" Text='<%# Eval("NamePath") %>'
                                CommandArgument='<%# Eval("ID") %>' OnClick="WorksheetDetail_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
            
                    <asp:BoundField DataField="RequestedBudget" HeaderText="Request" DataFormatString="{0:C0}"
                        HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Right" SortExpression="RequestedBudget" />
            
                    <asp:TemplateField HeaderText="Your Action" HeaderStyle-HorizontalAlign="Left" SortExpression="ActionStatus">
                        <ItemTemplate>
                            <asp:Image ID="YourActionIcon" ImageUrl='<%# DerivePendingCompleteYourActionIcon(Eval("EntityActionInternalName"), Eval("WorksheetStatus")) %>'
                                runat="server" />
                            <asp:Label ID="YourActionDetailText" runat="server" Text='<%# Eval("ActionStatus") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Worksheet status" HeaderStyle-HorizontalAlign="Left"
                        SortExpression="WorksheetStatusText">
                        <ItemTemplate>
                            <asp:Image ID="WorksheetStatusIcon" ImageUrl='<%# DerivePendingCompleteWorksheetStatusIcon(Eval("EntityActionInternalName"), Eval("WorksheetStatus"), Eval("MasterBudgetStatus")) %>'
                                    runat="server" />
                            <asp:Label ID="WorksheetStatusText" runat="server" Text='<%# Eval("WorksheetStatusText") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <HeaderStyle CssClass="PBGridViewHeader" />
            </asp:GridView>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="lnkViewPendingComplete" EventName="Click" />
            <asp:PostBackTrigger ControlID="gvPendingCompleteWorksheets" />
        </Triggers>
    </asp:UpdatePanel>


    <asp:Label ID="lblCurrentWorksheets" CssClass="PBInformativeText" runat="server"
        Text="This Year's Active Worksheets" />
    <asp:LinkButton ID="LineItemSearchLink" runat="server"
        OnClick="LineItemSearchLink_Click" CssClass="PBHeaderLink">Search this year's active line items</asp:LinkButton>
    <asp:GridView ID="gvCurrentWorksheets" runat="server" AutoGenerateColumns="false"
        CellPadding="4" GridLines="None" CssClass="PBGridView" AlternatingRowStyle-CssClass="alt"
        DataKeyNames="WorksheetID" AllowSorting="true" OnSorting="CurrentWorksheets_Sorting"
        OnRowCreated="gvCurrentWorksheets_RowCreated" OnRowCommand="gvCurrentWorksheets_RowCommand">
        <Columns>
            <asp:TemplateField HeaderText="Worksheet" HeaderStyle-HorizontalAlign="Left" SortExpression="WorksheetName">
                <ItemTemplate>
                    <asp:LinkButton ID="WorksheetDetailLink" runat="server" Text='<%# Eval("WorksheetName") %>'
                        CommandArgument='<%# Eval("WorksheetID") %>' OnClick="MonitorWorksheetDetail_Click" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Worksheet" Visible="false" HeaderStyle-HorizontalAlign="Left" SortExpression="NamePath">
                <ItemTemplate>
                    <asp:LinkButton ID="WorksheetDetailLink2" runat="server" Text='<%# Eval("NamePath") %>'
                        CommandArgument='<%# Eval("WorksheetID") %>' OnClick="MonitorWorksheetDetail_Click" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Status" HeaderStyle-HorizontalAlign="Left" SortExpression="Status">
                <ItemTemplate>
                    <asp:Image ID="StatusIcon" ImageUrl='<%# DeriveStatusIcon(Eval("Status")) %>' Visible='<%# DeriveStatusIconVisibility(Eval("Status")) %>'
                        runat="server" />
                    <asp:LinkButton ID="StatusLink" runat="server" Text='<%# Eval("Status") %>'
                         CommandArgument='<%# Eval("WorksheetID") + ";" + Eval("NumPendingAdjustments") %>'
                        OnClick="ViewPendingAdjustment_Click" Visible='<%# DeriveStatusLinkVisibility(Eval("NumPendingAdjustments")) %>' />
                    <asp:Label runat="server" Text='<%# Eval("Status") %>' Visible='<%# DeriveStatusTextVisibility(Eval("Status"), Eval("NumPendingAdjustments")) %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="AvailableNow" HeaderText="Available Now" DataFormatString="{0:C0}"
                ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Left" SortExpression="AvailableNow" />
            <asp:BoundField DataField="ComingLater" HeaderText="Future Budget" DataFormatString="{0:C0}"
                ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Left" SortExpression="ComingLater" />
            <asp:BoundField DataField="Spending" HeaderText="Spending" DataFormatString="{0:C0}"
                ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Left" SortExpression="Spending" />
            <asp:BoundField DataField="TotalBudget" HeaderText="Total Budget" DataFormatString="{0:C0}"
                ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Left" SortExpression="TotalBudget" />
            
        </Columns>
        <HeaderStyle CssClass="PBGridViewHeader" />
    </asp:GridView>
    <br />
</div>
<div id="divLinks" class="pSection" runat="server" visible="true">
	<table>
		<tr>
			<td><asp:linkbutton id="lnkBack" Runat="server"></asp:linkbutton></td>
		</tr>
	</table>
</div>