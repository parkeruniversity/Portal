<%@ Control Language="c#" AutoEventWireup="True" Codebehind="MainViewFuture.ascx.cs" Inherits="Jenzabar.CRM.Budget.Web.Portlets.PrepareBudgetPortlet.MainViewFuture" %>
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
                    <td class="PBBoldText PBHeader1Text">Budget to Prepare for Next Year</td>
                    <td class="">
                        <asp:LinkButton ID="LinkButton1" Text="Cancel, go back" OnClick="btnCancel_Click" CssClass="PBFloatRight"
                            runat="server" />
                    </td>
                </tr>
            </table>
        </td>
    
    <br/>
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
    <br />
</div>
<div id="divLinks" class="pSection" runat="server" visible="true">
	<table>
		<tr>
			<td><asp:linkbutton id="lnkBack" Runat="server"></asp:linkbutton></td>
		</tr>
	</table>
</div>