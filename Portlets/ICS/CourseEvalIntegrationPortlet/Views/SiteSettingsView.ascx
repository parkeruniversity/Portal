<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SiteSettingsView.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.CourseEvalIntegrationPortlet.Views.SiteSettingsView" %>
<%@ Import Namespace="Jenzabar.ICS.Web.Portlets.CourseEvalIntegrationPortlet" %>
<%@ Register TagPrefix="common" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<link href="<%= ResolveUrl(CourseEvalIntegrationPortlet.CSS_FILE_LOCATION) %>" rel="stylesheet" type="text/css" />
<div class="<%= CourseEvalIntegrationPortlet.CSS_CLASS %> siteSettingsScreen pSection">

<h4 class="textOnly"><common:GlobalizedLabel TextKey="MSG_CEINT_SITESETTINGS_HEADER" runat="server" /></h4>
<common:GlobalizedLabel TextKey="MSG_CEINT_SITESETTINGS_INTRO" CssClass="introText" runat="server" />

<div class="moreInfo hint">
    <common:GlobalizedLabel TextKey="MSG_CEINT_ONEMORESTEP_HEADER" CssClass="textHeader" runat="server" />
    <common:GlobalizedLabel TextKey="MSG_CEINT_ONEMORESTEP_TEXT" runat="server" />
</div>

<ul class="dataEntry">
    <li class="connectUrl labelRow"><common:GlobalizedLabel TextKey="MSG_CEINT_COURSEVALURL_LABEL" runat="server" /></li>
    <li class="connectUrl entryRow"><asp:TextBox ID="CoursEvalUrlEntry" runat="server" /></li>
    <li class="connectUrl noteRow"><common:GlobalizedLabel TextKey="MSG_CEINT_COURSEVALURL_NOTE" runat="server" /></li>

    <li class="encryptSecret labelRow"><common:GlobalizedLabel TextKey="MSG_CEINT_ENCRYPTIONSECRET_LABEL" runat="server" /></li>
    <li class="encryptSecret entryRow"><asp:TextBox ID="EncryptionSecretEntry" runat="server" /></li>
    <li class="encryptSecret noteRow"><common:GlobalizedLabel TextKey="MSG_CEINT_ENCRYPTIONSECRET_NOTE" runat="server" /></li>

    <li class="surveyList labelRow"><common:GlobalizedLabel TextKey="MSG_CEINT_ENABLESURVEYLIST_TEXT" runat="server" /></li>
    <li class="surveyList entryRow">
        <asp:RadioButton ID="ShowSurveysEntry" GroupName="EnableSurveyList" runat="server" />
        <common:GlobalizedLabel TextKey="MSG_CEINT_ENABLESURVEYLIST_ON_LABEL" runat="server" />
    </li>
    <li class="surveyList entryRow">
        <asp:RadioButton ID="HideSurveysEntry" GroupName="EnableSurveyList" runat="server" />
        <common:GlobalizedLabel TextKey="MSG_CEINT_ENABLESURVEYLIST_OFF_LABEL" runat="server" />
    </li>

    <li class="fileLocation labelRow"><common:GlobalizedLabel TextKey="MSG_CEINT_TRANSFERFILELOCATION_LABEL" runat="server" /></li>
    <li class="fileLocation entryRow"><asp:TextBox ID="TransferFileLocationEntry" runat="server" /></li>
    <li class="fileLocation noteRow"><common:GlobalizedLabel TextKey="MSG_CEINT_TRANSFERFILELOCATION_NOTE" runat="server" /></li>
</ul>

<div class="buttonBar">
    <common:GlobalizedButton ID="SaveButton" TextKey="TXT_SAVE_CHANGES" runat="server"/>
    <common:GlobalizedButton ID="CancelButton" TextKey="TXT_CANCEL" runat="server" />
</div>

<div class="footer"></div>

</div>
