<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SurveyListView.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.CourseEvalIntegrationPortlet.Views.SurveyListView" %>
<%@ Register TagPrefix="common" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="common" Namespace="Jenzabar.Common.Web.UI.Controls.TemplateFields" Assembly="Jenzabar.Common" %>
<%@ Import Namespace="Jenzabar.ICS.CourseEvaluation.Dtos" %>

<script type="text/javascript">

    $(function () {
        $('#<%= SurveyHeaderCELink.ClientID %>').click(function () {
            openCoursEvalMainScreen($('#<%= SurveyHeaderCELink.ClientID %>').get(0));
        });

        $(window).focus(function () {
            if (_causeRefreshOnReload) {
                _causeRefreshOnReload = false;
                window.setTimeout(function () { location.reload(); }, 500);
            }
        });
    });

    var _jicsCoursEvalConnectorWindow;
    var _lastClickedLinkControl;
    var _causeRefreshOnReload = false;

    function openCoursEvalMainScreen(linkControl) {
        var webServiceRoot = 'portlets/ics/courseevalintegrationportlet/services/externalurlservice.asmx/';

        BlockUI();
        _lastClickedLinkControl = linkControl;

        ajaxUtil.callSynchronousAsmxWebService(webServiceRoot + 'GetMainCoursEvalUrlAndClearCache', {}, goToCoursEvalUrl, showCoursEvalErrorMessage);
    }

    function openCoursEvalSurvey(linkControl, surveyId) {
        if (!surveyId) return;

        var webServiceRoot = 'portlets/ics/courseevalintegrationportlet/services/externalurlservice.asmx/';

        BlockUI();
        _lastClickedLinkControl = linkControl;

        ajaxUtil.callSynchronousAsmxWebService(webServiceRoot + 'GetCoursEvalSurveyUrlAndClearCache', { surveyId: surveyId }, goToCoursEvalUrl, showCoursEvalErrorMessage);
    }

    function goToCoursEvalUrl(dataContainer) {
        UnblockUI();

        var url = dataContainer.d;
        if (!url) {
            console.log('The "ExternalUrlService" Web Service call did not return a URL.');
            alert('<%= GetConnectionErrorMessage() %>');
            return;
        }

        _lastClickedLinkControl.href = url;
        _causeRefreshOnReload = true;
    }

    function showCoursEvalErrorMessage(err) {
        UnblockUI();

        try {
            var response = JSON.parse(err.responseText);
            console.log(response.Message);
        } catch (e) { /* do nothing; just a parsing issue we can ignore */ }

        alert('<%= GetConnectionErrorMessage() %>');
    }

    function BlockUI() {
        $.blockUI({ message: $('#divBlock'), css: { border: 'none', background: 'transparent' }, overlayCSS: { backgroundColor: '#000', opacity: 0.3 } });
        return true;
    }

    function UnblockUI() {
        $.unblockUI();
    }

</script>

<div class="surveyListScreen">
    
<div id="AdminPanel" class="adminPanel pSection" runat="server">
    <h4 class="textOnly"><common:GlobalizedLabel TextKey="MSG_CEINT_COURSEEVALADMIN_HEADER" runat="server" /></h4>
    <common:EmbeddedHyperLink ID="AdminHeaderCELink" OuterTextKey="MSG_FORMAT_CEINT_COURSEEVALADMIN_INTRO" TextKey="MSG_CEINT_MYCOURSEEVAL"
            CssClass="introText" Enabled="False" runat="server" />

    <div id="TransferFilePanel" class="transferFiles hint" runat="server">
        <div class="generateFiles">
            <common:EmbeddedLinkButton ID="GenerateFilesButton"
                    OuterTextKey="MSG_FORMAT_CEINT_TRANSFERFILES_BUTTON" TextKey="MSG_CEINT_TRANSFERFILES_BUTTON_LINK"
                    CssClass="generateFilesButton" runat="server" />
	        <asp:DropDownList ID="TermSelector" runat="server" />
        </div>
        <common:EmbeddedHyperLink ID="TransferCELink"
                OuterTextKey="MSG_FORMAT_CEINT_TRANSFERFILES_TEXT" TextKey="MSG_FORMAT_CEINT_TRANSFERFILES_TEXT_LINK"
                Enabled="False" runat="server" />
    </div>

    <hr />
</div>

<div id="SurveyListPanel" class="surveyPanel pSection" runat="server">
    <h4 class="textOnly"><common:GlobalizedLabel TextKey="MSG_CEINT_COURSEEVALLIST_HEADER" runat="server" /></h4>

    <div class="oops logoutWarning"><common:GlobalizedLabel TextKey="MSG_CEINT_COURSEVAL_LOGOUT_WARNING" runat="server" /></div>

    <common:EmbeddedHyperLink ID="SurveyHeaderCELink"
            OuterTextKey="MSG_FORMAT_CEINT_COURSEEVALLIST_INTRO" TextKey="MSG_CEINT_MYCOURSEEVAL"
            NavigateUrl="javascript:" Target="_coursEval" CssClass="introText" runat="server" />

    <common:StyledGridView ID="SurveyListDisplay" CssClass="surveyList" runat="server">
        <Columns>
            <common:GlobalizedTemplateField HeaderTextKey="HDR_COURSE">
                <ItemTemplate>
                    <a href="javascript:" onclick="openCoursEvalSurvey(this, '<%# ((CourseEvalSurveyDto)Container.DataItem).SurveyId %>');" target="_coursEval">
                        <%# ((CourseEvalSurveyDto)Container.DataItem).CourseName %>
                    </a>
                </ItemTemplate>
            </common:GlobalizedTemplateField>
            <common:GlobalizedTemplateField HeaderTextKey="HDR_FACULTY">
                <ItemTemplate>
                    <%# ((CourseEvalSurveyDto)Container.DataItem).FacultyName %>
                </ItemTemplate>
            </common:GlobalizedTemplateField>
        </Columns>
    </common:StyledGridView>

    <common:GlobalizedLabel ID="NoSurveysMessage" TextKey="MSG_CEINT_NO_SURVEYS" Visible="False" CssClass="noSurveysMessage" runat="server" />
</div>
    
<div id="divBlock" style="display:none;"><img src="<%= GetAJAXImageUrl() %>" alt="Please Wait" /></div>

<div class="screenFooter"></div>
</div>
