<%@ Page Language="C#" ContentType="text/css" EnableViewState="false" Inherits="Jenzabar.Portal.Framework.Web.UI.Pages.CssCommonBasePage" %>
/* Grade Entry Control */

.FormTxtErr
{
    color:Red;
}
div.gradeInput{
	margin-left:6px;
}
div.gradeInput.fullGradeInput{
	float:left;
	border:1px solid #484848;
	max-width:180px;
    margin-top:5px;
}
div.fullGradeInput a{
	float:left;
	background-color:#F7F7F7;
	text-decoration:none;
	color:#484848;
	display:block;
	min-width:50px;
	padding:50px 3px 3px 3px;
	font-size:0.88em;
	text-align:center;
	background-position: 15px 10px;
	background-repeat: no-repeat;
	/*background-image defined with expandGradeDisplay*/
}
a.gradeDivider{
	border-left:1px solid #484848;
}
.gradeInputHeader{
	display:block;
	background-color:#484848;
	color:#FFF;
	padding:2px;
}
div.gradeInput.gradeItemExists{
	display:none;
}
div.fullGradeInput a.zero{
	background-image: url(<%=GetIconUrl("32\\cross.png")%>);
}
div.fullGradeInput a.full{
	background-image: url(<%=GetIconUrl("32\\tick.png")%>);
}
div.fullGradeInput a.partial{
	background-image: url(<%=GetIconUrl("score-partial-large.png")%>);
}

div.gradeInput input[type=image]{
	border:1px solid #578fc9;
	padding:3px 8px;
	background-color:#F7F7F7;
	display:inline-block;
	margin:0px 0px -3px -6px;
}
div.gradeInput input[type=image].full:hover{
	background-color:#f4ffcc;
	border-color:#008700;
}
div.gradeInput input[type=image].partial:hover{
	background-color:#eaeaea;
	border-color:#484848;
}
div.gradeInput input[type=image].zero:hover{
	background-color:#fdefef;
	border-color:#790000;
}
div.gradeInputEntry{
    width:350px;
    padding:0px 10px 10px 50px;
    background-image: url(<%=GetIconUrl("score-partial-large.png")%>);
    background-repeat:no-repeat;
    background-position:10px 10px;
}
div.gradeInputEntry div{
	margin-bottom:10px;
	white-space:normal;
}
div.gradeInputEntry  span.gradeInputInfo{
    display:block;
    color:#707070;
    margin:10px 0px;
    font-size:0.9em;
}
table.assignmentGrid tr:hover div.gradeInput.gradeItemExists{
	display:inline-block;
}
#nonGradedContainer
{
    /*background: red;*/
    
}
.notGradedPanel
{
    background-image: url(<%=GetIconUrl("32/document_prepare.png")%>);
    background-repeat: no-repeat;
	background-position: 5px 5px;
	padding-left:45px;

}
#studentNotGraded
{
    font-weight: bold;
    color: #003471;
    font-size: 1.3em;
}