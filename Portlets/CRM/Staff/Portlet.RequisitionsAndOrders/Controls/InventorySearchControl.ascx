<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="InventorySearchControl.ascx.cs" Inherits="Portlet.RequisitionsAndOrders.Controls.InventorySearchControl" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>

<script type="text/javascript">

    Sys.Application.add_load(inventorySearchControlLoad);

    function inventorySearchControlLoad() {
        $("#" + "<%# btnOk.ClientID %>").attr("disabled", "disabled");

        $("#ROInventorySearchControlResultGrid input[type='radio']").click(function () {
            $("#" + "<%# btnOk.ClientID %>").removeAttr("disabled");
        });

        $("#ROInventorySearchControlSearch input").keypress(function (event) {
            if (event.which == 13) {
                event.preventDefault();
            }
        });

        $find('<%# ModalBehaviorID %>').add_showing(function () {
            setTimeout(function () {
                $("#<%# txtSearch.ClientID %>").focus();
            }, 100); 
        });

        $find('<%# ModalBehaviorID %>').add_hiding(function () {
            $("#<%# txtSearch.ClientID %>").val("");
            __doPostBack("<%# upResult.UniqueID %>", "");
        });

        $("#ROInventorySearchControlResultGrid input[type=radio]").keypress(function (event) {
            if (event.which == 13) {
                $("#" + "<%# btnOk.ClientID %>").click();
                event.preventDefault();
            }
        });
    }

    function updateInventory() {
        var cell = $("#ROInventorySearchControlResultGrid input[type=radio]:checked").parent().next();
        var invCode = cell.html();
        var descriptionValue = cell.next().html();
        var unitCostValue = cell.next().next().html();
        var unitValue = cell.next().next().next().html();
        var catalogValue = cell.next().next().next().next().html();

        if (invCode != "&nbsp;") $("#<%# InvCodeID %>").val(invCode); else $("#<%# InvCodeID %>").val("");
        if (descriptionValue != "&nbsp;") $("#<%# DescriptionID %>").val(descriptionValue); else $("#<%# DescriptionID %>").val("");
        if (unitCostValue != "&nbsp;") {
            unitCostValue = unitCostValue.replace("$", "");
            unitCostValue = unitCostValue.replace(/,/g, "");

            $("#<%# UnitCostID %>").val(unitCostValue);
        }
        else {
            $("#<%# UnitCostID %>").val("");
        }
        if (unitValue != "&nbsp;") $("#<%# UnitID %>").val(unitValue); else $("#<%# UnitID %>").val("");
        if (catalogValue != "&nbsp;") $("#<%# CatalogID %>").val(catalogValue); else $("#<%# CatalogID %>").val("");
    }
    
</script>

<style type="text/css">            
    #ROInventorySearchControl
    {
        background-color: #FFFFFF;
        width: 960px;
    }
    
    #ROInventorySearchControlSearch
    {
        border-bottom: 2px solid #D4D4D4;
        padding: 10px;
    }
    
    #ROInventorySearchControlSearch p
    {
        margin-bottom: 10px;
    }
    
    #ROInventorySearchControlWarning
    {
        margin: 5px 20px 20px 20px;
        background-color: #FFFFE4;
        border: 2px solid #880000;
    }
    
    #ROInventorySearchControlWarning p
    {
        margin: 5px;
    }
    
    #ROInventorySearchControlWarning img
    {
        float: left;
        margin-right: 5px;
    }
    
    #ROInventorySearchControlResult
    {
        padding: 10px;
    }
    
    #ROInventorySearchControlResult > div > div {
        margin-bottom: 10px;
    }
    
    #ROInventorySearchControlResultGrid {
      height: 300px;
      overflow: auto;
    }
    
    #ROInventorySearchControlReturn
    {
        background-color: #D6E2FB;
        border-bottom: 1px solid #D4D4D4;
        border-top: 1px solid #D4D4D4;
        overflow: hidden;
        padding: 10px;
    }
    
    #ROInventorySearchControlReturn div
    {
        float: left;
        margin-right: 20px;
    }
    
    #ROInventorySearchControlReturn div a
    {
        margin-top: 3px;
        display: block;
    }
</style>

<div id="ROInventorySearchControl">
    <%--Search Area--%>
    <div id="ROInventorySearchControlSearch">
        <p class="ROInformativeText">Item description includes</p>
        <p>
            <asp:TextBox ID="txtSearch" runat="server" MaxLength="40" />
        </p>
    </div>
    <%--Result Area--%>
    <div id="ROInventorySearchControlResult">
        <asp:UpdatePanel ID="upResult" runat="server" UpdateMode="Conditional" OnLoad="upResult_Load">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="txtSearch" />
            </Triggers>
            <ContentTemplate>
                <asp:Panel ID="pnlItemsFound" runat="server" CssClass="ROInformativeText" Visible="false">Select one item, then click OK.</asp:Panel>
                <asp:Panel ID="pnlItemsNone" runat="server" CssClass="ROInformativeText" ForeColor="Red" Visible="false">No matching records found.  You may search again or cancel.</asp:Panel>
                <div id="ROInventorySearchControlResultGrid">
                    <asp:GridView ID="gvItems" runat="server" AutoGenerateColumns="false" CellPadding="4" GridLines="None" CssClass="ROGridView"
                        HeaderStyle-CssClass="ROGridViewHeader" AlternatingRowStyle-CssClass="alt" AllowSorting="true" OnSorting="gvItems_Sorting" OnRowCreated="gvItems_RowCreated">
                        <Columns>
                            <asp:TemplateField HeaderText="Select" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Literal ID="lItem" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="Inventory Code" DataField="Code" SortExpression="Code" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                            <asp:BoundField HeaderText="Item Description" DataField="Description" SortExpression="Description"  HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                            <asp:BoundField HeaderText="Unit Cost" DataField="UnitCost" SortExpression="UnitCost"  DataFormatString="{0:C2}" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Right" />
                            <asp:BoundField HeaderText="Unit" DataField="Unit" SortExpression="Unit"  HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                            <asp:BoundField HeaderText="Catalog #" DataField="CatalogNumber" SortExpression="CatalogNumber"  HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                        </Columns>
                    </asp:GridView>
                    <asp:Panel ID="pnlEmptyGrid" runat="server" Visible="false">
                        <table cellpadding="4" class="ROGridView" border="0" style="border-collapse:collapse;">
                            <tr class="ROGridViewHeader">
                                <th>Select</th>
                                <th>Inventory Code</th>
                                <th>Item Description</th>
                                <th>Unit Cost</th>
                                <th>Unit</th>
                                <th>Catalog #</th>
                            </tr>
                        </table>
                    </asp:Panel>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <div id="ROInventorySearchControlWarning" style="display: none;">
        <p><img id="Img1" src="<%# GetWarningIcon() %>" runat="server" alt="Warning" />Selecting an item will replace description, cost, unit and catalog values already entered on the Request Line Item screen.</p>
    </div>
    <%--Return Area--%>
    <div id="ROInventorySearchControlReturn">
        <div>
            <asp:Button ID="btnOk" runat="server" Text="OK" />
        </div>
        <div>
            <asp:LinkButton ID="lbCancel" runat="server" Text="Cancel, go back" />
        </div>
    </div>
</div>