<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GeneralAssignmentInfoForm.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.GeneralAssignmentInfoForm" %>
<%@ Import Namespace="Jenzabar.LMS.Coursework" %>
<%@ Register Assembly="Jenzabar.Portal.Framework.Web" TagPrefix="JICS" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" %>
<%@ Register Assembly="Jenzabar.Common" TagPrefix="JICS" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register Assembly="AjaxControlToolkit" TagPrefix="asp" Namespace="AjaxControlToolkit" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" TagPrefix="asp" Namespace="System.Web.UI" %>
<%@ Register TagPrefix="CWK" TagName="AddOrganizationalUnitPopup" Src="AddOrganizationalUnitPopup.ascx" %>
<%@ Register TagPrefix="CWK" TagName="AddOrganizationalTypePopup" Src="AddOrganizationalTypePopup.ascx" %>
<%@ Register TagPrefix="CWK" TagName="ChangeFormat" Src="ChangeAssignmentFormat.ascx" %>
<%@ Register TagPrefix="LMS" TagName="Modal" Src="../../../Common/Controls/Modal.ascx" %>

<script type="text/javascript" language="javascript">
    var TestIsValid = true;    
    $(document).ready(function() 
    {
        //Don't implement past Due Date yet:
        /*var dueDateIframeID = $("iframe[id$='_dpDueDateif']").attr('id');
        var today = new Date("<%=Today %>");
        var origDate = new Date($("input[id$='dpDueDate_d']").val());
        ProcessPastDueDate(origDate, today);
        document.getElementById(dueDateIframeID).contentWindow.document.body.onclick =  function()
        {
            var changeDate = new Date($("input[id$='dpDueDate_d']").val());
            if(changeDate != origDate)
            {
                var date = new Date($("input[id$='dpDueDate_d']").val());
                ProcessPastDueDate(date, today);
            }
            origDate = new Date($("input[id$='dpDueDate_d']").val());
        }*/
        if(!TestIsValid){
            DisableNowRadio();
        }
    });

    function ProcessPastDueDate(dueDate, today){
        if(dueDate < today)
        {
            DisableOpenDiv();
        }
        else
        {
            ResetOpenDiv();
        }
    }

    function DisableOpenDiv(){
        $("#<%= rdbOpenNow.ClientID %>").attr('checked', true);
        openNow_Click();
        $('#divOpen :input').attr('disabled', true); 
    }
    function DisableNowRadio(){
        $("#<%= rdbOpenNow.ClientID %>").attr('disabled', true);
        $("#<%= rdbOpenNow.ClientID %>").attr('checked', false);
    }

    function ResetOpenDiv(){
        $('#divOpen :input').removeAttr('disabled');
        if(!TestIsValid){
            DisableNowRadio();
        }
    }
    
    function openNow_Click() {
        $("#<%= rdbOpenOn.ClientID %>").attr('checked', false);
        $("#<%= rdbOpenLater.ClientID %>").attr('checked', false);
        $("#<%= chkDisplayBeforeOpen.ClientID %>").removeAttr("checked");
        $("#<%= divDisplayBeforeOpen.ClientID %>").css("visibility", "hidden");
    }

    function openLater_Click() {
        $("#<%= rdbOpenOn.ClientID %>").attr('checked', false);
        $("#<%= rdbOpenNow.ClientID %>").attr('checked', false);
        $("#<%= divDisplayBeforeOpen.ClientID %>").css("visibility", "visible");
    }

    function openOn_Click() {
        $("#<%= rdbOpenNow.ClientID %>").attr('checked', false);
        $("#<%= rdbOpenLater.ClientID %>").attr('checked', false);
        $("#<%= divDisplayBeforeOpen.ClientID %>").css("visibility", "visible");
    }

    var isUploadAssignment = ("<%=AssignmentFormat %>" == "<%=AssignmentFormat.Uploaded %>");

    function chkAcceptLateSubmissinClick() {
        var gradeMethod = $("#<%= ddlGradingType.ClientID %>").val();
        if ($("#<%= chkAcceptLateSubmission.ClientID %>").prop("checked") == true) {
            $("#<%= dpLateSubmissionDueDate.GetMinuteTextBoxClientID() %>").removeAttr('disabled');
            $("#<%= dpLateSubmissionDueDate.GetHourTextBoxClientID() %>").removeAttr('disabled');
            $("#<%= dpLateSubmissionDueDate.GetAmPmTextBoxClientID() %>").removeAttr('disabled');
            $("#<%= dpLateSubmissionDueDate.GetDateTextBoxClientID() %>").removeAttr('disabled');
            if(!(isUploadAssignment && gradeMethod == "Credit")){
                $("#<%= divPenalizeLateAssignments.ClientID %>").css("visibility", "visible");             
            }
        }
        else {
            $("#<%= dpLateSubmissionDueDate.GetMinuteTextBoxClientID() %>").attr("disabled", "disabled");
            $("#<%= dpLateSubmissionDueDate.GetHourTextBoxClientID() %>").attr("disabled", "disabled");
            $("#<%= dpLateSubmissionDueDate.GetAmPmTextBoxClientID() %>").attr("disabled", "disabled");
            $("#<%= dpLateSubmissionDueDate.GetDateTextBoxClientID() %>").attr("disabled", "disabled");
            $("#<%= divPenalizeLateAssignments.ClientID %>").css("visibility", "hidden");
            $("#<%= txtLateAssignmentPenaltyValue.ClientID %>").attr('value', '');
            $("#<%= chkPenalizeLateAssignment.ClientID %>").attr('checked', false);
            $("#<%= dpLateSubmissionDueDate.GetDateTextBoxClientID() %>").attr('value', '');
        }
    }

    function ddlGradingType_OnChange() {
        var gradeMethod = $("#<%= ddlGradingType.ClientID %>").val();
        var showGradeDDL = "#<%= ddlShowGrade.ClientID%>";
        var v = "<%=ShowGrade.NotApplicable.ToString() %>";
        var t = "<%=Globalizer.GetString("MSG_CWK_NOT_APPLICABLE") %>";
        if (gradeMethod == "NotGraded")
        {
            $("#<%= divGradingPoints.ClientID %>").hide();            
            $(showGradeDDL).append('<option value=' + v + '>' + t + '</option>');
            $(showGradeDDL).val(v);
            $(showGradeDDL).attr("disabled", "disabled");
        }
        else
        {
            $("#<%= divGradingPoints.ClientID %>").show();
            $(showGradeDDL).removeAttr('disabled');
            $("#<%=ddlShowGrade.ClientID %> option[value='" + v + "']").remove();
            if(isUploadAssignment && gradeMethod == "Credit"){
                $("#<%= chkPenalizeLateAssignment.ClientID %>").removeAttr("checked");
                $("#<%= divPenalizeLateAssignments.ClientID %>").css("visibility", "hidden");
            }
        }
        chkAcceptLateSubmissinClick();
    }

    var _forumCatTops =  <%=GetJSONForumCatTopics() %>;
    function BindTopicDDL() {
        var category = $('#' + '<%=_ddlCategory.ClientID %>');
        var topic = $('#' + '<%=_ddlTopic.ClientID %>');
        $('#' + '<%=_ddlTopic.ClientID %>' + ' >option').remove();
        $.each(_forumCatTops[category.val()], function() {
            topic.append($("<option />").val(this.id).text(this.name));});
    }
