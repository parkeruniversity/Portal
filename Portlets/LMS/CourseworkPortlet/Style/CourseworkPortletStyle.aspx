<%@ Page Language="C#"  ContentType="text/css" EnableViewState="false"   AutoEventWireup="true" CodeBehind="CourseworkPortletStyle.aspx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Style.CourseworkPortletStyle" %>
<%@ OutputCache Duration="60" VaryByParam="none" %>
<%@ Import Namespace="Jenzabar.LMS.Portlets.CourseworkPortlet.Utils" %>

@import url('<%= ResolveUrl("~/Portlets/LMS/Common/Style/LmsCommonStyle.aspx") %>');

div.mainTop {
    padding:5px 12px 3px 12px;
    overflow:hidden;
}
.mainTop div.mainTopLeft{
    float:left;
    width:280px;
}
.mainTop div.mainTopRight
{
    margin:0px;
    margin-left:295px;
}
.mainTop div.mainTopRight.topEmpty{
    margin-left:0px;
}
.gettingStarted{
	margin-top:15px;
}
.gettingStarted ul{
	padding-left:20px;
}
.gettingStarted li.checked{
	background-image: url(<%=GetImageURL("check.gif")%>);
	background-repeat:no-repeat;
	padding-left:30px;
}
.gettingStarted ul li.unChecked{
	background-image: url(<%=GetImageURL("unchecked_box.gif")%>);
	background-repeat:no-repeat;
	padding-left:30px;
}
.gettingStartedTitle,.recentSubTitle{
	display:block;

	font-weight:bold;
	padding-bottom:15px;
}
.recentSubNo{
	display:block;
	font-style:italic;
	margin:20px;
}
div.recentSubs{
    margin:5px 0px;
}
a.recentUser,a.recentUser:link,a.recentUser:visited{
    font-weight:bold;
    text-decoration:none;
    color:#000;
}
.studentNoRecent{
    color:#464646;
    max-width:600px;
    display:inline-block;
}
.quickLinks li.strongLink, .stuStrong, .filesTurnedIn, .noReview{
	font-weight:bold;
}
.filesTurnedIn{
	font-style:italic;
}
ul.menu {
	margin: 0;
	padding: 0;
	overflow: hidden;
	border: 1px solid #b2b2b2;
}
ul.menu li {
    display: block;
    margin: 0;
    padding: 0;
    list-style: none;
    background-color: #efefef;
    border-top: 1px solid white;
    border-bottom: 1px solid #cecfce;
    clear:left;
    background-repeat:no-repeat;
    background-position:8px 8px;
}
ul.menu li a {
    padding: 8px 8px 8px 40px;
    display: block;
    text-decoration:none;
}
ul.menu li.student{
    background-image: url(<%=GetImageURL("16/group.png")%>);
}
ul.menu li.configuration{
    background-image: url(<%=GetImageURL(CourseworkImgUtil.CONFIG)%>);
}
ul.menu li.manageUnits{
    background-image: url(<%=GetImageURL(CourseworkImgUtil.EDIT_FOLDER)%>);
}
ul.menu li.viewGradebook{
  background-image: url(<%=GetImageURL("fb_icon_mysubmissions.gif")%>);  
}
ul.menu li img{
    float:left;
    padding:8px 5px 0px 8px;
}
ul.menu li.addAssignment a
{
    background-image: url(<%=GetImageURL("add.gif")%>);
    background-repeat:no-repeat;
    background-position:10px 10px;
    background-color:#D6E2FC;
}
div.welcome{
	background-color:#EAFFCA;
	padding:10px;
	border-bottom:2px solid #BABABA;
}
div.welcome ul{
	padding: 5px 0px 0px 40px;
}
div.welcome li{
	list-style:  disc;
}
input.welcomeClose{
	float:right;
}
div.noAssignments{
	margin:20px;
}
div.noAssignments span{
	font-style:italic;
	margin-right:20px;
}
div.assignmentTitle{
    background-image: url(<%=GetImageURL("folder.png")%>);
    background-repeat:no-repeat;
    background-position:5px;
    padding:5px 5px 5px 25px;
    border:1px solid white;
}
div.assignmentTypeTitle{
	background:none;
	padding-left:5px;
	font-weight:bold;
}
span.unitName{
	color:#003471
}
span.unitActive{
	font-weight:bold;
}
span.unitStatus, span.unitCollapse{
	font-style:italic;
	color:#464646;
	margin-left:10px;
}
div.assignmentTitle.unitPast span{
	color:#464646;
}
div.assignmentTitle.unitPast{
	background-image: url(<%=GetImageURL("folder-inactive.png")%>);
	cursor: pointer;
}
div.assignmentTitle.studentAssignmentPast{
	background-image: url(<%=GetImageURL(CourseworkImgUtil.TODO_CHECKED)%>);
}
div.assignmentTitle.studentAssignmentActive{
	background-image: url(<%=GetImageURL(CourseworkImgUtil.ACTIVE_ITEM)%>);
}
span.unitCollapse{
	text-decoration:underline;
}
div.assignmentUnitCollapsible.itemHover:hover,
table.assignmentGrid.itemHover tr:hover,
table.assignmentGrid.itemHover tr:hover td,
table.cwkTableDisplay.itemHover tr:hover td,
table.reorder.itemHover tr:hover,
table.reorder.itemHover tr:hover td{
	border:1px solid #1851AD;
	background-color:#D6E2FC;
}
div.assignmentUnitCollapsible.itemHover:hover{
    cursor: pointer;
}
table.assignmentGrid.itemHover tr:hover .modalDiv tr:hover,
table.assignmentGrid.itemHover tr:hover td .modalDiv td{
	border: inherit;
	background-color:inherit;
}
table.assignmentGrid.itemHover tr.headerAssignmentGrid:hover{
	border:0px;
	cursor: default;
}
div.assignmentView{
	border-top:2px solid #003471;
	padding:5px;
	margin-bottom:10px;
}
div.unitAssignmentActions{
	float:right;
}
div.unitAssignmentActions a{
	margin-right:20px;
}
div.editAssignType{
	float:left;
}
div.unitAssignmentDescription{
	clear:both;
	margin:5px 0px 15px 0px;
	font-size:0.85em;
}
img.assignNotify{
	float:right;
}
table.cwkTableDisplay,
table.assignmentGrid{
	border: 1px solid #BABABA;
}
table.cwkTableDisplay th,
table.assignmentGrid th{
    border: 1px solid #BABABA;
	background-color:#DEDFDE;
	white-space:nowrap;
	font-weight:normal;
}
table.cwkTableDisplay th,
table.assignmentGrid th{
	padding:3px 3px 3px 7px;
    border-bottom-width: 0px;
}
table.assignmentGrid th a{
    color:#000;
}
table.assignmentGrid th.sortCol{
    padding-left:20px;
    background-repeat:no-repeat;
    background-position:5px 10px;
}
table.assignmentGrid th.sortCol.Ascending{
    background-image: url(<%=GetImageURL(CourseworkImgUtil.WEDGE_UP)%>);
}
table.assignmentGrid th.sortCol.Descending{
    background-image: url(<%=GetImageURL(CourseworkImgUtil.WEDGE_DOWN)%>);
}
/*
    cwkTableDisplay td with a border causes improper rendering of modals created within StyledGridView
    The td border 1px was added to table.cwkTableDisplay td to help a Chrome hover issue,
    need to revisit this issue in Chrome to see if it is incorrect in Chrome
*/
/*table.cwkTableDisplay td,*/
table.assignmentGrid td{    
    border: 1px solid #BABABA;
	padding:0px 3px 0px 7px;
    border-bottom-width: 0px;
	height:26px;
}
.altAssignmentGrid, .altRow {
	background-color:#EFEFEF;
}
table.assignmentGrid .gridGradeColumn{
	width:250px;
	vertical-align:middle;
}
table.assignmentGrid .gridStudentColumn{
	width:200px;
}
table.assignmentGrid a.inactiveAssignment{
	color:black;
	font-style:italic;
}
table.assignmentGrid td.formatType, table.reorderAssignment td.formatType{
	padding-left:30px;
    background-repeat:no-repeat;
    background-position:5px;
}
table.assignmentGrid span.requiredType{
    font-style:italic;
}
table.assignmentGrid span.requiredType img{
    margin-bottom:-3px;
}
table caption{
	font-weight:bold;
	background-color:#BABABA;
	text-align:left;
	padding:5px;
}
div.studentResults table.assignmentGrid{
	width:auto;
}
.formatForum{background-image: url(<%=GetImageURL(CourseworkImgUtil.FORMAT_FORUM)%>);}
.formatOffline{background-image: url(<%=GetImageURL(CourseworkImgUtil.FORMAT_OFFLINE)%>);}
.formatOnline{background-image: url(<%=GetImageURL(CourseworkImgUtil.FORMAT_ONLINE)%>);}
.formatUpload{background-image: url(<%=GetImageURL(CourseworkImgUtil.FORMAT_UPLOAD)%>);}

div.detailInfoContent.formatType{
	background-position:0px;
	background-repeat:no-repeat;
	padding-left:40px;
}
div.detailInfoContent.formatType.formatOffline{background-image: url(<%=GetImageURL(CourseworkImgUtil.FORMAT_OFFLINE_LARGE)%>);}
div.detailInfoContent.formatType.formatForum{background-image: url(<%=GetImageURL(CourseworkImgUtil.FORMAT_FORUM_LARGE)%>);}
div.detailInfoContent.formatType.formatOnline{background-image: url(<%=GetImageURL(CourseworkImgUtil.FORMAT_ONLINE_LARGE)%>);}
div.detailInfoContent.formatType.formatUpload{background-image: url(<%=GetImageURL(CourseworkImgUtil.FORMAT_UPLOAD_LARGE)%>);}
div.assignmentNotify{
	float:right;
    margin-left:10px;
}
div.assignmentNotify img{
	padding-left:3px;
}
div.dueNext{
	background-color:#EFEFEF;
	border:1px solid #B2B2B2;
	padding:5px 10px;
}
.dueNextTitle{
	display:block;
	font-weight:bold;
	margin-bottom:5px;
}
div.dueNextAssignment{
	background-repeat:no-repeat;
	background-position:1px 0px;
	padding-left:25px;
	margin-bottom:8px;
}
div.dueNextViewAll, div.recentActionAll{
	margin-top:10px;
	font-style:italic;
	font-size:.9em;
	text-align:right;
}
div.unitEdit{
    display:inline-block;
    padding:3px;
    margin-bottom:10px;
}
div.editStart{
    display:inline;
}
.cwkBorderButtonBar
{
	display: block;
	background-color: #EFEFEF;
	padding: 5px 10px;
	overflow: hidden;
}

