<%@ Control Language="c#" AutoEventWireup="false" CodeBehind="ViewFeed.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.RssNewsReaderPortlet.ViewFeed" %>
<%@ Register TagPrefix="jenzabar" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="rssSideBar" TagName="SideBar" Src="SideBar.ascx" %>
<%@ Import Namespace="Jenzabar.ICS" %>
<%@ Import Namespace="Jenzabar.ICS.Web.Portlets.RssNewsReaderPortlet" %>
<%@ Import Namespace="Jenzabar.Portal.Framework" %>
<%@ Import Namespace="Jenzabar.Common.Globalization" %>
<script language="javascript" type="text/javascript">
	function ConfirmFeedDelete()
	{		
		if (confirm("<%= DeletConfirmationText %>")==true)
			return true;
		else
			return false;
	}
    
    function ToggleRssFeedItem(id)
    {
		var elem = document.getElementById(id);
		if (elem.style.display != 'none')
	    {
			elem.style.display = 'none';
		}
		else
		{
			elem.style.display = 'inline';
		}		
    }    
</script>
<table width="100%" cellpadding="0" cellspacing="0" class="rssTable">
	<tr>
		<td class="rssSideBarCell" valign="top">
			<rssSideBar:SideBar ID="sidebar" runat="server" />
		</td>
		<td width="75%" valign="top">
			<div class="rssViewFeedHeader">
				<table width="100%" class="rssTable">
					<tr>
						<td align="left" width="70%">
							&nbsp;
							<%= GetFeedIcon()%>
							<span style="vertical-align: middle;">
								<%= GetFeedName()%>
							</span>&nbsp; <a href="<%= BuildEditFeedUrl()%>" id="lnkViewFeedEditFeed" runat="server" style="text-decoration: none">
								<img id="imgViewFeedEditFeed" runat="server" align="absmiddle" /></a>
							<asp:ImageButton ID="imgDeleteFeed" runat="server" ImageAlign="AbsMiddle" />
						</td>
						<td align="right" width="30%">
							<div>
								<asp:LinkButton ID="lnkOpenCloseAll" Runat="server" CssClass="rssOpenCloseAll" />
							</div>
						</td>
					</tr>
				</table>
			</div>
			<div id="divViewFeedContent">
				<asp:Repeater ID="rptFeedItems" runat="server">
					<ItemTemplate>
						<div class="rssViewFeedRow">
							<table width="100%" class="rssTable">
								<tr>
									<td align="left">
										<!-- Title -->
										<span onclick="ToggleRssFeedItem('<%# Container.FindControl("rssViewFeedItemBody").ClientID %>')" style="cursor: pointer;">
											<%#BuildItemTitle((RssFeedItem)Container.DataItem) %>
										</span>
									</td>
									<td align="right">
										<a href="<%#((RssFeedItem)Container.DataItem).Link %>" target="_blank"><img id='rssImgViewFeed<%# DataBinder.Eval(Container, "ItemIndex") %>' src="ui/common/images/PortletImages/Icons/contents_expand.gif" />
										</a>
									</td>
								</tr>
							</table>
							<div id="rssViewFeedItemBody" runat="server" class="rssLightText" style="display: none">
								<!-- Publication Date -->
								<%#((RssFeedItem)Container.DataItem).PubDate %>
								<br />
								<br />
								<!-- Description -->
								<div class="rssCopyText">
									<%#((RssFeedItem)Container.DataItem).Description %>
								</div>
								<br />
							</div>
						</div>
					</ItemTemplate>
					<AlternatingItemTemplate>
						<div class="rssViewFeedAltRow">
							<table width="100%" class="rssTable">
								<tr>
									<td align="left">
										<!-- Title -->
										<span onclick="ToggleRssFeedItem('<%# Container.FindControl("rssViewFeedItemBody").ClientID %>')" style="cursor: pointer;">
											<%#BuildItemTitle((RssFeedItem)Container.DataItem) %>
										</span>
									</td>
									<td align="right">
										<a href="<%#((RssFeedItem)Container.DataItem).Link %>" target="_blank"><img id='rssImgViewFeed<%# DataBinder.Eval(Container, "ItemIndex") %>' src="ui/common/images/PortletImages/Icons/contents_expand.gif" />
										</a>
									</td>
								</tr>
							</table>
							<div id="rssViewFeedItemBody" runat="server" class="rssLightText" style="display: none">
								<!-- Publication Date -->
								<%#((RssFeedItem)Container.DataItem).PubDate %>
								<br />
								<br />
								<!-- Description -->
								<div class="rssCopyText">
									<%#((RssFeedItem)Container.DataItem).Description %>
								</div>
								<br />
							</div>
						</div>
					</AlternatingItemTemplate>
				</asp:Repeater>
				<a id="lnkViewAllItems" runat="server">
					<asp:Label ID="lblViewAllItems" runat="server" /></a>
			</div>
			<div id="divViewFeedError" runat="server" visible="false" class="pSection">
				<br />
				<asp:Label ID="lblRssError" runat="server" class="rssFeedError" />
			</div>
		</td>
	</tr>
</table>
