<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MatchingManageQuestion.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.ManageQuestion.MatchingManageQuestion" %>
<%@ Register TagPrefix="cmn" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register Src="ChoiceManage.ascx" TagName="ChoiceManage" TagPrefix="cwk" %>
<%@ Register Src="../../../../Common/Controls/FeedbackEditor.ascx" TagName="Feedback" TagPrefix="cwk" %>
<asp:Label ID="lblErrGeneral" runat="server" CssClass="FormTxtErr" />
<div>
	<asp:GridView ID="_gvMatch" EnableViewState='false' FooterStyle-CssClass="optionFooter" ShowFooter="true" GridLines="None" CssClass="questionTable matchTable" AutoGenerateColumns="false" runat="server">
		<Columns>
			<asp:TemplateField FooterStyle-CssClass="addItems">
				<ItemTemplate>
                    <asp:Label ID="lblErrCorrectMatchNoObject" runat="server" />
					<cwk:ChoiceManage id="_choice" runat="server" />
				</ItemTemplate>
				<FooterTemplate>
						<cmn:ImageAndTextButton id="_itbAddOptions"  runat="server" /> 
				</FooterTemplate>
			</asp:TemplateField>
			<asp:TemplateField>
				<ItemTemplate>
					<asp:HiddenField ID="_hideOrder" runat="server" />
                    <div><asp:Label ID="lblErrObjectNoCorrectMatch" runat="server" /></div>
					<asp:TextBox ID="_txtMatch" CssClass="questionInput" runat="server" />
				</ItemTemplate>
				<FooterTemplate>
					<cmn:ImageAndTextButton id="_itbAddDistractors" runat="server" />
				</FooterTemplate>
			</asp:TemplateField>
			<asp:TemplateField>
				<ItemTemplate>
					<asp:Panel ID="_panHiddenFeedback" style="display:none;" runat="server"></asp:Panel>
					<cwk:Feedback id="_feedback" runat="server" />
				</ItemTemplate>
			</asp:TemplateField>
			<asp:TemplateField>
				<ItemTemplate>
					<asp:LinkButton ID="_lbtnClear" CssClass="clearButton" runat="server" />
				</ItemTemplate>
			</asp:TemplateField>
		</Columns>
	</asp:GridView>
</div>
<div class="questionOptions">
	<div>
		<asp:CheckBox ID="_cbxRandomize" runat="server" />
	</div>
	<div>
		<asp:CheckBox ID="_cbxRandomizeMatches" runat="server" />
	</div>
	<div>
		<asp:CheckBox ID="_cbxFilterMatches" runat="server" />
	</div>
	<div>
		<asp:CheckBox ID="_cbxPartialCredit" runat="server" />
	</div>
</div>
