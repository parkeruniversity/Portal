<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PageLayout.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.CustomizePage.Layout.PageLayout" %>
<%@ Import Namespace="Jenzabar.Common.Globalization" %>
<%@ Import Namespace="Jenzabar.Portal.Framework" %>
<%@ Import Namespace="StructureMap" %>
<script type="text/javascript" >

    $(document).ready(function () {
        var ls = $(".PageLayoutPanel");
        if (ls.length != 0) {
            $(".portlet").addClass("pageLayouts");
        }
    });
</script>

<div class="PageLayoutPanel">
    <div class="header">
        <span class="title"><%= Globalizer.GetGlobalizedString("TXT_PAGE_CHANGE_LAYOUT_TITLE") %></span>
        <span class="description"><%= this.GetDescription() %></span>    
    </div>
    <div id="readOnlyPanel" class="availableLayout one_column readonly"  runat="server">
         <div class="icon"></div>
         <h2><span class="layoutType"><strong><%= Globalizer.GetGlobalizedString("TXT_PAGE_READONLY_LAYOUT_LAYOUTTYPE") %></strong></span></h2>
         <span class="description"><%= Globalizer.GetGlobalizedString("TXT_PAGE_READONLY_LAYOUT_LAYOUTTYPE_DESCRIPTION") %></span>         
    </div>
    <asp:ListView id="pageLayouts" runat="server"  OnItemDataBound="OnDataBinding">
        <LayoutTemplate>
             <ul class="pageLayouts">
                 <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
             </ul>
        </LayoutTemplate>
        <ItemTemplate>
            <li>
                <a class= <%# "availableLayout " + ((PortalPageLayout)Container.DataItem).CssClass %> runat="server" ID="layoutLink" >
                    <span runat="server" Visible="false" ID="cssName"><%# ((PortalPageLayout)Container.DataItem).Name %></span>
                    <div class="icon"></div>
                    <h2><span class="layoutType"><strong><%# ((PortalPageLayout)Container.DataItem).DisplayName %></strong></span> 
                    <span id="hoverHint" runat="server" class="hoverHint">(click to change layout)</span></h2>
                    <span class="description"><%# ((PortalPageLayout)Container.DataItem).Description %></span>         
                </a>
            </li>
        </ItemTemplate>
    </asp:ListView>
   <div id="customlayout" runat="server" class="custom-layout">
        <div class="devider"></div>
        <span class="pre-title"><%= Globalizer.GetGlobalizedString("TXT_PAGE_LAYOUT_CUSTOM_PRE_TITLE") %></span>
        <div id="readonlyCustomLayout" class="availableLayout one_column readonly"  runat="server">
             <div class="icon"></div>
             <h2><span class="layoutType"><strong><%= this.PageInfo.Layout.DisplayName %></strong></span>
                 <span id="hoverHint" runat="server" class="hoverHint">(Used now)</span>
             </h2>
        </div>
        <asp:UpdatePanel ID="editCustomLayoutPanel" runat="server">
            <ContentTemplate>
            <span class="title"><%= Globalizer.GetGlobalizedString("TXT_PAGE_LAYOUT_CUSTOM_TITLE") %></span>
            <asp:Label runat="server" style="display: none;" Text="Custom Layout Name"  ID="accesibilitynewName" AssociatedControlID="customLayoutName"></asp:Label>
            <input id="customLayoutName" runat="server" type="text" class="layoutName"/>
            <asp:Button  ID="saveCustomLayoutButton" runat="server" />        
                <asp:RegularExpressionValidator ID="contentValidator" CssClass="ValidationError" EnableClientScript="false"  ControlToValidate="customLayoutName" ValidationExpression="^[a-zA-Z0-9,_\.\/\-]+$" runat="server" Text="The name for the custom layout can't be supported."></asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator runat="server" CssClass="ValidationError" ID="requiredCustomnameValidator" ControlToValidate="customLayoutName" EnableClientScript="false"  Text="Name for custom Layout is required."></asp:RequiredFieldValidator>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="saveCustomLayoutButton"/>
            </Triggers>
        </asp:UpdatePanel>
    </div>
    <a id="backButton" runat="server" class="backButton"> <%= Globalizer.GetGlobalizedString("TXT_BACK_LINK") + "<strong>"+this.PageInfo.DisplayName+"</strong>"%></a>
</div>