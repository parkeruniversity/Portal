<%@ Page Language="C#"  ContentType="text/css" EnableViewState="false"   AutoEventWireup="true" CodeBehind="LmsCommonStyle.aspx.cs" Inherits="Jenzabar.LMS.Portlets.Common.Style.LmsCommonStyle" %>
<%@ OutputCache Duration="60" VaryByParam="none" %>

/* Modal Popup Control */
.modalDiv{
    background-color:#FFF;
    padding:3px;
    border:1px solid black;
    max-width: 500px;
    z-index: 8001 !important;
    -moz-box-shadow: 2px 2px 30px rgba(0,0,0,0.5);
    -webkit-box-shadow: 2px 2px 30px rgba(0,0,0,0.5);
    box-shadow: 2px 2px 30px rgba(0,0,0,0.5);
}
.modalPopup{
    background-color: #BABABA;
	filter: Alpha(Opacity=70);
	opacity: 0.7;
	-moz-opacity: 0.7;
	-khtml-opacity: 0.7;
    z-index: 8000 !important;
}
#modalHeading .modalHeadingImg{
    float:right;
    margin-left:10px;
    padding:0px;
	cursor:pointer;
}
#modalHeading{
    font-weight:bold;
    padding:3px;
    background-color:#E2E2E2;
    float:none;
}
#innerModal{
    border:1px solid #B2B2B2;
    background-color:#EFEFEF;
    max-width:500px;
}
#modalButtons{
    margin:5px;
    padding:5px;
}

/* Grade Entry Control */

div.gradeInput{
	margin-left:6px;
}
div.gradeInput.fullGradeInput{
	float:left;
	border:1px solid #484848;
	max-width:180px;
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
	background-image: url(<%=GetIconURL("32\\cross.png")%>);
}
div.fullGradeInput a.full{
	background-image: url(<%=GetIconURL("32\\tick.png")%>);
}
div.fullGradeInput a.partial{
	background-image: url(<%=GetIconURL("score-partial-large.png")%>);
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
    background-image: url(<%=GetIconURL("score-partial-large.png")%>);
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

/* Feedback */
.clickable{
    cursor: pointer;
}
div.feedbackContainer, 
div.feedbackEditorContainer{
	display:inline;
}
.feedbackContainer .modalDiv{
    max-width: 600px;
}
.feedbackSection{
	margin-top:25px;
}
.feedbackTitle{
	margin-bottom:5px;
}
.feedbackLink{
	text-decoration:underline;
    cursor: pointer;
}
.feedbackLinkImage{
	cursor: pointer;
}
div.feedbackContainer #innerModal{
	max-width:600px;
}
div.feedbackEditor, div.clearOption{
	padding:10px;
	white-space: normal;
}
div.feedbackDisplayList{
    margin-bottom: 10px;
    padding: 0 70px 0 70px;
    width: 500px;
    overflow: auto;
    max-height: 400px;
    *max-height: none\9; 
}
div.feedbackDisplayList div.feedbackDisplay{
    position: inherit;
}
div.feedbackDisplay{
    clear:both;
	border:1px solid #578FC9;
	padding:2px 10px 2px 10px;
	margin:5px 10px 10px 10px;
    width: 420px;
    display: block;
    position: relative;
    z-index: 1;
}
div.feedbackDisplay div.feedbackContainer{
    display: inline;
}

div.feedbackDisplayEmpty{
    border-color: #AAAAAA;
    font-style:italic;
    color:#888888;
}
div.feedbackDisplay div.feedbackWedge, div.feedbackDisplay div.choiceWedge{
    float:left;
    margin-top: 4px;
    margin-left: -15px;
    display: block;
    width: 0;
    height: 0;
    border-right: 5px solid #ffffff; 
    border-top: 5px solid transparent;
    border-bottom: 5px solid transparent;
    position: relative;
    z-index: 3;
}
div.feedbackDisplay div.feedbackWedgeOutline, div.feedbackDisplay div.choiceWedgeOutline{
    float:left;
    margin-top: 3px;
    margin-left: -16px;
    display: block;
    width: 0;
    height: 0;
    border-right: 6px solid #578FC9; 
    border-top: 6px solid transparent;
    border-bottom: 6px solid transparent;
    position: relative;
    z-index: 2;
}
div.feedbackDisplayEmpty div.feedbackWedgeOutline
{
    border-right-color: #AAAAAA;
}
div.feedbackDisplay div.commentWedge{
    float:right;
    margin-top: 4px;
    margin-right: -15px;
    display: block;
    width: 0;
    height: 0;
    border-left: 5px solid #ffffff; 
    border-top: 5px solid transparent;
    border-bottom: 5px solid transparent;
    position: relative;
    z-index: 3;
}
div.feedbackDisplay div.commentWedgeOutline{
    float:right;
    margin-top: 3px;
    margin-right: -16px;
    display: block;
    width: 0;
    height: 0;
    border-left: 6px solid #578FC9; 
    border-top: 6px solid transparent;
    border-bottom: 6px solid transparent;
    position: relative;
    z-index: 2;
}
div.feedbackDisplay div.reviewWedge{
    margin-left: 7px;
    margin-bottom: -5px;
    display: block;
    width: 0;
    height: 0;
    bottom: 0;
    left: 0;
    border-top: 5px solid #ffffff; 
    border-left: 5px solid transparent;
    border-right: 5px solid transparent;
    position: absolute;
    z-index: 3
}
div.feedbackDisplay div.reviewWedgeOutline{

    margin-left: 6px;
    margin-bottom: -6px;
    display: block;
    width: 0;
    height: 0;
    bottom: 0;
    left: 0;
    border-top: 6px solid #578FC9; 
    border-left: 6px solid transparent;
    border-right: 6px solid transparent;
    position: absolute;
    z-index: 2;
}
div.feedbackEntry{
	padding:8px 0px 8px 0px;
}
img.feedbackImage{
    border:1px solid #578FC9;
    float: left;
    max-width: 50px;
    margin-left: -80px;
    margin-top: -3px;

}
img.feedbackImageGeneric{
    float: left;
    max-width: 50px;
    margin-left: -62px;
    margin-top: -3px;
}
img.commentImage{
    border:1px solid #578FC9;
    float: right;
    max-width: 50px;
    margin-right: -80px;
    margin-top: -3px;
}
img.commentImageGeneric{
    float: right;
    max-width: 50px;
    margin-right: -62px;
    margin-top: -3px;
}
div.feedbackDisplay span.author{
	color:#888888;
}
div.feedbackDisplay div.wysiwygtext{
	margin-bottom:2px;
}
div.facultyFeedbackLink{
    margin-top: -10px;
    margin-left: 70px;
}
div.facultyFeedbackLink div.feedbackContainer{
   margin-right: 10px;
}
div.studentCommentLink{
    margin-top: -10px;
    margin-left: 425px;
}
div.noFeedback div.studentCommentLink{
    margin-left: 0;
}

