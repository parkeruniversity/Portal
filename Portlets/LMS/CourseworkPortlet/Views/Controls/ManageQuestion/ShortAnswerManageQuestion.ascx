<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ShortAnswerManageQuestion.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.ManageQuestion.ShortAnswerManageQuestion" %>
<%@ Register TagPrefix="cmn" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register src="AnswerFieldEditor.ascx" TagName="AnswerField" TagPrefix="cwk" %>
<%@ Register Src="../../../../Common/Controls/Modal.ascx" TagName="Modal" TagPrefix="lms" %>

<asp:Label ID="lblErrGeneral" runat="server" />
<asp:Repeater ID="_rptAnswerField" runat="server" EnableViewState="false">
	<ItemTemplate>
		<cwk:AnswerField id="_answerField" runat="server" />
	</ItemTemplate>
</asp:Repeater>
<div>
	<cmn:ImageAndTextButton id="_itbAdd"  runat="server" /> <asp:Label ID="_lblFieldInfo" runat="server" /> 
</div>
<div class="questionOptions">
	<div>
		<asp:CheckBox ID="_cbxPartial" runat="server" />
	</div>
</div>
<div >
    <asp:HyperLink runat="server" ID="_hypHelp" CssClass="helpLink" NavigateUrl="#"></asp:HyperLink>
    <lms:Modal id="_modal" runat="server">
	    <ContentArea>
            <div class="helpContent">
                <asp:Literal ID="_litInfo" runat="server" />
            </div>
        </ContentArea>
    </lms:Modal>
</div>