.cwkBorderButtonBar.top
{
	border-bottom: solid 1px #E3E3E3;
	padding-bottom: 5px;
}

.cwkBorderButtonBar.bottom
{
	border-top: solid 1px #E3E3E3;
	padding-top: 5px;
}

.cwkBorderButtonBar.mainScreenLink {
    
}

.cwkBorderButtonBar.helpScreenLink {
    float: right;
    margin-top: -32px;
}

.cwkHeader
{
	display: block;
	font-size: 110%;
	font-weight: bold;
	padding: 10px 10px 0px 10px;
}

.cwkStuCommentsSaved{
    display:none;
    color:green;
    font-weight:bold;
}

.cwkText
{
	display: block;
	padding: 5px 10px;
}

.cwkTextStuComment{
    display: block;
	padding: 5px 10px;
    margin-top: -16px;
}

ul.cwkSimpleButtonBar
{
	display: block;
	padding: 5px;
}

ul.cwkSimpleButtonBar > li
{
	padding: 5px;
	display: inline;
}

.cwkButtonFooter
{
	margin-top: 0px;
	padding-top: 0px;
}

.cwkTableDisplay
{
	margin: 10px;
	border-color: #AAAAAA;
}

.popupWindow
{
	border: solid 1px black;
	background-color: #EEEEEE;
}

table.assignmentOptionsForm {
    padding: 10px 10px 10px 10px;
    
}
div.forumSelector{
    margin-top:7px;
}
div.forumSelector div{
    float:left;
    margin-left:15px;
}
div.forumSelector select{
    display:block;
    margin-top:5px;
}
.forumOptionSection{
    margin-bottom:30px;
}
.forumOptionSectionSub{
    padding-top:10px;
    padding-left:20px;
}
.forumOptionSectionSub div{
    margin-bottom:7px;
}
.forumOptionSectionSub  .forumRestriction{
    margin-top:5px;
    margin-bottom:25px;
}
.forumOptionSectionSub  .forumRestriction div{
    margin-top:5px;
    padding-left:20px;
}
.forumRestriction input[type=text]{
    width:50px;
}
.descriptiveText {
    color: #848484;
}
/* Student Assignment Display*/
div.assignmentText{
    float:left;
}
div.assignmentDisplay{
	background-position: 5px 10px;
	background-repeat: no-repeat;
	border:1px solid transparent;
	padding:10px 20px 10px 25px;
	margin:5px 0px 5px 15px;
	float:left;
	clear:left;
    *clear:none;
}
a.assignmentDisplay{
	background-repeat: no-repeat;
	padding-left:20px;
}
div.assignmentDisplay:hover{
	border-color:#003471;
	background-color:#E5EDFD;
}
div.assignmentDisplay.closed,a.assignmentDisplay.closed{
	background-image: url(<%=GetImageURL(CourseworkImgUtil.TODO_CHECKED)%>);
	color:#5C5C5C;
}
div.assignmentDisplay.closed a{
	color:#5C5C5C;
}
div.assignmentDisplay.open, a.assignmentDisplay.open{
	background-image: url(<%=GetImageURL(CourseworkImgUtil.ACTIVE_ITEM)%>);
}
div.assignmentDisplay.inactive,a.assignmentDisplay.inactive{
	background-image: url(<%=GetImageURL(CourseworkImgUtil.INACTIVE)%>);
}
div.assignmentDisplay.inactive,a.assignmentDisplay.inactive, div.assignmentDue,div.assignmentDisplay.inactive div.assignmentDescription {
	font-style:italic;
}
div.assignmentDisplay.inactive a,a.assignmentDisplay.inactive,a.assignmentDisplay.closed{
	color:#000;
}
#assignmentContent{
	border-left:1px solid;
	background-color:white;
	padding-left:5px;
	margin:-1px -1px -1px 23px;
}
div.assignmentDisplay.late, div.assignmentDisplay.late #assignmentContent{
	border-color:#790000;
}
div.assignmentDisplay.late{
	background-color:#FFFDE4;
	background-image: url(<%=GetImageURL(CourseworkImgUtil.LATE)%>);
}
div.assignmentDisplay.complete, div.assignmentDisplay.complete #assignmentContent,
div.assignmentDisplay.open #assignmentContent,
div.assignmentDisplay.notYetOpen, div.assignmentDisplay.notYetOpen #assignmentContent{
	border:0px;
}
div.assignmentDisplay.inProgress{ 
	border:0px;
}
div.assignmentDisplay.complete a{
	color:#464646;
}
div.assignmentDisplay.notYetOpen{
	background-image: url(<%=GetImageURL(CourseworkImgUtil.INACTIVE)%>);
}
div.assignmentDisplay.notYetOpen a{
	color:black;
}
div.assignmentDisplay.notYetOpen div.assignmentDue,div.assignmentDisplay.notYetOpen div.assignmentDescription{
	font-style:italic;
}
div.assignmentDisplay.retake, div.assignmentDisplay.retake div.assignmentContent{
	border-color:#003471;
}
div.assignmentDisplay.retake{
	background-color:#E5EDFD;
	background-image: url(<%=GetImageURL(CourseworkImgUtil.RETAKE)%>);
}
div.assignmentDisplay.new, div.assignmentDisplay.new #assignmentContent,
div.assignmentDisplay.newlyOpen, div.assignmentDisplay.newlyOpen #assignmentContent,
div.assignmentDisplay.newFeedback, div.assignmentDisplay.newFeedback #assignmentContent{
	border-color:#006003;
}
div.assignmentDisplay.new{
	background-color:#F1FFE4;
	background-position:6px 5px;
	background-image: url(<%=GetImageURL(CourseworkImgUtil.NEW)%>);
}
div.assignmentDisplay.newlyOpen{
	background-color:#F1FFE4;
	background-image: url(<%=GetImageURL(CourseworkImgUtil.NEWLY_OPENED)%>);
}
div.assignmentDisplay.newFeedback{
	background-color:#F1FFE4;
	background-image: url(<%=GetImageURL(CourseworkImgUtil.BUBBLE_FULL)%>);
}
div.assignmentDue{
	font-size:0.85em;
	margin:4px 0px;
    padding-top:4px;
    clear:both;
}
div.assignmentDescription{
	font-size:0.85em;
	color:#464646;
	margin:4px 0px;
}
div.detailHeader{
	padding:6px;
	background-color:#EFEFEF;
	border-top:1px solid #B2B2B2;
	border-bottom:1px solid #B2B2B2;
	clear:both;
}
div.detailHeaderNav{
	float:right;
	padding-top:5px;
}
div.detailHeaderLinkContainer{
     display:inline;
     font-style:italic;
     margin:0px 10px 0px 10px;
}
div.detailHeaderLinkContainer a{
     text-decoration:none;
     color: #000000;
}
div.detailHeaderLinkContainer a:hover{
     text-decoration: underline;
}
div.detailInfo{
	padding-left:10px;
	float:left;
}
div.detailInfo.studentInfo{
	font-weight:bold;
	padding:10px;
	margin:-6px;
}
div.detailInfo.studentInfo a,div.detailInfo.studentInfo a:active,div.detailInfo.studentInfo a:visited{
    	color:#000;
	text-decoration:none;
}
div.detailInfo.studentInfo:hover{
    	background-color:#EAF1FE;
	border:1px solid #144799;
	padding:9px;
}
div.detailInfo.studentInfo:hover a{
    text-decoration:underline;
}
div.detailInfo.studentInfo span{
	font-weight:normal;
}
div.detailInfo img{
	float:left;
}
div.detailInfo.studentInfo img{
	float:none;
}
div.detailInfo span.Title{
	font-weight:bold;
	display:block;
	size:1.3em;
	margin-bottom:3px;
}
div.detailInfoLink .TitleLink,div.detailInfoLink:hover .Descrip{
	display:none;
}
div.detailInfoLink:hover{
	background-color:#EAF1FE;
	border:1px solid #144799;
	padding:5px;
	padding-left:15px;
	margin:-6px;
}
div.detailInfoLink:hover .TitleLink{
	display:block;
}

table.groupedGrid>*>tr>td,
table.groupedGrid>tr>td
{
	padding: 2px 5px 3px 5px;
}

table.groupedGrid>*>tr>th,
table.groupedGrid>tr>th
{
	padding: 2px 5px 3px 5px;
	font-weight: normal;
	font-size: 100%;
}

div.assignmentStepHeader {
    background-color: #D4F0A9;
    padding: 5px 5px 5px 5px;
    border-bottom:1px dashed #CECFCE;
    border-top:1px solid #B2B2B2;
}
div.assignmentStepHeader.expandable:hover{
    background-color: #D6E2FB;
    cursor: pointer;
    border:1px solid #000;
    border-style: inset;    
}

.rightArrow{
    float:right;
    margin-top:3px;
}

div.assignmentStepHeaderImageDiv {
    float: right;
}

.notifyMsgBox {
    background-color: #FFFFE4;
    border:2px solid #1851AD;
    padding: 10px 10px 10px 10px;
    margin: 20px 20px 20px 20px;
}

.notifyTitle 
{
    color: #005b7f;
    font-weight: bold;
}

