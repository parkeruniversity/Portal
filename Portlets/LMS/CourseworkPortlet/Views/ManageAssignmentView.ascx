<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ManageAssignmentView.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.ManageAssignmentView" %>
<%@ Register Src="Controls/GeneralAssignmentInfoForm.ascx" TagName="GeneralAssignmentInformation" TagPrefix="JICS" %>
<%@ Register Src="Controls/OnlineAssignmentOptionsForm.ascx" TagName="OnlineAssignmentOptions" TagPrefix="JICS" %>
<%@ Register Src="Controls/OfflineAssignmentOptionsForm.ascx" TagName="OfflineAssignmentOptions" TagPrefix="JICS" %>
<%@ Register Src="Controls/UploadedAssignmentOptionsForm.ascx" TagName="UploadedAssignmentOptions" TagPrefix="JICS" %>
<%@ Register Src="Controls/ForumAssignmentOptionsForm.ascx" TagName="ForumAssignmentOptions" TagPrefix="JICS" %>
<%@ Register Src="Controls/InstructionsAndFilesOptionsForm.ascx" TagName="InstructionsAndFilesOptions" TagPrefix="JICS" %>
<%@ Register Src="Controls/SelectAssignmentFormat.ascx" TagName="SelectAssignmentFormat" TagPrefix="JICS" %>
<%@ Register TagPrefix="framework" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Register TagPrefix="common" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register Src="../../Common/Controls/Modal.ascx" TagName="Modal" TagPrefix="lms" %>

<div class="cwkBorderButtonBar top" id="divTopBorder" runat="server">
    <div class="cwkBorderButtonBar mainScreenLink">
      <framework:PortalImageAndHyperLink ID="lnkBackToMain" TextKey="TXT_BACK_TO_MAIN_SCREEN" ImageCategory="PortletIcon" ImageUrl="back-arrow.gif" runat="server" />
    </div>
</div>

<div class="cwkBorderButtonBar helpScreenLink">
    <framework:PortalImageAndHyperLink ID="lnkHelp" TextKey="TXT_HELP_WITH_CREATING_AN_ASSIGNMENT" ImageCategory="PortletIcon" ImageUrl="icon-help.gif" runat="server" />
    <lms:Modal id="_modalHelp" runat="server">
	    <ContentArea>
            <div class="helpContent">
                <asp:Literal ID="_litInfo" runat="server" />
            </div>
        </ContentArea>
    </lms:Modal>
</div>

<div>
    <JICS:SelectAssignmentFormat ID="_SelectAssignmentFormat" runat="server" />
</div>
<div>
    <JICS:GeneralAssignmentInformation ID="_GeneralAssignmentInformation" runat="server" />
</div>
<div>
    <JICS:OnlineAssignmentOptions ID="_OnlineAssignmentOptions" runat="server" Visible="false" />
</div>
<div>
    <JICS:OfflineAssignmentOptions ID="_OfflineAssignmentOptions" runat="server" Visible="false" />
</div>
<div>
    <JICS:UploadedAssignmentOptions ID="_UploadedAssignmentOptions" runat="server" Visible="false" />
</div>
<div>
    <JICS:ForumAssignmentOptions ID="_ForumAssignmentOptions" runat="server" Visible="false" />
</div>
<div>
    <JICS:InstructionsAndFilesOptions ID="_InstructionsAndFilesOptions" runat="server" />
</div>


<div class="detailAction">
    <div class="detailActionDeleteAssignment">
        <asp:LinkButton ID="_linkBtnDeleteThisAssignment" runat="server" CssClass="imageAndText" />
    </div>
    <div class="buttons">
        <asp:Button ID="btnSaveAssignment" runat="server" />
    </div>
    <div class="detailActionAlert">
        <asp:Button ID="btnCancel" runat="server" />
    </div>    
</div>

<asp:HyperLink ID="_hypReopen" runat="server" style="visibility:hidden;" />
<lms:Modal id="_modalReopen" runat="server">
    <ContentArea>
        <div class="reopenAssignment">
            <asp:Literal ID="_litReopen" runat="server" />
            <div class="reopenSelection">
                <asp:DropDownList ID="_ddlReopen" runat="server" />
            </div>
        </div>
    </ContentArea>
</lms:Modal>

<common:Mirror ControlID="divTopBorder" runat="server" />
  