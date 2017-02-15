<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DynamicSQLInstrux.ascx.cs" Inherits="Jenzabar.Portal.Framework.Web.PortletModules.FormBuilder.Controls.DynamicSQLInstrux" %>
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
            "Dependency" is a feature that allows questions whose options are populated by SQL to use the user's response to a previous question as a variable in the SQL "SELECT" statement. If this feature is used, when the user responds to the original question, the dependent question will be populated with options based on their selection. For example, if you provide a dropdown menu of states for the question "In which state did you go to high school?", you could follow that question up with "If available, please select your high school from this list" and provide a dropdown menu of high schools in your system that are located in the state selected by the user (In this case, you would probably also want a "Enter your High School if it isn't available in the list" question as well, of course).<br /><br /> 
            Using this feature is quite simple, provided you already have an understanding of using SQL to populate question options from your database. When entering the dynamic SQL SELECT statement for your dependent question, just add a variable that corresponds to the original question to the SQL "WHERE" clause. This variable should be in the format: {S#Q#} with the "#" replaced by the section and question number (respectively) of the question to which you want to refer. Using the example above, and assuming the "High School State" question is the tenth (10th) question in Section 1 of your form, your "Select High School" question might have SQL that looks something like this: SELECT id, name FROM tbl_HighSchools WHERE stateId = '{S1Q10}'<br /><br />
            The application will automatically identify questions that use this variable, and will only populate their options once the user has made a selection in the original question, and will identify the dependent question as needing a response to the other question to minimize end-user confusion.<br /><br />
            One important note about using this feature is that the original question (the one on which the dependent question depends) MUST be either a Dropdown Menu question, or a Multiple Choice, Single Selection (i.e. Radio Button) question. The applications needs the original to have a single answer and a clear indication of the user having made a selection to properly reload the dependent question with the relevant options. Because of this, Text-based or multiple-selection questions will not work.<br /><br />
        </Content>
    </ajax:AccordionPane>
    <ajax:AccordionPane
        runat="server" ID="ap2"
        HeaderCssClass="accordionHeader"
        HeaderSelectedCssClass="accordionHeaderSelected"
        ContentCssClass="accordionContent">
        <Header><a><%=Globalizer.GetGlobalizedString("TXT_FRM_DYNAMIC_INTRO_TOKEN_USERID")%> &nbsp; <span class="accordionLink"><%=Globalizer.GetGlobalizedString("TXT_CLICK_HERE_TO_READ_MORE")%></span></a></Header>
        <Content>
            You can use the user's ID in the SQL that populates the options for this question. The token <%=SqlTokenUserID%> will be replaced by the current user's ID when the SQL is run, allowing you to return options specific to that user.<br /><br />
            In cases where the current user may be different than the subject of the form (For example, an advisor filling out a registration agreement on behalf of an advisee) the <%=SqlTokenUserID%> token will correspond to the subject's ID (in this example, the student's ID). If you are creating a form that will be filled out by this type of user and you want to use the administrator's ID (in this example, the Advisor's ID) in the SQL, you can use <%=SqlTokenAdminID %>. These two tokens will behave the same where the logged in user is also the subject of the form, which is the most common situation.<br /><br />
            NB: SQL using a user ID will never return any results for a guest user, so it should only be used in forms where you know your users will be logged in to their portal account.
        </Content>
    </ajax:AccordionPane>
    <ajax:AccordionPane
        runat="server" ID="ap3" 
        HeaderCssClass="accordionHeader" 
        HeaderSelectedCssClass="accordionHeaderSelected" 
        ContentCssClass="accordionContent">
        <Header><a><%=Globalizer.GetGlobalizedString("TXT_FRM_DYNAMIC_INTRO_TOKENS_WARNING")%> &nbsp; <span class="accordionLink"><%=Globalizer.GetGlobalizedString("TXT_CLICK_HERE_TO_READ_MORE")%></span></a></Header>
        <Content>
            When you populate a question via SQL it creates the possibility that a user will not see any options when they view the form. This is primarily a concern when a question is populated dynamically using the user's ID or previous questions' responses, but occasionally also may be caused due to network issues. In any of these cases, if the question is required, rather than stopping the user from being able to submit the form (due to the required question that they can't answer), we will ignore the requirement for that user's submission. Because your ERP database mapping may be based on data from that question, we will also ignore the mapping for that question (and any others in its row) and submit it unmapped. These changes only apply to that specific user's submission, and will not affect form behavior for other users who do have options available from the SQL.
        </Content>
    </ajax:AccordionPane>
</Panes>
</ajax:Accordion>