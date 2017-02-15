<%@ Page Language="C#"  ContentType="text/css" EnableViewState="false"   AutoEventWireup="true" CodeBehind="CourseEvalIntPortletStyle.aspx.cs" Inherits="Jenzabar.ICS.Web.Portlets.CourseEvalIntegrationPortlet.Style.CourseEvalIntPortletStyle" %>
<%@ OutputCache Duration="60" VaryByParam="none" %>

.courseEvalIntPortlet h4.textOnly {
    margin: 1em 0px 5px 0px;
    padding: 0px;
}

.courseEvalIntPortlet a[disabled=disabled]
{
    color: black;
}

/*** SITE SETTINGS SCREEN ***/

.courseEvalIntPortlet.siteSettingsScreen {
    max-width: 800px;
}

.courseEvalIntPortlet.siteSettingsScreen .screenHeader {
    display: block;
    font-size: 120%;
    font-weight: bold;
    padding-bottom: 5px;
}
    
.courseEvalIntPortlet.siteSettingsScreen .introText {
    display: block;
    padding-bottom: 20px;
}

.courseEvalIntPortlet.siteSettingsScreen .moreInfo {
    width: 250px;
    float: right;
    font-size: 100%;
}

.courseEvalIntPortlet.siteSettingsScreen .moreInfo .textHeader {
    font-weight: bold;
    display: block;
}
    
.courseEvalIntPortlet.siteSettingsScreen .dataEntry {
    padding: 0px 10px 30px 10px;
}

.courseEvalIntPortlet.siteSettingsScreen .dataEntry .connectUrl.labelRow {
    padding-top: 0px;
}

.courseEvalIntPortlet.siteSettingsScreen .dataEntry .labelRow 
{
    padding-top: 20px;
}
    
.courseEvalIntPortlet.siteSettingsScreen .dataEntry .noteRow {
    color: #999999;
}
    
.courseEvalIntPortlet.siteSettingsScreen .dataEntry .surveyList.entryRow {
    padding-left: 20px;
    padding-bottom: 5px;
}

.courseEvalIntPortlet.siteSettingsScreen .dataEntry .labelRow,
.courseEvalIntPortlet.siteSettingsScreen .dataEntry .entryRow
{
    padding-bottom: 0px;
    margin-bottom: 2px;
}

.courseEvalIntPortlet.siteSettingsScreen .dataEntry .entryRow input {
    margin-top: 0px;
    margin-bottom: 0px;
}

.courseEvalIntPortlet.siteSettingsScreen .dataEntry .fileLocation.entryRow input,
.courseEvalIntPortlet.siteSettingsScreen .dataEntry .connectUrl.entryRow input {
    width: 500px;
}

.courseEvalIntPortlet.siteSettingsScreen .dataEntry .encryptSecret.entryRow input {
    width: 250px;
}

.courseEvalIntPortlet.siteSettingsScreen .dataEntry .surveyList.labelRow {
    padding-bottom: 10px;
}


/*** SURVEY LIST SCREEN ***/

.courseEvalIntPortlet .surveyListScreen {
    max-width: 600px;
}

.courseEvalIntPortlet .surveyListScreen hr {
    border: 0;
    border-bottom: 1px dashed #cccccc;
}

.courseEvalIntPortlet .surveyListScreen .adminPanel>hr {
    margin: 20px 0px;
}

.courseEvalIntPortlet .surveyListScreen .viewCreateLink {
    font-size: 120%;
    display: block;
    margin-top: 10px;
    margin-bottom: 20px;
}

.courseEvalIntPortlet .surveyListScreen .generateFiles {
    display: block;
    padding-bottom: 10px;
    font-size: 120%;
}

.courseEvalIntPortlet .surveyListScreen .transferFiles {
    max-width: 400px;
    padding: 5px 10px 0px 50px;
    margin-top: 20px;
    background-image: url(<%= GetIconImageUrl("32/package.png") %>);
    background-repeat: no-repeat;
    background-position: 10px 10px;
}

.courseEvalIntPortlet .surveyListScreen .transferFiles.hint {
    font-size: 100%;
}

.courseEvalIntPortlet .surveyListScreen .surveyPanel .introText {
    display: block;
    margin-bottom: 15px;
}

.courseEvalIntPortlet .surveyListScreen .surveyPanel .logoutWarning {
    margin-bottom: 5px;
}

.courseEvalIntPortlet .surveyListScreen .noSurveysMessage {
    display: block;
    font-style: italic;
    padding: 10px 0px;
}

.courseEvalIntPortlet .surveyListScreen .screenFooter {
    height: 20px;
}
