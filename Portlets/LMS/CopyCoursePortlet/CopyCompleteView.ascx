<%@ Control Language="c#" AutoEventWireup="false" Codebehind="CopyCompleteView.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CopyCoursePortlet.CopyCompleteView" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="jenzabar" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Import Namespace="Jenzabar.Common.Globalization" %>

<jenzabar:SubHeader id="MainHeader" runat="server" TextKey="TXT_COURSE_COPYING" />

<div id="SuccessMessage" class="feedbackMessage" runat="server">
	<%=Globalizer.GetGlobalizedString("MSG_COPYCOURSEPORTLET_SUCCESSMESSAGE")%>
</div>

<div class="pSection">
	<asp:Label ID="SuccessText" Runat="server" />
</div>

<div class="pSection">
	<asp:Repeater ID="DestinationCourses" Runat="server">
		<HeaderTemplate><ul></HeaderTemplate>
		<ItemTemplate>
			<li style="margin-left:30px"><a id="DestinationCourseLink" runat="server" /></li>
		</ItemTemplate>
		<FooterTemplate></ul></FooterTemplate>
	</asp:Repeater>
</div>

<div class="pSection ccButtons">
	<jenzabar:GlobalizedLinkButton ID="BackButton" TextKey="MSG_COPYCOURSEPORTLET_BACK_TO_MAIN" runat="server" />
	<jenzabar:GlobalizedLinkButton ID="CancelButton" TextKey="MSG_COPYCOURSEPORTLET_DONE_FOR_NOW" runat="server" />
</div>
