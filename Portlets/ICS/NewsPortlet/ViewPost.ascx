<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ViewPost.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.NewsPortlet.ViewPost" %>
<%@ Register src="Controls/NewsPost.ascx" tagname="NewsPost" tagprefix="JICS" %>
<%@ Register TagPrefix="cmn" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls"%>
<%@ Register src="Controls/DynamicStyle.ascx" tagname="DynamicStyle" tagprefix="JICS" %>
<%@ Register src="Controls/ViewingMySubs.ascx" tagname="ViewingMySubs" tagprefix="JICS" %>
<%@ Register TagPrefix="JICS" tagname="TextEditor" src="~\UI\Controls\TextEditor.ascx" %>

<link rel="stylesheet" type="text/css" href="<%= this.ResolveUrl("~/UI/Common/Styles/lightbox.css") %>" />
<script language="JavaScript" src="<%= this.ResolveUrl("~/UI/Common/Scripts/jquery.lightbox.js") %>"></script>
<script>
		$(document).ready(function(){
			$(".lightbox").lightbox(
			    {
			        fileLoadingImage:'<%=this.ResolveUrl("~/UI/Common/Images/PortletImages/Lightbox/loading.gif")%>',
			        fileBottomNavCloseImage:'<%=this.ResolveUrl("~/UI/Common/Images/PortletImages/Lightbox/closelabel.gif")%>'
			    }
			 );
		});

</script>

<div class="pSection">
    <JICS:DynamicStyle ID="_dynamicStyle" runat="server" />
    <JICS:ViewingMySubs id="_vMySubs" runat="server" />
    <JICS:NewsPost id="_newsPost" runat="server" />
    <div style="clear:both;"></div>
    <asp:Panel ID="_panComments" runat="server" CssClass="postComments">
        <asp:Image ID="_imgDiscuss" runat="server" />&nbsp;<cmn:GlobalizedLabel ID="_glblDiscuss" CssClass="postComment" runat="server"></cmn:GlobalizedLabel>
        <asp:Repeater ID="_rptComments" runat="server">
            <ItemTemplate>
                <div class ="commentInfo">
                    <asp:Label ID="_lblCommentCount" CssClass="postComment" runat="server"></asp:Label>
                    <asp:Label ID="_lblCommentInfo" runat="server"></asp:Label>
                    <asp:ImageButton ID="_ibtnDelete" runat="server" OnClick="_ibtnDelete_Click" />
                </div>
                <p>
                    <asp:Literal ID="_litComment" runat="server"></asp:Literal>
                </p>
            </ItemTemplate>
        </asp:Repeater>
        <a name="addComment" ></a>
        <asp:Panel ID="_panAddComment" runat="server" class="addComment">
            <cmn:GlobalizedLabel ID="_glblComment" CssClass="postComment" runat="server"></cmn:GlobalizedLabel>
            <br />
            <JICS:TextEditor id="_textEditorComment" MaxLength="6000" runat="server" />
            <br />
            <cmn:GlobalizedButton ID="_gbtnSave" runat="server" OnClick="_gbtn_Click" />
        </asp:Panel>
    </asp:Panel>
    <asp:Panel ID="_panErr" runat="server" Visible="false" >
        <asp:Literal ID="_litError" runat="server"></asp:Literal>
    </asp:Panel>
</div>