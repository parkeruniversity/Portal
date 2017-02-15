<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Print_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.ForumPortlet.Print_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>



<div class=pSection>
<p>
<div class=forumPortlet><asp:repeater id=MessageRptr runat="server">
				<HeaderTemplate>
					<table class="forumPosts" cellspacing="0" border="0">
				</HeaderTemplate>
				<ItemTemplate>
					<tr>
						<td style="border-bottom:0px; border-right:0px">
							<h5>
							<asp:Literal ID="litSubject" Runat=server></asp:Literal>
							</h5>
						</td>
						<td align="right" style="background:#ccc;margin: 0;padding: 5px;border-bottom-color: #aaa; border-left:0px">
							<span><span style="font-weight:bold;font-size: 80%;padding: 4px;border-left: solid 1px #fff;border-collapse:collapse;">
									<asp:Literal ID="litCreatedby" Runat=server></asp:Literal>
								</span><span style="font-weight:bold;font-size: 80%;padding: 4px;border-left: solid 1px #fff;border-collapse:collapse;">
								<asp:Literal ID=litCreated Runat=server></asp:Literal>
								</span></span>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="postBody">
							<asp:Literal ID="litMessage" Runat=server></asp:Literal>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="space">&nbsp;</td>
					</tr>
				</ItemTemplate>
				<FooterTemplate>
					</table>
				</FooterTemplate>
			</asp:Repeater></DIV>
<p><asp:linkbutton id=lnkGoToMain Runat="server"></asp:LinkButton></P>
<P></P></DIV>
