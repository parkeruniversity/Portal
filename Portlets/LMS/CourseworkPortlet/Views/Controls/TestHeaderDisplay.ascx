<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TestHeaderDisplay.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.TestHeaderDisplay" %>
<%@ Register TagPrefix="framework" Assembly="Jenzabar.Portal.Framework.Web" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" %>
<%@ Register TagPrefix="JICS" Namespace="Jenzabar.Portal.Web.UI.Controls" Assembly="Jenzabar.Portal.Web" %>
<div class="testHeader">
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
		<li id="_liExit" runat="server" class="exitTest">
			<framework:PortalImageAndTextButton ID="_pitExit" ImageCategory="PortletIcon" runat="server" />
		</li>

	</ul>
	<ul class="testStatus">
		<li runat="server" id="_liRemain" class="timeRemaining first">
			<asp:Literal ID="_litRemaining" runat="server" />
			<asp:Label ID="_lblTimeRemaining" CssClass="headerStrong timeDisplay" runat="server" />
		</li>
		<li  class="saveTest">
				<asp:Button ID="_btnSave" runat="server" />
				<asp:Literal ID="_litSaved" runat="server" />
		</li>
		<li id="_liPage" runat="server">
			<asp:Label ID="_lblPages" CssClass="testHeaderPages" runat="server" />
			<JICS:Paging id="_paging" runat="server" />
		</li>
	</ul>	
</div>

		
			
		