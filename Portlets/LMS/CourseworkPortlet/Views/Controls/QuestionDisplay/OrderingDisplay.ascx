<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OrderingDisplay.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.QuestionDisplay.OrderingDisplay" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<%@ Register TagPrefix="cwk" TagName="RichText" Src="../RichTextDisplay.ascx" %>
<asp:Label ID="_lblOrderInfo" CssClass="orderingInfo" runat="server" />
<asp:LinkButton ID="_lbtnMode" CssClass="orderingInfo" runat="server" />
<asp:Label ID="_lblOrderInfoEnd" CssClass="orderingInfo" runat="server" />
<br/>
<div class="orderingDisplay">
    <asp:PlaceHolder ID="_phScript" runat="server">
         <script type="text/javascript">
             function BindSortable<%=ClientID%>() {
                 $('#' + '<%=_ulOrder.ClientID %>').sortable({ update: OnSortableUpdate<%=ClientID%>,placeholder:"sortableHighlight" });
                 $('#' + '<%=_ulOrder.ClientID %>').disableSelection();

                 function OnSortableUpdate<%=ClientID%>(event, ui) {
                     var newOrder = $('#' + '<%=_ulOrder.ClientID %>').sortable('toArray').join(',');
                     $('#' + '<%=_hfOrder.ClientID %>').val(newOrder);
                     $('#' + '<%=_ulOrder.ClientID %> li span.orderNum').each(function (e, item) { $(item).text(e+1); });
                 }
             }
        </script>
    </asp:PlaceHolder>
    <asp:PlaceHolder ID="_phDraggable" runat="server">
        <ul id="_ulOrder" class="sortable" runat="server">
            <asp:Repeater ID="_rptOrder" runat="server" EnableViewState="false">
                <ItemTemplate>
                    <li id="<%#Eval("Order") %>" class="orderNumDisplay">
				        <div class="orderNum">
					        <asp:Label ID="_lblNum" CssClass="orderNum" runat="server" />
				        </div>
				        <cwk:RichText ID="_rt" runat="server" />
			        </li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
        <asp:HiddenField ID="_hfOrder" runat="server" />  
    </asp:PlaceHolder>
    <asp:PlaceHolder ID="_phManual" runat="server">
        <asp:GridView  ID="_gvManual" runat="server" CssClass="orderingManual" EnableViewState="false" CellPadding="5" AutoGenerateColumns="false" ShowFooter="false" ShowHeader="false" GridLines="None">
            <AlternatingRowStyle CssClass="orderingAlternate"></AlternatingRowStyle>
            <Columns>
                <asp:TemplateField ItemStyle-CssClass="orderingInput">
			        <ItemTemplate>
				        <asp:TextBox ID="_txt" MaxLength="4" Width="30px" runat="server" />
			        </ItemTemplate>
		        </asp:TemplateField>
		        <asp:TemplateField>
			        <ItemTemplate>
				        <cwk:RichText id="_rt" runat="server" />
			        </ItemTemplate>
		        </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:Button ID="_btnOrder" runat="server" />
    </asp:PlaceHolder>

</div>