<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PositionRequestReviewView.ascx.cs" Inherits="Jenzabar.CRM.Staff.Web.Portlets.EmploymentManagementPortlet.PositionRequestReviewView" %>
<%@ Import Namespace="Jenzabar.CRM.Staff.Web.Portlets.EmploymentManagementPortlet" %>
<%@ Import Namespace="Jenzabar.CRM.Staff.Common" %>
<%@ Import Namespace="Jenzabar.EX.Common" %>
<%@ Import Namespace="EX.Data.Constants" %>
<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="fb" TagName="FeedbackView" Src="~/Portlets/CRM/Common/Jenzabar.EX.Feedback/Controls/FeedbackView.ascx" %>
<%@ Register TagPrefix="ajaxToolkit" Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" %>

<div class="EMPage">

<%-- Position Title & Number --%>
<div class="EMOverflowHidden">
    <p>
        <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRR_REQUEST_NEW" CssClass="EMHeader2Text EMLightText" />
    </p>
    <ul class="EMMarginTopFive">
        <li class="EMFloatLeft">
            <asp:Label runat="server" Text="<%# Position.Title %>" CssClass="EMHeader2Text EMBoldText EMMarginRightTen" />
            #<asp:Label runat="server" Text="<%# Position.ID %>" CssClass="EMLightText" />
        </li>
        <li class="EMFloatRight">
            <jenzabar:GlobalizedLinkButton ID="lbBack" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_BACK_MAIN" OnClick="lbBack_Click" />
        </li>
    </ul>    
</div>

<%-- Existing Position --%>
<asp:Panel ID="pnlExistingPosition" runat="server" CssClass="EMClearBoth" Visible="<%# !Position.IsNewPosition %>">    
    <%-- Position Details --%>
    <div id="dPositionDetails" class="EMBackgroundGray EMBorderTopBottomGray EMMarginTopFive">
        <p class="EMMarginAllTen">
            <jenzabar:GlobalizedLinkButton runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRF_R_LINK" OnClientClick="$('#dPositionDetailsExpanded').show(); $('#dPositionDetails').hide(); return false;" />
            <asp:Label ID="lblPositionDetails1" runat="server" />
            <asp:Label ID="lblPositionDetails2" runat="server" />
            <asp:Label ID="lblPositionDetails3" runat="server" />
        </p>
    </div>

    <%-- Position Details Expanded --%>
    <div id="dPositionDetailsExpanded" class="EMBackgroundGray EMBorderTopBottomGray EMMarginTopFive EMClearLeft" style="display: none;">
        <div id="dPositionDetailsExpandedText" runat="server" class="EMMarginAllTen EMOverflowHidden"></div>
        <div class="EMMarginAllTen">
            <jenzabar:GlobalizedLinkButton runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRF_R_LINK_ALT" OnClientClick="$('#dPositionDetails').show(); $('#dPositionDetailsExpanded').hide(); return false;" />
         </div>
    </div>
</asp:Panel>

<%-- Position Requester --%>
<div class="EMMarginTopTen EMOverflowHidden">
    <ul>
        <li class="EMFloatLeft">
            <asp:Image runat="server" CssClass="EMProfileImage" ImageUrl='<%# Page.ResolveUrl(Jenzabar.EX.Common.Constants.ContactProfileImageHandler + "?ID=" + Position.RequesterID) %>' />
        </li>
        <li class="EMFloatLeft EMMarginLeftFive">
            <p>
                <asp:Label runat="server" Text="<%# Position.RequesterName %>" CssClass="EMHeader3Text EMBoldText" />
                <asp:Label ID="lblRequesterDate" runat="server" />
            </p>
            <p>
                <asp:Image runat="server" ImageUrl='<%# Page.ResolveUrl(EMConstants.GetIconEmailSmall()) %>' CssClass="EMVAlignMiddle" />
                <asp:HyperLink ID="hlRequesterEmail" runat="server" NavigateUrl='<%# "mailto:" + Position.RequesterEmail %>' CssClass="EMVAlignMiddle" />
            </p>
        </li>
    </ul>
</div>

