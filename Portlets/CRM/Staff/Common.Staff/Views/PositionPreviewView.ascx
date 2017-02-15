<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PositionPreviewView.ascx.cs" Inherits="Common.Staff.PositionPreviewView" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Import Namespace="Jenzabar.CRM" %>
<%@ Import Namespace="Jenzabar.CRM.Staff.Common" %>
<%@ Import Namespace="Jenzabar.EX.Common" %>

<%-- Javascript --%>
<script type="text/javascript">
<%# UtilityFunctions.GetMailtoScript() %>
</script>

<div class="StaffCommon PositionPreview">

<%-- Administrator Header --%>
<div id="divAdminHeader" runat="server" class="SCBackgroundGreen SCOverflowHidden">
    <div class="SCMarginAllTen SCOverflowHidden">
        <ul>
            <li class="SCFloatLeft">
                <asp:Label runat="server" Text="<%# Position.Title %>" CssClass="SCHeader1Text SCMarginRightTen" />
                #<asp:Label runat="server" Text="<%# Position.ID %>" CssClass="SCLightText" />
            </li>
            <li class="SCFloatRight">
                <jenzabar:GlobalizedLinkButton ID="lbBack" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_BACK_JOB" OnClick="lbBack_Click" />
            </li>
        </ul>
        <p class="SCClearBoth SCMarginTopTen">
            <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PP_PREVIEW_INFO" />
        </p>
    </div>
</div>

<div class="SCPage">

<%-- Right Column --%>
<div class="PPMainRight">
    <div class="SCBackgroundBlue SCBorderTopBottomBlue SCPaddingAllTen SCMarginBottomTen">
        <jenzabar:GlobalizedLinkButton id="glnkApplyNow" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PP_APPLY_NOW" CssClass="SCHeader2Text" CommandName="Guid" CommandArgument="<%# Position.FormGUID.ToString() %>" OnCommand="glnkApplyNow_Command" />
        <jenzabar:GlobalizedLabel ID="glblYouApplied" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PP_YOU_APPLIED" visible="false" CssClass="SCItalicText" /><br />
        <jenzabar:GlobalizedLabel id="glblSeeBelow" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PP_SEE_BELOW" visible="false" CssClass="SCItalicText" />
    </div>
    <ul class="SCMarginLeftTen">
        <%-- Job Type --%>
        <li class="SCMarginBottomTen">
            <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_JOB_TYPE" CssClass="SCLightText" /><br />
            <asp:Label runat="server" Text="<%# Position.WorkType %>" /> 
        </li>
        <%-- Location --%>
        <li class="SCMarginBottomTen">
            <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_LOCATION" CssClass="SCLightText" /><br />
            <asp:Label runat="server" Text="<%# Position.Location %>" /> 
        </li>
        <%-- Department --%>
        <li class="SCMarginBottomTen">
            <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_DEPARTMENT" CssClass="SCLightText" /><br />
            <asp:Label runat="server" Text="<%# Position.Department %>" /> 
        </li>
        <%-- Salary --%>
        <li class="SCMarginBottomTen">
            <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_SALARY" CssClass="SCLightText" /><br />
            <asp:Label ID="lblSalary" runat="server" /> 
        </li>
        <%-- Required Competencies --%>
        <li id="liRequired" runat="server" class="SCMarginBottomTen">
            <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_REQUIRED" CssClass="SCLightText" />
            <div id="dRequired" runat="server"></div>
        </li>
        <%-- Desired Competencies --%>
        <li id="liDesired" runat="server" class="SCMarginBottomTen">
            <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_DESIRED" CssClass="SCLightText" />
            <div id="dDesired" runat="server"></div>
        </li>
    </ul>
    <div id="EmailUsArea" class="SCBackgroundLightGray SCBorderTopBottomGray SCPaddingAllTen SCMarginBottomTen"
        runat="server">
        <table>
            <tr>
                <td colspan="2">
                    <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PP_HAVE_QUESTION"
                        CssClass="SCLabelText" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:ImageButton ID="EmailUsButton" OnClick="EmailUs_Click" runat="server" />
                </td>
                <td>
                    <jenzabar:GlobalizedLinkButton ID="EmailUsLink" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_EMAIL_US"
                        CssClass="SCHeader3Text" OnClick="EmailUs_Click" />
                </td>
            </tr>
        </table>        
    </div>
    <div id="divBackSearch01" runat="server">
        <p><jenzabar:GlobalizedLinkButton runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_BACK_JOB" OnClick="lbBackSearch_Click" /></p>
    </div>
