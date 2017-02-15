<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Subscribe.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.ForumPortlet.Views.Controls.Subscribe" %>
<%@ Register TagPrefix="fwk" TagName="Modal" Src="~/UI/Controls/UserControls/Modal.ascx" %>

<asp:HyperLink ID="_hypSubscribe" runat="server" />
<asp:HiddenField ID="_itemID" runat="server" />
<fwk:Modal id="_modal" runat="server">
    <ContentArea>
        <div class="subscribeContainer">
            <div>
                <asp:Image ID="_imgEmail" runat="server" />
                <asp:Label ID="_lblEmail" CssClass="subTitle" runat="server"></asp:Label>

                <div class="subSection subSectionHigher"  runat="server" id="_divEmail">
                    <asp:CheckBox ID="_cbxEmail" runat="server" />
                    <div id="_divEmailHigher" class="subscribeOverride" runat="server">
                        <asp:Label ID="_lblEmailHigher" runat="server" />
                        <br />
                        <asp:Image ID="_imgEmailEdit" runat="server" />
                        <asp:HyperLink ID="_hypEmailHigher" runat="server" />
                    </div>
                </div>
            </div>
             <asp:Image ID="_imgMySub" runat="server" />
            <asp:Label ID="_lblMySub" CssClass="subTitle" runat="server"></asp:Label>
            <div class="subSection">
                <div>
                    <asp:CheckBox ID="_cbxMySub" runat="server" />
                    <div id="_divMySubHigher" class="subscribeOverride" runat="server">
                        <asp:Label ID="_lblMySubHigher" runat="server" />
                        <br />
                        <asp:Image ID="_imgMySubEdit" runat="server" />
                        <asp:HyperLink ID="_hypMySubHigher" runat="server" />
                    </div>
                </div>
            </div>
        </div>
    </ContentArea>
</fwk:Modal>