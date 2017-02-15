<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OnlineAssignmentAttemptDetails.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.StudentAssignmentDetails.OnlineAssignmentAttemptDetails" %>
<%@ Register TagPrefix="cwk" TagName="ReviewContainer" Src="../ReviewDisplay/ReviewContainer.ascx" %>
<%@ Register TagPrefix="framework" Assembly="Jenzabar.Portal.Framework.Web" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" %>

<div class="retakeGradeContainer" runat="server" id="_divGradeBox">
    <asp:Label runat="server" ID="lblRetakeGradeLabel" CssClass="retakeGradeLabel" />
    <asp:Label runat="server" ID="lblRetakeGrade" CssClass="retakeGrade" />
</div>
<div class="attemptDetails">
	<asp:Label runat="server" ID="_lblAttemptDetails" />
	<asp:Label ID="_lblAttemptTime" CssClass="attemptTime" runat="server" />
    <asp:Panel ID="_panIP" runat="server" CssClass="ipAddress"></asp:Panel>
	<div>
		<asp:Label ID="_lblIgnore" CssClass="ignoreInfo" runat="server" />
		<asp:Image ID="_imgIgnore" runat="server" />
        <asp:LinkButton ID="_lbtnIgnore" runat="server" />
	</div>
</div>
<cwk:ReviewContainer id="_reviewContainer" runat="server" />
<br style="clear:both;" />
