<%@ Page Language="C#" ContentType="text/css" EnableViewState="false"   AutoEventWireup="true" CodeBehind="ForumAdvancedStyle.aspx.cs" Inherits="Jenzabar.ICS.Web.Portlets.ForumPortlet.ForumAdvancedStyle" %>
<%@ OutputCache Duration="60" VaryByParam="none" %>
<%@ Import Namespace="Jenzabar.ICS.Web.Portlets.ForumPortlet.Utils" %>

optgroup{
    font-style:normal;
    padding-left:2px;
}

.forumAdvanced .postData ol li  {list-style: decimal;}

.forumAdvanced
{
    font-size:.9em;
}
.forumAdvanced span.WordSpliter{
    margin-left:10px;
}

.forumAdvanced .baseLinks li
{
    display:inline;
    margin-right:25px;
}

.forumAdvanced .threadAssignmentInstrux a {
    text-decoration: underline;
    color: blue;
}

.forumAdvanced .post .modalDiv {
    min-width: 300px;
}

.baseLinks, .accessIcons
{
    text-align:center;
    margin:10px 0px 15px 12px;
}

.forumAdvanced .unRead
{
    font-weight:bold;
}

.postLink{
    padding-left:25px;
}

.fPostInfo img, .fTopicInfo img, .fThreadInfo img
{
    float:left;
    margin-left:-10px;
    margin-right:5px;
    padding-left:10px;
}

.recentPost .fPostInfo
{
    background-color:#EFEFEF;
    border-bottom:1px solid #CFCFCF;
    border-top:1px solid #FFF;
}

.postLinkLarge{
    padding:8px;
}

.recentPost .noPosts
{
    background-color:#EFEFEF;
    height:55px;
    text-align:center;
    padding-top:45px;
}

.recentPost
{
    border:1px solid #BABABA;
    margin:10px;
}

.recentPostTitle
{
    background-color:#CFCFCF;
    border-bottom:1px solid #BABABA;
    padding:5px;
}

.recentPostTitle span
{
    font-weight:bold;
    font-size:13px;
}

.recentPostTitle a
{
    float:right;
}

.postAttribution
{
    font-size:.85em;
    color:#777;
}

.post img.lockedContentImage
{
    float:left;
    padding-top: 3px;
    padding-left: 10px;
    padding-bottom: 0px;
    margin-right:5px;
}

.fPostInfo img.lockedContentImage
{
    padding-top: 3px;
    padding-left: 10px;
    padding-bottom: 0px;
}

.post .lockedContentContainer,
.fPostInfo .lockedContentContainer
{
    display: block;
    font-size:.85em;
    padding-top:5px;
}

div.mainTop {
    padding:5px 12px 3px 12px;
    overflow:hidden;
}
.mainTop div.recentPost
{
    margin:0px;
    margin-left:287px;
}
div.quickLinks{
    float:left;
    width:275px;
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
    background-position:10px 10px;
}
ul.menu li a {
    padding: 10px 10px 10px 40px;
    display: block;
    text-decoration:none;
}
ul.menu li.unreadQuick{
    background-image: url(<%=GetImageURL("files-small-unread.gif")%>);
}
ul.menu li.myQuick{
    background-image: url(<%=GetImageURL("user-posts-small.gif")%>);
}
ul.menu li.userListQuick{
    background-image: url(<%=GetImageURL("user-list-small.gif")%>);
}
ul.menu li.approvalQuick{
  background-image: url(<%=GetImageURL("approval-queue-small.gif")%>);  
}
ul.menu li img{
    float:left;
    padding:10px 5px 0px 8px;
}
ul.menu li.editForum a
{
    background-image: url(<%=GetImageURL("edit-forum.gif")%>);
    background-repeat:no-repeat;
    background-position:10px 10px;
    background-color:#D6E2FC;
}
div.mainContent{
    clear:both;
    padding:0px 12px 10px 12px;
}
div.guestQuickLink
{
    height:190px;
    padding: 5px;
    overflow: hidden;
    border: 1px solid #b2b2b2;
    background-color: #efefef;
}
.catName
{
    font-weight:bold;
    font-size:1.15em;
    display:inline-block;
    padding-bottom:2px;
}
.catDescrip
{
    font-style:italic;
    color:#6F6F6F;
}
.catDisplayHeader
{
    background-color:#CFCFCF;
    overflow:hidden;
    border:1px solid #BABABA;
    margin-top:12px;
}
a.subscribe{
    background-image: url(<%=GetImageURL(ForumConstants.IMG_SUBSCRIPTION)%>);
    background-repeat:no-repeat;
    background-position:5px 5px;
}
.reorderTableContainer a.deleteAnchor{
    width:115px;
    padding-left:27px;
    background-image: url(<%=GetImageURL(ForumConstants.IMG_DELETE)%>);
    background-repeat:no-repeat;
    background-position:5px 13px; 
}
.reorderTableContainer a.editAnchor{
    width:100px;
    padding-left:25px;
    background-image: url(<%=GetImageURL(ForumConstants.IMG_EDIT)%>);
    background-repeat:no-repeat;
    background-position:5px 10px; 
}
a.buttonAnchor
{
    float:right;
    border-left:#BABABA;
}

a.buttonAnchor
{
    display:block;
    width:80px;
    background-color:#CFCFCF;
    background-position:10px 7px;
    text-decoration:none;
    border-top:#FFF 1px solid;
    border-left:#FFF 1px solid;
    border-bottom:#A7A7A7 1px solid;
    border-right:#A7A7A7 1px solid;
    height:27px;
    padding-left:45px;
    padding-top:12px;
}

a.viewOptions{
    padding-left:10px;
    width:130px;
}

