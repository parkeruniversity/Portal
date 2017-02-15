<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ThreadMultiMsg_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.BulletinBoardPortlet.ThreadMultiMsg_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="framework" namespace="Jenzabar.Portal.Framework.Web.UI.Controls" assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Import namespace="Jenzabar.ICS.Web.Portlets.BulletinBoardPortlet" %>
<%@ Import namespace="Jenzabar.ICS" %>
<LINK href="Portlets/ICS/BulletinBoardPortlet/BBStyle.css" type="text/css" rel="stylesheet">
<div class="pSection">
<p>
	<div class="forumPortlet">
		<h4>
			<asp:LinkButton  ID="lnkTopic" Runat="server"/> 
			<span class="links">
				<span class="rcell">
					<asp:LinkButton ID="lnkSubscribe" Runat="server"></asp:LinkButton>
				</span>
				<!--span class="cell">
					Hide Photos
				</span-->
				<span class="rcell">
					<asp:LinkButton ID="lnkSingleMessage" Runat="server"></asp:LinkButton>
				</span>
			</span>
		</h4>
		<h5 id="PagingHeader" runat="server" align="center"></h5>
		&nbsp;<asp:Literal ID="litNotify" Runat="server"></asp:Literal>
		<p class="hint" id="pHint" runat="server">
			<asp:Literal ID="litHintVerbiage" Runat="server"></asp:Literal>
			<asp:LinkButton ID="lbViewAll" Runat="server" ></asp:LinkButton>
		</p>
		<br/>
		<asp:Repeater id="MessageRptr" runat="server">
		<HeaderTemplate>
			<table class="forumPosts" cellspacing="0" border="0" width="95%">
		</HeaderTemplate>
		<ItemTemplate>
		<tr>
				<th>
					<asp:PlaceHolder ID="phUserInfo" Runat="server">
						<framework:MyInfoPopup id="MyInfoLink" UserID='<%# DataBinder.Eval( Container.DataItem, "ForumUser.User.ID" ).ToString() %>' runat="server">
							<%# DataBinder.Eval( Container.DataItem, "ForumUser.User.NameDetails" ).ToString() %>
						</framework:MyInfoPopup>
						<div>
							<asp:label ID="lblUserName" Runat=Server /><%# DataBinder.Eval( Container.DataItem, "ForumUser.User.NameDetails" ).ToString()%>
							<asp:Image ID="Photo" Runat="server" class='<%#((bool)( UserPhoto.HasPhoto( DataBinder.Eval( Container.DataItem, "ForumUser.User.ID" ).ToString() ) ) ? "gPhotoImage" : "gPhotoNoImage")%>' />
						</div>
					</asp:PlaceHolder>
					<b><asp:Label ID="lblAnon" Runat="server" Visible="False" /></b>
				</th>
				<td>
					<h5><%# DataBinder.Eval(Container.DataItem, "Subject") %></h5>
					<div class="postInfo">
						<span class='postHist'>
							<asp:Label ID="lblNum" Runat="server" />
							<asp:LinkButton ID="ViewMsgLink" CommandName="ViewMessage" Runat="server" />
						</span>
							
						<%# DataBinder.Eval(Container.DataItem, "Created") %>
						<span class="postLinks">
							<asp:LinkButton ID="EditLink" CommandName="Edit" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ID")%>'  Runat="server"></asp:LinkButton>
							<asp:LinkButton ID="DeleteLink" CommandName="Delete" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ID")%>'  Runat="server"></asp:LinkButton>
							<asp:LinkButton ID="ReplyLink" CommandName="Reply" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ID")%>'  Runat="server"></asp:LinkButton>
						</span>
					</div>
					<div class="postBody">
						<%# DataBinder.Eval(Container.DataItem, "Message") %>
					</div>
					<div class="postBody" align="center">
						<asp:Hyperlink NavigateUrl="#" ID="FileLink" Runat="server" target="_blank"><%= Globalizer.GetGlobalizedString("TXT_FILE") %></asp:Hyperlink>
					</div>
				</td>
			</tr>
			<tr><td colspan="2" class="space">&nbsp;</td></tr>
		</ItemTemplate>
		<FooterTemplate>
			</table>
		</FooterTemplate>
		</asp:Repeater>
	</div>
</p>
</div>