<%-- New Position Request --%>
<asp:Panel ID="pnlNewPosition" runat="server" CssClass="EMBackgroundYellow EMBorderTopBottomBlack EMClearLeft EMMarginTopTen" Visible="<%# Position.IsNewPosition %>">
    <div class="EMMarginAllFive">
        <asp:Image runat="server" ImageUrl='<%# Page.ResolveUrl(EMConstants.GetIconWarningSmall()) %>' CssClass="EMVAlignMiddle" />
        <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRR_NEW_POSITION_INFO" CssClass="EMVAlignMiddle" />
    </div>
</asp:Panel>

<%-- This opening --%>
<div class="EMClearLeft EMMarginTopTwenty">
    <p>
        <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRR_THIS_OPENING" CssClass="EMLightText" />
    </p>
    <p class="EMMarginTopFive">
        <asp:Literal ID="lTargetSalary" runat="server" />
        <asp:Literal ID="lSalaryRange" runat="server" />
    </p>
    <p class="EMMarginTopFive">
        <asp:Literal ID="llHireDate" runat="server" />
    </p>
</div>

<%-- Justification --%>
<div class="EMMarginTopTwenty">
    <p>
        <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRF_JUSTIFICATION" CssClass="EMLightText" />
    </p>
    <p class="EMMarginTopFive"><%# Position.Justification %></p>
</div>

<%-- Instructions --%>
<div class="EMMarginTopTwenty">
    <p>
        <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRF_INSTRUCTIONS" CssClass="EMLightText" />
    </p>
    <p class="EMMarginTopFive"><%# Position.Instructions %></p>
</div>

<%-- Feedback --%>
<div class="EMMarginTopTwenty">
    <p class="EMPaddingTopTwenty">
        <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRR_DISCUSSION_ABOUT" CssClass="EMLightText" />
    </p>
    <fb:FeedbackView runat="server" FeedbackGOID="<%# Position.Goid %>" IsModalFeedback="<%# false %>"
        AttachmentUseCde="<%# StaffConstants.AttachmentUseHRProcess %>" AttachmentTypeCde="<%# StaffConstants.AttachmentTypeHRSupport %>" />
</div>

<%-- Committee Approval --%>
<div class="EMMarginTopTwenty">
    <p>
        <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRR_COMMITTEE_APPROVAL" CssClass="EMLightText" />
    </p>
    <p class="EMMarginTopFive">
        <asp:Image runat="server" ImageUrl='<%# Page.ResolveUrl(EMConstants.GetIconCheckSmall()) %>' CssClass="EMVAlignMiddle" />
        <asp:Label runat="server" CssClass="EMBoldText EMVAlignMiddle"><%# ReviewersApproved %></asp:Label>
        <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_APPROVE" CssClass="EMBoldText EMVAlignMiddle" />
        <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_TO" CssClass="EMVAlignMiddle" />
        <asp:Image runat="server" ImageUrl='<%# Page.ResolveUrl(EMConstants.GetIconCrossSmall()) %>' CssClass="EMVAlignMiddle" />
        <asp:Label runat="server" CssClass="EMBoldText EMVAlignMiddle"><%# ReviewersDenied %></asp:Label>
        <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_DENY" CssClass="EMBoldText EMVAlignMiddle" />
        <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_WITH" CssClass="EMVAlignMiddle" />
        <asp:Image runat="server" ImageUrl='<%# Page.ResolveUrl(EMConstants.GetIconEmptyCheck()) %>' CssClass="EMVAlignMiddle" />
        <asp:Label runat="server" CssClass="EMBoldText EMVAlignMiddle"><%# ReviewersInProcess %></asp:Label>
        <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_UNDECIDED" CssClass="EMBoldText EMVAlignMiddle" />
    </p>
    <p class="EMMarginTopFive">
        <jenzabar:GlobalizedLinkButton ID="glbRequestOpinions" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_AD_VIEW_VOTES" />
    </p>
</div>