.headerText {
    font-weight:bold;
}
.attention, div.gradedAssignment.attention{
	background-color:#FFF899;
	font-style: italic;
}
.alerts{
    float:right;
    padding-left: 10px;
}
.alerts img{
    padding-left: 5px;
}
div.detailSubHeader{
	background-color:#D6E2FB;
	border-bottom:1px solid #BABABA;
	white-space: nowrap;
}
div.detailSubHeader ul,div.detailSubHeader li{
	margin:0px;
}
div.errorSubHeader{
    background-color:#D6E2FB;
	border-bottom:1px solid #BABABA;
    padding: 10px;
    font-weight: bold;
}
div.errorMsgBody{
    padding: 10px 10px 150px 10px;
}
div.detailSubHeader ul li{
	display:inline-block;
	padding:8px 15px 8px 8px;
	zoom:1;
        *display: inline;
}
div.detailSubHeader li.due{
	background-color:#FFFDE4;
	border-right:1px solid #BABABA;
}
div.detailSubHeader li.due,div.detailSubHeader li.moreLink{
    padding-top:11px;
}
div.detailSubHeader li img{
	margin-bottom:-3px;
}
li.moreLink{
	border-left:1px solid #BABABB;
	border-right:1px solid #BABABB;
	cursor: pointer;
}
li.moreLink span.more{
	text-decoration:underline;
	color:blue;
}
li.moreLink.moreHover span.more{
	text-decoration:none;
}
div.detailSubHeader li.moreLink img{
	margin-bottom:0px;
}
div.menuContent, .moreHover{

	background-color:#EFEFEF;
}
div.menuContent{
	display:none;
	position: absolute;
	margin:8px 0px 0px -400px;
	width:500px;
	border:1px solid #BABABB;
	border-top:0px;
	z-index:100;
}
div.innerMenuContent{
	border:1px solid #BABABA;
	margin:3px;
	margin-top:0px;
	padding:10px;
	white-space:normal;
}
div.menuContent td.title{
	text-align:right;
	padding-right:10px;
}
div.detailAction{
	background-color:#EFEFEF;
	border:1px solid #BABABA;
}
div.detailAction div{
	display:inline-block;
	padding:10px;
	background-color:#EFEFEF;
		zoom:1;
        *display: inline;
}
div.detailAction div.buttons{
	background-color:#D6E2FB;
	border:1px solid #002157;
	margin:-1px;
	padding-right:25px;
}
div.detailActionInfo{
	padding:5px 10px;
}
div.detailAction div.detailActionDeleteAssignment{
    float: right;
}
div.detailAction div.detailActionDeleteAssignment span{
    color:#790000;
    display:inline-block;
    margin-left:4px;
    margin-bottom:4px;
    cursor:pointer;
}
div.detailActionInfo span{
	font-weight:bold;
	margin-left:10px;
}
div.detailActionInfo img{
	margin-bottom:-8px;	
}
div.reopenAssignment{
	margin:10px;
}
div.studentResults, div.studentResultsMeta{
	float:left;
}
a.showHideNonActiveStudents{
    display: block;
    margin-bottom: 20px;
}
div.noStudents{
    font-style:italic;
}
div.studentResultsMeta{
	margin-left:20px;	
}
div.bonusContainer{
	background-image: url(<%=GetImageURL("16/star.png")%>);
	background-position: 0px;
	background-repeat: no-repeat;
}
span.bonusDetail{
	padding-left:20px;
}
.stats{
    width: 250px;
	padding: 15px 10px 10px 20px;
}
.stats>* {
    margin: 0 0 5px 0;
}
.stats .averageStat{
    padding-top: 15px;
}
.pSection div.editGradeInstr{
	width:300px;
	background-color:#EFEFEF;
	border:1px solid #BABABA;
	padding:10px;
	font-size:0.85em;
	margin-top:10px;
	margin-bottom:10px;
}
span.howTo{
	display:block;
	font-weight:bold;
	font-size:1.1em;
	margin-bottom:5px;
}
div.editGradeInstr ul{
	margin-top:5px;
	margin-left:20px;
}
div.editGradeInstr li{
	list-style: disc;
}
span.resultGrade{
}
img.attentionImg{
	margin-right:3px;
	margin-bottom:-4px;
}
table.assignmentGrid tr:hover div.gradeInput.gradeItemExists{
	display:inline;
}
table.assignmentGrid tr:hover td.metRequirement{
	background-image: url(<%=GetImageURL(CourseworkImgUtil.FORUMS_MET)%>);
	background-position: 27px 6px;
	background-repeat: no-repeat;
}
table.assignmentGrid tr:hover td.notMetRequirement{
	background-image: url(<%=GetImageURL(CourseworkImgUtil.FORUMS_NOT_MET)%>);
	background-position: 27px 6px;
	background-repeat: no-repeat;
}
div.feedbackMessage.notVisible{
	font-weight:normal;
	font-size:1em;
}
div.feedbackMessage.notVisible span{
	color:#1B1464;
	font-weight:bold;
	display:block;
	margin-bottom:10px;
}
.minRequirements{
	font-style:italic;
	text-align:right;
	font-weight:normal;
}
tr.minRequirementRow{
	background-color:#D6E2FC;
	font-weight:bold;
}
div.moreContainer{
	margin-top:10px;
	padding-top:10px;
	border-top:1px dashed black;
}
div.innerMenuContent span.linkItem{
	display:inline-block;
	width:220px;
	margin-left:10px;
	margin-bottom:5px;
}
div.moreInfo{
	margin-top:10px;
	clear:both;
}
div.moreInfo span{
	display:inline-block;
	text-align:right;
	width:90px;
	vertical-align:top;
}
div.moreInfo .infoValue{
	text-align:left;
	width:300px;
}
div.moreInfo .infoValue div{
	margin-bottom:5px;
}
div.innerMenuContent a.deleteAssignment{
	color:#790000;
}

/* Manage Assignment*/

div.cwkSaveButtonBar {
    background-color: #D6E2FB;
    padding: 20px 20px 20px 20px;
    border-color: #364F78;
    border-style: solid;
    border-width: 1px;
}

div.cwkCancelButtonBar {
    float: right;
    background-color: #EFEFEF;
    padding: 20px 20px 20px 20px;
    border-color: #BDBDBD;
    border-style: solid;
    border-width: 1px;
    width: 70%;
}

div.cwkCancelButtonBarFull {
    background-color: #EFEFEF;
    padding: 20px 20px 20px 20px;
    border-color: #BDBDBD;
    border-style: solid;
    border-width: 1px;
}

div.newAssignmentImportExistingAssignment {
    float: right;
    background-color: #EFEFEF;
    border-color: #C6C6C6;
    border-style: solid;
    border-width: 1px;
    padding: 10px 25px;    
}


.lineSeparator {
    border-bottom: 1px dashed #BABABA;
    padding-bottom: 10px;
    padding-top: 10px;   
}
a.selectAssignment, div.selectAssignment {
    text-decoration: none;
    display:block;
    padding:10px 10px 10px 55px;
    border:1px solid  #FFF;
    background-position: 10px 12px;
    background-repeat: no-repeat;
}
a.selectAssignment span{
    color:#000;
}
a.selectAssignment:hover{
    background-color: #D4F0A9;
    border:1px solid #000;
    cursor: pointer;
}
span.selectAssignmentHeader{
    display:block;
    text-decoration:underline;
    padding-bottom:3px;
}
.selectAssignment.selectOnline{
    background-image: url(<%=GetImageURL(CourseworkImgUtil.FORMAT_ONLINE_LARGE)%>);
}
.selectAssignment.selectUpload{
    background-image: url(<%=GetImageURL(CourseworkImgUtil.FORMAT_UPLOAD_LARGE)%>);
}
.selectAssignment.selectForum{
    background-image: url(<%=GetImageURL(CourseworkImgUtil.FORMAT_FORUM_LARGE)%>);
}
.selectAssignment.selectOffline{
    background-image: url(<%=GetImageURL(CourseworkImgUtil.FORMAT_OFFLINE_LARGE)%>);
}
.assignmentFormatHelpTxt{
    color: #999999;
}
.assignmentFormat {
    padding: 10px 25px;
    display: block;    
    clear: left;
    color: #000000;
    border-style: solid;
    border-width: 1px;
    /*border-color: #EFEFEF;*/
    border-color: #ffffff;
}

.assignmentFormatCurrent {
    padding: 10px 25px;
    display: block;    
    clear: left;
    color: #000000;
    border-style: solid;
    border-width: 1px;
    /*border-color: #EFEFEF;*/
    border-color: #ffffff;
}

.assignmentFormat:hover{
    background-color: #D4F0A9;
    border-style: solid;
    border-width: 1px;
    border-color: #000000;
    cursor: pointer;
}
.assignmentFormatInfo {
    
}
.assignmentFormatImage {
    float: left;
    display: block;
    padding: 0px 5px 5px 5px;
}
.assignmentFormatHeaderLabel {
    display: block;
    text-decoration: underline;
}
.assignmentFormatStepOne{
    font-weight: bold;
    font-size: 12pt;
}
.assignmentFormatHeader{
    padding: 5px 5px 0px 5px;
}
.assignmentFormatHighlightContainer{
    background-color: #ffffff;
    border-style:solid;
    border-width:1px;
    border-color: #999999;
}
.assignmentFormatMainDiv{
    display: block;
    border: 0;
    margin: 10px;
    overflow: visible;
    z-index: 0;
    background-color: #EFEFEF;
    border-style: double;
    border-width: medium;
    border-color: #B2B2B2;
    padding: 10px 10px 10px 10px;
    width: 500px;
}
.assignmentFormatSelectionHiddenControl{
    display: none;
}
div.fileTypes {
    padding: 5px 20px;
}
div.assignmentFormatSection {
    padding: 10px 10px 10px 10px;
}

div.formatSelectionImage {
    float: left;
    padding-right: 10px;
}

div.generalAssignmentInfoFormatSelection {
    overflow: hidden;
    padding: 20px 20px 5px 20px;
}

div.formatSelectionDescription {
    float: left;
}

div.formatSelectionFormatHeader {
    padding-bottom: 5px;
}

div.formatChangeWarningPanel {
    background-color: #FFFCD7;
    overflow: hidden;
    border-style: double;
    border-width: medium;
    border-color: #790000;
    width: 600px;
}

div.formatChangeFormatImage {
    float: left;
    padding-right: 10px;
}

div.formatChangeWarning {
    overflow: hidden;
    display: block;
    padding: 20px 20px;
}

div.fromFormatToFormat{
    padding-top: 7px;    
}




/**** Configuration Screen*****/
.orgImg{
	display:inline-block;
	padding-left:5px;
	padding-top:5px;
}
span.orgMesgValue{
	display:block;
	margin-top:5px;
	font-size:1.2em;
}
.orderingLink{
	margin:8px 50px 8px 8px;
}
.organizationContainer{
	display:inline-block;
	background-color:#EAFFCA;
	border:1px solid #BABABA;
	width:300px;
	margin-top:20px;
	margin-left:30px;
}
.studentCommentsContainer{
    margin-top:20px;
}
.studentCommentsContainer input{
    margin-top:10px;
}
#divStudentCommentsSaveMsg{
    margin-top:10px;
}
#divStudentCommentsSaveBtn{
    display:none;
}
.orgContainerInfo{
	display:inline-block;
	padding:5px;
	border-left:1px solid #BABABA;
	vertical-align:top;
}
.orgGrouping{
	margin-top:20px;
	display:inline-block;
	vertical-align:top;
	padding:5px;
}
.changeOrder{
	margin-top:10px;
	margin-bottom:5px;
}
.orderingLink a[disabled]{
	color:#000;
}
.uploadFilePanel {
    background-color: #EFEFEF;
    border: medium double #b2b2b2;
    max-width:400px;
}

.uploadFilePanelHeader {
    background-color: #E2E2E2;
    padding: 5px;
    display: block;
    overflow: hidden;
}

.closeIcon {
    float: right;
}

