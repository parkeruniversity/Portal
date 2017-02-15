<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PositionDetailView.ascx.cs" Inherits="Jenzabar.CRM.Staff.Web.Portlets.EmploymentManagementPortlet.PositionDetailView" %>
<%@ Import Namespace="Jenzabar.CRM.Staff.Web.Portlets.EmploymentManagementPortlet" %>
<%@ Import Namespace="EX.Data.Constants" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="fb" TagName="FeedbackView" Src="~/Portlets/CRM/Common/Jenzabar.EX.Feedback/Controls/FeedbackView.ascx" %>
<%@ Register TagPrefix="ajaxToolkit" Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" %>


<%-- Header --%>
<div class="EMBackgroundGreen EMOverflowHidden">
    <div class="EMMarginAllTen EMOverflowHidden">
        <ul class="EMOverflowHidden">
            <li class="EMFloatLeft">
                <asp:Label runat="server" Text="<%# Position.Title %>" CssClass="EMHeader1Text EMMarginRightTen" />
                #<asp:Label runat="server" Text="<%# Position.ID %>" CssClass="EMLightText" />
            </li>
            <li class="EMFloatRight">
                <jenzabar:GlobalizedLinkButton ID="lbBack" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_BACK_MAIN" OnClick="lbBack_Click" />
            </li>
        </ul>
        <asp:Label ID="lblPositionInfo" runat="server" CssClass="EMClearBoth EMMarginTopFive EMMarginBottomThree EMDisplayInlineBlock" />
    </div>
</div>

<%-- Header Links --%>
<div class="EMOverflowHidden EMBackgroundGray EMBorderTopBottomGray">
    <ul>
        <%-- Preview --%>
        <li class="EMFloatLeft EMBackgroundBlueLight EMBorderRightGray">
            <table class="EMMarginAllTen">
                <tr>
                    <td rowspan="2">
                        <asp:Image runat="server" ImageUrl="<%# Page.ResolveUrl(EMConstants.GetIconMagnifierLarge()) %>" />
                    </td>
                    <td class="EMHeader3Text">
                        <jenzabar:globalizedliteral runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_PREVIEW" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <jenzabar:GlobalizedLinkButton ID="glbPreview" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_PREVIEW_THE_LISTING" OnClick="glbPreview_Click" />
                    </td>
                </tr>
            </table>
        </li>
        <%-- Position Listing --%>
        <li class="EMFloatLeft">
            <table class="EMMarginAllTen">
                <tr>
                    <td rowspan="2">
                        <asp:Image runat="server" ImageUrl="<%# Page.ResolveUrl(EMConstants.GetIconPaperText()) %>" />
                    </td>
                    <td class="EMHeader3Text">
                        <jenzabar:globalizedliteral runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_POSITION_LISTING" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <jenzabar:GlobalizedLinkButton ID="glbListing" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_EDIT_LISTING" OnClick="glbListing_Click" />
                    </td>
                </tr>
            </table>
        </li>
        <%-- Application Form --%>
        <li class="EMFloatLeft">
            <table class="EMMarginAllTen">
                <tr>
                    <td rowspan="2">
                        <asp:Image runat="server" ImageUrl="<%# Page.ResolveUrl(EMConstants.GetIconButtonGroupLarge()) %>" />
                    </td>
                    <td class="EMHeader3Text">
                        <jenzabar:globalizedliteral runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_APPLICATION_FORM" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <jenzabar:GlobalizedLinkButton ID="glbApplication" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_EDIT_APPLICATION" OnClick="glbApplication_Click" />
                    </td>
                </tr>
            </table>
        </li>
        <%-- Hiring Committtee --%>
        <li class="EMFloatLeft">
            <table class="EMMarginAllTen">
                <tr>
                    <td rowspan="2">
                        <asp:Image runat="server" ImageUrl="<%# Page.ResolveUrl(EMConstants.GetIconPeopleLarge()) %>" />
                    </td>
                    <td class="EMHeader3Text">
                        <jenzabar:globalizedliteral runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_HIRING_COMMITTEE" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <jenzabar:GlobalizedLinkButton ID="glbHiring" runat="server" OnClick="lbHiring_Click" />
                    </td>
                </tr>
            </table>
        </li>
    </ul>
