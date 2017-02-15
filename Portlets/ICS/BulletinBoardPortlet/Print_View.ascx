<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Print_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.BulletinBoardPortlet.Print_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<LINK href="Portlets/ICS/BulletinBoardPortlet/BBStyle.css" type="text/css" rel="stylesheet">
<div class="pSection">
<p>
	<div class="forumPortlet">
		<asp:Repeater id="MessageRptr" runat="server">
		<HeaderTemplate>
			<table class="forumPosts" cellspacing="0" border="0">
		</HeaderTemplate>
		<ItemTemplate>
			<tr>
				<td>
					<h5>
						<%# DataBinder.Eval(Container.DataItem, "Subject") %>
						<span class="links">
							<span class="rcell">
								<%# DataBinder.Eval( Container.DataItem, "ForumUser.User.NameDetails" ).ToString()%>
							</span>
							<span class="rcell">
								<%# DataBinder.Eval(Container.DataItem, "Created") %>
							</span>
						</span>
						
					</h5>
					<div class="postBody">
						<%# DataBinder.Eval(Container.DataItem, "Message") %>
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
	<p>
		<asp:LinkButton ID="lnkGoToMain" Runat="server"></asp:LinkButton>
	</p>
</p>
</div>