.link {
    text-decoration: underline;
    cursor:pointer;
}
.addUnitOrTypePopup {
    background-color: #EFEFEF;
    padding: 10px;
}
div.dragHandle{
    background-color:#DEDEDE;
    background-image: url(<%=GetImageURL("drag-handle.gif")%>);
    width:17px;
    height:29px;
    cursor:move;
}
div.dragReorder{
    height:20px;
    border: 1px dashed #000;
    width:98%;
}
div.reorderList table{
    width:100%;
    margin:0px;
}
div.reorderList td.dragHandleTD{
    background-color:#DEDEDE;
    background-image: url(<%=GetImageURL("drag-handle-line.gif")%>);
    background-repeat:repeat-y;
    background-position:2px 0px;
    vertical-align:middle;
	border-left:1px solid #BABABA;
	border-bottom:1px solid #BABABA;
}
div.reorderList li, div.reorderList ul{
    margin:0px;
}
div.reorderList table{
	height:32px;
}
div.reorderList table.reorderAssignment{
	border-collapse:collapse;
}
table.reorderAssignment td{
	border:1px solid #BABABA;
	border-top:0px;
	padding-left:10px;
}
.assignMetaDate{
	width:200px;
	min-width:200px;
}
.assignMetaOrg{
	width:200px;
	min-width:200px;
}
.assignMetaOrgHeader{
	width:200px;
	min-width:219px;
}
table.assignmentGrid th.assignMetaNameHeader{
	min-width:240px;
}
.assignMetaName{
	min-width:200px;
}
table.reorderHeader,div.reorderList{
	width:85%;
	margin-bottom:0px;
}
table.reorderHeader th.assignMetaOrgHeader, table.reorderHeader th.assignMetaDate{
	border-left:1px solid #BABABA;
}
div.assignReorderContainer{
	margin-top:30px;
}
/* Test Builder */
.detailHeader.testBuilderHeader{
	background-color:#D4F0A9;
}
.detailSubHeader.testBuilderSubHeader {
	background-color:#EFEFEF;
	font-size:1.2em;
	color:#15489A;
}
.detailSubHeader.testBuilderSubHeader li.moreLink div.menuContent{
	font-size:.8em;
	color:black;
}
.tbMissingPoints{
	float:right;
	width:300px;
	margin:-6px;
	padding:13px;
	font-style:normal;
}
span.timeLimit{
	display:block;
	margin:3px 0px;
}
div.timeBar{
	display:inline-block;
	background-position:0px;
	background-image: url(<%=GetImageURL(CourseworkImgUtil.DATE_RANGE)%>);
	background-repeat:no-repeat;
	padding-left:35px;
}
div.timeBarText{
	margin-bottom:3px;
	width:350px;
}
.timeBarNormal{
	font-size:12px;
	color:#000;
}
.timeBarNormal.due{
	color:#7A0202;
	float:right;
}
.timeBarNormal.open{
	color:#008700;
}
div.timeBarDate img{
	margin:0px 5px;
}
.tbTopLinks{
	width:475px;
	background-color:#EFEFEF;
	border:1px solid #BABABA;
	padding:3px;
	text-align:center;
	margin-bottom:10px;
}
.tbPreview{
	border-style: solid;
}
.tbAddSection{
	border-style: dashed;
}
.tbDetail, .tbImport{
	padding:4px;
	background-color:#EFEFEF;
}
.tbImport{
    float:right;
    padding:16px 5px 16px 35px;
    border:1px solid #BABABA;
    background-position:5px 15px;
    background-repeat:no-repeat;
    background-image: url(<%=GetImageURL(CourseworkImgUtil.IMPORT)%>);
}
div.tbDetail.detailExtraCredit{
	background-color:#EBFFCC;
	padding-left:40px;
	background-position:10px 5px;
	background-image: url(<%=GetImageURL(CourseworkImgUtil.EXTRA_CREDIT_LARGE)%>);
	background-repeat:no-repeat;
	min-height:32px;
}
.groupHeader{
	padding-left:10px;
	background-color:#BABABA;
	min-height:25px;
}
.groupHeader span{
	font-weight:bold;
	font-size:1.1em;
}
div.reorderList table.reorderTableContainer{
	margin-bottom:20px;
}
a.buttonAnchor{
	float:right;
	 border-left:#BABABA;
    display:block;
    background-color:#CFCFCF;
    background-position:10px 5px;
	background-repeat:no-repeat;
    text-decoration:none;
    border-top:#FFF 1px solid;
    border-left:#FFF 1px solid;
    border-bottom:#A7A7A7 1px solid;
    border-right:#A7A7A7 1px solid;
    height:19px;
    padding-top:4px;
}
a.deleteAnchor{
    width:60px;
    padding-left:27px;
    background-image: url(<%=GetImageURL("delete.gif")%>);
}
a.editAnchor{
    width:45px;
    padding-left:30px;
    background-image: url(<%=GetImageURL("edit.gif")%>);
    margin-left:3px;
}
div.addQuestion{
	margin:1px;
	border:1px dashed #BABABA;
	padding:3px;
	background-color:#D6E2FB;
	text-align:center;
}
div.questionGroup{
	border:1px solid #BABABA;
	border-right:0px;
}
div.questionGroup.attention{
	font-style:normal;
}
div.questionGroup.attention{
	padding-left:25px;
	background-position:5px 5px;
	background-image: url(<%=GetImageURL(CourseworkImgUtil.ATTENTION)%>);
	background-repeat:no-repeat;
}
div.testBuilder table.reorderTableContainer{
	width: 680px;
}
div.testBuilder div.reorderList{
	width:100%;
}
div.questionGroup table.headerAssignmentGrid{
	height:auto;
}
#questions{
	background-color:#FFF;
}
div.tbDetail.detailPool{
	background-color:#FFEBD3;
}
span.pool{
	color:#894801;
	font-weight:bold;
}
div.rightQAction{
	float:right;
}
div.leftQAction{
	padding:5px;
	padding-bottom:10px;
	background-color:#EFEFEF;
	border-left:1px solid #BABABA;
}
div.leftQAction a{
	margin-right:30px;
}
div.finishEdits{
	padding:3px 3px 3px 10px;
	background-color:#CFCFCF;
}
.tbPoint{width:75px;}
.tbType{ width:150px;}
th.tbPoint, th.tbType{border-left:1px solid #BABABA;}
.tbSpacer{width:10px;border-left:1px solid #BABABA;}
.tbExtra{float:right;margin-right:5px;}

.questionGroup #innerModal{
	max-width:440px;
}
.ecOverride{
	padding:20px 10px 10px 10px;
}
.ecProceed{
	margin-top:20px;
}
.ecAction{
	padding:4px 5px 4px 10px;
	border:1px solid #578FC9;
	background-color:#FFF;
	white-space:nowrap;
	margin:10px 0px;
}

.deleteOrgHeaderModal
{
	padding: 0px 10px 0px 10px;
}

.deleteOrgHeaderModal>*
{
	padding-top: 10px;
}

.manageOrgUnit #innerModal
{
	width: 500px;
	max-width: 100%;
}

/* Manage Question Editor */
.manageQuestion #innerModal{
	width: 500px;
	max-width: 100%;
}
div.shortAnswerMatch{
	margin-top:10px;
}
div.shortAnswerMatch input[type=text]{
	width:300px;
}
.betweenMatch{
	display:inline;
}
div.shortAnswerMatch input[type=text].betweenText, input[type=text].partialInput{
	width:75px;
}
div.match{margin-top:5px;margin-bottom:5px;}
div.addMatch,div.match{
	margin-left:25px;
}
div.otherResponses{
	margin-top:20px;
	margin-bottom:5px;
}
.questionTable.saTable td.shortRemove{
	border-top:1px solid #B2B2B2;
	background-color:#FFFDC6;
	padding:5px;
}
div.choiceManage input[type=text], input[type=text].questionInput{
	width:300px;
}
div.manageQuestionContent{
	margin:15px;
}
div.answerType{
	margin:15px 0px;
	font-size:1.1em;
}
div.answerType select{
	margin-left:20px;
}
/*Rich Text Editor */
div.richTextContainer div#swfu_container
{
	margin:10px 0px;
}
/* Rich Text Display */
div.richText{
	max-width:650px;
}
div.imgGallery span{
	color:#7D7D7D;
	font-size:0.9em;
	display:block;
	margin-top:8px;
	margin-bottom:5px;
}
div.richText div.imgGallery{
	margin-top:3px;
}
div.richText div.imgGallery img{
	margin-right:8px;
}
div.richText div.equation, div.generalExtra{
	margin-top:10px;
}
div.richText div.equation img, div.editEquation div.equation img,
div.questionTypeDisplay div.equation img {
	padding:5px;
	border:1px solid #B2B2B2;
}
div.richScrollable{
	margin-top:10px;
	max-height:300px;
	overflow:auto;
}
div.editEquation div.equation{
	display:inline-block;
	margin-top:5px;
}
/* Edit Question Table */
.questionTable{
	background:#EFEFEF;
	border:1px solid #B2B2B2 ;
	border-top:0px;
	min-width:200px;
}
.questionTable caption{
	font-weight:normal;
	background-color:#E2E2E2;
	border:1px solid #B2B2B2;
	border-bottom:0px;
}
.questionTable th, td.distractorText{
	font-weight:normal;
	color:#707070;
	padding:5px 10px 0px 5px;
}
.questionTable tr{
	border-bottom:1px dashed #B2B2B2;
}
.questionTable tr.distractor{
	border-bottom:0px;
}
.questionTable td.disIcon{
	padding-left:25px;
	background-position:7px 10px;
	background-image: url(<%=GetImageURL(CourseworkImgUtil.DISTRACTOR)%>);
	background-repeat:no-repeat;
}
.questionTable td.matchIcon, .matchTable td.matchIcon, .matchReview td.matchIcon{
	padding-left:25px;
	background-position:7px 10px;
	background-image: url(<%=GetImageURL(CourseworkImgUtil.MATCH)%>);
	background-repeat:no-repeat;
}
.matchReview td.matchIcon{
	background-position:2px 3px;
}
.questionTable tr.optionFooter{
	border-top: 1px solid #B2B2B2;
}
.questionTable tr:first-child{border-bottom:0px;}
.questionTable td{
	padding:5px;
	vertical-align:top;
}
.questionTable td:first-child, .questionTable.matchTable tr.distractor td:first-child{
	text-align:right;
}
.questionTable td.addItems, .questionTable.tfTable td, .questionTable.saTable td,
.questionTable.matchTable td{
	text-align:left;
}
.questionTable.saTable td{
	padding:10px;
}
.saTable{
	margin:10px 0px;
}
.questionTable tr.distractor.multiAdd td{
	text-align:center;
	background-color:#D6E2FB;
	border-bottom:1px dashed #B2B2B2;
}
.questionTable div.choiceManage td,.questionTable .choiceManage td:first-child,
.questionTable div.choiceManage #innerModal,.questionTable div.feedbackContainer td{
	text-align:left;
	padding:0px;
	vertical-align: middle;
}
.choiceManage #innerModal{
	max-width:600px;
}
.choiceManage div.richTextContainer, div.clearOption{
	padding:10px;
	white-space: normal;
}
.richIcon{
	display:block;
	margin-top:10px;
}
div.manageSection{
	clear:both;
	margin-bottom:20px;
}
span.manageTitle{
	float:left;
	display:block;
	width:110px;
	text-align:right;
}
div.manageContent{
	margin-left:115px;
}
span.extraInfo{
	margin-left:10px;
	font-size:0.85em;
	color:#606060;
	display:inline-block;
}
span.extraInfo.typeInfo{
	margin:10px 0px;
}
div.audioWarning{
	padding-left:25px;
	background-image: url(<%=GetImageURL("alert-small.gif")%>);
	background-repeat:no-repeat;
}
div.audioWarning div{
	margin-top:8px;
}
a.clearButton{
	background-image: url(<%=GetImageURL(CourseworkImgUtil.REMOVE)%>);
	background-repeat:no-repeat;
	cursor:pointer;
	display:inline-block;
	height:20px;
	width:20px;
	margin-left:8px;
	margin-top:4px;
}
div.questionOptions{
	margin-top:15px;
	font-size:0.85em;
	color:#606060;
}
div.questionOptions strong{
	font-size:1.2em;
	color:black;
	font-weight:normal;
}
div.questionOptions div{
	margin-top:10px;
}
div.previewContainer{
	clear:both;
	margin:30px 0px 20px 0px;
	text-align:center;
}
div.previewContainer.fcPreview{
    display:inline;
}
div.previewContainer div.modalDiv{
	text-align:left;
}
div.previewContainer #innerModal,div.previewContainer .modalDiv{
	max-width:660px;
}
div.previewContainer div.questionDisplay{
	margin:10px;
	overflow: auto;
	max-height:600px;
	max-width:450px;
}
table.assignmentGrid div.previewContainer div.questionDisplay{ /*filecabinet preview*/
    max-height:400px;
}
div.previewContainer div.richText{
	max-width:450px;
}
div.previewContainer.fcPreview div#modalButtons{
    display:none;
}
div.previewContainer div#modalButtons{
	background-color:#D6E2FB;
	text-align:center;    
}
div.toolLaunchContainer{
    background-color:#D6E2FB;
	text-align:center;
    max-width:140px;
    border:1px solid #BABABA;
    padding:10px 25px 10px 25px;
}
a.previewQuestion{
	padding:5px 20px 5px 35px;
	background-color:#D6E2FB;
	background-position:15px 5px;
	background-image: url(<%=GetImageURL("icon-preview.gif")%>);
	background-repeat:no-repeat;
	border:1px solid #BABABA;
}
a.helpLink{
	display:block;
	margin-top:15px;
    	padding-left: 20px;
	background: transparent url(<%= this.GetImageURL(CourseworkImgUtil.HELP)%>) no-repeat 0 0;
}
div.helpContent{
    padding:5px;
    overflow: auto;
    max-height: 500px;
}
/********  Test Taking *****/
div.questionArea{
	margin:15px;
}
div.testHeader ul{
	width:100%;
	background-color:#EFEFEF;
	margin:0px;
	border-top:1px solid #B5B6B5;
	overflow:hidden;
	min-width:950px;
}
div.testHeader li{
	display:block;
	float:left;
	padding:5px 15px 5px 10px;
	border-left:1px solid #B5B6B5;
	margin:0px;
	height:46px;
}
div.testHeader li.testCounter{
	border-left-style:dashed;
	height:30px;
	margin-top:8px;
}
div.testHeader li.first{
	border-left:0px;
}
div.testHeader span.Title{
	font-weight:bold;
	font-size:1.3em;
	display:block;
	margin-bottom:5px;
}
div.testHeader ul.testStatus{
	border-bottom:1px solid #B5B6B5;
}
div.testHeader li.timeRemaining{
	background-color:#FFFBC6;
	padding-left:40px;
	background-image: url(<%=GetImageURL("32/hourglass.png")%>);
	background-repeat:no-repeat;
	background-position:5px 8px;
}
div.testHeader li.timeRemaining.warning{
	background-color:#FFD8D8;
}
div.testHeader span.headerStrong{
	display:block;
	font-size:18px;
	color:#15489A;
}
div.testHeader li.saveTest{
	background-color:#E4F1FF;
	padding:15px 40px 0px 40px;
	margin-bottom:-5px;
}
div.testHeader li.saveTest input{
	margin-right:30px;
}
div.testHeader li.exitTest{
	padding-top:15px;
	margin-bottom:-15px;
}
div.testHeader li.exitTest a{
	color:#790101;
	padding-left:20px;
}
div.testHeader li.exitTest img{
	margin-bottom:-4px;
}
div.testFooter {
    text-align: center; 
    padding: 10px; 
    background-color: #EFEFEF; 
    border-top: 1px solid #B5B6B5;
    border-bottom: 1px solid #B5B6B5;
    margin-left: -4px;
    margin-right: -10px;
}
div.reviewFooter {
    text-align: center; 
    padding: 20px; 
    background-color: #EFEFEF; 
    border-top: 1px solid #B5B6B5;
}
div.reviewFooter a {
    color: #790101;
}
div.reviewFooter img {
    margin-bottom: -4px;
}
span.testHeaderPages{
	text-align:center;
	display:block;
	margin-bottom:5px;
	color:#847D84;
}
span.groupName{
	display:block;
	margin-bottom:10px;
	color:#847D84;
	font-weight:bold;
}
div.timedGroup{
	background-color:#FFFFE4;
	border:2px solid #1851AD;
	font-weight:bold;
	padding:5px 10px;
	margin:10px 20px 20px 0px;
	font-size:0.9em;
}
span.groupTimeRemaining{
	color:#15489A;
	display:block;
	margin:5px 0px;
	font-size:18px;
}
div.timedInfo{
	font-weight:normal;
}
div.questionDisplay{
	margin:20px 0px;
}
div.questionArea div.questionDisplay{
    width:800px;
}
.questionSpacer{
	margin-left:10px;
}
div.questionSection{
	float:left;
}
div.pointDisplay{
	float:left;
	margin-left:5px;
	font-size:0.9em;
	color:#7D7D7D;
}
div.pointDisplay img{
	margin-bottom:-3px;
}
div.questionTypeDisplay{
	clear:both;
	padding-top:10px;
	max-width:775px;
}
div.orderingDisplay{
    clear:both;
    float:left;
}
div.shortDisplay{
	margin-bottom:10px;
}
div.multiDisplay input[type=checkbox],div.multiDisplay input[type=text]{
	vertical-align:top;
}
div.multiDisplay div.multiContent{
	display:inline-block;
	margin-top:2px;
	zoom:1;
        *display: inline;
}
div.multiDisplay div.multiChoice{
	margin-bottom:5px;
}
.matchDisplayTable td{
	padding:5px;
	border:1px solid #B5B2B5;
}
.matchTable td.matchIcon{
	vertical-align:top;
}
span.orderingInfo,a.orderingInfo,a.orderingInfo:visited,a.orderingInfo:link{
	display:inline-block;
	margin-bottom:10px;
	color:#7D7D7D;
}
div.orderNum{
	float:left;
	background-position:20px 3px;
	background-image: url(<%=GetImageURL(CourseworkImgUtil.MATCH)%>);
	background-repeat:no-repeat;
	height:15px;
	width: 30px;
}
ul.sortable{
	list-style-type: none;
	margin: 0;
	padding: 0;
}
ul.sortable li
{
    margin: 0 5px 5px 5px;
    border:1px solid #CCC;
    padding: 5px;
    cursor: move;
    background:#FFF;
}
ul.sortable li.sortableHighlight{
    height:1.5em;
    line-height:1.2em;
    background-color: #FFFFE4;
    border: 1px solid #FFCE08;
    min-width:50px;
}
li.orderNumDisplay div.richText{
	margin-left:35px;
}
tr.orderRow{
	border:1px solid #FFF;
}
tr.orderRow:hover{
	border:1px solid #7D7D7D;
}
table.orderingManual{
    border:1px solid #B4B4B4;
}
tr.orderingAlternate{
    background-color:#EFEFEF;
    border-top:1px solid #B4B4B4;
    border-bottom:1px solid #B4B4B4;
}
div.testSubmit{
	margin:20px 10px 30px 10px;
	border-top:1px dashed #B4B4B4;
}
div.testSubmitInfo{
	margin:25px 0px;
}
span.testSubmitAction{
	text-align:center;
	padding:15px 30px;
	background-color:#D6E2FB;
	border:1px solid #002157;
}
div.testPaging{
	background-color:#EFEFEF;
	border-top:1px solid #BABABA;
	border-bottom:1px solid #BABABA;
	padding:8px;
	text-align:center;
}
div.testContinue{
	text-align:right;
	margin:10px;
}
div.timeExpired{
	margin:10px;
}
div.timeExpired span.timeExpiredText{
	display:block;
	margin:10px 0px;
	font-size:1.1em;
}
div.timeExpired a{
	display:block;
	margin:15px 0px;
}
div.timeExpired span.testSubmitAction{
	display:inline-block;
	margin:15px 0px;
}
a.expiredNext{
	font-weight:bold;
}
div.testHeader div.pagingContainerDefault, 
div.testFooter div.pagingContainerDefault, 
div.reviewHeaderFooter div.pagingContainerDefault{
	background-color:inherit;
	border:0px;
	padding:0px;
}
div.reviewHeaderFooter div.pagingContainerDefault{
	float:left;
}
div.testHeader div.pagingCenter, div.reviewHeaderFooter div.pagingCenter{
	margin:0px 60px 0px 80px;
}
a.attemptBonus{
	display:block;
	float:right;
	background-color:#F5FFCD;
	border:1px solid #018701;
	padding:2px 10px 2px 25px;
	margin-top:-3px;
	margin-right:-7px;
	background-repeat: no-repeat;
}
div.bonusModalContainer{
	padding:0px 10px 0px 50px;
	background-image: url(<%=GetImageURL("32\\Star.png")%>);
	background-repeat: no-repeat;
	background-position: 5px 5px;
}
div.bonusModalContainer input{
	width:50px;
}
div.bonusModalContainer div{
	margin-top:15px;
}
div.bonusModal div#innerModal{
	border-color:#008700;
	background-color:#F4FFCC;
}
div.bonusModal div#innerModal div#modalHeading{
	background-color:#008700;
	color:#FFF;
}
div.openAssignment {
    background-color:#F6FFE0;
    border: 1px solid #5B8F00;
    margin: 5px;
    padding:5px;
}
div.openAssignment div.statusDisplay{
	background-image: url(<%=GetImageURL(CourseworkImgUtil.CALENDAR)%>);
	background-repeat: no-repeat;
	background-position: 5px 5px;
	padding-left:45px;
}
div.gradeSoFar{
	background-image: url(<%=GetImageURL(CourseworkImgUtil.GRADED_ASSIGNMENT)%>);
	background-repeat: no-repeat;
	background-position: 5px 5px;
	padding:0px 0px 10px 45px;
	border-bottom:1px dashed #BABABA;
}
span.assignmentStatus{
	display:block;
	margin-bottom:5px;
	font-size:1.1em;
}
div.openAssignment span.assignmentStatus strong {
    color: #005B7F;
    font-weight: bold;
}
div.lateAssignment span.assignmentStatus strong {
    color: #790000;
    font-weight: bold;
}
div.studentAssignmentInfo{
	margin:5px;
}
#innerModal div.studentAssignmentInfo{
    max-height:500px;
    overflow-y:auto;
}
div.studentAssignmentInfo div{
	margin:5px 0px 15px 0px;
}
div.studentAssignStatus{
	font-style:italic;
}
div.readingDetails{
	margin:10px 0px;
}
div.readings{
	margin: 10px 0px 10px 30px;
}
div.readings ul{
	margin-bottom:20px;
}
div.notYetOpenAssignment div.statusDisplay{
    margin: 5px;
    padding:5px;
    padding-left: 43px;
    background-image: url(<%=GetImageURL(CourseworkImgUtil.INACTIVE_STATUS)%>);
    background-repeat: no-repeat;
    background-position: 5px 0px;
}
span.startDate, span.dueDate{
	display:block;
	margin:10px 0px 2px 0px;
}
div.notYetOpenAssignment span.startDate, div.notYetOpenAssignment span.dueDate{
	color:#555;
}
div.overrideDue, div.overrideStart{
	font-size:0.85em;
}
div.overrideDue a, div.overrideStart a{
	text-decoration:underline;
}
div.gradedAssignment {
    background-color: #EEF4FF;
    border: 1px solid #003471;
    max-width:300px;
    margin: 5px;
    padding:5px;
}
div.gradedAssignment div.statusDisplay, div.gradedAssignment.lateAssignment div.statusDisplay{
	background-image: url(<%=GetImageURL(CourseworkImgUtil.GRADED_ASSIGNMENT)%>);
	background-repeat: no-repeat;
	background-position: 5px 5px;
	padding-left:45px;
}
div.gradedAssignment.attention{
	 font-style:normal;
}
span.assignmentGrade {
    color: #003471;
    font-size: 1.6em;
}
div.lateAssignment {
    background-color: #FEF8E7;
    border: 1px solid #003471;
    margin: 5px;
    padding:5px;
}
div.lateAssignment div.statusDisplay{
    background-image: url(<%=GetImageURL(CourseworkImgUtil.CALENDAR)%>);
    background-repeat: no-repeat;
    background-position: 5px 5px;
    padding-left:45px;
}
div.lateAssignment p {
    margin: 0;
    padding: 0;
}