<%-- Your Decision --%>
<asp:Panel ID="pnlDecision" runat="server" CssClass="EMMarginTopTwenty">    
    <p>
        <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRR_YOUR_DECISION" CssClass="EMLightText" />
    </p>    
    <asp:Panel ID="pnlDecisionInProcess" runat="server" Visible="false">
        <ul class="EMOverflowHidden EMMarginTopFive">
            <li class="EMFloatLeft EMBackgroundGreen EMBorderAllBlue">
                <asp:Image runat="server" ImageUrl='<%# Page.ResolveUrl(EMConstants.GetIconCheckLarge()) %>' CssClass="EMButtonImage" />
                <jenzabar:GlobalizedButton ID="gbtnApprove" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRR_ADD_APPROVAL" CssClass="EMButton" OnClick="gbtnApprove_Click" />
            </li>
            <li class="EMFloatLeft EMBackgroundRed EMBorderAllBlue">
                <asp:Image runat="server" ImageUrl='<%# Page.ResolveUrl(EMConstants.GetIconCrossLarge()) %>' CssClass="EMButtonImage" />
                <jenzabar:GlobalizedButton ID="gbtnReject" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRR_REJECT_REQUEST" CssClass="EMButton" />
            </li>
            <li class="EMFloatLeft" style="margin-left: 25px">
                <jenzabar:GlobalizedLinkButton runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRR_NO_DECISION" CssClass="EMLinkButton" OnClick="glbNoDecision_Click" />
            </li>
        </ul>
    </asp:Panel>
    <asp:Panel ID="pnlDecisionApproved" runat="server" Visible="false">
        <ul class="EMOverflowHidden EMMarginTopFive">
            <li class="EMFloatLeft EMBackgroundGreen EMBorderAllBlue">
                <asp:Image runat="server" ImageUrl='<%# Page.ResolveUrl(EMConstants.GetIconCheckLarge()) %>' CssClass="EMButtonImage" />
                <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_APPROVED" CssClass="EMHeader3Text EMButton" />
            </li>
        </ul>
    </asp:Panel>
    <asp:Panel ID="pnlDecisionDenied" runat="server" Visible="false">
        <ul class="EMOverflowHidden EMMarginTopFive">
            <li class="EMFloatLeft EMBackgroundRed EMBorderAllBlue">
                <asp:Image runat="server" ImageUrl='<%# Page.ResolveUrl(EMConstants.GetIconCrossLarge()) %>' CssClass="EMButtonImage" />
                <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_DENIED" CssClass="EMHeader3Text EMButton" />
            </li>
        </ul>
    </asp:Panel>
    <p class="EMClearLeft EMMarginTopFive">
        <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRR_REQUEST_APPROVAL_INFO" CssClass="EMLightText" />
    </p>
</asp:Panel>