.altDataGrid, table.reorderTable.altDataGrid td
{
    background-color:#EFEFEF;
}

table.dataGrid, table.dataGrid th, table.dataGrid tr, table.dataGrid td
{
    border: 1px solid #BABABA;
}

table.dataGrid th
{
    font-weight:normal;
    padding:5px;
    white-space: nowrap;
}

table.dataGrid .fTopicInfo, table.dataGrid .fThreadInfo
{
    padding:3px;
    text-align:left;
}

a.hideLink
{
    text-decoration:none;
    color:#000;
}

table.dataGrid .fTopicInfo a, table.dataGrid .fThreadInfo a, table.dataGrid .fTopicInfo a.showLink
{
    text-decoration:underline;
}

table.dataGrid .fTopicInfo .topicDescrip
{
    color:#6F6F6F;
    font-size:.9em;
    word-wrap:break-word;
}

table.dataGrid .fTopicInfo .topicModerators
{
    font-size:.9em;
}

table.dataGrid .fTopicInfo .viewImg, table.dataGrid .fThreadInfo .viewImg
{
    height:35px;
    padding-top:5px;
}

div.topicLink, div.threadLink
{
    padding-left:33px;
}

.topicLink span.private
{
    font-weight:bold;
    font-size:0.9em;
    display:block;
}

table.dataGrid .fPostInfo
{
    text-align:left;
    font-style:normal;
}

table.dataGrid .fPostInfo a
{
    text-decoration:underline;
}

table.dataGrid td
{
    padding:2px 5px 2px 0px;
    text-align:right;
}

table.dataGrid td.cellAccess
{
    text-align:center;
}

table.dataGrid td.cellLatestPost
{
    text-align:left;
    padding:5px;
    font-style:italic;
}

table.dataGrid td a
{
    text-decoration:none;
}

table.dataGrid td.approvalCell
{
   height:45px;
   border:1px solid #EAD80C;
   background-color:#FFFDE5;
}

table.dataGrid td.approvalCell div.requiresApproval
{
    padding-right:5px;
}

table .footerDataGrid, table .headerDataGrid
{
    background-color:#DFDFDF;
    text-align:right;
}
table .headerDataGrid .cellTopicHeader, table .headerDataGrid .cellLatestPostHeader, table td.cellTopic
{
    text-align:left;
}
table .headerDataGrid .cellLatestPostHeader{
    min-width:230px;
}
table td.cellTopic{
    padding:3px;
}
table .headerDataGrid .cellAccessHeader
{
    text-align:center;
}

.noTopics, .noCategories, .noThreads, .noPostList
{
    text-align:center;
    padding:10px;
    border: 1px solid #BABABA;
    background-color:#DFDFDF;
}

/*  Post */
.post .contentTabs .tabbox{
    border:0px;
}

.postRow
{
    clear:both;
    border:1px solid #BABABA;
    background-color: #EBEBEB;
    overflow:hidden;<%-- --%>
    background-color:#EBEBEB;
    background-image: url(<%=GetImageURL("reply-arrow-gray.gif")%>);
    background-repeat: no-repeat;
    background-position: -15px 0px; /* value will be overwritten in post.ascx if identation is needed */
}

.postRowAlternate
{
    background-color:#DBDBDB;
}

.postContainer
{
    background-color:#FFF;
    border-left:1px solid #BABABA;
    border-right:1px solid #BABABA;
    overflow:hidden; <%----%>
}

.managePostContainer{
    margin-top:10px;
    clear:both;
    border:0px;
    background-color:transparent;
}

.managePostSeparator
{
    margin:5px 15px;
    border-top: 1px dashed #B3B3B3;
}

.alternatePost
{
    background-color:#EEE;
}

.originalPost
{
    background-color:#D7DFEC;
    overflow:hidden;<%-- --%>
}

.originalPost span.postTitle
{
    color:#1C416B;
}

.originalPost span.postDate
{
    color:#849DB1;
}

.unreadPost
{
    background-color:#EAF9E6;
}

.postContainerIndent
{
    border-left:2px dashed #B3B3B3;
}


.unreadPost span.postTitle
{
    color:#348133;
}

.unreadPost span.postDate
{
    color:#005303;
}

.recentPost .requiresApproval, .requiresApproval, div.editPostSection, div.editPostMoveTo, ul.menu li.requiresApproval
{
    border:1px solid #EAD80C;
    background-color: #FFFDE5;
    height:auto;
}
.moveToMeta{
    margin-left:5px;
    font-style:italic;
}

span.postTitle
{
    display:block;
    font-weight:bold;
    font-size:14px;
}

span.postDate
{
    font-size:0.8em;
    color:#515151;
}

div.postMessage, div.topicMessage{
    margin:0px;
    padding:5px;
    text-align:center;
    font-size:1.0em;
}
div.postMessage span, div.topicMessage span{
    display:block;
    margin:5px;
    font-weight:normal;
}
div.postMessage span.messageTitle, div.topicMessage span.messageTitle{
    font-weight:bold;
}
div.topicMessage{
    text-align:left;
    background-color:#FFFDE5;
    margin-bottom:12px;
}
div.topicMessage div{padding:5px;}
div.topicMessage span.extraInfo{
    display:inline;
    margin:0;
}
div.legendBox{
    text-align:center;
    padding:10px;
}
div.legendBox span.legendBox{
    height:30px;
    width:30px;
    display:inline-block;
    border: 1px solid #B8BCBF;
    margin-left:10px;
    margin-right:3px;
}
span.unreadLarge{
    background-image: url(<%=GetImageURL("file-unread.gif")%>);
    background-repeat:no-repeat;
    background-position:7px 2px; 
}
span.unreadSmall{
    background-image: url(<%=GetImageURL("file-small-unread.gif")%>);
    background-repeat:no-repeat;
    background-position:10px 10px;   
}
div.baseLinks div.unreadPost img
{
    padding: 3px 5px 2px 5px;
}

