<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MainView.ascx.cs" Inherits="Jenzabar.CRM.Staff.Web.Portlets.EmploymentManagementPortlet.MainView" %>
<%@ Import Namespace="Jenzabar.CRM.Staff.Web.Portlets.EmploymentManagementPortlet" %>
<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="ajaxToolkit" Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" %>

<div class="EMPage">

<%-- Setup & Have an opening Section --%>
<asp:Panel ID="pnlOptions" runat="server" CssClass="EMMainPnlOptions">
    <asp:Panel ID="pnlSetup" runat="server" CssClass="EMMarginBottomTwenty">
        <span class="EMHeader2Text"><jenzabar:globalizedliteral Runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_SETUP" /></span>
        <p>
            <jenzabar:globalizedliteral Runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_M_SETUP_PARAGRAPH" />
            <jenzabar:GlobalizedLinkButton ID="glbSetupSettings" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_M_SETUP_LINK" OnClick="glbSetupSettings_Click" />
        </p>
    </asp:Panel>
    <asp:Panel ID="pnlOpening" runat="server" CssClass="EMMarginTopTwenty">
        <span class="EMHeader2Text"><jenzabar:globalizedliteral Runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_M_OPENING_HEADER" /></span>
        <p class="EMBackgroundBlue EMBorderAllGray EMPaddingAllTen">
            <jenzabar:globalizedliteral Runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_M_OPENING_PARAGRAPH" />
            <jenzabar:GlobalizedLinkButton ID="glbNewPosition" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_M_OPENING_PARAGRAPH_LINK" OnClick="glbNewPosition_Click" />            
        </p>            
    </asp:Panel>
    <asp:Panel ID="pnlRecentRequestLink" runat="server" CssClass="EMMarginTopFive">
        <jenzabar:GlobalizedLinkButton ID="glbRecentRequests" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_M_OPENING_RECENT_LINK" CssClass="EMItalicText" />        
    </asp:Panel>
</asp:Panel>

