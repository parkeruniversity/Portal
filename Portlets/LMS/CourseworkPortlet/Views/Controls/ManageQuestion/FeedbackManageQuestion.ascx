<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FeedbackManageQuestion.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.ManageQuestion.FeedbackManageQuestion" %>
<%@ Register TagPrefix="cmn" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>

<div onclick="toggleHeader(this,'feedbackContent','<%=GetShowText()%>','<%=GetHideText() %>','<%=GetShowImgUrl() %>','<%=GetHideImgUrl() %>');" class="assignmentStepHeader expandable"> 
    <img class="rightArrow" src='<%=GetShowImgUrl() %>' />
    <img src='<%=GetShowImgUrl() %>' /> 
    <asp:Label ID="_lbl3" runat="server" /> 
    <asp:Label ID="_lblFeedback" CssClass="headerText" runat="server" /> <%=GetShowText() %>
</div>
<div id="feedbackContent" style="display:none;" class="manageQuestionContent">
	<div class="feedbackSection">
		<div class="feedbackTitle"><asp:Literal ID="_litAll" runat="server" /></div>
		<cmn:TextBoxEditor id="_txtAll" Rows="10" runat="server" />
	</div>

	<div class="feedbackSection">
		<div class="feedbackTitle"><asp:Literal ID="_litCorrect" runat="server" /></div>
		<cmn:TextBoxEditor id="_txtCorrect" Rows="10" runat="server" />
	</div>

	<div class="feedbackSection">
		<div class="feedbackTitle"><asp:Literal ID="_litIncorrect" runat="server" /></div>
		<cmn:TextBoxEditor id="_txtIncorrect" Rows="10" runat="server" />
	</div>
</div>