<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Comment.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.ForumPortlet.Views.Controls.Comment" %>


<asp:Panel ID="_panEdit" CssClass="commentContainer" runat="server"> 
    <asp:Image ID="_imgComment" runat="server" CssClass="commentBubble" />
    <div class="commentEdit">
        <div class="manageTitle"><asp:Label ID="_lblTitle" runat="server" AssociatedControlID="_txtComment" /></div>
        <asp:TextBox ID="_txtComment" TextMode="MultiLine" Rows="5" runat="server" />
        <div class="actionButtons">
            <asp:Button ID="_btnSave" runat="server" />
            <asp:Button ID="_btnCancel" runat="server" />
        </div>
     </div>
     <div  class="commentInfo" >
         <asp:Label ID="_lblCommentInfo" runat="server"/>
     </div>
</asp:Panel>

<asp:Panel ID="_panRender" CssClass="commentContainer" runat="server">
    <div class="commentBy">
        <div style="float:right;">
            <asp:LinkButton ID="_lbtnEdit" runat="server" />
            <asp:LinkButton ID="_lbtnDelete" runat="server" />
        </div>
        <asp:Label ID="_lblCommentBy" runat="server" />
    </div>
    <div class="comment">
        <asp:Literal ID="_litComment" runat="server" />
    </div>
</asp:Panel>