</div>

<div class="EMPage">

<%-- Applications --%>
<p class="EMMarginBottomTen">
    <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PD_APPLICATIONS" CssClass="EMLightText" />
</p>

<asp:GridView ID="gvApplications" runat="server" AutoGenerateColumns="false" CellPadding="4" GridLines="None"
OnRowDataBound="gvApplications_RowDataBound" OnRowCommand="gvApplications_RowCommand"
CssClass="EMGridView" AlternatingRowStyle-CssClass="EMGridViewAlt">
    <Columns>
        <asp:TemplateField>
            <ItemTemplate>
                <asp:LinkButton ID="lbApplicant" runat="server" Text='<%# Eval("Name") %>' CommandName="Ids" CommandArgument='<%# Eval("PositionID") + "," + Eval("ApplicantID") %>' />
                <asp:Label ID="lblApplicant" runat="server" Text='<%# Eval("Name") %>' />
            </ItemTemplate>
        </asp:TemplateField>                         
        <asp:BoundField DataField="ApplyDate" DataFormatString="{0:D}" />
        <asp:TemplateField>
            <ItemTemplate>
                <asp:Image ID="imgUserDecision" runat="server" CssClass="EMVAlignMiddle" />
                <asp:Label ID="lblUserDecision" runat="server" CssClass="EMVAlignMiddle" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField>
            <ItemTemplate>
                <asp:Image ID="imgCommitteeDecision" runat="server" CssClass="EMVAlignMiddle" />
                <asp:Label ID="lblCommitteeDecision" runat="server" CssClass="EMVAlignMiddle" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>        
</asp:GridView>

<%-- Feedback --%>
<div class="EMMarginTopTwenty">
    <p class="EMPaddingTopTwenty">
        <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PD_DISCUSSION" CssClass="EMLightText" />
    </p>
    <fb:FeedbackView runat="server" FeedbackGOID="<%# Position.Goid %>" IsModalFeedback="<%# false %>"
        AttachmentUseCde="<%# StaffConstants.AttachmentUseHRHiring %>" AttachmentTypeCde="<%# StaffConstants.AttachmentTypeHRSupport %>" />
</div>

<%-- No Access Modal Popup --%>
<ajaxToolkit:ModalPopupExtender ID="modalNoAccess" runat="server" TargetControlID="btnNoAccessHidden" PopupControlID="pnlNoAccess" PopupDragHandleControlID="pnlNoAccessHeader" CancelControlID="glbNoAccessClose" BackgroundCssClass="EMModalBackground" />
<asp:Button ID="btnNoAccessHidden" runat="server" style="display: none;" />
<asp:Panel ID="pnlNoAccess" runat="server" CssClass="EMModalPopup">
    <div class="EMModalInner" style="min-width: 350px;">
        <asp:Panel ID="pnlNoAccessHeader" runat="server" CssClass="EMModalHeader">
            <jenzabar:GlobalizedLiteral Runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_NO_ACCESS" />
            <asp:ImageButton runat="server" CssClass="EMModalHeaderImg" ImageUrl='<%# Page.ResolveUrl(EMConstants.GetIconClose()) %>' />         
        </asp:Panel>
        <div class="EMMarginAllTwenty">
            <jenzabar:GlobalizedLabel Runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PD_NO_PERMISSION" CssClass="EMHeader3Text" />
        </div>
        <div class="EMModalButtons">
            <jenzabar:GlobalizedLinkButton ID="glbNoAccessClose" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_CLOSE" />
        </div>
    </div>
</asp:Panel>

</div>