div.lateAssignment .daysLate, .noFiles,.noAttempts {
    color: #790000;
    font-weight: bold;
}

#statusDisplay{	
	background-color:white;
	padding-left:5px;
	margin:-1px -1px -1px 23px;
}
div.statusDisplay a{
    cursor: pointer;
}
span.assignmentStatusDisplay{
	background-position:1px 1px;
	background-repeat:no-repeat;
	margin-left:5px;
}
span.assignmentStatusDisplay.late{
	padding-left:22px;
	background-image: url(<%=GetImageURL(CourseworkImgUtil.LATE)%>);
}
span.assignmentStatusDisplay.newlyOpen{
	padding-left:22px;
	background-image: url(<%=GetImageURL(CourseworkImgUtil.NEWLY_OPENED)%>);
}
span.assignmentStatusDisplay.retake{
	padding-left:22px;
	background-image: url(<%=GetImageURL(CourseworkImgUtil.RETAKE)%>);
}
span.assignmentStatusDisplay.inProgress{ 
	padding-left:22px;
	background-image: url(<%=GetImageURL(CourseworkImgUtil.IN_PROGRESS)%>);
}
div.assignmentStatusDisplay.complete{ 
	background-image: url(<%=GetImageURL(CourseworkImgUtil.TODO_CHECKED)%>);
	color:#464646;
}
div.assignmentStatusDisplay.complete a{
	color:#464646;
}
div.assignmentStatusDisplay.notYetOpen a{
	color:black;
}
div.assignmentStatusDisplay.notYetOpen div.assignmentDue,div.assignmentDisplay.notYetOpen div.assignmentDescription{
	font-style:italic;
}
div.assignmentStatusDisplay.retake, div.assignmentDisplay.retake div.assignmentContent{
	border-color:#003471;
}