div.baseLinks span
{
    display:inline-block;
    margin-bottom:5px;
}

.postLegendBox img{
    margin:3px 0px 1px 0px;
    padding-bottom:2px;
}
.post a.postReply,.post a.postQuote{
    float:right;
    color:#FFF;
    font-size:13px;
    display:block;
    background-color:#1A4D86;
    text-decoration:none;
    border-top:#B3B5B2 1px solid;
    border-left:#B3B5B2 1px solid;
    border-bottom:#000 1px solid;
    border-right:#000 1px solid;
    padding:5px 10px 5px 25px;
    font-weight:bold;
}
a.postReply{
    background-image: url(<%=GetImageURL("reply-button-arrow.gif")%>);
    background-repeat:no-repeat;
    background-position:3px 3px; 
}
a.postQuote{
    background-image: url(<%=GetImageURL("quote-button-icon.gif")%>);
    background-repeat:no-repeat;
    background-position:3px 5px; 
}

.postAuthor, .participationAuthor
{
    float:left;
    width:140px;
    text-align:center;
    margin-top:10px;
    margin-bottom:5px;
}

.postAuthor span, .participationAuthor span
{
    display:block;
    margin:5px 0px;
}

.postAuthor span.userRoles, .participationAuthor span.userRoles
{
    color:#7A7A7A;
}

.postAuthor .authorImg, .participationAuthor .authorImg
{
    width:100px;
}

.postNav
{
    margin:5px 5px 5px 155px;
    overflow:hidden;
}

.postContent{
    padding:0px 5px 0px 5px;
    margin-bottom:5px;
}

.postContent span.quote{
   padding:0px 10px 0px 10px; 
}
.postContent .contentDeleted{
    font-style:italic;
}

/* HACK to clear floated elements in a post*/
.postContent:after {  
     content: ".";  
     visibility: hidden;  
     display: block;  
     clear: both;  
     height: 0;  
     font-size: 0;
}  

.post, div.commentContainer
{
    margin:5px 5px 5px 155px;
    border: 1px solid #B5B5B5;
    background-color:#FFF;
}

.post, div.postListContainer, .postWordCount
{
    margin:10px 10px 10px 155px;
}
.postWordCount{
    text-align:center;
    font-size:0.95em;
}
.postWordCount span.wordCount{
    font-weight:bold;
}
div.postListContainer img{
    margin-right:5px;
    margin-bottom:-3px;
}
.post, div.postListContainer a{
    font-size:0.95em;
} 
.post img.imgBubble{
    margin-left:-17px;
    margin-top:2px;
    float:left;
}
.postData{
    padding:5px;
}
img.commentBubble{
    margin-left:40px;
    margin-bottom:-2px;
}
.postTitleDate{
    margin-bottom:5px;
    padding-left:5px;
}
.postTitleDate img{
    float:left;
    padding-right:5px;
}
.navHeader{
    background-color:#CFCFCF;
    border:1px solid #BBB;
    overflow:hidden;
}
.navHeader .span.navSubTitle{
    color:#535353;
    font-size:0.8em;
}
.navHeader span.navTitle{
    color:#000;
    display:block;
    font-weight:bold;
    font-size:14px;
    margin-top:5px;
}
.navHeader img{
    float:left;
    padding:5px;
}
div.previousItem, div.nextItem{
    float:left;
    margin-right:10px;
    height:39px;
    border-right:1px solid #A7A7A7;
    border-bottom:1px solid #A7A7A7;
    border-top:1px solid #FFF;
    border-left:1px solid #FFF;
    padding:0px 3px 0px 3px;
}

div.previousItem img,
div.nextItem img
{
    display:block;
    padding:15px 6px 15px 7px;
}

div.nextItem
{
    float:right;
    margin-right:0px;
}

div.viewOptions
{
    float:right;
    margin-right:0px;
    width:150px;
}

div.viewOptions a
{
    display:inline-block;
    padding:13px 13px 15px 13px;
    text-decoration:none;
}

div.pagingContainer
{
    background-color:#BABABA;
    padding:4px;
}

div.pagingRight
{
    float:right;
}

div.pagingLeft
{
    float:left;
}

div.pagingCenter
{
    text-align:center;
}

.discussionReplies
{
    border:1px solid #B3B3B3;
}

.discussionReplies th
{
    font-weight:normal;
    font-size:0.95em;
    padding:4px;
    background-color:#DFDFDF;
}

.discussionReplies td
{
    height:18px;
    vertical-align:middle;
}

.discussionReplies td div
{
    overflow:hidden;
    width:100%;
    clear:both;
}

.discussionReplies td span
{
    padding-left:5px;
}

.discussionReplies a
{
    padding:2px 0px 3px 5px;
    float:left;
    display:block;
}

.discussionReplies img
{
    float:left;
    padding-top:3px;
    padding-left:3px;
}

.highLightedPost
{
    color:#FFF;
    background-color:#1A4D86;

}
.discussionReplies .highLightedPost a
{
    color:#FFF;
    text-decoration:none;
    font-weight:bold;
}

.discussionReplies span.indentBlock
{
    display:block;
    float:left;
    width:18px;
    height:20px;
    border-right:2px dashed #B9B9B9;
    background-color:#EEE;
    padding:0px;
}

.discussionReplies .alternatePost span.indentBlock
{
    background-color:#DCDCDC;
}

