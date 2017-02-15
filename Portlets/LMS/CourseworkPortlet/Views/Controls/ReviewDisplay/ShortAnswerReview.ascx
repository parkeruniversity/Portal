<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ShortAnswerReview.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.ReviewDisplay.ShortAnswerReview" %>
<asp:GridView ID="_gvShortAnswers" CellSpacing="4" runat="server" AutoGenerateColumns="false" GridLines="None" CssClass="shortReview" ShowFooter="false">
	<Columns>
		<asp:TemplateField >
			<ItemTemplate>
				<asp:Literal ID="_litNum" runat="server" />
			</ItemTemplate>
		</asp:TemplateField>
		<asp:TemplateField HeaderStyle-CssClass="reviewHeader" >
			<ItemTemplate>
				<div class="shortAnswer">
					<asp:Label ID="_lblAnswer" runat="server" />
				</div>
			</ItemTemplate>
		</asp:TemplateField>
		<asp:TemplateField>
			<ItemTemplate>
				<asp:Literal ID="_litCorrectness" runat="server" />
			</ItemTemplate>
		</asp:TemplateField>
		<asp:TemplateField ItemStyle-CssClass="matchAnswerKey" HeaderStyle-CssClass="reviewHeader">
			<ItemTemplate>
				<div class="shortCorrectContainer">
					<asp:Repeater ID="_rptCorrect" runat="server">
						<ItemTemplate>
							<span><%#GetOrText(Container.ItemIndex) %></span>
							<div class="correctAnswer"> 
								<asp:Literal ID="_litCorrect" runat="server" />
							</div>
							<%# GetSeparator(Container.ItemIndex) %>
						</ItemTemplate>
					</asp:Repeater>
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
<asp:Label id="_lblNoSelection" CssClass="studentNameDisplay" runat="server" />