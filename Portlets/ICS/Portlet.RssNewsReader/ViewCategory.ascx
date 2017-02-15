<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ViewCategory.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.RssNewsReaderPortlet.ViewCategory" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="rssSideBar" TagName="SideBar" Src="SideBar.ascx" %>
<%@ Import Namespace="Jenzabar.ICS" %>
<%@ Import Namespace="Jenzabar.ICS.Web.Portlets.RssNewsReaderPortlet" %>
<%@ Import Namespace="Jenzabar.Common.Globalization" %>

<script language="javascript" type="text/javascript">
    function ConfirmCategoryDelete()
	{		
		if (confirm("<%= Globalizer.GetGlobalizedString("TXT_CONFIRM_RSS_CATEGORY_DELETE") %>")==true)
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
			<rssSideBar:SideBar ID="sidebar" Runat="server" />
		</td>
		<td width="75%" valign="top">
			<div id="divViewCategoryHeader" class="rssViewFeedHeader">
				<table width="100%" class="rssTable">
					<tr>
						<td align="left" width="70%">
							&nbsp;							
							<img id="imgViewCategoryFolder" src="ui/common/images/PortletImages/Icons/folder.gif" />
							<%= GetCategoryName()%>							
							&nbsp; 							
							<a href="<%= BuildEditCategoryUrl()%>" id="lnkEditCategory" style="TEXT-DECORATION: none">
								<img id="imgViewCategoryEditCategory" src="ui/common/images/PortletImages/Icons/edit.gif" runat="server" /> 
							</a>
							<asp:ImageButton ID="imgDeleteCategory" Runat="server" />
						</td>
						<td align="right" width="30%">
							<asp:LinkButton ID="lnkOpenCloseAll" Runat="server" class="rssOpenCloseAll" />
						</td>
					</tr>
				</table>
			</div>
			<br />
			<!-- Begin Feed Repeater -->
			<asp:Repeater ID="rptFeeds" Runat="server">
				<ItemTemplate>
					<div class="rssViewCategoryItemHeader">
						<%# new RssFeedUtil().GetFeedIcon(((RssFeed)Container.DataItem).Url)%>
						<a ID="lnkViewFeed" runat="server">
							<%# ((RssFeed)Container.DataItem).Name %>
						</a>
					</div>
					<!-- Begin Feed Items Repeater -->
					<asp:Repeater ID="rptFeedItems" Runat="server">
						<ItemTemplate>
							<div class="rssViewCategoryFeedItemsRow">
								<table width="100%">
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
							</div>
						</ItemTemplate>
						<AlternatingItemTemplate>
							<div class="rssViewCategoryFeedItemsAltRow">
								<table width="100%">
									<tr>
										<td align="left">
											<!-- Title -->
											<span onclick="ToggleRssFeedItem('<%# Container.FindControl("rssViewFeedItemBody").ClientID %>')" style="cursor: pointer;">
												<%#BuildItemTitle((RssFeedItem)Container.DataItem) %>
											</span>
										</td>
										<td align="right">
											<a href="<%#((RssFeedItem)Container.DataItem).Link %>" target="_blank" ><img id='rssImgViewFeed<%# DataBinder.Eval(Container, "ItemIndex") %>' src="ui/common/images/PortletImages/Icons/contents_expand.gif" />
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
					<!-- End Feed Items Repeater -->
					<br />
					<a id="lnkViewAllItems" runat="server">
						<% =Globalizer.GetGlobalizedString("TXT_VIEW_ALL_ITEMS")%>
					</a>
					<br />
					<br />
				</ItemTemplate>
			</asp:Repeater>
			<!-- End Feed Repeater -->
		</td>
	</tr>
</table>
