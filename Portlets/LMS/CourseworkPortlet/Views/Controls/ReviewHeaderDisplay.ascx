<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ReviewHeaderDisplay.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.ReviewHeaderDisplay" %>
<%@ Register TagPrefix="framework" Assembly="Jenzabar.Portal.Framework.Web" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" %>
<%@ Register TagPrefix="JICS" Namespace="Jenzabar.Portal.Web.UI.Controls" Assembly="Jenzabar.Portal.Web" %>
<div class="testHeader reviewHeader">
	<ul>
		<li class="first">
			<asp:Label ID="_lblName" CssClass="Title" runat="server" />
			<asp:Label ID="_lblType" runat="server" />
		</li>
		<li class="testCounter">
			<asp:Literal ID="_litLimit" runat="server" />
			<asp:Label ID="_lblTotalTime" CssClass="headerStrong"  runat="server" />
		</li>
		<li class="testCounter">
			<asp:Literal ID="_litCount" runat="server" />
			<asp:Label ID="_lblQuestionCount" CssClass="headerStrong"  runat="server" />
		</li>
		<li class="testCounter">
			<asp:Literal ID="_litScored" runat="server" />
			<asp:Label ID="_lblPoints" CssClass="headerStrong"  runat="server" />	
		</li>
		<li class="exitTest">
			<framework:PortalImageAndTextButton ID="_pitExit" ImageCategory="PortletIcon" runat="server" />
		</li>
	</ul>
</div>

		
			
		