span.indentBlock img
{
    padding-left:3px;
    padding-top:0px;
}

span.origPostHeader
{
    display:inline-block;
    padding-top:15px;
    padding-left:5px;
    font-weight:bold;
}

a.addAPost
{
    display:inline-block;
    border-left:1px solid #CFDCE5;
    border-top:1px solid #CFDCE5;
    border-right:1px solid #000;
    border-bottom:1px solid #000;
    background-color:#1B4C86;
    text-decoration:none;
    font-weight:bold;
    color:#FFF;
    height:20px;
    padding:5px 5px 0px 5px;
}

a.addAPost span{
    color:#FFF;
}
span.topicCat{
    color:#636363;
    size:0.95em;
}
div.topicMeta{
    margin:10px 0px;
}
div.topicMetaAssignment{
    border-top: 2px dashed #ccc;
    border-bottom: 2px dashed #ccc;
    margin:10px 0px;
    padding-top: 10px;
    padding-bottom: 10px;
}
div.assignmentItem{
    padding-bottom: 10px;
}
div.topicTitle{
    font-size:1.7em;
    margin-bottom:7px;
}
div.topicDescription{
    font-size:0.95em;
    margin-bottom:20px;
}
span.optionTitle{
    display:block;
    color:#7E7E7E;
    font-size:0.95em;
    margin-bottom:3px;
}
div.topicActions{
    float:left;
    margin-bottom:10px;
    width:100%;
    min-width:740px;
}
div.topicNavigation{
    float:right;
}
div.topicNavigation a{
    padding:8px 15px;
    background-color:#EFEFEF;
    width: auto;
    float:left;
    height:auto;
    text-decoration:underline;
}
div.topicNavigation a.inactive, div.topicNavigation a.inactive span{
    text-decoration:none;
    color:#7E7E7E;
    cursor: default;
}
div.topicOptions ul li, div.topicNavigation ul li{
    display:inline;
}
div.topicOptions ul li{
    display:inline-block;
    margin-right:10px;
    float:left;
}
div.topicOptions a.buttonAnchor{
    float:none;
    height:20px;
    padding-top:10px;
    font-weight:bold;
}
div.topicOptions a.addAPost{
    padding-top:8px;
    height:23px;
}
a.editTopic{
    display:inline-block;
    padding:7px;
    height:15px;
    border:1px solid #F4D400;
}
a.editTopic img{
    margin-bottom:-2px;
}
div.privateTopic{
    border:1px solid #B3B3B3;
    background-color:#EFEFEF;
    margin-bottom:10px;
}

div.privateTopic span{
    background-color:#E2E2E2;
    display:block;
    font-weight:bold;
    font-size:1.1em;
    padding:5px;
}

div.privateTopic div{
    padding:10px;
}

a.addPostHeader, img.imgHeader
{
    float:right;
}

a.addPostFooter
{
    float:left;
}
.modalPopup{
    background-color: #BABABA;
	filter: Alpha(Opacity=70);
	opacity: 0.7;
	-moz-opacity: 0.7;
	-khtml-opacity: 0.7;
}
.modalDiv{
    background-color:#FFF;
    padding:3px;
    border:none;
}
.modalHeading .modalHeadingImg{
    float:right;
    margin-left:10px;
    padding:0px;
}
.modalHeading{
    font-weight:bold;
    padding:3px;
    background-color:#E2E2E2;
}
.innerModal{
    border:1px solid #B2B2B2;
    background-color:#EFEFEF;
    max-width:400px;
}
.msgPerPage
{
    padding:10px;
}

.addCategory
{
    background-color:#FFF;
    padding:10px;
}

/*   Manage Category/Topic */
div.manageOuterContainer
{
    border:1px dashed #B5B7B6;
    margin:0px 8px;
}

div.navHeaderTopic{
    margin:3px 8px;
    padding-left:5px;
    padding-bottom:5px;
}

div.manageContainer
{
    background-color:#EEE;
    border:2px solid #1879BE;
    margin:2px;
}

div.actionButtons, div.modalButtons
{
    text-align:center;
    background-color:#BBCDDB;
    margin:5px;
    padding:5px;
}

#modalButtons {
    margin: 10px 5px;
    padding: 5px;
    text-align: center;
}

 div.actionButtons input
{
    margin-right:10px;
}

div.actionButtons .focusAction{
    font-weight:bold;
    margin-right:30px;
}

div.manageTitle
{
    background-color:#1879BE;
    padding:5px;
    text-align:center;
    font-weight:bold;
    color:#FFF;
}

div.manageNameDescrip
{
    background-color:#DCDCDC;
    padding:10px;
}

div.manageIcon
{
    float:left;
    padding-right:10px;
}

span.selTitleInfo
{
    margin-left:30px;
    margin-right: 5px;
}

div.manageName input
{
    width:350px;
}

div.manageName span
{
    display:block;
    margin-bottom:3px; 
}

span.selTitle
{
    font-weight:bold;
    font-size:1.1em;       
}

div.manageDescrip
{
    margin-top:10px;
}

div.manageDescrip.topic
{
    margin-left: 40px;
}

div.manageDescrip .label
{
    margin-bottom:5px;
}

div.manageDescrip span.catDescrip
{
    color:#707070;
    margin-bottom:3px;
}

.forumAdvanced div.manageDescrip .mceEditor .textEditorCounts
{
    margin-left: 35px;
}