</div>

<%-- Left Column --%>
<div class="PPMainLeft">
    <%-- Position Header --%>
    <p>
        <asp:Label runat="server" Text="<%# Position.Title %>" CssClass="SCHeader1Text" />        
    </p>
    <p id="pPostedOn" runat="server">
        <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PP_POSTED_ON" CssClass="SCLightText" />
        <asp:Label runat="server" Text="<%# Position.PostingDate.ToShortDateString() %>" CssClass="SCLightText" /> 
    </p>
    <p id="pAcceptingUntil" runat="server">
        <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PP_ACCEPTING_UNTIL" CssClass="SCLightText" />
        <asp:Label runat="server" Text="<%# Position.ClosingDate.ToShortDateString() %>" CssClass="SCLightText" />
    </p>
    <p id="pAccepting" runat="server" visible="false">
        <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PP_ACCEPTING" CssClass="SCLightText" />
    </p>
    <%-- About Position --%>
    <p runat="server" class="SCMarginTopTwenty" visible='<%# Position.ExternalDesc != "" %>'>
        <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PP_ABOUT_POSITION" CssClass="SCLightText" />
        <asp:Label runat="server" Text="<%# Position.ExternalDesc %>" CssClass="SCLabelText" />
    </p>
    <%-- About Candidate --%>
    <p runat="server" class="SCMarginTopTwenty" visible='<%# Position.ExternalApplDesc != "" %>'>
        <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PP_ABOUT_CANDIDATE" CssClass="SCLightText" />
        <asp:Label runat="server" Text="<%# Position.ExternalApplDesc %>" CssClass="SCLabelText" />
    </p>
    <%-- About Us --%>
    <table id="tAboutUs" runat="server" class="SCMarginTopTwenty">
        <tr>
            <td>
                <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PP_ABOUT_US"
                    CssClass="SCLightText" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Literal ID="litAboutUs" runat="server" />
            </td>
        </tr>
    </table>

    <%-- Apply for the xxxxxx position --%>
    <div class="SCBackgroundBlue SCBorderTopBottomBlue SCPaddingAllTen SCMarginBottomTen SCMarginTopTen">
        <jenzabar:GlobalizedLinkButton id="glnkApplyFor" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PP_APPLY_NOW" CssClass="SCHeader2Text" CommandName="Guid" CommandArgument="<%# Position.FormGUID.ToString() %>" OnCommand="glnkApplyNow_Command" />
        <jenzabar:GlobalizedLabel ID="glblYouAppliedOn" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PP_YOU_APPLIED_ON" visible="false" /><br />
        <jenzabar:GlobalizedLabel ID="glblYourApplicationIs" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PP_YOUR_APPLICATION_IS" visible="false" />
    </div>
    <table>
        <tr>
            <td><a id="aViewSub" runat="server" visible="false" /></td>
            <td class="SCPaddingLeftSeventy"><jenzabar:GlobalizedLinkButton id="glnkWithdrawApplication" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PP_WITHDRAW_YOUR_APPLICATION" CommandName="PosAppSeq" CommandArgument="<%# Position.FormGUID.ToString() %>" OnCommand="glnkWithdraw_Command" visible="false" /></td>
        </tr>
    </table>
    <%-- Ask us a question --%>
    <table class="SCMarginTopTwenty">
        <tr>
            <td>
                <asp:ImageButton ID="AskUsButton" OnClick="EmailUs_Click" runat="server" />
            </td>
            <td>
                <jenzabar:GlobalizedLinkButton runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_ASK_QUESTION"
                    OnClick="EmailUs_Click" />
            </td>
            <td>
                <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_ABOUT_LISTING"
                    CssClass="SCLabelText" />
            </td>
        </tr>
    </table>    
    <div id="divBackSearch02" runat="server" style="margin-top:10px;">
        <p><jenzabar:GlobalizedLinkButton runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_BACK_JOB" OnClick="lbBackSearch_Click" /></p>
    </div>    
</div>
    
</div>

</div>