div.assignmentStatusDisplay.new{
	background-color:#F1FFE4;
	background-position:6px 5px;
	background-image: url(<%=GetImageURL(CourseworkImgUtil.NEW)%>);
}

div.assignmentStatusDisplay.newFeedback{
	background-color:#F1FFE4;
	background-image: url(<%=GetImageURL(CourseworkImgUtil.BUBBLE_FULL)%>);
}

div.assignmentStatusDisplay.late, div.assignmentDisplay.late {
	border-color:#790000;
}

div.assignmentStatusDisplay.complete, div.assignmentDisplay.complete #assignmentContent,
div.assignmentStatusDisplay.open, div.assignmentDisplay.open #assignmentContent,
div.assignmentStatusDisplay.notYetOpen, div.assignmentDisplay.notYetOpen #assignmentContent{
	border:0px;
}
div.assignmentStatusDisplay.new, div.assignmentStatusDisplay.new #assignmentContent,
div.assignmentStatusDisplay.newlyOpen, div.assignmentStatusDisplay.newlyOpen #assignmentContent,
div.assignmentStatusDisplay.newFeedback, div.assignmentStatusDisplay.newFeedback #assignmentContent{
	border-color:#006003;
}
.assignmentList.notActive {
    font-style: italic;    
    color: #000000;  
}
/*Review Display*/
div.reviewHeaderFooter{
	clear:both;
	background-color:#EFEFEF;
	border:1px solid #B2B2B2;
	padding:3px 7px;
	margin:5px 0px;
}
div.questionReviewContainer{
	margin:10px;
}
a.showPaging{
    margin-left:20px;
}
div.reviewSection{
	font-weight:bold;
	margin:15px 0px;
}
div.reviewQuestions{
	margin-left:15px;
}
div.reviewQuestions div.questionDisplay{
	margin:5px 0px;
	width:1000px;
}
div.reviewQuestions div.questionDisplay.showCollapse div.collapseGradeDisplay:hover,
div.reviewQuestions div.questionDisplay.showExpand div.expandGradeDisplay:hover{
	border:1px solid #144799;
	cursor: pointer;
}
div.reviewQuestions div.gradeInput{
	clear:both;
}
div.showCollapse .reviewExpand,div.showExpand .reviewCollapse{
	display:none;
}
div.showExpand .reviewContainer{
	border-left:1px solid #B4B4B4;
	border-bottom:1px solid #B4B4B4;
	min-width:950px;
}
div.showCollapse .reviewContainer{
	border:0px;
}
div.collapseGradeDisplay{
	float:left;
	text-align:left;
	padding:2px 5px 2px 27px;
	min-width:40px;
	border: 1px solid #484848;
	background-color:#F7F7F7;
	background-position:5px 3px;
	background-repeat: no-repeat;
}
div.expandGradeDisplay{
	float:left;
	text-align:left;
	padding:4px 0px 10px 27px;
	width:73px;
	border: 1px solid #484848;
	background-position:5px 5px;
	background-repeat: no-repeat;
}
div.showCollapse div.reviewQuestionText div.richText{
	height:16px;
	line-height:16px;
	width:300px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	-o-text-overflow: ellipsis;
	-moz-binding: url('<%=GetEllipsisBinding()%>');
	-ms-text-overflow: ellipsis;
}
div.collapseGradeDisplay.partial,div.expandGradeDisplay.partial{
	background-image: url(<%=GetImageURL("score-partial.png")%>);
	border: 1px solid #484848;
	background-color:#F7F7F7;
}
div.collapseGradeDisplay.notyetgraded,div.expandGradeDisplay.notyetgraded,
table.multiReview .multiNotyetgraded{
	background-image: url(<%=GetImageURL("score-notscored.png")%>);
	border: 1px solid #484848;
	background-color:#F7F7F7;
}
div.collapseGradeDisplay.attention,div.expandGradeDisplay.attention{
	background-image: url(<%=GetImageURL(CourseworkImgUtil.ATTENTION)%>);
	background-color:#FFF899;
	border: 1px solid #484848;
}
div.collapseGradeDisplay.full, div.expandGradeDisplay.full, table.multiReview .correct{
	background-color:#F4FFCC;
	border:1px solid #008700;
	background-image: url(<%=GetImageURL(CourseworkImgUtil.CHECKED)%>);
}
div.collapseGradeDisplay.zero, div.expandGradeDisplay.zero, table.multiReview .incorrect{
	border: 1px solid #790000;
	background-color:#F7F7F7;
	background-image: url(<%=GetImageURL(CourseworkImgUtil.WRONG)%>);
}
div.collapseGradeDisplay.extra, div.expandGradeDisplay.extra,div.collapseGradeDisplay.bonus,div.expandGradeDisplay.bonus{
	background-position:4px 3px;
	background-color:#F4FFCC;
	border-color:#008700;
	background-image: url(<%=GetImageURL("score-extrapoints.png")%>);
}
div.collapseGradeDisplay.bonus,a.attemptBonus{
	background-position:2px 2px;
	background-image: url(<%=GetImageURL("16\\star.png")%>);
}
div.collapseGradeDisplay.notTaken, div.expandGradeDisplay.notTaken{
	border: 1px solid #B2B2B2;
	background-color:#F7F7F7;
	background-image: url(<%=GetImageURL("due_date.png")%>);
}
div.collapseGradeDisplay.notGiven, div.expandGradeDisplay.notGiven{
	border: 1px solid #484848;
	background-color:#EAEAEA;
	background-image: url(<%=GetImageURL("status-inactive.png")%>);
}
div.expandGradeDisplay.attention{
	background-position:2px 2px;
	padding-top:2px;
	text-align:left;
	padding-left:22px;
	width:78px;
}
div.expandGradeDisplay.attention span{
	font-size:0.88em;
	display:block;
	margin-left:-10px;
	margin-top:5px;
}
div.collapseFeedback{
	float:left;
	width:21px;
	height:19px;
	border:1px solid #578FC9;
	border-left:0px;
	background-position:2px 2px;
	background-repeat: no-repeat;
	background-image: url(<%=GetImageURL(CourseworkImgUtil.BUBBLE_FULL)%>);
}
div.collapseExtra{
	float:left;
	background-position:4px 2px;
	background-repeat: no-repeat;
	background-image: url(<%=GetImageURL(CourseworkImgUtil.EXTRA_CREDIT)%>);
	width:19px;
	height:19px;
}
div.questionReviewChange{
	margin:10px 0px;
	background-color:#FFF2D4;
	padding:8px 8px 8px 35px;
	border: 1px solid #484848;
	background-position:10px 7px;
	background-repeat: no-repeat;
	background-image: url(<%=GetImageURL("16\\error.png")%>);
}
div.shortAnswer{
	border:1px solid #578FC9;
	padding:5px;
	max-width:300px;
}
div.reviewExpand.feedbackDisplay{
	margin:15px 0px 5px 25px;
}
div.reviewExpand.feedbackDisplay div.feedbackEntry{
	padding-bottom:0px;
	font-style:italic;
}
div.reviewExpand.feedbackDisplay div.wysiwygtext{
	margin-bottom:10px;
	font-style:normal;
}
div.questionTypeDisplay.reviewExpand{
    max-width:850px;
}
div.questionTypeDisplay div.feedbackDisplay div.wysiwygtext{
	margin:0px;
}
div.questionTypeDisplay div.feedbackDisplay{
	display:inline-block;
	margin:0px 0px 0px 5px;
	max-width:350px;
}
div.expandFooter{
	clear:both;
	float:left;
	border-top:1px solid #B4B4B4;
	border-right:1px solid #B4B4B4;
	background-color:#F7F7F7;
	margin-top:10px;
	width:100%
}
div.expandFooter div{
	float:left;
	padding:3px 7px;
}
div.expandFooterDivide{
	border-left:1px solid #B4B4B4;
}
div.expandFooter div.feedbackContainer{
	border:1px solid #F7F7F7;
}
div.expandFooter div.feedbackContainer:hover{
	background-color:#EAF1FE;
	border:1px solid #144799;
}
div.expandFooter div.yourFeedback{
	padding-left:25px;
	background-position:2px 2px;
	background-repeat: no-repeat;
	background-image: url(<%=GetImageURL(CourseworkImgUtil.BUBBLE_FULL)%>);
}
div.ecReview{
	clear:both;
	margin:20px 0px;
}
div.ecReview div.collapseGradeDisplay{
	margin:0px 10px 0px 25px;
}
div.ecReview span{
	display:block;
	margin:10px 0px;
	font-weight:bold;
}
span.studentNameDisplay, div.studentNameDisplay{
	font-weight:bold;
	color:#646464;
	display:block;
	margin:10px 0px;
}
table.tfReview td{
	padding-right:5px;
	background-position: 2px;
}
td.correct{
	padding-left:20px;
	color:#008600;
	background-repeat: no-repeat;
	background-image: url(<%=GetImageURL(CourseworkImgUtil.CHECKED)%>);
}
td.incorrect{
	padding-left:20px;
	color:#7B0000;
	background-repeat: no-repeat;
	background-image: url(<%=GetImageURL(CourseworkImgUtil.WRONG)%>);
}
td.partial{
	padding-left:20px;
	background-repeat: no-repeat;
	background-image: url(<%=GetImageURL("score-partial.png")%>);
	color:#000;
}
td.notyetgraded{
	padding-left:20px;
	background-repeat: no-repeat;
	background-image: url(<%=GetImageURL("score-notscored.png")%>);
	color:#484848;
}
div.wordCount{
	margin-top:20px;
}
td.multiSelector{
	text-align:right;
}
th.reviewHeader{
	font-size:0.8em;
	color:#646464;
}
table.multiReview .multiNotyetgraded{
	border-style:dashed;
}
table.multiReview .multiPartial{
	background-color:#EFEFEF;
	border: 1px solid #ABA000;
}
table.multiReview td, table.multiReview img, table.matchReview td,
td.matchAnswerKey img, td.matchAnswerKey span, table.shortReview td{
	vertical-align: top;
}
table.multiReview div.multiNotyetgraded, table.multiReview div.correct,
table.multiReview div.incorrect,table.multiReview div.multiPartial,
table.multiReview .multiHeader, table.multiReview div.unSelected{
	background-image: none;
	padding:2px 5px 2px 5px;
	text-align:right;
}
table.multiReview div.multiNotyetgraded img, table.multiReview div.correct img,
table.multiReview div.incorrect img,table.multiReview .multiHeader img{
	padding-left:5px;
}
table.multiReview .multiHeader{
	border-bottom:1px solid #898989;
}
span.noSelection{
	font-style:italic;
	color:#646464;
}
td.showMatchCorrect{
	padding-left:25px;
	background-repeat: no-repeat;
	background-position:2px 0px;
	background-image: url(<%=GetImageURL("16\\arrow_right.png")%>);
}
span.matchCorrect{
	margin-right:10px;
}
td.orderingNum div.richText,td.orderingNum span, td.orderAnswerKey div.richText, td.orderAnswerKey img{
	float:left;
}
td.orderingNum div.richText, td.orderAnswerKey div.richText{
	margin-left:5px;
}
div.shortCorrectContainer{
	float:left;
	margin-right:10px;
	max-width:300px;
}
div.correctAnswer{
	margin:2px 1px;
	padding:2px 5px 2px 23px;
	border:1px dashed #CECECE;
	float:left;
	background-repeat: no-repeat;
	background-position:3px 2px;
	background-image: url(<%=GetImageURL(CourseworkImgUtil.CHECKED_CORRECT)%>);
}
table.shortReview td.showMatchCorrect span{
	float:left;
	margin:5px;
}
div.studentDetailLinks {    
    background-color: #EFEFEF;
    border-color: #BDBEBD;  
    border-style: solid;
    border-width: 1px;
    float: right;
    padding: 20px 20px 20px 20px;
}

