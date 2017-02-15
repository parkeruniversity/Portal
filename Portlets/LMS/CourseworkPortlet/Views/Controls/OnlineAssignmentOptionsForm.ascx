<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OnlineAssignmentOptionsForm.ascx.cs"
    Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.OnlineAssignmentOptionsForm" %>
<%@ Register TagPrefix="JICS" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<script type="text/javascript" language="javascript">
    function ddlStudentsCanViewTest_onchange(targetVal, stuViewDDL, showStuAnsDDL) {
        svDDL = "#" + stuViewDDL;
        ssaDDL = "#" + showStuAnsDDL;
        if ($(svDDL).val() == targetVal) {
            $(ssaDDL).val(targetVal);
            $(ssaDDL).attr("disabled", "disabled");
            $("#<%= dpTurnOffTestReview.GetMinuteTextBoxClientID() %>").attr("disabled", "disabled");
            $("#<%= dpTurnOffTestReview.GetHourTextBoxClientID() %>").attr("disabled", "disabled");
            $("#<%= dpTurnOffTestReview.GetAmPmTextBoxClientID() %>").attr("disabled", "disabled");
            $("#<%= dpTurnOffTestReview.GetDateTextBoxClientID() %>").attr("disabled", "disabled");
        } else {
            $(ssaDDL).removeAttr('disabled');
            $("#<%= dpTurnOffTestReview.GetMinuteTextBoxClientID() %>").removeAttr('disabled');
            $("#<%= dpTurnOffTestReview.GetHourTextBoxClientID() %>").removeAttr('disabled');
            $("#<%= dpTurnOffTestReview.GetAmPmTextBoxClientID() %>").removeAttr('disabled');
            $("#<%= dpTurnOffTestReview.GetDateTextBoxClientID() %>").removeAttr('disabled');
        }
    }
</script>

<!-- Step Two Header -->
<div id="divOnlineAssignmentOptionsHeader" onclick="toggleHeader(this,'divOnlineAssignmentOptions','<%=ShowText%>','<%=HideText%>','<%=ShowImgUrl %>','<%=HideImgUrl %>');"
    class="assignmentStepHeader expandable">
    <img class="rightArrow" src='<%=ShowImgUrl %>' />
    <img src='<%=ShowImgUrl %>' />
    <%=ShowText %>    
</div>

<!-- Assignment Options -->
<div id="divOnlineAssignmentOptions" class="pSection" style="display: none;">
    <table class="assignmentOptionsForm" cellspacing="10" width="100%">
        <tr>
            <td rowspan="3" valign="top" align="right">
                <asp:Label ID="lblTestReview" runat="server" />
            </td>
            <td>
                <asp:Label ID="lblStudentsCanViewTest" runat="server" />
                <asp:DropDownList ID="ddlStudentsCanViewTest" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblShowStudentsCorrectAnswers" runat="server" />
                <asp:DropDownList ID="ddlShowStudentsCorrectAnswers" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblTurnOfTestReview" runat="server" />
                <JICS:DatePicker ID="dpTurnOffTestReview" runat="server" /> <asp:Label ID="labErrTurnOffTestReview" runat="server" />
            </td>
        </tr>
        <tr>
            <td valign="top" align="right" width="100">
                <asp:Label ID="lblTimeLimit" runat="server" />
            </td>
            <td>
                <asp:TextBox ID="txtTimeLimit" MaxLength="3" runat="server" /> <asp:Label ID="labErrTimeLimit" runat="server" />
                <asp:DropDownList ID="ddlTimeLimitUnits" runat="server" />
                <asp:Label ID="lblLeaveBlankForNoTimeLimit" runat="server" CssClass="descriptiveText" />
            </td>
        </tr>
        <tr>
            <td valign="top" align="right">
                <asp:Label ID="lblPagination" runat="server" />
            </td>
            <td>
                <asp:DropDownList ID="ddlPagination" runat="server" />
            </td>
        </tr>
        <tr>
            <td valign="top" align="right">
                <asp:Label ID="lblSectionOrder" runat="server" />
            </td>
            <td>
                <asp:CheckBox ID="chkShuffleSections" runat="server" />
                <asp:Label ID="lblShuffleSections" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td valign="top" align="right">
                <asp:Label ID="lblLockOut" runat="server" />
            </td>
            <td>
                <asp:CheckBox ID="cbLockOut" runat="server" />
                <div>
                    <asp:Label ID="lblLockOutInstrux" runat="server" CssClass="descriptiveText" />
                </div>
            </td>
        </tr>
        <tr>
            <td valign="top" align="right">
                <asp:Label ID="lblExtraCredit" runat="server" />
            </td>
            <td>
                <asp:CheckBox ID="cbExtraCredit" runat="server" />
                <div>
                    <asp:Label ID="lblExtraCreditInstrux" runat="server" CssClass="descriptiveText" />
                </div>
            </td>
        </tr>
        <tr>
            <td valign="top" align="right">
                <asp:Label ID="lblSecurity" runat="server" />
            </td>
            <td>
                <asp:Label ID="lblPassword" runat="server" />
                <asp:TextBox ID="txtPassword" runat="server" MaxLength="50" /> <asp:Label ID="labErrPassword" runat="server" />
                &nbsp;
                <asp:Label ID="lblPasswordDescription" runat="server" CssClass="descriptiveText"></asp:Label>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:CheckBox id="cbRequireSecureBrowserForTaking" runat="server" />
                <div><asp:Label ID="lblSecureBrowserDesc" runat="server" CssClass="descriptiveText"></asp:Label></div>
                <br />
                <asp:CheckBox id="cbRequireSecureBrowserForReviewing" runat="server" />
            </td>
        </tr>
        <tr>
            <td valign="top" align="right">
                <asp:Label ID="lblRetakes" runat="server" />
            </td>
            <td>
                <asp:Label ID="lblLetStudentsRetakeThisTest" runat="server"></asp:Label>
                <asp:DropDownList ID="ddlNumberOfRetakesAllowed" runat="server">
                </asp:DropDownList>
                <asp:Label ID="lblTimesAfterFirstAttempt" runat="server"></asp:Label>
                <br />
                <br />
                <asp:Label ID="lblRetakesDescription" runat="server" CssClass="descriptiveText" />
                <br />
                <br />
                <asp:Label ID="lblRetakeWaitingPeriod" runat="server" />
                <asp:TextBox ID="txtRetakeWaitingPeriod" MaxLength="3" runat="server" /> <asp:Label ID="labErrRetakeWaitingPeriod" runat="server" />
                <asp:DropDownList ID="ddlRetakeWaitingPeriodUnits" runat="server">
                </asp:DropDownList>
                <br />
                <br />
                <asp:Label ID="lblRetakeWaitingPeriodDescription" runat="server" CssClass="descriptiveText"></asp:Label>
                <br />
                <br />
                <asp:CheckBox ID="chkDisplayAttempts" runat="server" />
                <asp:Label ID="lblDisplayAttempts" runat="server"></asp:Label>
                <br />
                <br />
                <asp:Label ID="lblDisplayAttemptsDescription" runat="server" CssClass="descriptiveText"></asp:Label>
                <br />
                <br />
                <asp:Label ID="lblFinalGrade" runat="server"></asp:Label>
                <asp:DropDownList ID="ddlFinalGrade" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
    </table>
</div>
