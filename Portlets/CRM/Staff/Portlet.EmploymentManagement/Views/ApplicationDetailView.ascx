<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ApplicationDetailView.ascx.cs" Inherits="Jenzabar.CRM.Staff.Web.Portlets.EmploymentManagementPortlet.ApplicationDetailView" %>
<%@ Import Namespace="Jenzabar.CRM.Staff.Web.Portlets.EmploymentManagementPortlet" %>
<%@ Import Namespace="Jenzabar.CRM.Staff.Common" %>
<%@ Import Namespace="EX.Data.Constants" %>
<%@ Import Namespace="Jenzabar.EX.Common" %>
<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="fb" TagName="FeedbackView" Src="~/Portlets/CRM/Common/Jenzabar.EX.Feedback/Controls/FeedbackView.ascx" %>
<%@ Register TagPrefix="ajaxToolkit" Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" %>

<%-- Javascript --%>
<script type="text/javascript">
<%# UtilityFunctions.GetMailtoScript() %>
</script>

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

<%-- Administrator Confirmation Message --%>
<asp:Panel ID="pnlAdminConfirmMessage" runat="server" CssClass="EMBorderAllBlue EMMarginBottomTwenty EMDisplayInlineBlock" Visible="false">
    <div class="EMMarginAllTen EMOverflowHidden">
        <asp:Image ID="imgAdminConfirmMessage" runat="server" CssClass="EMFloatLeft EMMarginRightTen" />
        <asp:Label ID="lblAdminConfirmMessage1" runat="server" CssClass="EMBoldText" />
        <br />
        <asp:Label ID="lblAdminConfirmMessage2" runat="server" />
    </div>
</asp:Panel>

<%-- Applicant Header --%>
<div>
    <ul class="EMOverflowHidden">
        <li class="EMFloatLeft EMMarginRightThree">
            <asp:LinkButton ID="lbPreviousApplicant" runat="server" OnClick="lbPreviousApplicant_Click">
                <asp:Image runat="server" ImageUrl="<%# Page.ResolveUrl(EMConstants.GetIconNavArrowLeft()) %>" CssClass="EMVAlignMiddle" />
            </asp:LinkButton>
        </li>
        <li class="EMFloatLeft EMBorderLeftRightGray EMPaddingLeftFive" style="padding-right: 200px">
            <p>
                <asp:Label runat="server" Text="<%# Applicant.Name %>" CssClass="EMHeader2Text EMBoldText" />
            </p>
            <p>
                <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_AD_APPLIED_ON" CssClass="EMLightText" />
                <asp:Label runat="server" Text='<%# Applicant.ApplyDate.ToString("MMMM d, yyyy") %>' CssClass="EMLightText" />
            </p>
        </li>
        <li class="EMFloatLeft EMMarginLeftThree">
            <asp:LinkButton ID="lbNextApplicant" runat="server" OnClick="lbNextApplicant_Click">
                <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_AD_NEXT_APPLICANT" CssClass="EMMarginRightThree" />
                <asp:Image runat="server" ImageUrl="<%# Page.ResolveUrl(EMConstants.GetIconNavArrowRight()) %>" CssClass="EMVAlignMiddle" />
            </asp:LinkButton>
        </li>
    </ul>
</div>

