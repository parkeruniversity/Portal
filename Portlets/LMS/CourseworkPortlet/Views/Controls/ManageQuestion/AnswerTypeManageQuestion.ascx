<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AnswerTypeManageQuestion.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.ManageQuestion.AnswerTypeManageQuestion" %>
<%@ Register tagname="TrueFalse" tagprefix="cwk"  src="TrueFalseManageQuestion.ascx" %>
<%@ Register tagname="Multi" tagprefix="cwk"  src="MultipleChoiceManageQuestion.ascx" %>
<%@ Register tagname="Audio" tagprefix="cwk"  src="AudioManageQuestion.ascx" %>
<%@ Register tagname="Equation" tagprefix="cwk"  src="EquationManageQuestion.ascx" %>
<%@ Register tagname="Essay" tagprefix="cwk"  src="EssayManageQuestion.ascx" %>
<%@ Register tagname="Match" tagprefix="cwk"  src="MatchingManageQuestion.ascx" %>
<%@ Register tagname="Order" tagprefix="cwk"  src="OrderingManageQuestion.ascx" %>
<%@ Register tagname="Short" tagprefix="cwk"  src="ShortAnswerManageQuestion.ascx" %>
<%@ Register tagname="Preview" tagprefix="cwk"  src="PreviewQuestion.ascx" %>

<cwk:Audio id="_audio" runat="server" />
<cwk:Equation id="_equation" runat="server" />
<cwk:Essay id="_essay" runat="server" />
<cwk:Match id="_match" runat="server" />
<cwk:Multi id="_multi" runat="server" />
<cwk:Order id="_order" runat="server" />
<cwk:Short id="_short" runat="server" />
<cwk:TrueFalse id="_trueFalse" runat="server" />

<cwk:Preview id="_preview" runat="server" />