div.manageArea{
    clear:both;
    border-top: 1px dashed #B5B7B6;
    margin:10px 10px 0px 10px;
    padding-top:10px;
}
div.manageAreaBottom{
    border-bottom:1px dashed #B5B7B6;
    padding-bottom: 10px;
}
div.manageArea span.selTitle{
    float:left;
}
div.manageSelection{
    margin-left:110px;
}
div.manageSelection div.feedbackMessage{
    text-align:center;
    margin:0px 0px 10px 0px;
}
div.manageSelection span.restrictInfo{
    display:block;
    margin-left:150px;
}
.manageSpacer{
    margin-top:15px;
}

/*  Date selector Styles*/
div.manageSelection div.dateRangeEdit{
    float:left;
    margin-bottom:30px;
    width:700px;
}
div.manageSelection div.dateRangeEdit label{
    width:auto;
    text-align:left;
}
div.manageSelection input.dateInput{
    width:80px;
}
div.manageSelection div.dateRangeEdit div.cal{
    display:block;
    margin-left:25px;
}
div.manageSelection div.dateRangeEdit div.start,div.manageSelection div.dateRangeEdit div.end{
    float:left;
    clear:none;
}

/*END  Date Selector Stytles*/
ul.connectedSortable {
    padding-top:2px; /* allows for dragging into empty list */
}
ul.connectedSortable .sortableHighlight{
    height:30px;
    background-color: #FFFFE4;
    border: 1px solid #FFCE08;
    margin:5px 0px;
}
div.manageArea div.principalSelector{
    width:75%;
    border:1px solid #B2B2B2;
    background-color:#E4E4E4;
    padding:5px;
    margin-left:5px;
    margin-top:10px;
}
div.dragHandle{
    background-color:#DEDEDE;
    background-image: url(<%=GetImageURL("drag-handle.gif")%>);
    width:17px;
    height:31px;
    cursor:move;
}
div.dragReorder{
    height:20px;
    border: 1px dashed #000;
    width:98%;
}
div.reorderList li, div.reorderList ul{
    margin:0px;
}
div.reorderList table{
    width:100%;
}
div.reorderList td.dragHandleTD{
    background-color:#DEDEDE;
    background-image: url(<%=GetImageURL("drag-handle-line.gif")%>);
    background-repeat:repeat-y;
    background-position:2px 0px;
    vertical-align:middle;
}
div.manageTopicAction{
    float:right;
    padding-top:8px;
}
div.manageTopicAction img{
    margin-left:1px;
}
div.reorderList div.catDisplayHeader{
    margin-top:0px;
    border-top:0;
    border-left:0;
    border-right:0;
}

div.reorderList .buttonAnchor a{
    width:130px;
    font-weight:bold;
    padding-top:10px;
    height:29px;
}
div.exitEdit{
    float:right;
    margin-right:10px;
    font-weight:bold;
}
table.reorderTable td{
    background-color:#FFF;
}
table.reorderTable td.topicLink{
    text-align:left;
    padding:6px;
    border-left:0;
}

table.reorderTableContainer{
    margin-bottom:20px;
    width:100%;
}
table.reorderTableContainer td
{
    border:1px solid #BABABA;
}
table.reorderTable td, .reorderList table.headerDataGrid td, .reorderList table.footerDataGrid td
{
    border-top:0;
    border-bottom:0;
    border-right:0;
}

table.headerDataGrid td.cellTopicHeader, .reorderList table.footerDataGrid td:first-child
{
    border-left:0;
}

td.tdCounters
{
    width:50px;
    padding:2px 8px 2px 2px;
    text-align:right;
}

div.addTopic, div.addCategory, div.topicOrdering
{
    background-color:#EFEFEF;
    padding:3px;
    text-align:center;
    border: 1px dashed #B2B2B2;
    margin:2px;
    font-weight:bold;
}
span.topicOrderTitle{
    font-weight:normal;
}
 div.addCategory
 {
    margin-bottom:15px;
 }

.reorderList table.headerDataGrid, .reorderList table.footerDataGrid
{
    width:100%;
}

div.allowAnonymous
{
    margin-bottom:20px;
    font-size:1.2em;
}

span.anonymousTitle
{
    display:block;
    font-weight:bold;
    font-size:1.2em;
    margin-bottom:3px;
    padding-left:3px;
}

/*  Manage Post/Reply */
.newPost{
    border:1px solid #BAB9BE;
}
.newPost .navTitle{
    margin-left:10px;
}
.managePostContainer .post{
    padding-right:0px;
}
.managePostContainer .manageTitle{
    margin-bottom:10px;
}
span.manageSubjectTitle{
    display:block;
    font-weight:bold;
    margin-bottom:3px;
}
span.itemTitle{
    display:block;
    margin-top:15px;
    margin-bottom:5px;
}
div.startSpecific, div.endSpecific{
    display:inline;
}
.moderationInfo{
    font-weight:bold;
}
div.maxBytes{
    margin-top:10px;
}
div.postPrivacy{
    margin-top:15px;
}
div.postPrivacy label
{
    margin-right:15px;
}
.quote
{
    font-weight:bold;
}
.post blockquote{
    margin:1px;
}
.quoteTxt
{
    background-image: url(<%=GetImageURL("quote-open.gif")%>); 
    background-repeat:no-repeat;
    background-position:0px 5px;
    margin:10px;
    padding:10px 25px;
    min-height:40px;
    border-top: 1px dashed #B2B2B2;
    border-bottom: 1px dashed #B2B2B2;
}

.quoteTxtEnd{
    background-image: url(<%=GetImageURL("quote-close.gif")%>); 
    background-repeat:no-repeat;
    background-position:99% 98%; 
}

div.editPostSection
{
    padding:5px;
    margin:5px 7px 7px 7px;
    font-size:0.9em;
}
div.editPostSection img{
    margin-bottom:-2px;
}
div.editPostSectionRegular
{
    border-color:#B2B2B2;
    background-color:#EFEFEF;
}