<%-- Applicant Details --%>
<div class="EMMarginTopTen EMOverflowHidden">
    <%-- Documents --%>
    <asp:Panel ID="pnlDocuments" runat="server" CssClass="EMFloatLeft EMBackgroundBlue EMBorderTopBottomBlue">
        <ul class="EMMarginAllTen">
            <li id="liNoDocuments" runat="server" visible="false" style="max-width: 215px;">
                <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_AD_NO_DOCUMENTS" CssClass="EMBlueText" />
            </li>
            <li id="liApplicationForm" runat="server" class="EMMarginBottomTen">
                <ul class="EMOverflowHidden">
                    <li class="EMFloatLeft EMMarginRightThree"><asp:Image runat="server" ImageUrl="<%# Page.ResolveUrl(EMConstants.GetIconButtonGroupLarge()) %>" CssClass="EMVAlignMiddle" /></li>
                    <li class="EMFloatLeft">
                        <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_VIEW_THE" CssClass="EMBlueText" />            
                        <br />
                        <jenzabar:GlobalizedHyperLink runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_APPLICATION_FORM" NavigateUrl='<%# ParentPortlet.GetNextScreenURL("ViewSubmission//" + Applicant.SubmissionGuid.ToString() + "//" + EMConstants.APPLICATION_DETAIL_SCREEN) %>' CssClass="EMHeader3Text EMBoldText" />
                    </li>        
                </ul>
            </li>
            <asp:Repeater ID="rDocument" runat="server" OnItemDataBound="rDocument_ItemDataBound">
                <ItemTemplate>
                    <li class="EMMarginBottomTen">
                        <ul class="EMOverflowHidden">
                            <li class="EMFloatLeft EMMarginRightThree"><asp:Image ID="imgDocument" runat="server" CssClass="EMVAlignMiddle" /></li>
                            <li class="EMFloatLeft">
                                <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_AD_DOWNLOAD_THE" CssClass="EMBlueText" />            
                                <br />
                                <asp:HyperLink ID="hlDocument" runat="server" CssClass="EMHeader3Text EMBoldText" Target="_blank" />
                            </li>        
                        </ul>
                    </li>
                </ItemTemplate>
            </asp:Repeater>                
        </ul>
    </asp:Panel>
    <%-- Administrator & Committee --%>
    <div class="EMFloatLeft EMBackgroundGray EMMarginLeftTwenty">
        <%-- Administrator --%>
        <div class="EMBorderAllGray">
            <div class="EMMarginAllFive">
                <p class="EMMarginBottomFive">
                    <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_AD_MANAGER_DECISION" CssClass="EMLightText EMCapitalize EMHeader3Text" />
                </p>
                <ul class="EMOverflowHidden">
                    <li class="EMFloatLeft"><asp:Image runat="server" CssClass="EMProfileImage" ImageUrl='<%# Page.ResolveUrl(Jenzabar.EX.Common.Constants.ContactProfileImageHandler + "?ID=" + Administrator.ID) %>' /></li>
                    <li class="EMFloatLeft EMMarginLeftFive">
                        <p>
                            <asp:Label runat="server" Text='<%# Administrator.Name %>' CssClass="EMHeader3Text EMBoldText" />
                        </p>
                        <p class="EMMarginTopFive">
                            <asp:Image ID="imgApplicantStatus" runat="server" CssClass="EMVAlignMiddle" />
                            <asp:Label ID="lblApplicantStatus" runat="server" />
                        </p>
                    </li>
                </ul>
            </div>
            <asp:Panel ID="pnlAdministratorDecision" runat="server" CssClass="EMMarginTopTen EMBackgroundYellow EMBorderTopGray EMPaddingAllTen" Visible="false">
                <asp:Label ID="lblAdministratorDecision" runat="server" CssClass="EMMarginBottomFive EMLightText EMHeader3Text" />
                <ul class="EMOverflowHidden EMMarginTopFive">
                    <li class="EMFloatLeft EMBackgroundGreen EMBorderAllBlue">
                        <asp:Image runat="server" ImageUrl='<%# Page.ResolveUrl(EMConstants.GetIconCheckSmall()) %>' CssClass="EMButtonImage" />
                        <asp:LinkButton ID="lbAdministratorApprove" runat="server" CssClass="EMButton EMDisplayInlineBlock" OnClick="lbAdministratorApprove_Click" />
                    </li>
                    <li class="EMFloatLeft EMBackgroundRed EMBorderAllBlue">
                        <asp:Image runat="server" ImageUrl='<%# Page.ResolveUrl(EMConstants.GetIconCrossSmall()) %>' CssClass="EMButtonImage" />
                        <asp:LinkButton ID="lbAdministratorReject" runat="server" CssClass="EMButton EMDisplayInlineBlock" OnClick="lbAdministratorReject_Click" />
                    </li>
                </ul>
            </asp:Panel>
            <p id="pApplicantStatusChangeDate" runat="server" class="EMClearLeft EMMarginAllFive">
                <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_AD_DECIDED_ON" CssClass="EMLightText" />
                <asp:Label runat="server" Text='<%# Applicant.StatusChangeDate.ToString("MMMM d, yyyy, h:mm tt")  %>' CssClass="EMLightText" />
            </p>
        </div>
        <%-- Committee --%>
        <div class="EMClearLeft EMPaddingAllFive EMBorderAllGray">
            <p>
                <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_AD_COMMITTEE_CONSENSUS" CssClass="EMLightText EMCapitalize EMHeader3Text" />
            </p>
            <ul class="EMOverflowHidden EMMarginTopFive">
                <li class="EMFloatLeft EMMarginLeftThree EMMarginRightThree"><asp:Image ID="imgCommitteeConsensus" runat="server" CssClass="EMVAlignMiddle" /></li>
                <li class="EMFloatLeft">
                    <asp:Label ID="lblCommitteeConsensus" runat="server" />
                    <jenzabar:GlobalizedLinkButton ID="glbCommitteeConsensus" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_AD_VIEW_VOTES" />
                </li>        
            </ul>
            <p class="EMClearLeft EMMarginTopTwenty">
                <asp:Image runat="server" ImageUrl='<%# Page.ResolveUrl(EMConstants.GetIconEmailSmall()) %>' CssClass="EMVAlignMiddle" />
                <jenzabar:GlobalizedLinkButton ID="glbEmailCommittee" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_AD_EMAIL_COMMITTEE" />
            </p>
        </div>
    </div>       
