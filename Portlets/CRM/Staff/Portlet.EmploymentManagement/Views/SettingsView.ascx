<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SettingsView.ascx.cs" Inherits="Jenzabar.CRM.Staff.Web.Portlets.EmploymentManagementPortlet.SettingsView" %>
<%@ Import Namespace="Jenzabar.CRM.Staff.Web.Portlets.EmploymentManagementPortlet" %>
<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="jics" tagname="TextEditor" src="~\UI\Controls\TextEditor.ascx" %>

<div class="EMPage">

<%-- Header --%>
<div class="EMOverflowHidden">
    <ul>
        <li class="EMFloatLeft">
            <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_S_CONFIGURATION_SETTINGS" CssClass="EMHeader2Text EMBoldText" />
        </li>
        <li class="EMFloatRight">
            <jenzabar:GlobalizedLinkButton ID="lbBack" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_BACK_MAIN" OnClick="lbBack_Click" />
        </li>
    </ul>
</div>

<%-- Warning --%>
<div class="EMBackgroundYellow EMBorderTopBottomBlack EMMarginTopFive">
    <div class="EMMarginAllFive">
        <asp:Image runat="server" ImageUrl="<%# Page.ResolveUrl(EMConstants.GetIconWarningLarge()) %>" CssClass="EMFloatLeft EMMarginRightFive" />
        <jenzabar:GlobalizedLiteral runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_S_GLOBAL_CONFIGURATION" />
    </div>
</div>

<%-- Default Email --%>
<div class="EMMarginTopTwenty">
    <p>
        <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_S_DEFAULT_HR_EMAIL" CssClass="EMHeader3Text EMBoldText" />
    </p>
    <p>
        <jenzabar:GlobalizedLiteral runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_S_DEFAULT_HR_EMAIL_INFO" />
    </p>
    <p class="EMMarginTopFive">
        <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_S_DEFAULT_EMAIL" CssClass="EMMarginLeftTen" />
        <asp:TextBox ID="txtEmail" runat="server" Width="200px" />
    </p>
</div>

<%-- About Us --%>
<div class="EMMarginTopTwenty">
    <p>
        <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_S_ABOUT_US" CssClass="EMHeader3Text EMBoldText" />
    </p>
    <p>
        <jenzabar:GlobalizedLiteral runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_S_ABOUT_US_INFO" />
    </p>
    <p class="EMMarginTopTen">
        <jenzabar:GlobalizedLiteral runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_ABOUT_US" />
    </p>
    <p>
        <jics:TextEditor ID="tbxAboutUs" runat="server" />
    </p>
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