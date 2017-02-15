<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GradeByQuestionView.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.GradeByQuestionView" %>
<%@ Register src="Controls/DetailHeader.ascx" tagname="Header" tagprefix="cwk" %>
<%@ Register src="Controls/QuestionNavSubHeader.ascx" tagname="SubHeader" tagprefix="cwk" %>
<%@ Register src="Controls/GradeByQuestionErrorDisplay.ascx" tagname="ErrorDisplay" tagprefix="cwk" %>
<%@ Register TagPrefix="cmn" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="cwk" TagName="QuestionDisplay" Src="Controls/QuestionDisplay/QuestionDisplay.ascx" %>
<%@ Register TagPrefix="cwk" TagName="ReviewContainer" Src="Controls/ReviewDisplay/ReviewContainer.ascx" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register TagPrefix="lms" TagName="FeedbackDisplay" Src="../../Common/Controls/FeedbackDisplay.ascx"%>

<cwk:Header ID="_header" runat="server" />
<cwk:ErrorDisplay id="_errorDisplay" runat="server" Visible="false" />
<asp:UpdatePanel runat="server" ID="_updatePanelHeader">
<ContentTemplate>
	<cwk:SubHeader id="_subHeader" runat="server" />
</ContentTemplate>
</asp:UpdatePanel>

<div class="pSection">
	<cwk:QuestionDisplay id="_qDisplay" runat="server" />
	<asp:Label ID="_lblNoUserResponses" runat="server" />
	<div >
		<!--Feedback control must exists outside of UpdatePanel for proper usage-->
		<lms:FeedbackDisplay id="_dummyFeedbackDisplay" runat="server" />
	</div>
	<asp:UpdatePanel runat="server" ID="_updatePanel">
    <ContentTemplate>
		<cwk:ReviewContainer id="_reviewContainer" runat="server" />
	</ContentTemplate>
	</asp:UpdatePanel>
</div>
<cmn:Mirror ID="_mirHeader" ControlID="_header" runat="server" />