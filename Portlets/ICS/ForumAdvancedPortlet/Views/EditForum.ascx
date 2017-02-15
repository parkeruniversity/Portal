<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditForum.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.ForumPortlet.Views.EditForum" %>
<%@ Register Assembly="System.Web.Extensions"Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<%@ Register TagPrefix="cmn" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register src="Controls/BaseIcons.ascx" tagname="BaseIcons" tagprefix="JICS" %>
<%@ Register src="Controls/EditCategoryTopics.ascx" tagname="EditCatTopics" tagprefix="JICS" %>
<%@ Register src="Controls/Sortable.ascx" tagname="Sortable" tagprefix="JICS" %> 
<%@ Register TagPrefix="fwk" TagName="Modal" Src="~/UI/Controls/UserControls/Modal.ascx" %>

<div style="padding:12px;">
    <asp:UpdatePanel ID="_updatePanel" runat="server" ChildrenAsTriggers="true" UpdateMode="Always" >
       <ContentTemplate>
            <JICS:Sortable ID="_sortable" runat="server" />

           <div id="_divExit" runat="server" class="exitEdit">
                <asp:Image runat="server" ID="_imgExit" />
                <asp:HyperLink ID="_hypExitEditMode" runat="server" />
            </div>
            <div class="allowAnonymous">
                <asp:Label ID="_lblAllowAnonymous" CssClass="anonymousTitle" runat="server" />
                <asp:CheckBox ID="_cbxAnonymous" runat="server" AutoPostBack="true" />
            </div>
            <div class="addCategory">
                <asp:Image runat="server" ID="_imgAddCat" />
                <asp:HyperLink ID="_hypAddNewCat" runat="server" />
            </div>

             <ajax:ReorderList ID="_reorderCategory" CssClass="reorderList" AllowReorder="true" DragHandleAlignment="Right" PostBackOnReorder="true" runat="server" ClientIDMode="AutoID">
                <ItemTemplate>
                    <JICS:EditCatTopics id="_editCatTopics" runat="server" />
                </ItemTemplate>
                <DragHandleTemplate>
                    <div class="dragHandle" id="_divCatDrag" runat="server">
                        &nbsp;
                    </div>
                </DragHandleTemplate>
                <ReorderTemplate>
                    <div class="dragReorder"></div>
                </ReorderTemplate>
            </ajax:ReorderList>
            <asp:Hyperlink ID="_hypModal" runat="server" style="display: none;"></asp:Hyperlink>
            <fwk:Modal ID="_modalMesg" runat="server" TargetControlID="_hypModal">
                <ContentArea>
                    <div style="padding:10px;">
                        <asp:Literal ID="_litMesg" runat="server" />
                    </div>
                </ContentArea>
            </fwk:Modal>
       </ContentTemplate>
    </asp:UpdatePanel>
    <div>
        <cmn:Mirror id="_mirTopAction" ControlID="_divExit" runat="server" />
        <JICS:BaseIcons id="_baseIcons" runat="server" RenderFolderIcons="true" />
    </div>
</div>