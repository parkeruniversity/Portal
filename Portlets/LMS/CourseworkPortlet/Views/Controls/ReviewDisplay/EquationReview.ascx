<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EquationReview.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.ReviewDisplay.EquationReview" %>
<asp:PlaceHolder ID="_phEq" runat="server">
	<div class="studentNameDisplay">
		<asp:Literal ID="_litStudent" runat="server" />
	</div>
</asp:PlaceHolder>
<asp:Label ID="_lblNoAnswer" CssClass="studentNameDisplay" runat="server" />