</div>

<%-- Your Decision --%>
<asp:Panel ID="pnlDecision" runat="server" CssClass="EMMarginTopTwenty EMBorderTopGrayDashed">    
    <p class="EMMarginTopTen EMMarginBottomFive">
        <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_AD_WORTH_INTERVIEWING" CssClass="EMLightText EMCapitalize EMHeader3Text" />
    </p>    
    <asp:Panel ID="pnlDecisionInProcess" runat="server">
        <ul class="EMOverflowHidden EMMarginTopFive">
            <li class="EMFloatLeft EMBackgroundGreen EMBorderAllBlue">
                <asp:Image runat="server" ImageUrl='<%# Page.ResolveUrl(EMConstants.GetIconCheckLarge()) %>' CssClass="EMButtonImage" />
                <jenzabar:GlobalizedButton ID="gbtnApprove" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_AD_APPROVE" CssClass="EMButton" OnClick="gbtnApprove_Click" />
            </li>
            <li class="EMFloatLeft EMBackgroundRed EMBorderAllBlue">
                <asp:Image runat="server" ImageUrl='<%# Page.ResolveUrl(EMConstants.GetIconCrossLarge()) %>' CssClass="EMButtonImage" />
                <jenzabar:GlobalizedButton ID="gbtnReject" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_AD_REJECT" CssClass="EMButton" OnClick="gbtnReject_Click" />
            </li>
        </ul>
    </asp:Panel>
    <asp:Panel ID="pnlDecisionApproved" runat="server">
        <ul class="EMMarginTopFive">
            <li>
                <asp:Image runat="server" ImageUrl='<%# Page.ResolveUrl(EMConstants.GetIconCheckSmall()) %>' CssClass="EMVAlignMiddle" />
                <asp:Label ID="lblDecisionApproved" runat="server" />
            </li>
            <li class="EMMarginTopFive EMMarginLeftTen">
                <asp:Image runat="server" ImageUrl='<%# Page.ResolveUrl(EMConstants.GetIconCrossSmall()) %>' CssClass="EMVAlignMiddle" />
                <jenzabar:GlobalizedLinkButton ID="glbDecisionApprovedChange" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_AD_NOW_REJECT" OnClick="glbDecisionApprovedChange_Click" />
            </li>
        </ul>
    </asp:Panel>
    <asp:Panel ID="pnlDecisionDenied" runat="server">
        <ul class="EMMarginTopFive">
            <li>
                <asp:Image runat="server" ImageUrl='<%# Page.ResolveUrl(EMConstants.GetIconCrossSmall()) %>' CssClass="EMVAlignMiddle" />
                <asp:Label ID="lblDecisionDenied" runat="server" />
            </li>
            <li class="EMMarginTopFive EMMarginLeftTen">
                <asp:Image runat="server" ImageUrl='<%# Page.ResolveUrl(EMConstants.GetIconCheckSmall()) %>' CssClass="EMVAlignMiddle" />
                <jenzabar:GlobalizedLinkButton ID="glbDecisionDeniedChange" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_AD_NOW_APPROVE" OnClick="glbDecisionDeniedChange_Click" />
            </li>
        </ul>
    </asp:Panel>
    <asp:Panel ID="pnlDecisionOver" runat="server">
        <ul class="EMMarginTopFive">
            <li>
                <asp:Image ID="imgDecisionOver" runat="server" CssClass="EMVAlignMiddle" />
                <asp:Label ID="lblDecisionOver" runat="server" CssClass="EMVAlignMiddle" />
            </li>
        </ul>
    </asp:Panel>
