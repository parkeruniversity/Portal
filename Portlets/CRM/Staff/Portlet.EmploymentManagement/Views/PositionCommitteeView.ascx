<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PositionCommitteeView.ascx.cs" Inherits="Jenzabar.CRM.Staff.Web.Portlets.EmploymentManagementPortlet.PositionCommitteeView" %>
<%@ Import Namespace="Jenzabar.CRM.Staff.Web.Portlets.EmploymentManagementPortlet" %>
<%@ Import Namespace="Jenzabar.CRM.Staff.Common" %>
<%@ Import Namespace="Jenzabar.EX.Common" %>
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
        <li class="EMFloatLeft"><asp:Image runat="server" ImageUrl='<%# Page.ResolveUrl(EMConstants.GetIconPeopleLarge()) %>' /></li>
        <li class="EMFloatLeft">
            <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_HIRING_COMMITTEE" CssClass="EMHeader3Text EMBoldText" />            
            <br />
            <asp:Label ID="lblHiringCommitteePeople" runat="server" CssClass="EMLightText" />
        </li>        
    </ul>
</div>

<%-- Email Hiring Committee --%>
<div class="EMClearLeft EMBackgroundBlue EMBorderAllGray EMDisplayInlineBlock EMMarginTopTen EMOverflowHidden">
    <p class="EMPaddingAllTen">
        <asp:Image runat="server" ImageUrl='<%# Page.ResolveUrl(EMConstants.GetIconEmailSmall()) %>' CssClass="EMVAlignMiddle" />
        <jenzabar:GlobalizedHyperLink ID="ghlCommitteeEmails" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PHC_EMAIL" CssClass="EMVAlignMiddle" />        
    </p>
</div>

<%-- Position Manager --%>
<div class="EMMarginTopTen">
    <p>
        <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PHC_POSITION_MANAGER" CssClass="EMLightText" />
    </p>
    <asp:Repeater ID="rAdministrator" runat="server" OnItemDataBound="rAdministrator_ItemDataBound">
        <ItemTemplate>
            <div class="EMOverflowHidden EMMarginTopTen">
                <ul class="EMOverflowHidden EMMarginAllFive">
                    <li class="EMFloatLeft">
                        <asp:Image runat="server" CssClass="EMProfileImage" ImageUrl='<%# Page.ResolveUrl(Jenzabar.EX.Common.Constants.ContactProfileImageHandler + "?ID=" + Eval("ID")) %>' />
                    </li>
                    <li class="EMFloatLeft EMMarginLeftFive">
                        <p>
                            <asp:Label runat="server" Text='<%# Eval("Name") %>' CssClass="EMHeader3Text EMBoldText" />
                        </p>
                        <p class="EMMarginTopThree">
                            <asp:Label runat="server" Text='<%# Eval("HeldPosition") %>' />
                            <asp:Image runat="server" ImageUrl='<%# Page.ResolveUrl(EMConstants.GetIconEmailSmall()) %>' CssClass="EMVAlignMiddle" />
                            <asp:HyperLink ID="hlEmail" runat="server" NavigateUrl='<%# "mailto:" + Eval("Email") %>' />
                        </p>
                        <div id="dDecisions" runat="server">
                            <p class="EMMarginTopThree">
                                <asp:Label ID="lblDecisions" runat="server" CssClass="EMLightText" />
                            </p>
                            <ul class="EMMarginTopThree">
                                <li class="EMFloatLeft">
                                    <asp:Image runat="server" ImageUrl='<%# Page.ResolveUrl(EMConstants.GetIconCheckSmall()) %>' CssClass="EMVAlignMiddle" />
                                    <asp:Label runat="server" Text='<%# Eval("YesVotes") %>' />
                                    <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PHC_YES_VOTE" />
                                </li>
                                <li class="EMFloatLeft EMMarginLeftTen">
                                    <asp:Image runat="server" ImageUrl='<%# Page.ResolveUrl(EMConstants.GetIconCrossSmall()) %>' CssClass="EMVAlignMiddle" />
                                    <asp:Label runat="server" Text='<%# Eval("NoVotes") %>' />
                                    <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PHC_NO_VOTE" />
                                </li>
                                <li id="lUndecided" runat="server" class="EMFloatLeft EMMarginLeftTen">
                                    <asp:Image runat="server" ImageUrl='<%# Page.ResolveUrl(EMConstants.GetIconEmptyCheck()) %>' CssClass="EMVAlignMiddle" />
                                    <asp:Label runat="server" Text='<%# Eval("Undecided") %>' CssClass="EMBoldText" />
                                    <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_UNDECIDED" CssClass="EMBoldText" />
                                </li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </div>
            <br />
        </ItemTemplate>
    </asp:Repeater>
