<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OrderingReview.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.ReviewDisplay.OrderingReview" %>
<%@ Register TagPrefix="cwk" TagName="RichText" Src="../RichTextDisplay.ascx" %>
<%@ Register Src="../../../../Common/Controls/Modal.ascx" TagName="Modal" TagPrefix="lms" %>
<asp:GridView ID="_gvChoices" CellSpacing="4" runat="server" AutoGenerateColumns="false" CssClass="matchReview" GridLines="None" ShowFooter="false">
	<Columns>
		<asp:TemplateField HeaderStyle-CssClass="reviewHeader" ItemStyle-CssClass="orderingNum">
			<ItemTemplate>
				<asp:Label ID="_lblNum" CssClass="orderingNum" runat="server" />
				<cwk:RichText ID="_rt" runat="server" />
			</ItemTemplate>
		</asp:TemplateField>
		<asp:TemplateField>
			<ItemTemplate>
			     <img src='<%#GetCorrectIcon(Eval("IsUserOrderCorrect")) %>' />
			</ItemTemplate>
		</asp:TemplateField>
		<asp:TemplateField ItemStyle-CssClass="matchAnswerKey" HeaderStyle-CssClass="reviewHeader">
			<ItemTemplate>
                <div runat="server" id="_divCorrectAnswer" class="correctAnswer">
				    <cwk:RichText ID="_rtCorrect" runat="server" />
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
<asp:Panel ID="_panAccuracy" runat="server">
    <strong><asp:Literal ID="_litAccFirst" runat="server"></asp:Literal></strong> &nbsp; <asp:Literal ID="_litCountFirst" runat="server" />
    <br/>
    <asp:Literal ID="_litOr" runat="server" /> <asp:Literal ID="_litAccSecond" runat="server"></asp:Literal> &nbsp; <asp:Literal ID="_litCountSecond" runat="server" />
    <asp:PlaceHolder ID="_phHelp" runat="server">
        <div>
            <asp:HyperLink runat="server" ID="_hypHelp" CssClass="helpLink" NavigateUrl="#"></asp:HyperLink>
            <lms:Modal id="_modal" runat="server">
	            <ContentArea>
                    <div class="helpContent">
                        <asp:Literal ID="_litInfo" runat="server" />
                    </div>
                </ContentArea>
            </lms:Modal>
        </div>
    </asp:PlaceHolder>
</asp:Panel>
<asp:Label ID="_lblNoAnswer" CssClass="studentNameDisplay" runat="server" />