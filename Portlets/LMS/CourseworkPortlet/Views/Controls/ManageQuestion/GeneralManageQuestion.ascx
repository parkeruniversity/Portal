<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GeneralManageQuestion.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.ManageQuestion.GeneralManageQuestion" %>
<%@ Register TagPrefix="cmn" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register Src="../RichTextEditor.ascx" TagName="RichText" TagPrefix="cwk" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<div class="assignmentStepHeader"><asp:Label ID="_lbl1" runat="server" /> <asp:Label ID="_lblWrite" CssClass="headerText" runat="server" /></div>
<div class="notifyMsgBox" id="divValidationNotification" runat="server">
    <span class="notifyTitle"><asp:Label ID="lblNotReady" runat="server" /></span><p/>
    <asp:Label ID="lblNotReadyMsg" runat="server" />
</div>
<div class="manageQuestionContent">
    <div class="manageSection">
        <asp:Label ID="lblErrLabel" runat="server" />
    </div>
	<div class="manageSection">        
		<asp:Label ID="_lblLabel" CssClass="manageTitle" runat="server" />
		<div class="manageContent">
			<asp:TextBox ID="_txtLabel" Width="250" MaxLength="50" runat="server" />
			<asp:Label ID="_lblLabelInfo" CssClass="extraInfo" runat="server" />
		</div>
	</div>
    <div class="manageSection">
        <asp:Label ID="lblErrText" runat="server" />
    </div>
	<div class="manageSection">        
		<asp:Label ID="_lblText" CssClass="manageTitle" runat="server" />
		<div class="manageContent">
			<asp:UpdatePanel ID="_update" runat="server">
				<ContentTemplate>
					<cwk:RichText ID="_richText"  runat="server" />
				</ContentTemplate>
			</asp:UpdatePanel>
		</div>
	</div>
	<asp:Panel ID="_panPointValue" CssClass="manageSection" runat="server">
		<asp:Label ID="_lblPoint" CssClass="manageTitle" runat="server" />
		<div class="manageContent">
            <asp:Label ID="lblErrPointVal" runat="server" />
			<div>
				<asp:TextBox ID="_txtPoint" runat="server" />
			</div>
			<div class="generalExtra" id="_divExtra" runat="server">
				<asp:CheckBox ID="_cbxExtraCredit" runat="server" />
				<br />
				<asp:Label id="_lblExtraInfo" CssClass="extraInfo" runat="server" />
			</div>
		</div>
	</asp:Panel>
</div>