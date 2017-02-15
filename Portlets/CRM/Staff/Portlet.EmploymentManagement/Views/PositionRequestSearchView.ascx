<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PositionRequestSearchView.ascx.cs" Inherits="Jenzabar.CRM.Staff.Web.Portlets.EmploymentManagementPortlet.PositionRequestSearchView" %>
<%@ Import Namespace="Jenzabar.CRM.Staff.Web.Portlets.EmploymentManagementPortlet" %>
<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="ps" TagName="PositionSearch" Src="~/Portlets/CRM/Staff/Common.Staff/Controls/PositionSearch.ascx" %>

<div class="EMPage">

<%-- Heading --%>
<div>
    <ul>
        <li class="EMFloatLeft"><asp:Image ID="imgPaper" runat="server" ImageUrl='<%# Page.ResolveUrl(EMConstants.GetIconPaper()) %>' /></li>
        <li class="EMFloatLeft">
            <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRS_R_HEADER" CssClass="EMHeader3Text EMBoldText" />
            <br />
            <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRS_R_INFO" CssClass="EMLightText" />
        </li>
        <li class="EMFloatRight">
            <jenzabar:GlobalizedLinkButton ID="glbBack" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_BACK_MAIN" OnClick="glbBack_Click" />
        </li>
    </ul>
</div>

<%-- Position Search --%>
<div class="EMClearBoth EMPaddingTopTen">
    <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRS_S_HEADER" CssClass="EMHeader3Text EMBoldText" />
    <br />
    <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRS_S_INFO" CssClass="EMLightText" /> 
    <div class="EMMarginTopFive">
        <ps:PositionSearch ID="positionSearch" runat="server"></ps:PositionSearch>
    </div>    
</div>

</div>