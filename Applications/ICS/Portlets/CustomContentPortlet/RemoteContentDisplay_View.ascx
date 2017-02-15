<%@ Control Language="c#" AutoEventWireup="false" Codebehind="RemoteContentDisplay_View.ascx.cs" Inherits="Jenzabar.Portal.Web.Applications.ICS.Portlets.CustomContentPortlet.RemoteContentDisplay_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<script>
	var stayingOnSite = false;

	window.onload = function() {
	    var anchors = document.getElementsByTagName('a');

	    for (var i = 0; i < anchors.length; i++) {
	        if ((anchors[i].href.match(document.domain))
				|| (anchors[i].href.match('javascript:__doPostBack'))) {
	            anchors[i].oldonclick = anchors[i].onclick;
	            anchors[i].onclick = function(evt) {
	                if (this.oldonclick && typeof (this.oldonclick) != 'undefined') {
	                    if (this.oldonclick(evt) == false) { preventDefaultEvent(event, false); }
	                }

	                stayingOnSite = true;
	                return;
	            }
	        }
	    }
	}
	
	window.onbeforeunload = function (evt) 
	{
	
		if (!stayingOnSite)
		{
			var message = 'The page being displayed is trying to navigate away from JICS';
			if (typeof evt == 'undefined') 
			{
				evt = window.event;
			}
			if (evt) 
			{
				evt.returnValue = message;
			}
			
			stayingOnSite = false; 
			return message;
		}
	}
</script>
<div class="pSection">
	<div id="divEditOrAdd" runat="server" align="right"><asp:LinkButton ID="lnkEditOrAdd" Runat="Server" /></div>
	<asp:literal id="RemoteContent" runat="server" />
</div>
