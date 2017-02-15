<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MySubscriptions.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.NewsPortlet.Controls.MySubscriptions" %>
<%@ Register TagPrefix="cmn" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls"%>
<div class="mySubscriptions">
    <div class="mySubTitle">
        <cmn:GlobalizedLabel ID="_glblMySub" runat="server" TextKey="TXT_NEWS_MYSUB_TITLE"></cmn:GlobalizedLabel>
    </div>
    <asp:Panel ID="_panMessage" runat="server" CssClass="hint">
        <cmn:GlobalizedLiteral ID="_glitMessage" runat="server" TextKey="TXT_NEWS_MYSUB_MESSAGE" />
    </asp:Panel>
    <asp:Panel ID="_panSelection" runat="server" CssClass="hint">
        <div class="mySubSelection">
            <cmn:GlobalizedLabel ID="_glblView" runat="server" TextKey="LBL_VIEW" />
            <asp:DropDownList ID="_ddlSubscriptions" runat="server" AutoPostBack="true" OnSelectedIndexChanged="_ddlSubscriptions_SelectedIndexChanged" />
        </div>
        <asp:Panel ID="_panLinks" CssClass="mySubActions" runat="server">
            <div>
                <div class="subActionIcon">
                    <asp:Image ID="_imgOrg" runat="server" />
                </div>
                <asp:HyperLink ID="_hypOriginal" runat="server" />
            </div>
            <div>
                <div class="subActionIcon">
                    <asp:Image ID="_imgRename" runat="server" />
                </div>
                <asp:LinkButton ID="_lbtnRename" OnClick="_lbtnRename_Click" runat="server" />
            </div>
            <div>
                <div  class="subActionIcon">
                    <asp:Image ID="_imgRemove" runat="server" />
                </div>
                <asp:LinkButton ID="_lbtnRemove" CssClass="subRemoveLink" OnClick="_lbtnRemove_Click" runat="server" />
            </div>
        </asp:Panel>
        <div style="clear:both;float:none;"></div>
    </asp:Panel>
</div>