<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="VendorSearchControl.ascx.cs" Inherits="Portlet.RequisitionsAndOrders.Controls.VendorSearchControl" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>

<script type="text/javascript">

    Sys.Application.add_load(VendroSearchControlLoad);

    function VendroSearchControlLoad() {
        $("#" + "<%# btnOk.ClientID %>").attr("disabled", "disabled");

        $("#ROVendorSearchControlResultGrid input[type='radio']").click(function () {
            $("#" + "<%# btnOk.ClientID %>").removeAttr("disabled");
        });

        $("#ROVendorSearchControlSearch input").keypress(function (event) {
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
        });

        $("#ROVendorSearchControlResultGrid input[type=radio]").keypress(function (event) {
            if (event.which == 13) {
                $("#" + "<%# btnOk.ClientID %>").click();
                event.preventDefault();
            }
        });
    }

    function updateVendor() {
        var addressCode = $("#ROVendorSearchControlResultGrid input[type='radio']:checked").next().val();
        var cell = $("#ROVendorSearchControlResultGrid input[type='radio']:checked").parent().next();
        var idValue = cell.html();
        var nameValue = cell.next().children().first().html();
        var addressValue = cell.next().next().html();
        var fullAddress = "";

        if ("<%# VendorID %>" != "") {
            if (idValue != "&nbsp;") $("#<%# VendorID %>").val(idValue); else $("#<%# VendorID %>").val("");
        }

        if ("<%# VendorNameID %>" != "") {
            if (nameValue != "&nbsp;") $("#<%# VendorNameID %>").html(nameValue); else $("#<%# VendorNameID %>").html("");
        }

        if ("<%# VendorInfoID %>" != "") {
            if (nameValue != "&nbsp;" && addressValue != "&nbsp;") fullAddress = nameValue + " - " + addressValue;
            else if (nameValue != "&nbsp;") fullAddress = nameValue;
            else if (addressValue != "&nbsp;") fullAddress = addressValue;
            $("#<%# VendorInfoID %>").html(fullAddress);
        }

        if ("<%# VendorAddressCodeID %>" != "") {
            if (addressCode != "&nbsp;") $("#<%# VendorAddressCodeID %>").val(addressCode); else $("#<%# VendorAddressCodeID %>").val("");
        }

        if (document.getElementById("<%# ValidatorID %>") != null) {
            ValidatorEnable(document.getElementById("<%# ValidatorID %>"), true); //For Disabling
        }
    }
    
</script>

<style type="text/css">
    #ROVendorSearchControl
    {
        background-color: #FFFFFF;
        width: 960px;
    }
    
    #ROVendorSearchControl .ROVendorSearchControlPreferred
    {
        font-weight: bold;
    }
    
    #ROVendorSearchControl .ROVendorSearchControlReason
    {
        font-weight: bold;
        font-style: italic;
        font-size: .9em;
        margin-left: 10px;
    }
    
    #ROVendorSearchControlSearch
    {
        border-bottom: 2px solid #D4D4D4;
        padding: 10px;        
    }
    
    #ROVendorSearchControlSearch p
    {
        margin-bottom: 10px;
    }
    
    #ROVendorSearchControlSearch input
    {
        margin: 10px 0;
        vertical-align: middle;
    }
    
    #ROVendorSearchControlResult
    {
        padding: 10px;
    }
    
    #ROVendorSearchControlResult > div > div
    {
        margin-bottom: 10px;
    }
    
    #ROVendorSearchControlResultGrid
    {
      height: 310px;
      overflow: auto;
    }    
    
    #ROVendorSearchControlReturn
    {
        background-color: #D6E2FB;
        border-bottom: 1px solid #D4D4D4;
        border-top: 1px solid #D4D4D4;
        overflow: hidden;
        padding: 10px;
    }
    
    #ROVendorSearchControlReturn div
    {
        float: left;
        margin-right: 20px;
    }
    
    #ROVendorSearchControlReturn div a
    {
        margin-top: 3px;
        display: block;
    }
    
    .ROVendorSearchControlPreferred
    {
        font-weight: bold;
        font-style: italic;        
    }

  
</style>

<div id="ROVendorSearchControl">
    <%--Search Area--%>
    <div id="ROVendorSearchControlSearch">
        <p class="ROInformativeText">Vendor name includes</p>
        <p>
            <asp:TextBox ID="txtSearch" runat="server" MaxLength="40" /> 
        </p>
    </div>
    <%--Result Area--%>
    <div id="ROVendorSearchControlResult">
        <asp:UpdatePanel ID="upResult" runat="server" UpdateMode="Conditional" OnLoad="upResult_Load">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="txtSearch" />
            </Triggers>
            <ContentTemplate>
                <asp:Panel ID="pnlItemsFound" runat="server" CssClass="ROInformativeText" Visible="false">Select one vendor, then click OK.</asp:Panel>
                <asp:Panel ID="pnlItemsNone" runat="server" CssClass="ROInformativeText" ForeColor="Red" Visible="false">No matching records found.  You may search again or cancel.</asp:Panel>
                <div id="ROVendorSearchControlResultGrid">
                    <asp:GridView ID="gvItems" runat="server" AutoGenerateColumns="false" CellPadding="4" GridLines="None" CssClass="ROGridView"
                        HeaderStyle-CssClass="ROGridViewHeader" AlternatingRowStyle-CssClass="alt" AllowSorting="true" AllowPaging="true"
                        OnSorting="gvItems_Sorting" OnRowCreated="gvItems_RowCreated" OnPageIndexChanging="gvItems_PageIndexChanging" PageSize="10">
                        <PagerSettings Mode="Numeric"
                            Position="Bottom"
                             />
                        <PagerStyle CssClass="GridviewScrollPager" />

                        <Columns>
                            <asp:TemplateField HeaderText="Select" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Literal ID="lItem" runat="server" />
                                    <input type="hidden" runat="server" value='<%# Eval("AddressCode") %>' />                                    
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="ID Number" DataField="ID" SortExpression="ID" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                            <asp:BoundField HeaderText="Vendor Name" DataField="NamePreferredReason" SortExpression="Name" HtmlEncode="false" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                            <asp:BoundField HeaderText="Vendor Address" DataField="Address" SortExpression="Address" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                        </Columns>
                    </asp:GridView>
                    <asp:Panel ID="pnlEmptyGrid" runat="server" Visible="false">
                        <table cellpadding="4" class="ROGridView" border="0" style="border-collapse:collapse;">
                            <tr class="ROGridViewHeader">
                                <th>Select</th>
                                <th>ID Number</th>
                                <th>Vendor Name</th>
                                <th>Vendor Address</th>
                            </tr>
                        </table>
                    </asp:Panel>       
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <%--Return Area--%>
    <div id="ROVendorSearchControlReturn">
        <div>
            <asp:Button ID="btnOk" runat="server" Text="OK" />
        </div>
        <div>
            <asp:LinkButton ID="lbCancel" runat="server" Text="Cancel, go back" />
        </div>
    </div>
</div>
