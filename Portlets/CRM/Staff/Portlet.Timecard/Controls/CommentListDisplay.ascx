<%@ Control Language="c#" AutoEventWireup="True" Codebehind="CommentListDisplay.ascx.cs" Inherits="Portlet.Timecard.Controls.CommentListDisplay" %>
<%@ Register TagPrefix="common" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="framework" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" Assembly="Jenzabar.Portal.Framework.Web" %>
<link href="<%= this.ResolveUrl("Styles/CommentListDisplay.css?v=182") %>" rel="stylesheet" type="text/css" />

<asp:Repeater ID="CommentList" runat="server">
	<HeaderTemplate>
		<ul class="tcCommentList">
			<li class="tcHeader"><asp:Label ID="Header" runat="server" /></li>
	</HeaderTemplate>
	<ItemTemplate>
			<li>
				<div id="CommentText" class="tcComment" runat="server" />
				<div class="tcSignatureLine">
					--<asp:Label ID="SignatureName" CssClass="tcName" runat="server" />, 
					<asp:Label ID="SignatureDate" CssClass="tcDate" runat="server" />
					<framework:PortalImageButton ID="DeleteButton" ImageCategory="PortletIcon" ImageUrl="delete.gif" 
							CommandName="DeleteComment" EnableViewState="true" runat="server" />
				</div>
				<div style="clear: both"></div>
			</li>
	</ItemTemplate>
	<FooterTemplate>
		</ul>
	</FooterTemplate>
</asp:Repeater>
