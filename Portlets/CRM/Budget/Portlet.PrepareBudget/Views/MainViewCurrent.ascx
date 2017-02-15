<%@ Control Language="c#" AutoEventWireup="True" Codebehind="MainViewCurrent.ascx.cs" Inherits="Jenzabar.CRM.Budget.Web.Portlets.PrepareBudgetPortlet.MainViewCurrent" %>
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
    <td>
        <table class="PBGreyButtonBox PBStretchWidth PBNoMarginPadding">
            <tr class="PBNoMarginPadding">
                <td class="PBBoldText PBHeader1Text">This Year's Active Budget</td>
                <td class="">
                    <asp:LinkButton ID="btnCancel" Text="Cancel, go back" OnClick="btnCancel_Click" CssClass="PBFloatRight"
                        runat="server" />
                </td>
            </tr>
        </table>
    </td>
    <br />

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