.studentDetailAssignmentText {
    color: #305B8C;
    font-weight: bold;
    font-size: large;
}

.inactiveUnitText {
    color: #464646;    
}

.inactiveUnitStatusText {
    color: #464646;
    font-style: italic;
}

.studentDetailStudentName {
    font-weight: bold;
    font-size: large;
}
div.studentDetailUnits{
	clear:both;
	margin-top:25px;
}

div.uploadAssignmentInfo, div.onlineAssignmentInfo {
    margin: 5px 0px;
    padding: 5px 5px 5px 43px;
    background-image: url(<%=GetImageURL(CourseworkImgUtil.ASTERISK)%>);
    background-repeat: no-repeat;
    background-position: 0px 5px;
    min-height:30px;
}
div.uploadAssignmentInfo span{
	display:block;
	margin-bottom:5px;
}
span.maxUpload{
	display:block;
	margin:5px 0px;
	color:#7A0101;
	font-style:italic;
}
div.onlineAssignmentInfo span{
	display:block;
	margin:3px 0px;
}
a.turnInAssignment {
    background-color: #375880;
    border:1px solid #363636;
    float: left;
    margin: 5px;
    padding:12px 60px;
    background-image: url(<%=GetImageURL(CourseworkImgUtil.WHITE_CHECK_LARGE)%>);
    background-repeat: no-repeat;
    background-position: 20px 17px;
}
a.turnInAssignment, a.turnInAssignment:link, a.turnInAssignment:visited{
	color: #fff;
	text-decoration:none;
}
a.uploadFile,a.startAttempt,span.waitAttempt {
    display:block;
    background-color: #D6E2FA;
    text-decoration:underline;
    float: left;
    margin: 5px;
    padding:12px 45px;
    border:1px solid #003471;
    cursor: pointer;
    color: #0202C6;
    font-weight: bold;
}
a.startAttempt, a.startAttempt:link, a.startAttempt:visited{
	padding:12px 30px;
	text-decoration:none;
	font-weight:normal;
	color:black;
}
a.startAttempt, a.turnInAssignment{
    margin-bottom: 40px;
}
a.startAttempt .attemptLink, a.turnInAssignment .turnInLink{
	display:block;
	margin-top:5px;
	text-decoration:underline;
	font-weight: bold;
}
a.uploadFile.notAllowed{
	background-color:#F7F7F7;
	border:1px solid #E4E4E4;
	color:#B6B6B6;
	cursor:  default;
	background-image:url();
}
span.waitAttempt{
	background-color:#F7F7F7;
	border-color:#E4E4E4;
	padding:11px 15px;
	text-decoration:none;
	color:#000;
	font-weight:normal;
	cursor:default;
}
div.retakeInfo{
	margin:10px 0px 5px 5px;
}
span.invalidTextMsg{
    font-weight:bold;
}
.uploadFile {
    background-image: url(<%=GetImageURL(CourseworkImgUtil.ADD_PAGE)%>);
    background-repeat: no-repeat;
    background-position: 5px 5px;
}

a.uploadFile, a.uploadFile:link, a.uploadFile:visited, a.startAttempt span, a.startAttempt:visited span, a.startAttempt:link span {
    color: #0202C6;
    font-weight: bold;
}
.startAttempt a{
	display:block;
}

div.assignmentAttentionStatus{        
    background-position:3px 5px;
    background-repeat:no-repeat;
    min-height:24px;	
}

div.assignmentAttentionStatus.lateAlert{
    border:1px solid;
    padding-left:20px;
    background-color: #FEFA9A;
    background-repeat: no-repeat;
    background-image: url(<%=GetImageURL("16/date_error.png")%>);
    color:#484848;
}

div.assignmentAttentionStatus.needsGradedAlert{
    border:1px solid;
    padding-left:20px;
    background-color: #FEFA9A;
    background-repeat: no-repeat;
    background-image: url(<%=GetImageURL("16/calculator_error.png")%>);
    color:#484848;
}

.onlineAssignmentAttempts {
    background-color: #EFEFEF;
    border: 1px solid #B2B2B2;
    border-bottom: 1px solid #555;
    height: 20px;
    margin: 10px 0px;
}

.onlineAssignmentAttempts a, .onlineAssignmentAttempts a:visited, .onlineAssignmentAttempts a:active, .onlineAssignmentAttempts a:link {
    color: #000;
}

.onlineAssignmentAttempts li {
    display: inline;
    list-style-type: none;
    padding: 5px 10px;
}

.onlineAssignmentAttempts li.active {
    font-weight: bold;
    border: 1px solid #000;
    border-bottom: none;
    background-color: #fff;
}

.onlineAssignmentAttempts li.active a, .onlineAssignmentAttempts li.active a:visited, .onlineAssignmentAttempts li.active a:active, .onlineAssignmentAttempts li.active a:link {
    text-decoration: none;
}