<%-- Your Approval Committee & Hiring Committee & Audit & Admin Section --%>
<asp:Panel ID="pnlCommittees" runat="server" CssClass="EMMainPnlCommittees">
    <%-- Your Approval Committee Section --%>
    <asp:Panel ID="pnlApprovalCommittee" runat="server" CssClass="EMBorderAllGray EMMarginBottomTwenty">
        <div class="EMHeader2Text EMBackgroundGreen EMCapitalize EMBoldText EMPaddingAllFive"><jenzabar:globalizedliteral Runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_M_AC_HEADER" /></div>
        <asp:Panel ID="pnlApprovalCommitteeNew" runat="server" CssClass="EMBackgroundYellow EMBorderTopBottomBlack">
            <div class="EMMarginAllFive">
                <asp:Label ID="lblApprovalPositionNewHeader" runat="server" CssClass="EMHeader3Text" />
                <asp:Repeater ID="rApprovalNew" runat="server" OnItemDataBound="rApprovalNew_ItemDataBound">
                    <ItemTemplate>
                        <div class="EMMarginTopTen EMMarginBottomTen">
                            <asp:LinkButton runat="server" CssClass="EMPositionTitle" CommandName="ID" CommandArgument='<%# Eval("ID") %>' OnCommand="lbApprovalPosition_Command"><%# Eval("Title") %></asp:LinkButton>
                            <asp:LinkButton runat="server" CssClass="EMPositionNumber" CommandName="ID" CommandArgument='<%# Eval("ID") %>' OnCommand="lbApprovalPosition_Command">#<%# Eval("ID") %></asp:LinkButton><asp:Label ID="lblApprovalNew" runat="server" CssClass="EMLightText" />
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </asp:Panel>
        <asp:Panel ID="pnlApprovalCommitteeOld" runat="server" CssClass="EMMarginAllFive">
            <p><asp:Label ID="lblApprovalPositionOldHeader" runat="server" CssClass="EMLightText" /></p>
            <asp:Repeater ID="rApprovalOld" runat="server" OnItemDataBound="rApprovalOld_ItemDataBound">
                <ItemTemplate>
                    <div class="EMMarginTopTen EMMarginBottomTen">
                        <asp:ImageButton runat="server" ImageUrl='<%# Page.ResolveUrl(EMConstants.GetIconCheckSmall()) %>' />
                        <asp:LinkButton runat="server" CssClass="EMPositionTitle" CommandName="ID" CommandArgument='<%# Eval("ID") %>' OnCommand="lbApprovalPosition_Command"><%# Eval("Title") %></asp:LinkButton>
                        <asp:LinkButton runat="server" CssClass="EMPositionNumber" CommandName="ID" CommandArgument='<%# Eval("ID") %>' OnCommand="lbApprovalPosition_Command">#<%# Eval("ID") %></asp:LinkButton><asp:Label ID="lblApprovalOld" runat="server" CssClass="EMLightText" />
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </asp:Panel>
    </asp:Panel>
    <%-- Your Hiring Committee Section --%>
    <asp:Panel ID="pnlHiringCommittee" runat="server" CssClass="EMBorderAllGray EMMarginBottomTwenty">
        <div class="EMHeader2Text EMBackgroundGreen EMCapitalize EMBoldText EMPaddingAllFive"><jenzabar:globalizedliteral Runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_M_HC_HEADER" /></div>
        <div class="EMMarginAllFive">
            <p class="EMLightText"><jenzabar:globalizedliteral Runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_M_HC_PARAGRAPH" /></p>
            <p class="EMLightText EMItalicText EMMarginTopTen"><jenzabar:globalizedliteral Runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_M_HC_INFORMATION" /></p>
            <asp:Repeater ID="rHiring" runat="server" OnItemDataBound="rHiring_ItemDataBound">
                <ItemTemplate>
                    <div class="EMMarginTopTwenty EMMarginBottomTwenty">
                        <asp:LinkButton runat="server" CssClass="EMPositionTitle" CommandName="ID" CommandArgument='<%# Eval("ID") %>' OnCommand="lbPosition_Command"><%# Eval("Title") %></asp:LinkButton>
                        <asp:LinkButton runat="server" CssClass="EMPositionNumber" CommandName="ID" CommandArgument='<%# Eval("ID") %>' OnCommand="lbPosition_Command">#<%# Eval("ID") %></asp:LinkButton>
                        <p><asp:Label ID="lblHiringCommitteeDepartment" runat="server" CssClass="EMLightText" /></p>
                        <p><asp:Label ID="lblHiringCommitteeStatus" runat="server" /></p>
                        <p><asp:Label ID="lblHiringCommitteeAction" runat="server" /></p>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </asp:Panel>
    <%-- Your Audit Section --%>
    <asp:Panel ID="pnlAudit" runat="server" CssClass="EMBorderAllGray EMMarginBottomTwenty">
        <div class="EMHeader2Text EMBackgroundGreen EMCapitalize EMBoldText EMPaddingAllFive"><jenzabar:globalizedliteral Runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_M_A_HEADER" /></div>
        <div class="EMMarginAllFive">
            <p class="EMLightText"><jenzabar:globalizedliteral Runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_M_A_PARAGRAPH" /></p>
            <p class="EMLightText EMItalicText EMMarginTopTen"><jenzabar:globalizedliteral Runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_M_HC_INFORMATION" /></p>
            <asp:Repeater ID="rAudit" runat="server" OnItemDataBound="rAudit_ItemDataBound">
                <ItemTemplate>
                    <div class="EMMarginTopTwenty EMMarginBottomTwenty">
                        <asp:LinkButton runat="server" CssClass="EMPositionTitle" CommandName="ID" CommandArgument='<%# Eval("ID") %>' OnCommand="lbPosition_Command"><%# Eval("Title") %></asp:LinkButton>
                        <asp:LinkButton runat="server" CssClass="EMPositionNumber" CommandName="ID" CommandArgument='<%# Eval("ID") %>' OnCommand="lbPosition_Command">#<%# Eval("ID") %></asp:LinkButton>
                        <p><asp:Label ID="lblAuditDepartment" runat="server" CssClass="EMLightText" /></p>
                        <p><asp:Label ID="lblAuditStatus" runat="server" /></p>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </asp:Panel>
    <%-- Your Admin Section --%>
    <asp:Panel ID="pnlAdmin" runat="server" CssClass="EMBorderAllGray EMMarginBottomTwenty">
        <div class="EMHeader2Text EMBackgroundGreen EMCapitalize EMBoldText EMPaddingAllFive"><jenzabar:globalizedliteral Runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_M_ADMIN_HEADER" /></div>
        <div class="EMMarginAllFive">
            <p class="EMLightText"><jenzabar:globalizedliteral Runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_M_ADMIN_PARAGRAPH" /></p>
            <p class="EMLightText EMItalicText EMMarginTopTen"><jenzabar:globalizedliteral ID="Globalizedliteral3" Runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_M_HC_INFORMATION" /></p>
            <asp:Repeater ID="rAdmin" runat="server" OnItemDataBound="rAdmin_ItemDataBound">
                <ItemTemplate>
                    <div class="EMMarginTopTwenty EMMarginBottomTwenty">                                           
                        <p class="EMMarginBottomThree">
                            <asp:LinkButton ID="lbAdminTitleApproval" runat="server" CssClass="EMPositionTitle" CommandName="ID" CommandArgument='<%# Eval("ID") %>' OnCommand="lbApprovalPosition_Command" Visible="false"><%# Eval("Title") %></asp:LinkButton>
                            <asp:LinkButton ID="lbAdminNumberApproval" runat="server" CssClass="EMPositionNumber" CommandName="ID" CommandArgument='<%# Eval("ID") %>' OnCommand="lbApprovalPosition_Command" Visible="false">#<%# Eval("ID") %></asp:LinkButton>
                            <asp:LinkButton ID="lbAdminTitleHiring" runat="server" CssClass="EMPositionTitle" CommandName="ID" CommandArgument='<%# Eval("ID") %>' OnCommand="lbPosition_Command" Visible="false"><%# Eval("Title") %></asp:LinkButton>
                            <asp:LinkButton ID="lbAdminNumberHiring" runat="server" CssClass="EMPositionNumber" CommandName="ID" CommandArgument='<%# Eval("ID") %>' OnCommand="lbPosition_Command" Visible="false">#<%# Eval("ID") %></asp:LinkButton> 
                        </p>
                        <p id="pRecentRequestsStatus1" runat="server" class="EMMarginBottomThree">
                            <asp:Image ID="imgRecentRequestsStatus1" runat="server" CssClass="EMVAlignMiddle" />
                            <asp:Label ID="lblRecentRequestsStatus1" runat="server" CssClass="EMVAlignMiddle" />
                        </p>
                        <p id="pRecentRequestsStatus2" runat="server" class="EMMarginBottomThree">
                            <asp:Image ID="imgRecentRequestsStatus2" runat="server" CssClass="EMVAlignMiddle" />
                            <asp:Label ID="lblRecentRequestsStatus2" runat="server" CssClass="EMVAlignMiddle" />
                        </p>
                        <p id="pRecentRequestsStatus3" runat="server" class="EMMarginBottomThree">
                            <asp:Image ID="imgRecentRequestsStatus3" runat="server" CssClass="EMVAlignMiddle" />
                            <asp:Label ID="lblRecentRequestsStatus3" runat="server" CssClass="EMVAlignMiddle" />
                        </p>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </asp:Panel>
