<%@ Page language="c#" Codebehind="PrintView.aspx.cs" AutoEventWireup="false" Inherits="Jenzabar.Portal.Web.Applications.ICS.Portlets.ForumPortlet.PrintView" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" > 

<html>
  <head>
    <title>PrintView</title>
    <meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" Content="C#">
    <meta name=vs_defaultClientScript content="JavaScript">
    <meta name=vs_targetSchema content="http://schemas.microsoft.com/intellisense/ie5">
    <style type="text/css">
		.forumPortlet .forumPosts {
		cellspacing: 0;
		cellpadding: 0;
		width: 95%;
		border: none;
		}
		.forumPortlet .forumPosts th,
		.forumPortlet .forumPosts td {
		border: solid 1px #aaa;
		border-collapse:collapse;
		vertical-align: top;  
		padding: 0;
		margin: 0 0 1000px 0;
		}
		.forumPortlet .forumPosts th {
		padding: 10px;
		width: 100px;
		background: #eee;
		text-align: left;
		font-weight: normal;
		border-right: none;
		}
		.forumPortlet .forumPosts td.space {
		height: 20px;
		border: none;
		}
		.forumPortlet .forumPosts th a,
		.forumPortlet .forumPosts th div,
		.forumPortlet .forumPosts th img {
		display: block;
		}
		.forumPortlet .forumPosts th a,
		.forumPortlet .forumPosts th a:link,
		.forumPortlet .forumPosts th a:visited {
		font-weight: bold;
		color: #000;
		}
		.forumPortlet .forumPosts th a:hover {
		font-weight: bold;
		color: #000;
		text-decoration: none;
		}
		.forumPortlet .forumPosts td h5 {
		margin: 0;
		background: #ccc;
		padding: 5px;
		}
		.forumPortlet .forumPosts td .postInfo {
		border-bottom: solid 1px #aaa;
		background: #eee;
		position: relative;
		white-space: nowrap;
		overflow: hidden;
		padding: 2px;
		}
		.forumPortlet .forumPosts td .postInfo .postHist {
		border-right:  solid 1px #aaa;
		padding: 0 .25em;
		}
		  
		.forumPortlet .forumPosts td .postInfo .postLinks {
		position: absolute;
		right: 5px;
		}
		.forumPortlet .forumPosts td .postBody {
		margin: 10px;
		}

		.forumPortlet h4,
		{
		background: #ccc;
		margin: 0 0 1px 0;
		padding: 5px;
		}

		.forumPortlet h5 {
		margin: 0 0 1px 0;
		background: #ddd;
		padding: 2px;
		}

		.forumPortlet h4 .links,
		{
		position: absolute;
		right: 10px;
		}

		.forumPortlet h4 .lcell,
		.forumPortlet h5 .lcell
		{
		padding: 4px;
		border-right: solid 1px #fff;
		border-collapse:collapse;
		}

		.forumPortlet h4 .rcell,
		.forumPortlet h5 .rcell
		{
		padding: 4px;
		border-left: solid 1px #fff;
		border-collapse:collapse;
		}

		</style>
  </head>
  <body MS_POSITIONING="GridLayout">
	
    <form id="PrintView" method="post" runat="server">
		<div class="pSection">
			<div class="forumPortlet">
				<asp:Repeater id="MessageRptr" runat="server">
				<HeaderTemplate>
					<table class="forumPosts" cellspacing="0" border="0">
				</HeaderTemplate>
				<ItemTemplate>
					<tr>
						<td>
							<h5><%# DataBinder.Eval(Container.DataItem, "Subject") %></h5>
							<div class="postInfo">
								<%# DataBinder.Eval( Container.DataItem, "ForumUser.User.NameDetails" ).ToString()%>
								<span class="postLinks"><%# DataBinder.Eval(Container.DataItem, "Created") %></span>
							</div>
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
		</div>

     </form>
	
  </body>
</html>