</div>

<%-- Committee Members --%>
<div class="EMBorderTopGrayDashed EMMarginTopTen">
    <p class="EMMarginTopFive">
        <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PHC_OTHER_MEMBERS" CssClass="EMLightText" />
    </p>
    <asp:Repeater ID="rMember" runat="server" OnItemDataBound="rMember_ItemDataBound">
        <ItemTemplate>
            <div id="dWrapper" runat="server" class="EMOverflowHidden EMDisplayInlineBlock EMMarginTopTen">
                <ul class="EMOverflowHidden EMMarginAllFive">
                    <li class="EMFloatLeft">
                        <asp:Image runat="server" CssClass="EMProfileImage" ImageUrl='<%# Page.ResolveUrl(Jenzabar.EX.Common.Constants.ContactProfileImageHandler + "?ID=" + Eval("ID")) %>' />
                    </li>
                    <li class="EMFloatLeft EMMarginLeftFive">
                        <p>
                            <asp:Label runat="server" Text='<%# Eval("Name") %>' CssClass="EMHeader3Text EMBoldText" />
                        </p>
                        <p class="EMMarginTopThree">
                            <asp:Label runat="server" Text='<%# Eval("HeldPosition") %>' />
                            <asp:Image runat="server" ImageUrl='<%# Page.ResolveUrl(EMConstants.GetIconEmailSmall()) %>' CssClass="EMVAlignMiddle" />
                            <asp:HyperLink ID="hlEmail" runat="server" NavigateUrl='<%# "mailto:" + Eval("Email") %>' />
                        </p>
                        <p class="EMMarginTopThree">
                            <asp:Label ID="lblDecisions" runat="server" CssClass="EMLightText" />
                        </p>
                        <ul class="EMMarginTopThree">
                            <li class="EMFloatLeft">
                                <asp:Image runat="server" ImageUrl='<%# Page.ResolveUrl(EMConstants.GetIconCheckSmall()) %>' CssClass="EMVAlignMiddle" />
                                <asp:Label runat="server" Text='<%# Eval("YesVotes") %>' />
                                <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PHC_YES_VOTE" />
                            </li>
                            <li class="EMFloatLeft EMMarginLeftTen">
                                <asp:Image runat="server" ImageUrl='<%# Page.ResolveUrl(EMConstants.GetIconCrossSmall()) %>' CssClass="EMVAlignMiddle" />
                                <asp:Label runat="server" Text='<%# Eval("NoVotes") %>' />
                                <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PHC_NO_VOTE" />
                            </li>
                            <li id="lUndecided" runat="server" class="EMFloatLeft EMMarginLeftTen">
                                <asp:Image runat="server" ImageUrl='<%# Page.ResolveUrl(EMConstants.GetIconEmptyCheck()) %>' CssClass="EMVAlignMiddle" />
                                <asp:Label runat="server" Text='<%# Eval("Undecided") %>' CssClass="EMBoldText" />
                                <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_UNDECIDED" CssClass="EMBoldText" />
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
            <br />
        </ItemTemplate>
    </asp:Repeater>
</div>

</div>
