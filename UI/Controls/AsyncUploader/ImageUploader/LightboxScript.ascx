<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LightboxScript.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.Controls.AsyncUploader.ImageUploader.LightboxScript" %>
<link rel="stylesheet" type="text/css" property="stylesheet" href="<%= this.ResolveUrl("~/UI/Common/Styles/lightbox.css") %>" />
<script src="<%= this.ResolveUrl("~/UI/Common/Scripts/jquery.lightbox.js") %>"></script>
<script>
    $(document).ready(function() { LoadLightboxValues();});    
	function LoadLightboxValues() 
	{
	    $(".lightbox").lightbox(
	        {
	            fileLoadingImage: '<%=this.ResolveUrl("~/UI/Common/Images/PortletImages/Lightbox/loading.gif")%>',
	            fileBottomNavCloseImage: '<%=this.ResolveUrl("~/UI/Common/Images/PortletImages/Lightbox/closelabel.gif")%>'
	        });
	}
 
</script>