<%-- Request Opinions Modal Popup --%>
<ajaxToolkit:ModalPopupExtender ID="modalRequestOpinions" runat="server" TargetControlID="glbRequestOpinions" PopupControlID="pnlRequestOpinions" PopupDragHandleControlID="pnlRequestOpinionsHeader" CancelControlID="glbRequestOpinionsClose" BackgroundCssClass="EMModalBackground" />
<asp:Panel ID="pnlRequestOpinions" runat="server" CssClass="EMModalPopup">
    <div class="EMModalInner EMOverflowAuto">
        <asp:Panel ID="pnlRequestOpinionsHeader" runat="server" CssClass="EMModalHeader">
            <jenzabar:globalizedliteral Runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRR_REQUEST_OPINION" />
            <asp:ImageButton runat="server" CssClass="EMModalHeaderImg" ImageUrl='<%# Page.ResolveUrl(EMConstants.GetIconClose()) %>' />         
        </asp:Panel>
        <div class="EMMarginAllTwenty">
            <p class="EMMarginBottomTen">
                <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRR_COMMITTEE_OPINION" CssClass="EMLightText" />
            </p>
            <div class="EMOverflowHidden EMDisplayInlineBlock" style="min-width:500px;">
                <%-- Approve Members --%>
                <div class="EMFloatLeft EMPaddingRightTwenty" style="margin-bottom:-100%; padding-bottom:100%; min-width:250px;">
                    <p class="EMMarginBottomTen">
                        <asp:Image runat="server" ImageUrl='<%# Page.ResolveUrl(EMConstants.GetIconCheckSmall()) %>' CssClass="EMVAlignMiddle" />
                        <asp:Label runat="server" CssClass="EMBoldText EMVAlignMiddle"><%# ReviewersApproved %></asp:Label>
                        <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_APPROVE" CssClass="EMBoldText EMVAlignMiddle" />
                    </p>
                    <asp:Repeater ID="rApprovedMembers" runat="server">
                        <ItemTemplate>
                            <p class="EMBoldText EMMarginBottomThree EMClearLeft"><%# Eval("Name") %></p>
                            <ul class="EMOverflowHidden EMMarginBottomTwenty">
                                <li class="EMFloatLeft">
                                    <asp:Image runat="server" CssClass="EMProfileImage" ImageUrl='<%# Page.ResolveUrl(Jenzabar.EX.Common.Constants.ContactProfileImageHandler + "?ID=" + Eval("ID")) %>' />
                                </li>
                                <li class="EMFloatLeft EMMarginLeftTen">
                                    <div class="EMWedgeWrapper">
                                        <div class="EMWedgeIcon"></div>
                                        <div class="EMWedgeIconOutline"></div>
                                        <div class="EMWedgeEntry">
                                            <asp:Image runat="server" ImageUrl='<%# Page.ResolveUrl(EMConstants.GetIconCheckSmall()) %>' CssClass="EMVAlignMiddle" />
                                            <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_I_APPROVE" CssClass="EMVAlignMiddle" />
                                        </div>
                                    </div>
                                    <p class="EMMarginTopThree">
                                        <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_VOTED_ON" CssClass="EMLightText" />
                                        <%# Eval("ApprovalDate", "{0:MMMM d, yyyy}")%>
                                    </p>
                                </li>
                            </ul>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <%-- Deny Members --%>
                <div class="EMFloatLeft  EMPaddingLeftTwenty EMBorderLeftGrayDashed" style="margin-bottom:-100%; padding-bottom:100%; min-width:250px;">
                    <p class="EMMarginBottomFive">
                        <asp:Image runat="server" ImageUrl='<%# Page.ResolveUrl(EMConstants.GetIconCrossSmall()) %>' CssClass="EMVAlignMiddle" />
                        <asp:Label runat="server" CssClass="EMBoldText EMVAlignMiddle"><%# ReviewersDenied %></asp:Label>
                        <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_DENY" CssClass="EMBoldText EMVAlignMiddle" />
                    </p>                    
                    <asp:Repeater ID="rDeniedMembers" runat="server">
                        <ItemTemplate>                            
                            <ul class="EMOverflowHidden EMClearLeft">
                                <li class="EMFloatLeft">
                                    <asp:Image runat="server" CssClass="EMProfileImage" ImageUrl='<%# Page.ResolveUrl(Jenzabar.EX.Common.Constants.ContactProfileImageHandler + "?ID=" + Eval("ID")) %>' />
                                </li>
                                <li class="EMFloatLeft EMMarginLeftTen">
                                    <p class="EMBoldText"><%# Eval("Name") %></p>
                                    <p class="EMMarginTopThree">
                                        <asp:Image runat="server" ImageUrl='<%# Page.ResolveUrl(EMConstants.GetIconEmailSmall()) %>' CssClass="EMVAlignMiddle" />
                                        <asp:HyperLink runat="server" NavigateUrl='<%# "mailto:" + Eval("Email") %>' CssClass="EMVAlignMiddle">
                                            <jenzabar:GlobalizedLiteral runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_EMAIL" />&nbsp;<%# Eval("FirstName") %>
                                        </asp:HyperLink>
                                    </p>
                                </li>
                            </ul>
                            <p class="EMMarginTopThree EMMarginBottomTwenty" style="max-width:250px;">
                                <%# Eval("Reason") %>
                                <jenzabar:GlobalizedLiteral runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_AD_NO_REASON" Visible='<%# Eval("Reason") == "" %>' />
                            </p>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>                       
        </div>
        <%-- Undecided Opinion --%>
        <div class="EMBackgroundYellow EMClearLeft EMOverflowHidden">
            <div class="EMMarginAllTen" style="max-width: 700px;">
                <p class="EMMarginBottomTen">
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%# Page.ResolveUrl(EMConstants.GetIconEmptyCheck()) %>' CssClass="EMVAlignMiddle" />  
                    <asp:Label ID="lblIndividualVoteUndecided" runat="server" CssClass="EMBoldText EMHeader3Text EMVAlignMiddle"><%# ReviewersInProcess %></asp:Label>
                    <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_UNDECIDED" CssClass="EMHeader3Text EMVAlignMiddle" />&nbsp;
                    <asp:HyperLink ID="hlEmailAll" runat="server" NavigateUrl='<%# GetUndecidedEmails() %>' CssClass="EMVAlignMiddle" />
                </p>
                <ul class="EMOverflowHidden">
                    <asp:Repeater ID="rUndecidedMembers" runat="server">
                        <ItemTemplate>
                            <li class="EMFloatLeft EMMarginBottomTwenty EMMarginRightTwenty">
                                <ul class="EMOverflowHidden">
                                    <li class="EMFloatLeft">
                                        <asp:Image ID="Image2" runat="server" CssClass="EMProfileImage" ImageUrl='<%# Page.ResolveUrl(Jenzabar.EX.Common.Constants.ContactProfileImageHandler + "?ID=" + Eval("ID")) %>' />
                                    </li>
                                    <li class="EMFloatLeft EMMarginLeftFive">
                                        <p class="EMBoldText"><%# Eval("Name") %></p>
                                        <p class="EMMarginTopThree">
                                            <asp:Image ID="Image3" runat="server" ImageUrl='<%# Page.ResolveUrl(EMConstants.GetIconEmailSmall()) %>' CssClass="EMVAlignMiddle" />
                                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "mailto:" + Eval("Email") %>'>
                                                <jenzabar:GlobalizedLiteral ID="GlobalizedLiteral1" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_EMAIL" />&nbsp;<%# Eval("FirstName") %>
                                            </asp:HyperLink>
                                        </p>
                                    </li>
                                </ul>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </div>
        </div>
        <div class="EMModalButtons EMClearLeft">
            <jenzabar:GlobalizedLinkButton ID="glbRequestOpinionsClose" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_CLOSE" />
        </div>
    </div>
