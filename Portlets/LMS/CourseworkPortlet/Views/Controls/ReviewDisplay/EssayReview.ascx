<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EssayReview.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.ReviewDisplay.EssayReview" %>
<asp:PlaceHolder ID="_phEssay" runat="server">
	<div class="studentNameDisplay">
		<asp:Literal ID="_litStudent" runat="server" />
	</div>
	<asp:Literal  ID="_litAnswer" runat="server" />
	<div class="wordCount">
		<asp:Literal ID="_litWordCount" runat="server" />
	</div>
</asp:PlaceHolder>
<asp:Label ID="_lblNoAnswer" CssClass="studentNameDisplay" runat="server" />