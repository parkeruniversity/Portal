<%@ Import Namespace="Jenzabar.ICS.Web.Portlets.RssNewsReaderPortlet" %>
<%@ Import Namespace="Jenzabar.Common.Globalization" %>
<%@ Import Namespace="Jenzabar.ICS" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="SideBar.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.RssNewsReaderPortlet.SideBar" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<script language="javascript" type="text/javascript">

  function ToggleSideBarCategories(id, folderID)
    {
	  var elem = document.getElementById(id);
	  var imgFolder;
	  if (elem.style.display != 'none')
	  {
	     imgFolder = document.getElementById(folderID);
	     imgFolder.src = "ui/common/images/PortletImages/Icons/folder_closed.gif";
	     elem.style.display = 'none';
	  }
	  else
	  {
		  imgFolder = document.getElementById(folderID);
	      imgFolder.src = "ui/common/images/PortletImages/Icons/folder_open.gif";
	      elem.style.display = 'inline';
	  }   
    }
    
    function RefreshFeeds()
    {
		var url = "Portlets/ICS/Portlet.RssNewsReader/RefreshFeeds.aspx";
		xmlHttp = GetXmlHttpObject();
		xmlHttp.onreadystatechange = stateChanged;
		xmlHttp.open("GET", url, true);
		xmlHttp.send(null);
    }
    
    function stateChanged() 
	{ 
		if (xmlHttp.readyState == 4)
		{ 
		    location.reload(true);		
		}
	}
	
	function GetXmlHttpObject()
	{
		var xmlHttp = null;
		try
		{
			// Firefox, Opera 8.0+, Safari
			xmlHttp = new XMLHttpRequest();
		}
		catch (e)
		{
			// Internet Explorer
			try
			{
				xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
			}
			catch (e)
			{
				xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
		}
		return xmlHttp;
	}    
</script>
<div id="divContent" runat="server" style="width: 100%;">
	<div id="divInstructions" runat="server" style="padding-bottom: 5px; padding-top: 10px; padding-left: 10px; width: 100%;">
		<asp:Label ID="lblInstructions" runat="server" />
	</div>
	
	<div id="divPadding" style="padding-bottom: 5px; padding-top: 5px;"></div>
	
	<div id="divViewAllFeedsOutterDiv" runat="server" style="width: 100%;">
		<div id="divViewAllFeeds" class="rssViewAllFeeds">
			<a id="lnkViewAllFeeds" runat="server" style="color: #000000; text-decoration: none">
				<img id="imgAllFeeds" src="ui/common/images/PortletImages/Icons/folder.gif">
				<%= Globalizer.GetGlobalizedString("TXT_ALL_FEEDS")%>
				<asp:Label ID="lblAllFeedsUnreadCount" runat="server" />
			</a>
		</div>
	</div>
	<!-- Repeater of Categories -->
	<asp:Repeater ID="rptCategories" runat="server">
		<ItemTemplate>
			<div id="rssCategoryOutterDiv" runat="server">
				<div id='rssCategory<%# DataBinder.Eval(Container, "ItemIndex") %>' style="display: block; padding-left: 10px; padding-top: 3px; padding-bottom: 3px;">
					<img id="imgRssCategoryFolder" runat="server" />
					<a id="lnkViewCategory" runat="server" style="color: #000000; text-decoration: none;">
						<%# ((RssCategory)Container.DataItem).Name%>
						<asp:Label ID="lblCategoryUnreadCount" runat="server" />
					</a>
				</div>
			</div>
			<!-- Repeater of items in the given Category -->
			<div id="rssCategoryItems" runat="server" style="display:none" >
				<asp:Repeater ID="rptCategoryFeeds" runat="server">
					<ItemTemplate>
						<div id="rssCategoryFeedOutterDiv" runat="server">
							<div id="rssCategoryFeed" style="padding-left: 15px; padding-top: 3px; padding-bottom: 3px;">
								<a id="lnkViewCategoryFeed" runat="server" style="color: #000000; text-decoration: none;">
									<%# new RssFeedUtil().GetFeedIcon(((RssFeed)Container.DataItem).Url)%>
									<span style="vertical-align: middle">
										<%# ((RssFeed)Container.DataItem).Name %>
										<asp:Label ID="lblCategoryFeedUnreadCount" runat="server" /></span></a>
							</div>
						</div>
					</ItemTemplate>
				</asp:Repeater>
			</div>
			<!-- END Repeater of items in the given Category -->
		</ItemTemplate>
	</asp:Repeater>
	<!-- END Repeater of Categories -->
	<!-- Repeater of items not in a Category -->
	<asp:Repeater ID="rptFeeds" runat="server">
		<ItemTemplate>
			<div id="rptFeedsDiv" runat="server" class="rssSideBarFeedRepeaterItem">
				<div style="padding-left: 8px;">
				<a id="lnkViewFeed" runat="server" style="color: #000000; text-decoration: none; width: 100%;">
					<%# new RssFeedUtil().GetFeedIcon(((RssFeed)Container.DataItem).Url)%>
					<span style="vertical-align: middle; width: 100%">
						<%# ((RssFeed)Container.DataItem).Name %>
						<asp:Label ID="lblFeedUnreadCount" runat="server" /></span></a>
						</div>
			</div>
		</ItemTemplate>
	</asp:Repeater>
	<!-- END Repeater of items not in a Category -->
</div>
<br />
<div id="divRefresh" runat="server" visible="false" class="rssSideBarRefresh">
	<asp:ImageButton ID="imgBtnRefreshFeeds" runat="server" ImageAlign="AbsMiddle" />
	<asp:LinkButton ID="lnkBtnRefreshFeeds" runat="server" />
</div>
<br />
<div id="divAddContent" runat="server">
	    <div id="divAddFeed" class="rssSideBarAddFeed">
	    <img id="imgAddFeed" runat="server" /><a id="lnkAddFeed" runat="server"></a>
		</div>
		<br />
		<div id="divAddCategory" class="rssSideBarAddCategory">
		<img id="imgAddCategory" runat="server" /><a id="lnkAddCategory" runat="server"></a>
		</div>
</div>

