<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PositionEditListingView.ascx.cs" Inherits="Jenzabar.CRM.Staff.Web.Portlets.EmploymentManagementPortlet.PositionEditListingView" %>
<%@ Import Namespace="Jenzabar.CRM.Staff.Web.Portlets.EmploymentManagementPortlet" %>
<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="jics" tagname="TextEditor" src="~\UI\Controls\TextEditor.ascx" %>

<%-- Header --%>
<div class="EMBackgroundGreen EMOverflowHidden">
    <div class="EMMarginAllTen EMOverflowHidden">
        <ul>
            <li class="EMFloatLeft">
                <asp:Label runat="server" Text="<%# Position.Title %>" CssClass="EMHeader1Text EMMarginRightTen" />
                #<asp:Label runat="server" Text="<%# Position.ID %>" CssClass="EMLightText" />
            </li>
            <li class="EMFloatRight">
                <jenzabar:GlobalizedLinkButton ID="lbBack" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_BACK_JOB" OnClick="lbBack_Click" />
            </li>
        </ul>
    </div>
</div>

<div class="EMPage">

<%-- Position Listing --%>
<div class="EMOverflowHidden">
    <ul>
        <li class="EMFloatLeft"><asp:Image runat="server" ImageUrl='<%# Page.ResolveUrl(EMConstants.GetIconPaperText()) %>' /></li>
        <li class="EMFloatLeft">
            <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PEL_POSITION_LISTING" CssClass="EMHeader3Text EMBoldText" />            
            <br />
            <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PEL_POSITION_LISTING_INFO" CssClass="EMLightText" />
        </li>        
    </ul>
</div>

<%-- Position Details --%>
<div id="dPositionDetails" runat="server" class="EMBackgroundGray EMBorderTopBottomGray EMMarginTopFive EMClearLeft">
    <p class="EMMarginAllTen">
        <jenzabar:GlobalizedLinkButton ID="glbPositionDetails" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRF_R_LINK" OnClick="glbPositionDetails_Click" />
    <asp:Label ID="lblPositionDetails1" runat="server" />
    <asp:Label ID="lblPositionDetails2" runat="server" />
    <asp:Label ID="lblPositionDetails3" runat="server" />
    </p>
</div>

<%-- Position Details Expanded --%>
<div id="dPositionDetailsExpanded" runat="server" class="EMBackgroundGray EMBorderTopBottomGray EMMarginTopFive EMClearLeft" visible="false">
    <div id="dPositionDetailsExpandedText" runat="server" class="EMMarginAllTen EMOverflowHidden"></div>        
</div>

<%-- Application Period --%>
<div class="EMMarginTopTen">
    <p class="EMMarginBottomFive">
        <jenzabar:GlobalizedLabel Runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PEL_APPLICATION_PERIOD" CssClass="EMLightText" />
    </p>
    <div class="EMMarginLeftFive">
        <p class="EMMarginBottomTen">
            <jenzabar:GlobalizedLabel Runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PEL_INDICATE_WINDOW" />
        </p>
        <p class="EMMarginBottomTen">
            <asp:Label ID="lblStartDate" runat="server" CssClass="EMItalicText" />
        </p>
        <%-- Start Accepting --%>
        <div class="EMOverflowHidden EMMarginBottomTen">
            <ul>
                <li class="EMFloatLeft EMMarginRightTen" style="min-width:200px" >
                    <jenzabar:GlobalizedLiteral runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PEL_START_ACCEPTING" />
                </li>
                <li class="EMFloatLeft EMMarginRightTen">
                    <jenzabar:GlobalizedRadioButton ID="grbStartNow" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_NOW" GroupName="Start" TextAlign="Right" />
                </li>
                <li class="EMFloatLeft EMMarginRightTen">
                    <jenzabar:GlobalizedRadioButton ID="grbStartOn" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_ON_UPPER" GroupName="Start" TextAlign="Right" />
                </li>
                <li class="EMFloatLeft">
                    <jenzabar:datepicker ID="dpStartDte" runat="server" />
                </li>
            </ul>
        </div>
        <%-- Stop Accepting --%>
        <div class="EMOverflowHidden EMClearLeft EMMarginBottomTen">
            <ul>
                <li class="EMFloatLeft EMMarginRightTen" style="min-width:200px">
                    <jenzabar:GlobalizedLiteral runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PEL_STOP_ACCEPTING" />
                </li>
                <li class="EMFloatLeft EMMarginRightTen">
                    <jenzabar:GlobalizedRadioButton ID="grbStopNever" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_NEVER" GroupName="Stop" TextAlign="Right" />
                </li>
                <li class="EMFloatLeft EMMarginRightTen">
                    <jenzabar:GlobalizedRadioButton ID="grbStopOn" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_ON_UPPER" GroupName="Stop" TextAlign="Right" />
                </li>
                <li class="EMFloatLeft">
                    <jenzabar:datepicker ID="dpEndDte" runat="server" />
                </li>
            </ul>
        </div>
    </div>
</div>

<%-- Information For The Applicants --%>
<div class="EMClearLeft EMMarginTopTwenty">
    <p class="EMMarginBottomFive">
        <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PEL_INFORMATION_FOR_APPLICANTS" CssClass="EMLightText" />
    </p>
    <div class="EMMarginLeftFive">
        <p class="EMMarginBottomTen">
            <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PEL_INFORMATION_FOR_APPLICANTS_INFO" />
        </p>        
    </div>
</div>

<%-- About this position --%>
<div class="EMClearLeft EMMarginTopTwenty">
    <p class="EMMarginBottomFive"><jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PEL_ABOUT_POSITION" /></p>
    <jics:TextEditor ID="tbxAboutPosition" runat="server" />
</div>

<%-- About this candidate --%>
<div class="EMMarginTopTwenty">
    <p class="EMMarginBottomFive"><jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PEL_ABOUT_CANDIDATE" /></p>
    <jics:TextEditor ID="tbxAboutCandidate" runat="server" />
</div>

<%-- Footer --%>
<div class="EMBackgroundGray EMBorderAllGray EMMarginTopTwenty EMOverflowHidden">
    <ul>
        <li class="EMFloatLeft EMBackgroundBlue EMBorderAllBlue">
            <jenzabar:GlobalizedButton ID="gbtnSave" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_SAVE_CHANGES" CssClass="EMButton" OnClick="gbtnSave_Click" />
        </li>
        <li class="EMFloatLeft" style="margin: 1px;">
            <jenzabar:GlobalizedButton ID="gbtnCancel" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_CANCEL" CssClass="EMButton" OnClick="gbtnCancel_Click" />
        </li>
    </ul>
</div>

</div>