.onlineAssignmentAttempts li.ignored a, div.retakeGradeContainer.ignored,div.retakeGradeContainer.ignored .retakeGrade {
    font-style: italic;
    font-weight:normal;
    color:#707070;
}
div.onlineAssignmentAttempts{
    margin-bottom:10px;
    padding:5px;
}
.lateText,.attemptDetails a.lateText {
    font-weight: bold;
    color: #790000;
}
a.lateText{
	font-weight:normal;
}
/* Faculty Assignment Detail for Students */
div.facAssignmentDetailSection{
	margin:15px 0px;
	clear:both;
}
div.uploadOpen{
	margin:15px 10px;
	padding:10px;
	border:1px solid #790000;
	background-color:#EFEFEF;
	float:left;
}
div.uploadOpen span{
	font-weight:bold;
	display:block;
	margin-bottom:10px;
}
div.fileDisplay{
	margin:10px 0px;
	padding-left:20px;
	max-width:650px;
	background-repeat: no-repeat;
	background-image: url(<%=GetImageURL("icon-handout.gif")%>);
}
div.fileDisplay div{
	margin-top:3px;
	font-size:0.9em;
}
div.downloadAll{
	margin-top:20px;
}
div.fileContainer{
	margin-left:25px;
	clear:both;
}
div.overrideContainer{
	margin:10px;
}
div.overrideSpacer{
	margin:10px 0px 20px 0px;
}
div.gradeAssignment{
	font-style:normal;
	padding:5px;
	float:left;
	border:1px solid #484848;
}
div.gradeAssignment div.gradeInput{
	margin:0px;
}
div.assignmentGradeInfo{
	float:left;
	margin-left:10px;
}
div.assignmentGradeInfo span{
	display:block;
	margin-bottom:10px;
}
div.assignmentGradeVisibility{
	float:left;
	max-width:400px;
	padding-left:20px;
	margin:5px 0px 0px 10px;
	background-repeat: no-repeat;
	background-position:1px 1px;
	background-image: url(<%=GetImageURL(CourseworkImgUtil.INACTIVE)%>);
}
div.overrideDisplay{
	padding:5px 5px 5px 25px;
	border:1px solid #FFF;
	background-repeat: no-repeat;
	background-position:3px 5px;
}
div.overrideDisplay a{
	text-decoration:underline;
	cursor:pointer;
}
div.overrideDisplay:hover{
	background-color:#EAF1FE;
	border:1px solid #144799;
}
div.overrideClose{
	background-image: url(<%=GetImageURL("16\\control_stop_blue.png")%>);
}
div.overrideHistory{
	background-image: url(<%=GetImageURL("16\\attributes_display.png")%>);
}
div.overrideTime{
	background-image: url(<%=GetImageURL("16\\hourglass.png")%>);
}
div.overrideRetake{
	background-image: url(<%=GetImageURL("16\\control_repeat_blue.png")%>);
}
div.overrideFinal{
	background-image: url(<%=GetImageURL("16\\calculator.png")%>);
}
div.overrideReopen{
	background-image: url(<%=GetImageURL("16\\control_rewind_blue.png")%>);
}
div.overrideInstructions{
	background-image: url(<%=GetImageURL("16\\info_rhombus.png")%>);
}
span.uploadLate{
	font-weight:bold;
	color:#790101;
	padding-left:20px;
	background-repeat: no-repeat;
	background-image: url(<%=GetImageURL(CourseworkImgUtil.ATTENTION_DATE)%>);
}
div.uploadInfo{
	padding:5px 10px 10px 30px;
	margin-top:30px;
	background-color:#EFEFEF;
	border:1px solid #B2B2B2;
	background-repeat: no-repeat;
	background-image: url(<%=GetImageURL(CourseworkImgUtil.ADD_FILE)%>);
	background-position: 8px 6px;
}
div.aboutGrade{
	margin-bottom:10px;
}
div.aboutGradeAttention{
	padding-left:20px;
	background-repeat: no-repeat;
	background-image: url(<%=GetImageURL(CourseworkImgUtil.CALENDAR_WARNING)%>);
	background-position: 0px;
}
span.notes{
	display:block;
	padding:10px 0px;
	color:#B2B2B2;
}
div.lateNotes{
	margin-top:10px;
}
div.lateNotes ul,div.manualGradeFinal ul{
	margin:10px 0px 0px 25px;	
}
div.lateNotes ul li,div.manualGradeFinal ul li{
	margin-left:10px;
	list-style: disc outside;
}
div.manualGradeFinal{
    margin-top:10px;
}
div.manualGradeFinal b{
    color:red;
}
.retakeGradeContainer {
    width: 100px;
    height: 60px;
    border: 1px solid #144799;
    background-color: #EFEFEF;
    text-align: center;
    float:left;
    margin: 5px;
}
.retakeGradeContainer .retakeGradeLabel {
    color: #636363;
    font-size:0.9em;
    display:block;
    margin:5px 0px 8px 0px;
}
.retakeGradeContainer .retakeGrade {
    color: #003471;
    font-weight: bold;
    font-size: 1.2em;
}
div.attemptDetails{
	float:left;
	margin-left:20px;
}
div.assignmentTypePanel {
    background-color: #EFEFEF;
    margin: 30px 20px 20px 20px;
    padding: 5px 5px 5px 20px;
    border: 1px #BDBDBD solid;
    height: 30px;
    width: 300px;
    line-height:30px;
}
span.FolderObjectRowText {
    font-style:italic;
}
span.optionalHint {
    font-style:italic;
    font-size: 10px;
}
span.ignoreInfo,span.attemptTime,div.ipAddress{
	display:block;
	margin:2px 0px;
}
/* START History */
.historyLink{
	text-decoration:underline;
    cursor: pointer;
}

.historyContainer{
    display: inline;
}

.historyContainer .modalDiv{
    max-width: 800px;
}

.historyContainer #modalButtons{
    margin: 0;
    padding: 0;
}
.historyContainer #innerModal{
    max-width: 800px;
}

.historyContainer .history{
    padding: 10px 10px 0 10px;
    overflow: auto;
    max-height: 600px;
}

.historyContainer .historyHighlight{
    background-color: #d6e2fb;
}

.historyContainer .historyWarning{
    background-color: "#fff899";
}

/* END History */
.FormEleErr
{
    border: 1px solid red;
}
.FormEleErr75
{
    border: 1px solid red;
    width: 75px;
}
.FormEleErrQuestionInput
{
    border: 1px solid red;
    width:300px;
}
.FormTxtErr
{
    color:Red;
}
.indentedDiv
{
    padding-left:25px;
}

.passwordStrength1
{
    background-color:Yellow;
    padding: 2px 2px 2px 2px;
}
.passwordStrength2
{
    background-color:#fbcf03;
    padding: 2px 2px 2px 2px;
}
.passwordStrength3
{
    background-color:#f3ae0a;
    padding: 2px 2px 2px 2px;
}
.passwordStrength4
{
    background-color:#ec8a0a;
    padding: 2px 2px 2px 2px;
}
.passwordStrength5
{
    background-color:#f16803;
    padding: 2px 2px 2px 2px;
}

/*Start of GradeByQuestion*/
div.otherQuestions{
	padding:10px;
	overflow: auto;
	max-height: 400px;
	max-width:600px;
	min-width:300px;
}
div.otherQuestions div{
	margin:3px 0px 3px 20px;
}
div.otherQuestions a{
	display:block;
	padding:3px;
}
div.otherQuestions a.attention{
	border:1px solid #BABABA;
	padding-left:22px;
	background-repeat: no-repeat;
	background-image: url(<%=GetImageURL(CourseworkImgUtil.CALENDAR_WARNING)%>);
	background-position: 3px 2px;
}
div.userSpecific div.reviewQuestionText{
	color:#003471;
	font-weight:bold;
}
div.userSpecific span.fromRetake{
	font-weight:normal;
}
div.userSpecific li.gbqBullet{
	list-style-type: disc;
	color:#003471;
	font-weight:bold;
}
div.userSpecific span.notTaken,div.userSpecific span.notGiven{
	font-weight:normal;
	color:black;
	font-style:italic;
}
/*END of GradeByQuestion*/

/* Secured Browser */
.secureBrowserInfo
{
    margin: 20px 0 30px 10px;
    
}

.secureBrowserInfo h5
{
    border: 0;
}
    
.secureBrowserInfo a
{
    margin-left: 15px;
}

.secureBrowserInfo .confirmed
{
    padding-left: 40px;
    background: url(<%= GetImageURL(CourseworkImgUtil.CHECKED_LARGE)%>) no-repeat 0 0;
}

.secureBrowserInfo .launch
{
    padding-left: 40px;
    background: url(<%= GetImageURL(CourseworkImgUtil.ASTERISK)%>) no-repeat 0 0;
    margin-bottom: 20px;
}

.secureBrowserInfo .locked
{
    padding-left: 20px;
    background: url(<%= GetImageURL(CourseworkImgUtil.LOCKED)%>) no-repeat 0 0;
}
    
.secureBrowserInfo .textWithEmbeddedLink a
{
    margin-left: 0;
}

.secureBrowserInfo .launchLink
{
    padding: 15px 30px 15px 30px;
    display: inline-block;
    background-color: #D6E2FA;
    border: 1px solid #003471;
}

.secureBrowserInfo .returnLink
{
    padding: 15px 30px 15px 30px;
    display: inline-block;
    background-color: #D6E2FA;
    border: 1px solid #003471;
    font-weight: bold;
}
    
.secureBrowserInfo .testLink
{
    font-weight: bold;
}

.secureBrowserInfo .userGuideLink
{
    padding-left: 20px;
    background: url(<%= GetImageURL(CourseworkImgUtil.HELP)%>) no-repeat 0 0;
}
    
.secureBrowserInfo .downloadLinks
{
    border: 1px solid #B2B2B2;
    background: #EFEFEF;
    margin: 10px 0 15px 15px;
    padding: 10px 15px 10px 0;
    display: inline-block;
    zoom:1;
	*display: inline;
}

.secureBrowserInfo .warning
{
    border-top: 1px dashed #D8D6BC;
    border-bottom: 1px dashed #D8D6BC;
    background: #FDFACC;
    padding: 0 10px 0 10px;
}

.secureBrowserInfo .testStartWarning
{
    margin-top: 10px;
    padding-left: 20px;
    background: url(<%= GetImageURL(CourseworkImgUtil.ALERT_SMALL)%>) no-repeat 0 0;
}

/* End of Secured Browser */

.orgUnitModal{
	min-width: 600px;
	padding-right: 5px;
}

.orgUnitModal #innerModal{
	width: 100%;
	min-width: 100%;
	max-width: 100%;
}

.iconBar
{
	white-space:nowrap;
    width: 50px;
}
.myInfoIcon
{
	display: inline-block;
	padding: 5px;
    float:right;
}
.mailIcon
{
	display: inline-block;
	padding: 5px;
}