</asp:Panel>

<%-- Individual Votes Modal Popup --%>
<ajaxToolkit:ModalPopupExtender ID="modalIndividualVotes" runat="server" TargetControlID="glbCommitteeConsensus" PopupControlID="pnlIndividualVotes" PopupDragHandleControlID="pnlIndividualVotesHeader" CancelControlID="glbIndividualVotesClose" BackgroundCssClass="EMModalBackground" />
<asp:Panel ID="pnlIndividualVotes" runat="server" CssClass="EMModalPopup">
    <div class="EMModalInner EMOverflowAuto" style="min-width: 700px;">
        <asp:Panel ID="pnlIndividualVotesHeader" runat="server" CssClass="EMModalHeader">
            <asp:Label ID="lblIndividualVotesHeader" runat="server" />
            <asp:ImageButton runat="server" CssClass="EMModalHeaderImg" ImageUrl='<%# Page.ResolveUrl(EMConstants.GetIconClose()) %>' />         
        </asp:Panel>
        <div>
            <div class="EMOverflowHidden EMBorderTopBottomGray">
                <%-- Posting Manager Decision --%>
                <div class="EMFloatLeft EMBackgroundBlue EMTextAlignCenter" style="width:50%; margin-bottom:-100%; padding-bottom:100%;">
                    <div class="EMBorderRightGray">
                        <div class="EMDisplayInlineBlock EMTextAlignLeft EMMarginAllTen">
                            <p class="EMMarginBottomFive">
                                <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_AD_MANAGER_DECISION" CssClass="EMLightText" />
                            </p>
                            <ul class="EMOverflowHidden">
                                <li class="EMFloatLeft"><asp:Image runat="server" CssClass="EMProfileImage" ImageUrl='<%# Page.ResolveUrl(Jenzabar.EX.Common.Constants.ContactProfileImageHandler + "?ID=" + Administrator.ID) %>' /></li>
                                <li class="EMFloatLeft EMMarginLeftFive">
                                    <p>
                                        <asp:Label runat="server" Text='<%# Administrator.Name %>' CssClass="EMHeader3Text EMBoldText" />
                                    </p>
                                    <p>
                                        <asp:Image ID="imgAdministratorDecisionModal" runat="server" CssClass="EMVAlignMiddle" />
                                        <asp:Label ID="lblAdministratorDecisionModal" runat="server" />
                                    </p>
                                    <p class="EMMarginTopFive">
                                        <asp:Image runat="server" ImageUrl='<%# Page.ResolveUrl(EMConstants.GetIconEmailSmall()) %>' CssClass="EMVAlignMiddle" />
                                        <asp:HyperLink runat="server" NavigateUrl='<%# "mailto:" + Administrator.Email %>'>
                                            <jenzabar:GlobalizedLiteral runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_EMAIL" />&nbsp;<%# Administrator.FirstName %>
                                        </asp:HyperLink>
                                    </p>
                                </li>
                            </ul>
                            <p id="pApplicantStatusChangeDateModal" runat="server" class="EMClearLeft EMMarginTopFive">
                                <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_AD_DECIDED_ON" CssClass="EMLightText" />
                                <asp:Label runat="server" Text='<%# Applicant.StatusChangeDate.ToString("MMMM d, yyyy, h:mm tt") %>' CssClass="EMLightText" />
                            </p>
                        </div>
                    </div>
                </div>
                <%-- Compose Email --%>
                <div class="EMFloatLeft EMBackgroundGray EMTextAlignCenter" style="width:50%; margin-bottom:-100%; padding-bottom:100%;">
                    <div class="EMDisplayInlineBlock EMMarginAllTen">
                        <p>
                            <asp:Image runat="server" ImageUrl='<%# Page.ResolveUrl(EMConstants.GetIconEmailSmall()) %>' CssClass="EMVAlignMiddle" />
                            <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_AD_SEND_EMAIL" CssClass="EMLightText" />
                        </p>
                        <p class="EMMarginTopFive">
                            <asp:DropDownList ID="ddlIndividualVotesEmail" runat="server" />
                        </p>
                        <p class="EMMarginTopFive">
                            <jenzabar:GlobalizedButton ID="gbtnIndividualVotesEmail" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_AD_COMPOSE_EMAIL" OnClick="gbtnIndividualVotesEmail_Click" />
                        </p>
                    </div>            
                </div>
                <div class="EMClearLeft"></div>
            </div>
            <%-- Committee Opinion --%>
            <div class="EMClearLeft EMMarginAllTen">
                <p>
                    <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_AD_COMMITTEE_CONSENSUS" CssClass="EMLightText" />
                </p>
                <p class="EMMarginTopFive">
                    <asp:Image ID="imgIndividualVotesCommitteeConsensus" runat="server" CssClass="EMVAlignMiddle" />
                    <asp:Label ID="lblIndividualVotesCommitteeConsensus" runat="server" CssClass="EMMarginLeftThree EMHeader3Text" />
                </p>
                <div class="EMTextAlignCenter">
                    <div class="EMOverflowHidden EMMarginTopTen EMDisplayInlineBlock EMTextAlignLeft" style="min-width:500px;">
                        <%-- Approve Members --%>
                        <div class="EMFloatLeft EMPaddingRightTwenty" style="margin-bottom:-100%; padding-bottom:100%; min-width:250px;">
                            <p class="EMMarginBottomTen">
                                <asp:Label ID="lblIndividualVoteFavor" runat="server" CssClass="EMLightText"><%# Favor %></asp:Label>
                                <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_AD_MEMBERS_IN_FAVOR" CssClass="EMLightText" />
                            </p>
                            <asp:Repeater ID="rApprovedMembers" runat="server">
                                <ItemTemplate>
                                    <p class="EMBoldText EMMarginBottomThree EMClearLeft"><%# Eval("Name") %></p>
                                    <ul class="EMOverflowHidden">
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
                                                <%# Eval("HireStatusChangeDate", "{0:MMMM d, yyyy}")%>
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
                        <%-- Against Members --%>
                        <div class="EMFloatLeft EMPaddingLeftTwenty EMBorderLeftGrayDashed" style="margin-bottom:-100%; padding-bottom:100%; min-width:250px;">
                            <p class="EMMarginBottomTen">
                                <asp:Label ID="lblIndividualVoteAgainst" runat="server" CssClass="EMLightText"><%# Against %></asp:Label>
                                <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_AD_MEMBERS_AGAINST" CssClass="EMLightText" />
                            </p>
                            <asp:Repeater ID="rAgainstMembers" runat="server">
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
                                                    <asp:Image runat="server" ImageUrl='<%# Page.ResolveUrl(EMConstants.GetIconCrossSmall()) %>' CssClass="EMVAlignMiddle" />
                                                    <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_I_AGAINST" CssClass="EMVAlignMiddle" />
                                                </div>
                                            </div>
                                            <p class="EMMarginTopThree">
                                                <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_VOTED_ON" CssClass="EMLightText" />
                                                <%# Eval("HireStatusChangeDate", "{0:MMMM d, yyyy}")%>
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
                        <div class="EMClearLeft"></div>
                    </div>
                </div>
            </div>
            <%-- Undecided Opinion --%>
            <div class="EMBackgroundYellow EMOverflowHidden">
                <div class="EMMarginAllTen" style="max-width: 700px;">
                    <p class="EMMarginBottomTen">
                        <asp:ImageButton runat="server" ImageUrl='<%# Page.ResolveUrl(EMConstants.GetIconEmptyCheck()) %>' CssClass="EMVAlignMiddle" />  
                        <asp:Label ID="lblIndividualVoteUndecided" runat="server" CssClass="EMBoldText EMHeader3Text"><%# Undecided %></asp:Label>
                        <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_AD_UNDECIDED_MEMBERS" CssClass="EMHeader3Text" />
                    </p>
                    <ul class="EMOverflowHidden">
                        <asp:Repeater ID="rUndecidedMembers" runat="server">
                            <ItemTemplate>
                                <li class="EMFloatLeft EMMarginBottomTwenty EMMarginRightTwenty">
                                    <ul class="EMOverflowHidden">
                                        <li class="EMFloatLeft">
                                            <asp:Image runat="server" CssClass="EMProfileImage" ImageUrl='<%# Page.ResolveUrl(Jenzabar.EX.Common.Constants.ContactProfileImageHandler + "?ID=" + Eval("ID")) %>' />
                                        </li>
                                        <li class="EMFloatLeft EMMarginLeftFive">
                                            <p class="EMBoldText"><%# Eval("Name") %></p>
                                            <p class="EMMarginTopThree">
                                                <asp:Image runat="server" ImageUrl='<%# Page.ResolveUrl(EMConstants.GetIconEmailSmall()) %>' CssClass="EMVAlignMiddle" />
                                                <asp:HyperLink runat="server" NavigateUrl='<%# "mailto:" + Eval("Email") %>'>
                                                    <jenzabar:GlobalizedLiteral runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_EMAIL" />&nbsp;<%# Eval("FirstName") %>
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
        </div>
        <div class="EMModalButtons">
            <jenzabar:GlobalizedLinkButton ID="glbIndividualVotesClose" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_CLOSE" />
        </div>
    </div>
