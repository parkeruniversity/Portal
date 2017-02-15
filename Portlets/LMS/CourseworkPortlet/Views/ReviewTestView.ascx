<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ReviewTestView.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.ReviewTestView" %>
<%@ Register TagPrefix="framework" Assembly="Jenzabar.Portal.Framework.Web" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register TagPrefix="cwk" TagName="ReviewHeader" Src="Controls/ReviewHeaderDisplay.ascx" %>
<%@ Register TagPrefix="cwk" TagName="OnlineAssignmentAttempts" Src="Controls/StudentAssignmentDetails/OnlineAssignmentAttempts.ascx"  %>

<link href="<%= ResolveUrl("../Style/FullScreen.css") %>" type="text/css" rel="stylesheet" />

<div class="testArea reviewArea">
	<asp:UpdatePanel id="_update" runat="server">
		<ContentTemplate>
            <asp:HiddenField ID="_hPage" runat="server" />
			<cwk:ReviewHeader id="_header" runat="server" />
            <cwk:OnlineAssignmentAttempts id="_attempts" runat="server"  />
            <div class="reviewFooter">
                <framework:PortalImageAndTextButton ID="_pitExit" ImageCategory="PortletIcon" runat="server" />
            </div>
        </ContentTemplate>
	</asp:UpdatePanel>
</div>