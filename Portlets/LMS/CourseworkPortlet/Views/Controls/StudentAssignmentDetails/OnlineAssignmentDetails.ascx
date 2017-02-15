<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OnlineAssignmentDetails.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.StudentAssignmentDetails.OnlineAssignmentDetails" %>
<%@ Register Src="OnlineAssignmentAttempts.ascx" TagName="OnlineAssignmentAttempts" TagPrefix="JICS" %>
<%@ Register TagPrefix="lms" TagName="Modal" Src="../../../../Common/Controls/Modal.ascx" %>
<script language="javascript" src="UI/Common/Scripts/jquery.blockui.js"></script>
<script language="javascript" type="text/javascript">
    function BlockUI() {
        $.blockUI({ message: $('#divBlock'), css: { border: 'none', background: 'transparent' }, overlayCSS: { backgroundColor: '#000', opacity: 0.3 } });
        return true;
    }
    function UnblockUI() {
        $.unblockUI();
    }
    function HidePasswordPopup() {
        $('#<%= _modalPassword.ModalClientID %>').hide();
    }

    Sys.Application.add_load(UnblockUI);
</script>

<asp:Panel runat="server" ID="_panInfo" CssClass="onlineAssignmentInfo">
	<asp:Label ID="_lblInfo" runat="server" />
	<asp:Label ID="_lblAttempts" runat="server" />
	<asp:Label ID="_lblGrading" runat="server" />
    <asp:Label ID="_lblTimeLimit" runat="server" />
	<asp:Label ID="_lblLate" runat="server" />
</asp:Panel>
<asp:Panel runat="server" ID="_panTakeAttempt">
	<lms:Modal id="_modalPassword" runat="server">
		<ContentArea>
			<div class="overrideContainer">
				<div class="overrideSpacer">
					<asp:Label ID="_lblPasswordInfo" runat="server" />
				</div>
				<div>
					<asp:Label ID="_lblPassword" runat="server" AssociatedControlID="_txtPassword" />
					<asp:TextBox id="_txtPassword" runat="server" Width="150" TextMode="Password" />
				</div>
				<div class="overrideSpacer">
					<asp:Label ID="_lbInvalid" runat="server" CssClass="lateText" />
				</div>
			</div>
		</ContentArea>
	</lms:Modal>

	<asp:Panel ID="_panRetakeInfo" CssClass="retakeInfo" runat="server">
		<asp:Literal ID="_litRetakeInfo" runat="server" />
	</asp:Panel>
	<asp:Label id="_lblWait" runat="server" />
    <asp:Panel ID="_secureBrowserTestPanel" runat="server" Visible="false">
        <div class="secureBrowserInfo">
            <div class="warning">
                <h5 class="locked"><%= Globalizer.Format("HDR_CWK_QUIZ_TAKEN_IN_SECURE_BROWSER", _orgTypeName) %></h5>
                <p>
                    <asp:Literal ID="_litSecureBrowserUseConfirmPage" runat="server" ></asp:Literal>
                </p>
                <p>
                    <a id="_lnkTestSecureBrowser" runat="server" class="testLink">
                        <%= Globalizer.GetString("MSG_CWK_OPEN_SECURE_BROWSER_CONFIRM_PAGE")%>
                    </a>
                </p>
                <p class="textWithEmbeddedLink">
                    <%= Globalizer.GetString("MSG_CWK_SECURE_BROWSER_CONFIRM_FAIL")%>
                </p>
                <span class="downloadLinks">
                    <%= Globalizer.GetString("MSG_CWK_DOWNLOAD_MAC_SECURE_BROWSER_LINK")%>
                    <%= Globalizer.GetString("MSG_CWK_DOWNLOAD_PC_SECURE_BROWSER_LINK")%>
                </span>
                <span>
                     <%= Globalizer.GetString("MSG_CWK_SECURE_BROWSER_USER_GUIDE_LINK")%>
                </span>
            </div>
            <div class="testStartWarning">
                <p>
                    <%= Globalizer.Format("MSG_CWK_LAUNCH_SECURE_BROWSER_INFO", _orgTypeName)%>
                </p>
            </div>
        </div>
    </asp:Panel>
    <asp:LinkButton runat="server" ID="_lbtnTakeAttempt" CssClass="startAttempt" OnClick="lnkStartAttempt_Click" />
    <asp:LinkButton runat="server" ID="_lbtnTurnIn" CssClass="turnInAssignment" OnClick="btnTurnInAssignment_Click" />
