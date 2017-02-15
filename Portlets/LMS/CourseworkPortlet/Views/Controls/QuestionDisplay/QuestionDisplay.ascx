<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QuestionDisplay.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.QuestionDisplay.QuestionDisplay" %>
<%@ Register TagPrefix="cwk" TagName="RichText" Src="../RichTextDisplay.ascx" %>
<%@ Register tagname="TrueFalse" tagprefix="cwk"  src="TrueFalseDisplay.ascx" %>
<%@ Register tagname="Essay" tagprefix="cwk"  src="EssayDisplay.ascx" %>
<%@ Register tagname="Equation" tagprefix="cwk"  src="EquationQuestionDisplay.ascx" %>
<%@ Register tagname="Short" tagprefix="cwk"  src="ShortAnswerDisplay.ascx" %>
<%@ Register tagname="Multi" tagprefix="cwk"  src="MultiDisplay.ascx" %>
<%@ Register tagname="Match" tagprefix="cwk"  src="MatchDisplay.ascx" %>
<%@ Register tagname="Order" tagprefix="cwk"  src="OrderingDisplay.ascx" %>

<div class="questionDisplay">
	<div class="questionSection" ><asp:Literal ID="_litNum" runat="server" /></div>
	<div class="questionSection questionSpacer">
		<div class="questionSection">
			<cwk:RichText id="_rtQuestion" runat="server" />
		</div>
		<div class="pointDisplay"><asp:Literal ID="_litPoints" runat="server" /></div>
		<div class="questionTypeDisplay">
			<cwk:TrueFalse id="_tf" runat="server" />
			<cwk:Essay id="_essay" runat="server" />
			<cwk:Equation id="_equation" runat="server" />
			<cwk:Short id="_short" runat="server" />
			<cwk:Multi id="_multi" runat="server" />
			<cwk:Match id="_match" runat="server" />
			<cwk:Order id="_order" runat="server" />
		</div>
	</div>
	<div style="clear:both;"></div>
</div>