</script>
<asp:HiddenField ID="hiddenFieldID" runat="server" />
<div>
    <div>
        <div class="assignmentStepHeader">
            <table width="100%">
                <tr>
                    <td>
                        <asp:Label ID="lblStepOne" runat="server" />
                        <asp:Label ID="lblGeneralAssginmentOptions" runat="server" CssClass="headerText" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
<div class="notifyMsgBox" id="divValidationNotification" runat="server">
    <span class="notifyTitle"><asp:Label ID="lblNotReady" runat="server" /></span><p/>
    <asp:Label ID="lblNotReadyMsg" runat="server" />
</div>
<div class="generalAssignmentInfoFormatSelection">
    <table>
        <tr>
            <td valign="top">
                <div class="formatSelectionImage">
                    <img id="imgFormat" runat="server" />
                </div>
            </td>
            <td>
                <div class="formatSelectionDescription">
                    <div class="formatSelectionFormatHeader">
                        <asp:Label ID="lblAssignmentFormat" runat="server" />
                    </div>
                    <asp:Label ID="lblFormatDescription" runat="server" />
                    <br />
                    <br />
                    <CWK:ChangeFormat ID="_ChangeFormat" runat="server" />
                </div>
            </td>
        </tr>
    </table>    
</div>
<table class="assignmentOptionsForm" cellspacing="10" width="100%">
    <tr>
        <td align="right" valign="top">
            <asp:Label ID="lblName" runat="server" />
        </td>
        <td>
            <asp:TextBox ID="txtName" runat="server" Width="350px" MaxLength="200" /> 
            <asp:Label ID="labErrName" runat="server" />
        </td>
        <td rowspan="2" valign="top">
            <div id="divImportExistingAssignment" runat="server" class="newAssignmentImportExistingAssignment" visible="false">
                <asp:Label ID="lblImportLinkHeader" runat="server" CssClass="headerText" />
                <br />
                <asp:Label ID="lblImportExistingAssignment" runat="server" />
            </div>
        </td>
    </tr>
    <tr>
        <td align="right" valign="top">
            <asp:Label ID="lblUnit" runat="server" />
        </td>
        <td valign="top">
            <asp:UpdatePanel ID="upAddUnit" runat="server">
                <ContentTemplate>
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td><asp:DropDownList ID="ddlUnit" runat="server" Width="275px" /></td>
                            <td nowrap>&nbsp;<asp:Image ID="imgAddUnit" runat="server" /></td>
                        </tr>
                    </table>
                    <LMS:Modal ID="_addUnitPopup" CssClass="orgUnitModal" TargetControlID="imgAddUnit" runat="server">
	                    <ContentArea>
		                    <cwk:AddOrganizationalUnitPopup ID="_addUnitPopupContents" HideHeader="true" HideButtons="true" AddCancelClientClick="false" runat="server" />
		                </ContentArea>
                    </LMS:Modal>
                    <asp:Label ID="labErrUnit" runat="server" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </td>
    </tr>
    <tr>
        <td align="right" valign="top">
            <asp:Label ID="lblType" runat="server" />
        </td>
        <td colspan="2">
            <asp:UpdatePanel ID="upAddType" runat="server">
                <ContentTemplate>
                    <asp:DropDownList ID="ddlRequiredType" runat="server" />
                    &nbsp;
                    <asp:DropDownList ID="ddlAssignmentType" runat="server" />
                    <asp:Image ID="imgAddType" runat="server" /> <asp:Label ID="_lblErrType" runat="server" />
                    <LMS:Modal ID="_addTypePopup" TargetControlID="imgAddType" runat="server">
		                <ContentArea>
			                <cwk:AddOrganizationalTypePopup ID="_addTypePopupContents" HideHeader="true" HideButtons="true" runat="server" />
		                </ContentArea>
	                </LMS:Modal>
                </ContentTemplate>
            </asp:UpdatePanel>
        </td>
    </tr>
    <tr>
        <td align="right" valign="top">
            <asp:Label ID="lblDueDate" runat="server" />
        </td>
        <td colspan="2">
            <JICS:DatePicker ID="dpDueDate" runat="server" /> <asp:Label ID="labErrDueDate" runat="server" />
                &nbsp;
            <asp:CheckBox ID="chkShowDueDateInCoureCalendar" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
        </td>
        <td colspan="2">
            <div id="divAcceptLateSubmission" runat="server">
                <asp:CheckBox ID="chkAcceptLateSubmission" runat="server" onclick="chkAcceptLateSubmissinClick()" />
                <asp:Label ID="lblAcceptLateSubmissionUntil" runat="server" />
                <JICS:DatePicker ID="dpLateSubmissionDueDate" runat="server" /> <asp:Label ID="labErrLateSubDate" runat="server" />
            </div>
        </td>
    </tr>
    <tr>
        <td>
        </td>
        <td colspan="2">
            <div id="divPenalizeLateAssignments" runat="server">
                <asp:CheckBox ID="chkPenalizeLateAssignment" runat="server" />
                <asp:Label ID="lblPenalizeLateAssignment" runat="server" />
                <asp:TextBox ID="txtLateAssignmentPenaltyValue" runat="server" Width="50px" /> <asp:Label ID="labErrLatePenalty" runat="server" />
                &nbsp;
                <asp:DropDownList ID="ddlLateAssignmentPenaltyUnit" runat="server" Width="100px" />
                &nbsp;
                <asp:DropDownList ID="ddlLateAssignmentPenaltyRate" runat="server" Width="200px" />
            </div>
        </td>
    </tr>
    <tr>
        <td align="right" valign="top">
            <asp:Label ID="lblOpen" runat="server" />
        </td>
        <td colspan="2" id="divOpen">
            <asp:RadioButton ID="rdbOpenNow" runat="server" onclick="openNow_Click()" />
            <asp:Label ID="lblOpenNow" runat="server" />
            <asp:Label ID="lblOpenOnDescription" runat="server" CssClass="descriptiveText" />
            <br />
            <asp:RadioButton ID="rdbOpenLater" runat="server" onclick="openLater_Click()" />
            <asp:Label ID="lblOpenLater" runat="server" />
            <asp:Label ID="lblOpenLaterDescription" runat="server" CssClass="descriptiveText" />
            <br />
            <asp:RadioButton ID="rdbOpenOn" runat="server" onclick="openOn_Click()" />
            <asp:Label ID="lblOpenOn" runat="server" />
            <JICS:DatePicker ID="dpOpenOn" runat="server" /> <asp:Label ID="labErrOpenOnDate" runat="server" />
        </td>
    </tr>
    <tr>
        <td></td>
        <td colspan="2">
            <div id="divDisplayBeforeOpen" runat="server">
                <asp:CheckBox ID="chkDisplayBeforeOpen" runat="server" />
                &nbsp;
                <asp:Label ID="lblDisplayBeforeOpen" runat="server" />
            </div>
        </td>
    </tr>
    <tr>
        <td align="right" valign="top">
            <asp:Label ID="lblGrading" runat="server" />
        </td>
        <td colspan="2">            
                    <asp:DropDownList ID="ddlGradingType" runat="server" Height="21px" Width="150px" onchange='ddlGradingType_OnChange()' />
                    &nbsp;

                    <span id="divGradingPoints" runat="server" style="display: inline-block;">
                        <asp:Label ID="lblOutOf" runat="server" />
                        &nbsp;
                        <asp:TextBox ID="txtPoints" runat="server" Width="50px" />
                        &nbsp;
                        <asp:Label ID="lblPoints" runat="server" /> <asp:Label ID="labErrGradePoints" runat="server" />
                    </span>
        </td>
    </tr>
    <tr>
        <td align="right" valign="top">
            <asp:Label ID="lblShowGrade" runat="server" />
        </td>
        <td colspan="2">
            <asp:DropDownList ID="ddlShowGrade" runat="server" Height="20px" Width="450px"/>
        </td>
    </tr>
    <tr id="_trTopic" runat="server">
       <td colspan="3">
           <div>
               <asp:Literal ID="_litForumInfo" runat="server"></asp:Literal>
           </div>
           <div class="forumSelector">
               <div >
                   <asp:Label runat="server" ID="_lblCategory"></asp:Label>
                    <asp:DropDownList runat="server" ID="_ddlCategory" onchange="BindTopicDDL();"></asp:DropDownList>
               </div>
               <div>
                    <asp:Label runat="server" ID="_lblTopic"></asp:Label>
                    <asp:DropDownList runat="server" ID="_ddlTopic" AutoPostBack="true"></asp:DropDownList>
                    <asp:Label runat="server" ID="_lblTopicErr"></asp:Label>
               </div>
           </div>
       </td>
    </tr>
</table>