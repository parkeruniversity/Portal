<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PositionEditApplicationView.ascx.cs" Inherits="Jenzabar.CRM.Staff.Web.Portlets.EmploymentManagementPortlet.PositionEditApplicationView" %>
<%@ Import Namespace="Jenzabar.CRM.Staff.Web.Portlets.EmploymentManagementPortlet" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>

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
        <li class="EMFloatLeft"><asp:Image runat="server" ImageUrl='<%# Page.ResolveUrl(EMConstants.GetIconButtonGroupLarge()) %>' /></li>
        <li class="EMFloatLeft">
            <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PEA_APPLICATION_FORM" CssClass="EMHeader3Text EMBoldText" />            
            <br />
            <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PEA_APPLICATION_FORM_INFO" CssClass="EMLightText" />
        </li>        
    </ul>
</div>

<%-- The Basics --%>
<div class="EMMarginTopTwenty">
    <p class="EMMarginBottomThree">
        <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PEA_THE_BASICS" CssClass="EMLightText" />
    </p>
    <p>
        <jenzabar:GlobalizedLiteral runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PEA_THE_BASICS_INFO" />
    </p>
</div>

<%-- Info Box --%>
<div class="EMDisplayInlineBlock EMMarginAllTen EMBackgroundGray EMBorderAllGray">
    <ul class="EMPaddingAllTwenty">
        <li class="EMListStyleDisc EMMarginBottomThree">
            <jenzabar:GlobalizedLiteral runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PEA_NAME_INFO" />
        </li>
        <li class="EMListStyleDisc EMMarginBottomThree">
            <jenzabar:GlobalizedLiteral runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PEA_CONTACT_INFO" />
        </li>
        <li class="EMListStyleDisc EMMarginBottomThree">
            <jenzabar:GlobalizedLiteral runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PEA_ADDRESS_INFO" />
        </li>
    </ul>
</div>

<%-- More Basics --%>
<div class="EMOverflowHidden EMMarginTopTen">
    <p class="EMMarginBottomTen">
        <jenzabar:GlobalizedLiteral runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PEA_THE_BASICS_INFO_MORE" />
    </p>
    <ul>
        <li class="EMFloatLeft EMMarginLeftTwenty EMMarginRightTwenty">
            <jenzabar:GlobalizedCheckBox ID="gchkCoverLetter" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_COVER_LETTER" CssClass="EMBoldText" TextAlign="Right" />
        </li>
        <li class="EMFloatLeft EMMarginLeftTwenty EMMarginRightTwenty">
            <jenzabar:GlobalizedCheckBox ID="gchkResume" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_RESUME" CssClass="EMBoldText" TextAlign="Right" />
        </li>
        <li class="EMFloatLeft EMMarginLeftTwenty EMMarginRightTwenty">
            <jenzabar:GlobalizedCheckBox ID="gchkReferences" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_REFERENCES" CssClass="EMBoldText" TextAlign="Right" />
        </li>
        <li class="EMFloatLeft EMMarginLeftTwenty EMMarginRightTwenty">
            <jenzabar:GlobalizedCheckBox ID="gchkAddInfo" runat="server" TextKey="TXT_EA_ADDITIONAL_SUPPORTING_DOCS" CssClass="EMBoldText" TextAlign="Right" />
        </li>
    </ul>
    <p>
        <jenzabar:GlobalizedButton id="gbtnSave" runat="server" textkey= "TXT_STAFF_EMPLOYMENT_MANAGEMENT_SAVE_ATTACH" OnClick="gbtnSave_Click" CssClass="EMButton" />
    </p>
</div>

<%-- The Rest --%>
<div class="EMMarginTopTwenty">
    <p class="EMMarginBottomThree">
        <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PEA_THE_REST" CssClass="EMLightText" />
    </p>
    <p>
        <jenzabar:GlobalizedLiteral runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PEA_THE_REST_INFO" />
    </p>
</div>

<%-- Manage Application --%>
<div class="EMMarginAllTen">
    <jenzabar:GlobalizedHyperLink ID="ghlManageApplication" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PEA_MANAGE_APPLICATION" />
</div>

</div>