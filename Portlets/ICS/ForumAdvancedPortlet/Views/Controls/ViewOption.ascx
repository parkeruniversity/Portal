<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ViewOption.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.ForumPortlet.Views.Controls.ViewOption" %>
<%@ Register TagPrefix="fwk" TagName="Modal" Src="~/UI/Controls/UserControls/Modal.ascx" %>
<asp:Hyperlink ID="_hypViewOption" runat="server" CssClass="buttonAnchor viewOptions" NavigateUrl="#" />
 
<fwk:Modal id="_modal" runat="server">
    <ContentArea>
        <div class="viewReplyOption">
            <asp:Label ID="_lblViewOption" runat="server" />
            <div>
                <div class="viewReplySort">
                    <asp:Literal ID="_litSort" runat="server" />
                      <br />
                        <asp:RadioButton ID="_rbChronological" GroupName="sort" runat="server" />
                        <br />
                        <asp:RadioButton ID="_rbDiscussion" GroupName="sort" runat="server" />
                </div>
                <div>
                    <asp:Literal ID="_litShow" runat="server" />
                    <br />
                        <asp:RadioButton ID="_rbPostReply" GroupName="show" runat="server" />
                        <br />
                        <asp:RadioButton ID="_rbSingle" GroupName="show" runat="server" />
                </div>
            </div>
            <div class="msgPerPage">
                <asp:DropDownList ID="_ddlPerPage" runat="server" /> <asp:Label ID="_litMsgPerPage" AssociatedControlID="_ddlPerPage" runat="server" />
            </div>
            <div id="_divReply" runat="server">
                <asp:Label ID="_lblReplyOption" runat="server" />
                <div class="replyOption">
                    <asp:CheckBox ID="_cbxQuote" runat="server" />
                </div>
                <div class="replyOption">
                    <asp:CheckBox ID="_cbxShowPhoto" runat="server" />
                </div>
            </div>
        </div>
    </ContentArea>
</fwk:Modal>
