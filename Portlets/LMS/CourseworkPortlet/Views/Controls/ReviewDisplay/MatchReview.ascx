<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MatchReview.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.ReviewDisplay.MatchReview" %>
<%@ Register TagPrefix="cwk" TagName="RichText" Src="../RichTextDisplay.ascx" %>
<asp:GridView ID="_gvChoices" CellSpacing="4" runat="server" AutoGenerateColumns="false" CssClass="matchReview" GridLines="None" ShowFooter="false">
	<Columns>
		<asp:TemplateField HeaderStyle-CssClass="reviewHeader">
			<ItemTemplate>
				<cwk:RichText ID="_rt" runat="server" />
			</ItemTemplate>
		</asp:TemplateField>
		<asp:TemplateField ItemStyle-CssClass="matchIcon" HeaderStyle-CssClass="reviewHeader">
			<ItemTemplate>
				<asp:Label id="_lblSelection" runat="server" />
			</ItemTemplate>
		</asp:TemplateField>
		<asp:TemplateField>
			<ItemTemplate>
				<img src='<%#GetCorrectIcon(Eval("CorrectMatch"),Eval("SelectedMatch")) %>' />
			</ItemTemplate>
		</asp:TemplateField>
		<asp:TemplateField ItemStyle-CssClass="matchAnswerKey" HeaderStyle-CssClass="reviewHeader">
			<ItemTemplate>
                <div runat="server" id="_divCorrectAnswer" class="correctAnswer">
				    <asp:Label ID="_lblCorrect" CssClass="matchCorrect" runat="server" />
                </div>
				<asp:Image ID="_imgFeedback" runat="server" />
				<asp:Panel ID="_panFeedback" CssClass="feedbackDisplay" runat="server">
					<div class="choiceWedge"></div>
					<div class="choiceWedgeOutline"></div>
					<div class="feedbackEntry">
						<asp:Literal ID="_litFeedback" runat="server" />
					</div>
				</asp:Panel>
			</ItemTemplate>
		</asp:TemplateField>
	</Columns>
</asp:GridView>
<asp:Label ID="_lblNoAnswer" CssClass="studentNameDisplay" runat="server" />