div.editPostSection a
{
    margin-right:7px;
    margin-left:2px;
}
div.editPostDisplay{
    margin:-6px -6px 0px 0px;
    padding:5px;
    float:right;
}
div.messageRestrict{
    text-align:center;
}
.restrictEdit{
    border-bottom:1px dashed #EAD80C;
    padding-bottom:5px;
    margin-bottom:3px;
}
div.postLink div.messageRestrict{
    padding:5px;
    float:left;
    margin-top:2px;
    margin-bottom:3px;
    font-size:0.85em;
}
div.commentContainer{
    background-color:transparent;
    border:0px;
    padding:0px;
    color:#565656;
}

div.comment{
    border-top: 1px dashed #B2B2B2;
    border-bottom: 1px dashed #B2B2B2;
    padding:5px 0px;
    margin:3px 0px;
}

div.commentBy{
    font-weight:bold;
}

div.commentInfo{
    text-align:center;
    font-size:0.9em;
    margin-top:3px;
}

div.commentEdit{
    background-color:#FFF;
    border:2px solid #1879BE;
}

div.commentEdit textarea{
    width:98%;
    margin:5px;
}

div.viewReplyOption {
    font-size: 0.95em;
    padding: 5px 21px 5px 14px;
    width: 275px;
}

div.replyOption{
    margin-top:8px;
    clear:both;
}
div.replyOption  input[type="checkbox"]{
    float:left;
    margin-bottom:15px;
}
div.viewReplyOption span{
    font-weight:bold;
    display:block; 
    margin:3px 0px;
}
div.viewReplySort{
    float:right;
    margin-right:5px;
}

/*  Subscription */
div.subscribeContainer{
    padding:10px;
}

span.subTitle{
    font-weight:bold;
    font-size:1.0em;
}
div.subSection{
    padding:5px 3px 5px 25px;
    /*width:400px;*/
    clear:both;
}
div.subSection input{
    display:block;
    float:left;
    margin-left:-15px;
}
div.subSectionHigher{
     border-bottom:1px dashed #B3B3B3;
     margin-bottom:10px;
     padding-bottom:10px;
}
div.subscribeOverride{
    margin-top:5px;
    font-size:0.85em;
    color:#6F6F6F;
}
div.subscribeOverride img{ margin-top:3px;}

span.metaLabel{
    color:#535353;
    font-weight:bold;
}
span.noEmailAddress{
    font-style:italic;
}

div.additionalImages, div.postEdits,div.uploadedFileContainer{
    padding:0px 5px;
    margin-bottom:5px;
}

div.additionalImages span.metaLabel, div.uploadedFileContainer span.metaLabel {
    display:block;
    margin:10px 0px 5px 0px;
}
div.additionalImages img, div.uploadedFileContainer img {
    margin-right:5px;
}

div.postEdits{
    margin-top:10px;
    font-size:0.95em;
}

.forumAdvanced .hidden{
    filter:alpha(opacity=60);
    -moz-opacity:0.6;
    -khtml-opacity: 0.6;
    opacity: 0.6;
    display: table-cell;
}
div.hiddenContainer{
    border:0px;
}
.hiddenContainer fieldset{
    padding:10px;
    border:2px solid #B3B3B3;
}
.hiddenContainer fieldset legend{
    font-weight:bold;
    font-size:1.2em;
    padding:0px 10px 0px 10px;
}

.hiddenInfo{
    margin-bottom:10px;
    font-size:0.95em;
    font-weight:bold;
}
.tooltip{
    position:absolute;
    z-index:999;
    left:-9999px;
    background-color:#FFF;
    padding:5px;
    border:1px solid #000;
    width:250px;
}
.tooltip p{
    margin:0;
    color:#000;
    font-weight:bold;
    background-color:#DDD;
    padding:5px 7px 5px 35px;  
    border:1px solid #888;
    background-image: url(<%=GetImageURL("x-icon.gif")%>);
    background-repeat: no-repeat;
    background-position:10px 13px;
}
.userListContainer{
    margin:10px 0px;
}
.userListContainer table.dataGrid td a{
    text-decoration: underline;
}
tr.userListNonMember td{
    font-style:italic;
}
table.dataGrid td.noOverall{
    padding-right:22px;
}

/* User Participation */
div.participationWedge{
    margin-right:5px;
    padding-left:25px;
    text-indent:-8px;
}
div.participationWedge span{
    font-weight:bold;
    display:inline-block;
    padding-right:5px;
}
div.userParticipationContainer td.cellTopic a.cellTopicLink{
    text-decoration:none;
    color:#000;
}
div.userParticipationContainer td.cellTopic a.expandTopic:hover{
    cursor:pointer;
}
a.expandTopic img{
    margin-right:5px;
}
div.userParticipationContainer{
    margin:10px;
}
div.userParticipationContainer a,div.userParticipationContainer table.dataGrid td a{
    text-decoration:underline;
}

div.userParticipationContainer table{
    margin-top:15px;
}

div.userParticipationContainer table tr.participationTopic{
    background-color:#DFDFDF;
    font-size:1.1em;
}
div.userParticipationContainer table tr.participationPost{
    font-size:0.95em;
}
tr.participationTopic td.noExpand{
    padding-left:20px;
}

div.userParticipationContainer  .headerDataGrid, div.userParticipationContainer  .footerDataGrid{
    background-color:#CFCFCF;
}
 div.userParticipationContainer  .footerDataGrid{
    font-weight:bold;
 }
div.userParticipationContainer  .headerDataGrid .cellTopicHeader{
    font-weight:bold;
}

