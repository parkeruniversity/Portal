<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DynamicStyle.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.NewsPortlet.Controls.DynamicStyle" %>
<!-- Dynamic Style -->
<style type="text/css">
    div.postStatusHigh
    {
	    padding-left:16px;
	    background: #a90000 url(<%= GetImgUrl("highPriority.gif") %>) no-repeat  0px 3px;	
    }

    div.postStatusUnRead
    {
	    padding-left:16px;
	    background: #7da7d9 url(<%= GetImgUrl("arrowRight.gif") %>) no-repeat  0px 3px;	
    }
    
    div.postStatusPending
    {
	    padding-left:16px;
	    background: #555 url(<%= GetImgUrl("pending_post.gif") %>) no-repeat  0px 3px;	
    }
</style> 