</asp:Panel>

<%-- Email Committee Modal Popup --%>
<ajaxToolkit:ModalPopupExtender ID="modalEmailCommittee" runat="server" TargetControlID="glbEmailCommittee" PopupControlID="pnlEmailCommittee" PopupDragHandleControlID="pnlEmailCommitteeHeader" CancelControlID="glbEmailCommitteeClose" BackgroundCssClass="EMModalBackground" />
<asp:Panel ID="pnlEmailCommittee" runat="server" CssClass="EMModalPopup">
    <div class="EMModalInner EMOverflowAuto">
        <asp:Panel ID="pnlEmailCommitteeHeader" runat="server" CssClass="EMModalHeader">
            <jenzabar:globalizedliteral Runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_AD_EMAIL_COMMITTEE" />
            <asp:ImageButton runat="server" CssClass="EMModalHeaderImg" ImageUrl='<%# Page.ResolveUrl(EMConstants.GetIconClose()) %>' />         
        </asp:Panel>
        <div>
            <div class="EMMarginAllTen EMTextAlignCenter">
                <p>
                    <asp:Image runat="server" ImageUrl='<%# Page.ResolveUrl(EMConstants.GetIconEmailSmall()) %>' CssClass="EMVAlignMiddle" />
                    <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_AD_SEND_EMAIL" CssClass="EMLightText" />
                </p>
                <p class="EMMarginTopFive">
                    <asp:DropDownList ID="ddlEmailCommittee" runat="server" />
                </p>
                <p class="EMMarginTopFive">
                    <jenzabar:GlobalizedButton runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_AD_COMPOSE_EMAIL" OnClick="gbtnEmailCommittee_Click" />
                </p>
            </div>
        </div>
        <div class="EMModalButtons">
            <jenzabar:GlobalizedLinkButton ID="glbEmailCommitteeClose" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_CLOSE" />
        </div>
    </div>