div.participationHeader{
    text-align:center;
    font-weight:bold;
    font-size:1.1em;
}
img.participationHeaderImg{
    float:none;
    padding:0px;
}

.participationAuthor{
    padding:10px;
    float:left;
    width:250px;
    text-align:left;
    margin:0px;
}

.participationAuthor .authorImg{
    float:left;
    margin-right:10px;
}

div.participationOverview{
    width:100%;
    float:left;
    background-color:#EFEFEF;
    border: 1px solid #BABABA;
}

div.participationStats{
    padding:10px;
    border-left: 1px solid #BABABA;
    text-align:center;
    margin-left:275px;
    min-height:150px;
}
div.participationStats ul{
    width:500px;
    display:block;
}
div.participationStats li{
    display:inline;
    margin-left:45px;
    text-align:center;
    float:left;
}
div.participationStats li span{
    font-weight:bold;
    display:block;
    margin-bottom:5px;
}

div.timeSpentInfo{
    padding:5px;
    margin:50px 0px 15px 25px;
    text-align:left;
}

div.userParticipationContainer div.previousItem a,
div.userParticipationContainer div.nextItem a{
    display:block;
    padding:10px 6px 15px 7px;
    font-weight:normal;
    font-size:1em;
}
div.userParticipationContainer div.previousItem a{
    background-image: url(<%=GetImageURL("wedge-left.gif")%>);
    background-repeat: no-repeat;
    background-position:5px 15px;
    padding-left:15px;
}
div.userParticipationContainer div.nextItem a{
    background-image: url(<%=GetImageURL("wedge-right.gif")%>);
    background-repeat: no-repeat;
    background-position:75px 15px;
    padding-right:15px;
}

/*Post List*/
div.postListAction{
    float:right;
}
div.postListAction div{
    float:left;
}
div.postListBtn{
    float:left;
    border-left:1px solid #BABABA;
    padding:5px;
}
.postListBtnActive{
    background-color:#838486;    
}
div.postsPerPage{
    border-left:1px solid #BABABA;
    padding:10px 10px 5px 10px;
    min-height:25px;
}
/* Sorting */
.divider{
    margin:0px 3px 0px 3px;
}
img.sortDirImg{
    margin-left:2px;
    margin-top:-3px;
    text-decoration:none;
}
a.sortLink, a:link.sortLink, a:visited.sortLink{
    color:#000;
}
a.sortLinkActive{
    font-weight:bold;
}

th.sortColumn{
    text-align:left;
    background-color:#CECECE;
}
td.sortColumn{
    background-color:#EBEBEB;
}
tr.altDataGrid td.sortColumn{
    background-color:#DCDCDC;
}
th div.latestPostOrReply{
    float:right;
    display:inline;
}

