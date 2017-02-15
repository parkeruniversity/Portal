<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SearchBox.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.Controls.SearchBox" %>
<%@ Import Namespace="Jenzabar.Portal.Framework" %>

<script type="text/javascript">
    jQuery(document).ready(function ($) {
        searchBox.textBox = '<%=tbSearch.ClientID%>';
        searchBox.button = '<%=lbSearch.ClientID%>';
        searchBox.showInSideBar = '<%= JSSideBarControl %>';
        searchBox.whereDropDown = '<%=ddlWhere.ClientID%>';
        searchBox.whatDropDown = '<%=ddlWhat.ClientID%>';
        searchBox.includePastCheckBox = '<%=cbIncludePast.ClientID%>';
        searchBox.showHideLabel = '<%= lblShowHide.ClientID %>';
        searchBox.userId = "<%=PortalUser.Current.ID.AsGuid.ToString()%>";
        searchBox.autoCompleteSelect = function(event, ui) {
            $("#" + searchBox.textBox).val(ui.item.value);
            <%= Page.ClientScript.GetPostBackEventReference(lbSearch, String.Empty) %>;
        };
        searchBox.initAutoComplete();
        $('#<%=lbSearch.ClientID%>').keypress(function(e) {
            var key = e.which;
            if (key === 32 || key === 13) {
                if (searchBox.searchClick()) {
                    window.location.href = this.href;
                }
                return false;
            }
        });   
    });
 </script>

<div id="searchAutoCompleteResults" class="searchAutoComplete"> </div>

<asp:Panel runat="server" ID="searchPanel" CssClass="searchPanel" DefaultButton="lbSearch">
    <div id="divSideBarContainer" runat="server">
        <div class="searchControls">
     <%--        <asp:RegularExpressionValidator ID="vldName2" Text="The search term is invalid."  ValidationExpression="(^[^<>]*$)|(^[^>]*$)|(^[^<]*$)" ControlToValidate="tbSearch" Runat="server"></asp:RegularExpressionValidator>--%>
             <asp:Label runat="server" ID="lblForSearch" AssociatedControlID="tbSearch" CssClass="screenReaderText" Text="Search" />
             <asp:TextBox ID="tbSearch" runat="server" />
           
            <asp:Label runat="server" ID="lblForSearchButton" AssociatedControlID="lbSearch" CssClass="screenReaderText">Search Button</asp:Label>
            <asp:LinkButton 
                runat="server" 
                ID="lbSearch" 
                class="searchButton ieInlineBlock" 
                />
            
        </div>
        <div id="divSideBarAdvancedOptions" runat="server" visible="False">
            <div class="advancedSearchContent">
                <div id="wherediv" runat="server">
                    <asp:Label runat="server" ID="lblWhere" Text="Where:" />
                    <br />
                    <asp:DropDownList ID="ddlWhere" runat="server" Width="150" />
                    <br />
                    <asp:CheckBox ID="cbIncludePast" runat="server" /><br />
                    <br />
                </div>

                <asp:Label runat="server" ID="lblWhat" Text="What:" />
                <br />
                <asp:DropDownList ID="ddlWhat" runat="server" />
            </div>
            <div class="advancedSearchLink">
                <asp:Label ID="lblShowHide" runat="server" Text="Show"></asp:Label>
                search options
            </div>
        </div>
    </div>
</asp:Panel>
