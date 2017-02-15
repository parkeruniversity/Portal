<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MultiReview.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.ReviewDisplay.MultiReview" %>
<%@ Register TagPrefix="cwk" TagName="RichText" Src="../RichTextDisplay.ascx" %>
<asp:GridView ID="_gvChoices" CellSpacing="4" runat="server" AutoGenerateColumns="false" CssClass="multiReview" GridLines="None" ShowFooter="false">
	<Columns>
		<asp:TemplateField HeaderStyle-CssClass="multiHeader" ItemStyle-CssClass="multiSelector">
			<HeaderTemplate>
				<img src='<%#GetHeaderCheck() %>' />
				<img src='<%#GetHeaderPerson() %>' />
			</HeaderTemplate>
			<ItemTemplate>
				<div id="_divSelector" class="unSelected" runat="server">
					<img src='<%#GetSelectorUrl(Eval("IsSelected")) %>' />
				</div>
			</ItemTemplate>
		</asp:TemplateField>
		<asp:TemplateField>
			<ItemTemplate>
				<cwk:RichText ID="_rt" runat="server" />
			</ItemTemplate>
		</asp:TemplateField>
		<asp:TemplateField>
			<ItemTemplate>
				<img src='<%#GetFeedbackUrl()%>' />
				<div class="feedbackDisplay">
					<div class="choiceWedge"></div>
					<div class="choiceWedgeOutline"></div>
					<div class="feedbackEntry">
						<asp:Literal ID="_litFeedback" runat="server" />
					</div>
				</div>
			</ItemTemplate>
		</asp:TemplateField>
	</Columns>
</asp:GridView>
<asp:Label ID="_lblNoAnswer" CssClass="studentNameDisplay" runat="server" />