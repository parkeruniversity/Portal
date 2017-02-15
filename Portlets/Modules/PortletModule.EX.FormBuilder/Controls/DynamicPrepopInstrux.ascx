<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DynamicPrepopInstrux.ascx.cs" Inherits="Jenzabar.CRM.Common.Web.PortletModule.EX.FormBuilder.Controls.DynamicPrepopInstrux" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<ajax:Accordion
ID="MyAccordion"
runat="Server"
SelectedIndex="-1"
HeaderCssClass="accordionHeader"
HeaderSelectedCssClass="accordionHeaderSelected"
ContentCssClass="accordionContent"
AutoSize="None"
FadeTransitions="false"
TransitionDuration="250"
FramesPerSecond="40"
RequireOpenedPane="false"
SuppressHeaderPostbacks="true">
<Panes>
    <ajax:AccordionPane
        runat="server" ID="ap1"
        HeaderCssClass="accordionHeader"
        HeaderSelectedCssClass="accordionHeaderSelected"
        ContentCssClass="accordionContent">
        <Header><a><%=Globalizer.GetGlobalizedString("TXT_FRM_DYNAMIC_INTRO_PART_THREE")%> &nbsp; <span class="accordionLink"><%=Globalizer.GetGlobalizedString("TXT_CLICK_HERE_TO_READ_MORE")%></span></a></Header>
        <Content>
            You can use the user's answer to a previous question in the SQL that prepopulates an answer for this question.
            <p/>
            When entering the dynamic SQL SELECT statement to prepopulate an answer for this  question, just add a variable that corresponds to the original question to the SQL "WHERE" clause. This variable should be in the format: {S#Q#} with the "#" replaced by the section and question number (respectively) of the question to which you want to refer. (Remember, if you add or move questions on your form, you may need to update these references if the location of your parent question has changed)
            <p/>
            One important note about using this feature is that the original question (the one on which the dependent question depends) MUST be either a Dropdown Menu question, or a Multiple Choice, Single Selection (i.e. Radio Button) question. The applications needs the original to have a single answer and a clear indication of the user having made a selection to properly reload the dependent question with the relevant options. Because of this, Text-based or multiple-selection questions will not work.
            <p/>
            If the user gets to this question before they have answered the parent question, they will not have an answer prepopulated but will be able to select an answer manually like with any other question.
            <p/>
            NB: Due to a technical limitation, if you are prepopulating a multiple choice (checkbox) question, only the FIRST result returned in your SQL will be preselected for the user, even if there are further matches in the result set.
            <p />
        </Content>
    </ajax:AccordionPane>
    <ajax:AccordionPane
        runat="server" ID="ap2"
        HeaderCssClass="accordionHeader"
        HeaderSelectedCssClass="accordionHeaderSelected"
        ContentCssClass="accordionContent">
        <Header><a><%=Globalizer.GetGlobalizedString("TXT_FRM_DYNAMIC_INTRO_TOKEN_USERID")%> &nbsp; <span class="accordionLink"><%=Globalizer.GetGlobalizedString("TXT_CLICK_HERE_TO_READ_MORE")%></span></a></Header>
        <Content>
            You can use the user's ID in the SQL that prepopulates a response for this question. The token {UserID} will be replaced by the current user's ID when the SQL is run, allowing you to return an answer specific to that user.
            <p/>
            In cases where the current user may be different than the subject of the form (For example, an advisor filling out a registration agreement on behalf of an advisee) the {UserID} token will correspond to the subject's ID (in this example, the student's ID). If you are creating a form that will be filled out by this type of user and you want to use the administrator's ID (in this example, the Advisor's ID) in the SQL, you can use {AdminID}. These two tokens will behave the same where the logged in user is also the subject of the form, which is the most common situation.
            <p/>
            NB: Due to a technical limitation, if you are prepopulating a multiple choice (checkbox) question, only the FIRST result returned in your SQL will be preselected for the user, even if there are further matches in the result set. 
            <p/>
        </Content>
    </ajax:AccordionPane>
</Panes>
</ajax:Accordion>