.fdbkText
{
	display: block;
	padding: 5px 10px;
}
/* END Feedback */


/* "More" Window Control */


.moreWindowControl .moreButton
{
	background: transparent url(<%= this.GetIconURL("wedge-down-search.gif")%>) no-repeat right center;
	padding-right: 15px;
	color: blue;
	text-decoration: underline;
	cursor: pointer;
	display: block;
}

.moreWindowControl .moreWindow
{
	display: none;
	position: absolute;
	width: 450px;
	background-color: #FFFFFF;
	border: 1px solid #BABABA;
	border-top: 0px;
	z-index: 10000;
}

.moreWindowControl .moreWindow>div
{
	background-color: #EFEFEF;
	border: 1px solid #BABABA;
	border-top: 0px;
	margin: 3px;
	margin-top: 0px;
	padding: 10px;
}

.moreWindowControl .moreWindow>div .closeButton
{
	display: block;
	margin-top: 20px;
	text-align: center;
}


/* ADDITIONAL STUDENTS */ 
#additionalStudents
{
	overflow: auto;
}   
   
#additionalStudents #studentList
{
    float: left;
}

#additionalStudents #summary
{
    margin: 10px;
    float: left;
}

#additionalStudents .studentCount
{
    list-style: disc inside;
}
    
#additionalStudents .withdrawn
{
    font-style: italic;
}
    
#additionalStudents .nonroster
{
    font-weight: bold;
}

#additionalStudents #selector
{
	width: 600px;
    height: 400px;
	padding: 10px;
    overflow: auto;
}

#additionalStudents .modalDiv,
#additionalStudents #innerModal
{
	max-width: 630px;
}

#additionalStudents .withdrawn a
{
    font-style: normal;
}
    
#additionalStudents .nonroster a
{
    font-weight: normal;
    color: #7A0101;
}

#additionalStudents .studentName
{
    padding-left: 20px;
    background: url('<%= GetIconURL("16/user.png") %>') no-repeat left center;
}

#additionalStudents .nonroster .studentName
{
    background-image: url('<%= GetIconURL("16/user_add.png") %>');
}

#additionalStudents .withdrawn .studentName
{
    background-image: url('<%= GetIconURL("16/status_offline.png") %>');
}
/* END ADDITIONAL STUDENTS */


/* Paging Dropdown */

.pagingDropdown
{
	padding-left: 10px;
	padding-right: 10px;
}

ul.pagingDropdown li
{
	display: inline-block;
	padding-left: 20px;
	padding-right: 20px;
}

.pagingDropdown .pageItem
{
	line-height: 1.2em;
	padding-top: 5px;
	padding-bottom: 5px;
}

.pagingDropdown .pageItem:first-child
{
	padding-top: 0px;
}

.pagingDropdown .pageItem:last-child
{
	padding-bottom: 0px;
}

.pagingDropdown .moreButton
{
	text-decoration: none;
	color: black;
	font-style: italic;
}

.pagingDropdown a.previousLink
{
	padding-left: 10px;
    background: url('<%= GetIconURL("icon_prev.gif")%>') no-repeat left center;
}

.pagingDropdown a.nextLink
{
	padding-right: 10px;
    background: url('<%= GetIconURL("icon_next.gif")%>') no-repeat right center;
}

.pagingDropdown .moreWindow
{
	width: 150px;
	max-width: 200px;
}
