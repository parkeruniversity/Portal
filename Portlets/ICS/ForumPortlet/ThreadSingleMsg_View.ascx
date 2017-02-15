<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ThreadSingleMsg_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.ForumPortlet.ThreadSingleMsg_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="framework" namespace="Jenzabar.Portal.Framework.Web.UI.Controls" assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Import namespace="Jenzabar.ICS.Web.Portlets.Common" %>
<%@ Import namespace="Jenzabar.ICS.Web.Portlets.ForumPortlet" %>
<%@ Import namespace="Jenzabar.ICS" %>
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
					<asp:LinkButton ID="lnkMultiMessage" Runat="server"></asp:LinkButton>
				</span>
			</span>
		</h4>
		<br>
		<asp:Repeater id="MessageRptr" runat="server">
		<HeaderTemplate>
			<table class="forumPosts" cellspacing="0" border="0">
		</HeaderTemplate>
		<ItemTemplate>
		<tr>
				<th>
					<asp:PlaceHolder ID="phUserInfo" Runat="server">
						<framework:MyInfoPopup id="MyInfoLink" UserID='<%# DataBinder.Eval( Container.DataItem, "ForumUser.User.ID" ).ToString() %>' runat="server">
							<%# DataBinder.Eval( Container.DataItem, "ForumUser.User.NameDetails" ).ToString() %>test
						</framework:MyInfoPopup>
						<div>
							<asp:label ID="lblUserName" Runat=Server /><%# DataBinder.Eval( Container.DataItem, "ForumUser.User.NameDetails" ).ToString()%><br>
							<asp:Image ID="Photo" Runat="server" Visible="False" class='<%#((bool)( UserPhoto.HasPhoto( DataBinder.Eval( Container.DataItem, "ForumUser.User.ID" ).ToString() ) ) ? "gPhotoImage" : "gPhotoNoImage")%>' />
							<asp:label ID="lblPosts" Runat=Server /> &nbsp; <%# DataBinder.Eval( Container.DataItem, "ForumUser.Posts" ).ToString()%>
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
							<asp:LinkButton ID="ReplyLink" CommandName="Reply" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ID")%>'  Runat="server"></asp:LinkButton></span>
					</div>
					<div class="postBody">
						<%# DataBinder.Eval(Container.DataItem, "Message") %>
					</div>
					<div class="postBody" align="center">
						<asp:Hyperlink NavigateUrl="#" ID="FileLink" Runat="server" target="_blank"></asp:Hyperlink>
					</div>
				</td>
				</tr>
				<tr><td colspan="2" class="space">&nbsp;</td></tr>
		</ItemTemplate>
		<FooterTemplate>
			</table>
		</FooterTemplate>
		</asp:Repeater>
		<jenzabar:groupedgrid id=MessageGrid runat="server" AllowSorting="true" CellPadding="0" DataKeyField="ID" GroupKeyField="ID" RenderGroupHeaders="true">
			<GroupHeaderTemplate>
						<em><asp:label ID="lblEntireThread" Runat=Server /></em>
			</GroupHeaderTemplate>
			<Columns>
				<asp:TemplateColumn HeaderText="#" SortExpression="ReplyNumber">
					<ItemTemplate>
						<asp:Label ID="lblRepNum" Runat="server" />
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="Subject" SortExpression="Subject">
					<ItemTemplate>
						<asp:LinkButton ID="ViewMessageLink" CommandName="ViewMessage" Runat="server">
							<%# DataBinder.Eval( Container.DataItem, "Subject" )%>
						</asp:LinkButton>	
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="Author" SortExpression="ForumUser.User.NameDetails, Created desc">
					<ItemTemplate>
						<%# (bool)DataBinder.Eval( Container.DataItem, "Anonymous" ) ? "Anonymous" : DataBinder.Eval( Container.DataItem, "ForumUser.User.NameDetails" ).ToString()%>
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="Posted" SortExpression="Created desc">
					<ItemTemplate>
						<%# DataBinder.Eval( Container.DataItem, "Created" ).ToString()%>
					</ItemTemplate>
				</asp:TemplateColumn>
			</Columns>
		</jenzabar:groupedgrid>
	</div>
</p>
</div>