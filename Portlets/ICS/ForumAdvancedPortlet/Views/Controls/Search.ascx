<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Search.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.ForumPortlet.Views.Controls.Search" %>
<%@ Register TagPrefix="cmn" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="JICS" assembly="Portlet.Forum" namespace="Jenzabar.ICS.Web.Portlets.ForumPortlet.Views.Controls" %>

<div class="search">
    <asp:Label runat="server" CssClass="screenReaderText" AssociatedControlID="_txtSearchPhrase">Search Text</asp:Label>
    <asp:TextBox ID="_txtSearchPhrase" MaxLength="40" Width="300px" runat="server" />
    <asp:Button ID="_btnSearch" UseSubmitBehavior="true" CausesValidation="true"  runat="server" OnClick="_btnSearch_Click" />
    <asp:ValidationSummary id="_valSearchSum" runat="server" ForeColor="White" CssClass="searchError"  DisplayMode="List" EnableClientScript="true" />
    <asp:Panel id="_divMySubSearch" CssClass="clearSearch" runat="server">
        <asp:Image ID="_imgMySubSearch" runat="server" />
        <asp:HyperLink ID="_hypClearSearch" runat="server" />
    </asp:Panel>
</div>
<div class="searchOptions">
    <div id="searchOptionValues" class="searchOptionValues" style="display:none;">
        <div class="manageArea manageAreaTop">
            <asp:Label id="_lblMatch" runat="server" CssClass="selTitle" /> 
            <div class="manageSelection">
                <asp:RadioButtonList ID="_rblMatch" runat="server" />
            </div>
        </div>
        <div class="manageArea">
            <asp:Label id="_lblAuthor" CssClass="selTitle" AssociatedControlID="_ddlAuthor" runat="server" />
            <div class="manageSelection">
                <asp:DropDownList ID="_ddlAuthor" runat="server" EnableViewState="false" />
            </div>
        </div>
        <div class="manageArea">
            <asp:Label ID="_lblTopic" CssClass="selTitle" AssociatedControlID="_ddlTopic" runat="server" />
            <div class="manageSelection">
                <JICS:GroupedDropDownList id="_ddlTopic" runat="server" EnableViewState="false" />
            </div>
        </div>
        <div class="manageArea manageAreaBottom">
            <asp:Label CssClass="selTitle" ID="_lblDate" runat="server" />
            <div class="manageSelection">   
                <asp:Label ID="_lblFrom" runat="server" /> <cmn:DatePicker id="_dpStart" runat="server"></cmn:DatePicker>
                &nbsp;
                <asp:Label ID="_lblTo" runat="server" /> <cmn:DatePicker id="_dpEnd" runat="server"></cmn:DatePicker>
            </div>
        </div>
        <asp:HiddenField ID="_hfMySub" runat="server" />
    </div>
    <div class="searchAction">
        <asp:HyperLink ID="_hypSearchOption" CssClass="hypSearchOption" runat="server" />
        <asp:Image ID="_imgSearchOption" CssClass="imgSearchOption" runat="server" />
    </div>

</div>