</asp:Panel>

<%-- Recent Position Requests Modal Popup --%>
<ajaxToolkit:ModalPopupExtender ID="modalRecentRequests" runat="server" TargetControlID="glbRecentRequests" PopupControlID="pnlRecentRequests" PopupDragHandleControlID="pnlRecentRequestsHeader" CancelControlID="glbRecentRequestsClose" BackgroundCssClass="EMModalBackground" />
<asp:Panel ID="pnlRecentRequests" runat="server" CssClass="EMModalPopup">
    <div class="EMModalInner" style="min-width: 350px;">
        <asp:Panel ID="pnlRecentRequestsHeader" runat="server" CssClass="EMModalHeader">
            <jenzabar:GlobalizedLiteral Runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_M_RECENT_HEADER" />
            <asp:ImageButton runat="server" CssClass="EMModalHeaderImg" ImageUrl='<%# Page.ResolveUrl(EMConstants.GetIconClose()) %>' />         
        </asp:Panel>
        <div class="EMMarginAllTwenty">
            <asp:Repeater ID="rRecentRequests" runat="server" OnItemDataBound="rRecentRequests_ItemDataBound">
                <ItemTemplate>
                    <p class="EMMarginBottomThree">
                        <asp:LinkButton ID="lbRecentRequestsPositionTitleApproval" runat="server" CssClass="EMPositionTitle" CommandName="ID" CommandArgument='<%# Eval("ID") %>' OnCommand="lbApprovalPosition_Command" Visible="false"><%# Eval("Title") %></asp:LinkButton>
                        <asp:LinkButton ID="lbRecentRequestsPositionNumberApproval" runat="server" CssClass="EMPositionNumber" CommandName="ID" CommandArgument='<%# Eval("ID") %>' OnCommand="lbApprovalPosition_Command" Visible="false">#<%# Eval("ID") %></asp:LinkButton>
                        <asp:LinkButton ID="lbRecentRequestsPositionTitleHiring" runat="server" CssClass="EMPositionTitle" CommandName="ID" CommandArgument='<%# Eval("ID") %>' OnCommand="lbPosition_Command" Visible="false"><%# Eval("Title") %></asp:LinkButton>
                        <asp:LinkButton ID="lbRecentRequestsPositionNumberHiring" runat="server" CssClass="EMPositionNumber" CommandName="ID" CommandArgument='<%# Eval("ID") %>' OnCommand="lbPosition_Command" Visible="false">#<%# Eval("ID") %></asp:LinkButton>
                        <asp:Label ID="lblRecentRequestsPositionTitle" runat="server" Visible="false"><%# Eval("Title") %></asp:Label>
                        <asp:Label ID="lblRecentRequestsPositionNumber" runat="server" Visible="false">#<%# Eval("ID")%></asp:Label>
                    </p>
                    <p id="pRecentRequestsDepartment" runat="server" class="EMMarginBottomThree">
                        <asp:Label ID="lblRecentRequestsDepartment" runat="server" CssClass="EMLightText" />
                    </p>
                    <p id="pRecentRequestsStatus1" runat="server" class="EMMarginBottomThree">
                        <asp:Image ID="imgRecentRequestsStatus1" runat="server" CssClass="EMVAlignMiddle" />
                        <asp:Label ID="lblRecentRequestsStatus1" runat="server" CssClass="EMVAlignMiddle" />
                    </p>
                    <p id="pRecentRequestsStatus2" runat="server" class="EMMarginBottomThree">
                        <asp:Image ID="imgRecentRequestsStatus2" runat="server" CssClass="EMVAlignMiddle" />
                        <asp:Label ID="lblRecentRequestsStatus2" runat="server" CssClass="EMVAlignMiddle" />
                    </p>
                    <p id="pRecentRequestsStatus3" runat="server" class="EMMarginBottomThree">
                        <asp:Image ID="imgRecentRequestsStatus3" runat="server" CssClass="EMVAlignMiddle" />
                        <asp:Label ID="lblRecentRequestsStatus3" runat="server" CssClass="EMVAlignMiddle" />
                    </p>
                    <p class="EMMarginBottomTwenty"></p>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <div class="EMModalButtons">
            <jenzabar:GlobalizedLinkButton ID="glbRecentRequestsClose" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_CLOSE" />
        </div>
    </div>
</asp:Panel>

</div>