</asp:Panel>
<div id="divBlock" style="display:none;" >
    <img src="<%=GetAJAXImageUrl()%>" />
</div>
<asp:Panel ID="_secureBrowserReviewPanel" runat="server" Visible="false">
    <div class="secureBrowserInfo">
        <div class="launch">
            <h5 class="emphasis"><%= Globalizer.GetString("HDR_CWK_SECURE_BROWSER_REVIEW_LAUNCHER") %></h5>
            <p>
                <%= Globalizer.Format("MSG_CWK_SECURE_BROWSER_REVIEW_LAUNCHER_INTRO", _orgTypeName)%>
            </p>
            <p>
                <a id="_lnkLaunchSecureBrowser" runat="server" class="launchLink">
                    <%= Globalizer.Format("MSG_CWK_LAUNCH_SECURE_BROWSER_REVIEW", _orgTypeName)%>
                </a>
            </p>
            <p class="textWithEmbeddedLink">
                <%= Globalizer.GetString("MSG_CWK_SECURE_BROWSER_CONFIRM_FAIL")%>
            </p>
            <span class="downloadLinks">
                <%= Globalizer.GetString("MSG_CWK_DOWNLOAD_MAC_SECURE_BROWSER_LINK")%>
                <%= Globalizer.GetString("MSG_CWK_DOWNLOAD_PC_SECURE_BROWSER_LINK")%>
            </span>
            <span>
                    <%= Globalizer.GetString("MSG_CWK_SECURE_BROWSER_USER_GUIDE_LINK")%>
            </span>
        </div>
    </div>
</asp:Panel>
<asp:Panel ID="_secureBrowserDownloadPanel" runat="server" Visible="False">
    <div class="secureBrowserInfo">
        <div class="warning">
            <h5 class="locked"><%= Globalizer.Format("HDR_CWK_QUIZ_TAKEN_IN_SECURE_BROWSER", _orgTypeName) %></h5>
            <p>
                <asp:Literal ID="Literal1" runat="server" ></asp:Literal>
            </p>
            <p>
                <a id="_lnkTestSecureBrowser2" runat="server" class="testLink">
                    <%= Globalizer.GetString("MSG_CWK_OPEN_SECURE_BROWSER_CONFIRM_PAGE")%>
                </a>
            </p>
            <p class="textWithEmbeddedLink">
                <%= Globalizer.GetString("MSG_CWK_SECURE_BROWSER_CONFIRM_FAIL")%>
            </p>
            <span class="downloadLinks">
                <%= Globalizer.GetString("MSG_CWK_DOWNLOAD_MAC_SECURE_BROWSER_LINK")%>
                <%= Globalizer.GetString("MSG_CWK_DOWNLOAD_PC_SECURE_BROWSER_LINK")%>
            </span>
            <span>
                    <%= Globalizer.GetString("MSG_CWK_SECURE_BROWSER_USER_GUIDE_LINK")%>
            </span>
        </div>
    </div>
</asp:Panel>
<asp:Label CssClass="invalidTextMsg" ID="_lblNotValid" runat="server"/>
<br style="clear:both;"/>

<asp:Label ID="_lblAttemptInfo" runat="server" />
<JICS:OnlineAssignmentAttempts runat="server" ID="OnlineAssignmentAttempts" />