</asp:Panel>

<%-- Post Vote Modal Popup --%>
<ajaxToolkit:ModalPopupExtender ID="modalPostVote" runat="server" TargetControlID="btnPostVoteHidden" PopupControlID="pnlPostVote" PopupDragHandleControlID="pnlPostVoteHeader" CancelControlID="glbPostVoteCancel" BackgroundCssClass="EMModalBackground" />
<asp:Button ID="btnPostVoteHidden" runat="server" style="display: none;" />
<asp:Panel ID="pnlPostVote" runat="server" CssClass="EMModalPopup">
    <div class="EMModalInner EMOverflowAuto">
        <asp:Panel ID="pnlPostVoteHeader" runat="server" CssClass="EMModalHeader">
            <jenzabar:globalizedliteral Runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_AD_VOTE_SUCCESSFUL" />
            <asp:ImageButton runat="server" CssClass="EMModalHeaderImg" ImageUrl='<%# Page.ResolveUrl(EMConstants.GetIconClose()) %>' />         
        </asp:Panel>
        <div class="EMMarginAllTwenty" style="max-width: 600px;">
            <asp:Image ID="imgPostVote" runat="server" CssClass="EMFloatLeft EMMarginRightTen" />
            <asp:Label ID="lblPostVote" runat="server" />
            <asp:TextBox ID="txtReason" runat="server" TextMode="MultiLine" Width="600" Height="150" CssClass="EMMarginTopTen" />
        </div>
        <div class="EMModalButtons EMClearLeft">
            <jenzabar:GlobalizedLinkButton ID="glbPostVote" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_AD_SAVE_COMMENT" CssClass="EMMarginRightFive" OnClick="glbPostVote_Click" />
            <jenzabar:GlobalizedLinkButton ID="glbPostVoteCancel" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_AD_NO_THANKS" CssClass="EMMarginLeftFive" />
        </div>
        <p class="EMMarginAllTwenty">
            <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_AD_ALSO_COMMENT" CssClass="EMLightText" />
        </p>
    </div>