</asp:Panel>

<%-- Reject Request Modal Popup --%>
<ajaxToolkit:ModalPopupExtender ID="modalRejectRequest" runat="server" TargetControlID="gbtnReject" PopupControlID="pnlRejectRequest" PopupDragHandleControlID="pnlRejectRequestHeader" CancelControlID="glbRejectRequestCancel" BackgroundCssClass="EMModalBackground" />
<asp:Panel ID="pnlRejectRequest" runat="server" CssClass="EMModalPopup" Visible="false">
    <div class="EMModalInner EMOverflowAuto">
        <asp:Panel ID="pnlRejectRequestHeader" runat="server" CssClass="EMModalHeader">
            <jenzabar:globalizedliteral Runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRR_REJECT_REQUEST" />
            <asp:ImageButton runat="server" CssClass="EMModalHeaderImg" ImageUrl='<%# Page.ResolveUrl(EMConstants.GetIconClose()) %>' />         
        </asp:Panel>
        <div class="EMMarginAllTwenty" style="max-width: 640px;">
            <asp:Image runat="server" ImageUrl='<%# Page.ResolveUrl(EMConstants.GetIconCrossLarge()) %>' CssClass="EMFloatLeft EMMarginRightFive" />
            <asp:Label ID="lblRejectionInfo" runat="server" CssClass="EMMarginAllThree" />
            <p class="EMClearLeft">
                <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRR_REJECTION_REASON" CssClass="EMLightText" />
            </p>
            <asp:TextBox ID="txtRejectionReason" runat="server" TextMode="MultiLine" Width="600" Height="150" />
        </div>
        <div class="EMModalButtons EMClearLeft">
            <jenzabar:GlobalizedLinkButton ID="glbRejectRequest" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRR_REJECT_REQUEST" CssClass="EMMarginRightFive" OnClick="glbRejectRequest_Click" />
            <jenzabar:GlobalizedLinkButton ID="glbRejectRequestCancel" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRR_REJECTION_CANCEL" CssClass="EMMarginLeftFive" />
        </div>
    </div>
</asp:Panel>

</div>