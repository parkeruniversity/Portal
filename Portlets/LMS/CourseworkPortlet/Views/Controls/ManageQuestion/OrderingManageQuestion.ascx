<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OrderingManageQuestion.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.ManageQuestion.OrderingManageQuestion" %>
<%@ Register TagPrefix="cmn" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register Src="ChoiceManage.ascx" TagName="ChoiceManage" TagPrefix="cwk" %>
<%@ Register Src="../../../../Common/Controls/FeedbackEditor.ascx"  TagName="Feedback" TagPrefix="cwk" %>
<asp:Label ID="lblErrGeneral" runat="server" />
<div>
	<asp:GridView ID="_gvOrdering" EnableViewState='false' ShowFooter="true" GridLines="None" CssClass="questionTable" AutoGenerateColumns="false" runat="server">
		<Columns>
			<asp:TemplateField >
				<ItemTemplate>
					<asp:Label ID="_lblOrder" runat="server" />
				</ItemTemplate>
				<FooterTemplate>
					<cmn:ImageAndTextButton id="_itbAdd" runat="server" /> 
				</FooterTemplate>
			</asp:TemplateField>
			<asp:TemplateField>
				<ItemTemplate>
					<cwk:ChoiceManage id="_choice" runat="server" />
				</ItemTemplate>
			</asp:TemplateField>
		<asp:TemplateField >
				<ItemTemplate>
					<asp:Panel ID="_panHiddenFeedback" style="display:none;" runat="server"></asp:Panel>
					<cwk:Feedback id="_feedback" runat="server" />
				</ItemTemplate>
			</asp:TemplateField>
			<asp:TemplateField >
				<ItemTemplate>
					<asp:LinkButton ID="_lbtnClear" CssClass="clearButton" runat="server" />
				</ItemTemplate>
			</asp:TemplateField>
		</Columns>
	</asp:GridView>
</div>
<div class="questionOptions">
	<div>
		<asp:CheckBox ID="_cbxPartial" runat="server" />
	</div>
</div>