/*Search*/
div.search{
    background-color:#6286BA;
    padding:5px;
}
div.search input[type="submit"]{
    font-weight:bold;
    margin-left:10px;
}
div.searchOptions{
   background-color:#D8E0ED;
}
div.searchOptions .manageArea{
    border-color:#6185B9;
}
div.searchOptions .selTitle{
    font-size:0.85em;
}
div.searchOptions .manageAreaBottom{
    margin-bottom:5px;
    border-bottom:0px;
}
div.searchOptions .manageAreaTop{
    margin-top:0px;
    border-top:0px;
}
div.searchError{
    display:inline;
    font-style:italic;
    color:#FFF;
    font-weight:bold;
}
span.highlight{
   font-weight:bold;
   display:inline-block;
   background-color:#BDCDDA;
   padding:1px;
}
div.searchAction{
    padding:2px 0px 2px 10px;
    font-size:0.8em;
    margin-bottom:3px;
    color:#1850AD;
    border-top:1px solid #BAC9E0;
    border-bottom:1px solid #BAC9E0;
}
div.searchAction a{
    text-decoration:underline;
}
div.clearSearch{padding-top:2px;}
div.clearSearch a{ color:#FFF;font-weight:bold; font-size:0.85em;}
div.clearSearch img{margin-bottom:-4px;}

/* My Subscriptions */
div.mySubscriptions{
    margin:10px 0px 20px 0px;
    font-weight:bold;
}
div.mySubscriptionExit{
    float:right;
    margin-top:-5px;
}
div.mySubscriptionExit img{
    margin-bottom:-5px;
}

div.viewMySub{
    padding:10px 0px 0px 20px;
}
div.viewMySub img{
    margin-bottom:-5px;
}

/* Graded Forum Styles */

.forumAdvanced div.forumAssignmentSummaryControlValid a, 
.forumAdvanced div.forumAssignmentSummaryControlValid a:link, 
.forumAdvanced div.forumAssignmentSummaryControlValid a:visited
{
    color:#666666;
    
}
.forumAdvanced .forumAssignmentSummaryControlValidIcon
{
    padding-top:1px; 
    float:left; 
    margin-right:7px;
}
.forumAdvanced .forumAssignmentSummaryControlValid span
{
    color:#666666;
}

.forumAdvanced .postRow .gradedTopicUserPostTotals .initPostText,
.forumAdvanced .postRow .gradedTopicUserPostTotals .replyText,
.partialText {
    display: inline-block;
    padding-left: 20px;
    min-height: 15px;
}

/* No Requirement */
.forumAdvanced .postRow .gradedTopicUserPostTotals.noInitPostRequirement .initPostText,
.forumAdvanced .postRow .gradedTopicUserPostTotals.noReplyRequirement .replyText,
.noRequirementIcon {
    padding-left: 0px;
}

/* Meets (or Exceeds) Requirement */
.forumAdvanced .postRow .gradedTopicUserPostTotals.meetsInitPostRequirement .initPostText,
.forumAdvanced .postRow .gradedTopicUserPostTotals.meetsReplyRequirement .replyText,
.exceedsIcon {
	background: transparent url(<%= this.GetImageURL("16/tick.png")%>) no-repeat 0px 0px;
}

/* Partially Meets Requirement */
.forumAdvanced .postRow .gradedTopicUserPostTotals.doesNotMeetInitPostRequirement .initPostText,
.forumAdvanced .postRow .gradedTopicUserPostTotals.doesNotMeetReplyRequirement .replyText,
.partialIcon {
	background: transparent url(<%= this.GetImageURL("score-partial.png")%>) no-repeat 0px 0px;
}

/* None Entered */
.forumAdvanced .postRow .gradedTopicUserPostTotals.noInitPostMade .initPostText,
.forumAdvanced .postRow .gradedTopicUserPostTotals.noReplyMade .replyText,
.noneEnteredIcon {
	background: transparent url(<%= this.GetImageURL("16/cross.png")%>) no-repeat 0px 0px;
}

table.studentAssignmentThreadViewPostContainer{
    margin-left: 10px;
    margin-bottom: 10px;
}

td.studentAssignmentThreadViewPostFirst{
    border-left: 1px solid #ccc;
    border-top: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    padding: 5px;
    background-color: #ebebeb;
}

td.studentAssignmentThreadViewPost{
    border-left: 1px solid #ccc;
    border-top: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    padding: 5px;
}

td.studentAssignmentThreadViewPostLast{
    border-left: 1px solid #ccc;
    border-right: 1px solid #ccc;
    border-top: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    padding: 5px;
    background-color: #E5EEFE;
    background: transparent url(<%= this.GetImageURL("format-forum.png")%>) no-repeat 5px 6px;
    display: inline-block;
    padding-left: 28px;
    min-height: 15px;
}


div.facultyPost{
    width: 552px;
    margin-left: 8px;
    margin-bottom: 8px;
}
div.facultyPostLeftBox{
    width: 100px;
}
div.facultyGradeInput{
    display:none;
    width: 100px;
    white-space: nowrap;
}
div.facultyPostRightBox{
    width: 450px;
    float: right;
    border: solid 1px gray;
}
div.facultyPostRightBoxLayerOne{
    height: 23px;
}
div.facultyPostRightBoxLayerOneExpand{
    height: 23px;
    border-bottom: 1px dashed #B3B3B3;
}
div.facultyPostRightBoxLayerOneExpandErr{
    height: 23px;
    border-bottom: 1px dashed #B3B3B3;
}
div.facultyPostRightBoxLayerOneLeft{
    padding: 5px;
    float: left;
}
div.facultyPostRightBoxLayerOneRight{
    
}

div.facultyPostRightBoxLayerTwo{
    padding: 10px 5px 10px 5px;
    display: none;
}
div.facultyPostRightBoxLayerThree{
    display: none;
}

.forumAdvanced  .forumAssignmentSummaryControlValid
{
    padding:4px;  
    background: #EFEFEF;
    vertical-align: middle; 
    color:#ccc;
    min-height:15px;
}

.forumAdvanced  .forumAssignmentSummaryControlValidMsgBox{
    padding-left: 22px;
}

div.facultyValidationStatus{
    float:left;
    border-right: solid 1px gray;
    padding: 5px 5px 5px 20px;
    display:block;
    background: transparent url(<%= this.GetImageURL("16/circle-slash-16.png")%>) no-repeat 3px 4px;
}
div.facultyAssignmentPostExpand
{
    float:right; 
    height:15px;   
    border-left:1px solid gray; 
    border-bottom:1px solid gray;
    padding:4px 12px;
    background: #EFEFEF url(<%= this.GetImageURL("toggle-expand.png")%>) 6px 6px no-repeat;
}
div.facultyAssignmentPostRetract
{
    background: #EFEFEF url(<%= this.GetImageURL("toggle-collapse.png")%>) 6px 6px no-repeat;
}
div.facultyAssignmentPostExpand, div.facultyAssignmentPostRetractErr:hover
{
    cursor:pointer;
}
div.facultyAssignmentPostRetractErr{
    float:right; 
    height:15px;   
    border-left:1px solid gray; 
    border-bottom:1px solid gray;
    padding:4px 12px;
    background: #EFEFEF url(<%= this.GetImageURL("toggle-collapse.png")%>) 6px 6px no-repeat;
}

div.facultyGradeDisplay{
    border-top: 1px solid gray;
    border-left: 1px solid gray;
    border-bottom: 1px solid gray;
    /*width: 88px;*/
    padding-top: 5px;
    padding-left: 25px;
    line-height: 1.3em;
    height: 19px;
    height: 18px\9;
}
.facultyNoGrade{
    background: #EEF4FF url(<%= this.GetImageURL("score-notscored.png")%>) 6px 4px no-repeat;
}
.facultyNoGradeLate{
    background: #FFF899 url(<%= this.GetImageURL("16/calculator_error.png")%>) 6px 4px no-repeat;
}
.facultyGaveGrade{
    background: #EEF4FF url(<%= this.GetImageURL("16/tick.png")%>) 6px 4px no-repeat;
}
.facultyManageTopicTitle{
    font-weight: bold;
    margin-bottom: 3px;
    display:inline-block;
}
.facultyManageTopicLink{
    margin-top: 3px;
    font-style: italic;
    display:inline-block;
}
.facultyManageTopicContent{
    padding-left: 50px;
    background: transparent url(<%= this.GetImageURL("32/tick.png")%>) 6px 4px no-repeat;
}

.forumAdvanced .mce-wordcount{
    display: none;
}