</asp:Panel>

<%-- Administrator Confirm Modal Popup --%>
<ajaxToolkit:ModalPopupExtender ID="modalAdminConfirm" runat="server" TargetControlID="btnAdminConfirmHidden" PopupControlID="pnlAdminConfirm" PopupDragHandleControlID="pnlAdminConfirmHeader" CancelControlID="glbAdminConfirmCancel" BackgroundCssClass="EMModalBackground" />
<asp:Button ID="btnAdminConfirmHidden" runat="server" style="display: none;" />
<asp:Panel ID="pnlAdminConfirm" runat="server" CssClass="EMModalPopup">
    <div class="EMModalInner EMOverflowAuto">
        <asp:Panel ID="pnlAdminConfirmHeader" runat="server" CssClass="EMModalHeader">
            <asp:Literal ID="lAdminConfirm" runat="server" />
            <asp:ImageButton runat="server" CssClass="EMModalHeaderImg" ImageUrl='<%# Page.ResolveUrl(EMConstants.GetIconClose()) %>' />         
        </asp:Panel>
        <div class="EMMarginAllTwenty" style="max-width: 600px;">
            <asp:Image ID="imgAdminConfirm" runat="server" CssClass="EMFloatLeft EMMarginRightFive" />
            <asp:Label ID="lblAdminConfirm" runat="server" CssClass="EMMarginAllThree" />
        </div>
        <div class="EMModalButtons EMClearLeft">
            <asp:LinkButton ID="lbAdminConfirmApprove" runat="server" CssClass="EMMarginRightFive" OnClick="lbAdminConfirmApprove_Click" Visible="false" />
            <asp:LinkButton ID="lbAdminConfirmDeny" runat="server" CssClass="EMMarginRightFive" OnClick="lbAdminConfirmDeny_Click" Visible="false" />
            <jenzabar:GlobalizedLinkButton ID="glbAdminConfirmCancel" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_AD_NOT_NOW" CssClass="EMMarginLeftFive" />
        </div>
    </div>
</asp:Panel>

<%-- Feedback --%>
<div class="EMMarginTopTwenty">
    <p class="EMPaddingTopTwenty">
        <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_AD_DISCUSSION_ABOUT" CssClass="EMLightText" />
    </p>
    <fb:FeedbackView runat="server" FeedbackGOID="<%# Applicant.Goid %>" IsModalFeedback="<%# false %>"
        AttachmentUseCde="<%# StaffConstants.AttachmentUseHRHiring %>" AttachmentTypeCde="<%# StaffConstants.AttachmentTypeHRSupport %>" />
</div>

</div>