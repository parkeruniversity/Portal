<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ManageQuestionView.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.ManageQuestionView" %>
<%@ Register TagPrefix="cmn" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="framework" Assembly="Jenzabar.Portal.Framework.Web" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register tagname="General" tagprefix="cwk"  src="Controls/ManageQuestion/GeneralManageQuestion.ascx" %>
<%@ Register tagname="Feedback" tagprefix="cwk"  src="Controls/ManageQuestion/FeedbackManageQuestion.ascx" %>
<%@ Register tagname="FeedbackEditor" tagprefix="cwk"  src="../../Common/Controls/FeedbackEditor.ascx" %>
<%@ Register tagname="AnswerType" tagprefix="cwk"  src="Controls/ManageQuestion/AnswerTypeManageQuestion.ascx" %>

<cwk:FeedbackEditor id="_feMaster" HideFeedbackLink="true" runat="server" />
<div class="cwkBorderButtonBar top">
    <div style="float:right;"><asp:Literal ID="_litGroupName" runat="server"></asp:Literal></div>
	<framework:PortalImageAndHyperLink ID="_pihBack" ImageCategory="PortletIcon"  runat="server" />
</div>

<asp:PlaceHolder ID="_phLightBox" EnableViewState="false" runat="server" />

<cwk:General id="_general" EnableViewState="false" runat="server" />
	

<div class="assignmentStepHeader"><asp:Label ID="_lbl2" runat="server" /> <asp:Label ID="_lblDesign" CssClass="headerText" runat="server" /></div>
<div class="manageQuestionContent">
	<asp:UpdatePanel id="_update" runat="server">
		<ContentTemplate>
			<div class="answerType">
				<asp:Label id="_lblAnswerType" runat="server" /> <asp:DropDownList ID="_ddlAnswerType" runat="server" AutoPostBack="true" />
			</div>
            <cwk:AnswerType id="_answerType" runat="server" />
		</ContentTemplate>
	</asp:UpdatePanel>
</div>
<cwk:Feedback id="_feedback" runat="server" />
<asp:Panel ID="_panAction" CssClass="detailAction" runat="server">
    <div class="detailActionDeleteAssignment">
        <cmn:ImageAndTextButton ID="_itbDelete" runat="server"></cmn:ImageAndTextButton>
    </div>
	<div class="buttons">
		<cmn:GlobalizedButton ID="_gbtnSaveAddNew" runat="server" UseSubmitBehavior="false" OnClick="GBtnSaveAddNew_Click" />
		&nbsp;
		<cmn:GlobalizedButton ID="_gbtnSave" UseSubmitBehavior="true" runat="server" OnClick="GBtnSave_Click" />
	</div>
	<div class="detailActionAlert">
		<cmn:GlobalizedButton ID="_gbtnCancel" runat="server" OnClick="GBtnCancel_Click" />
	</div>
</asp:Panel>
<div class="cwkBorderButtonBar bottom">
	<cmn:Mirror ControlID="_pihBack" runat="server" />
</div>