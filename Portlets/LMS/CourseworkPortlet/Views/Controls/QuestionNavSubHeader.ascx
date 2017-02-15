<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QuestionNavSubHeader.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.QuestionNavSubHeader" %>
<%@ Register Src="../../../Common/Controls/Modal.ascx" TagName="Modal" TagPrefix="lms" %>
<div class="detailSubHeader">
	<div class="detailHeaderNav">
		<asp:Image ID="_imgPrev" runat="server" />
		<asp:HyperLink ID="_hypPrev" runat="server" />
		<div style="display:inline;font-style:italic;margin:0px 10px 0px 10px;">
			<asp:HyperLink ID="_hypOther" runat="server" />
			<asp:Image ID="_imgOther" runat="server" />
		</div>
		<asp:HyperLink ID="_hypNext" runat="server" />
		<asp:Image ID="_imgNext" runat="server" /> 
		<lms:Modal id="_modal" runat="server">
			<ContentArea>
				<div class="otherQuestions">
					<asp:Repeater ID="_rptGroups" runat="server">
						<ItemTemplate>
							<asp:Literal id="_litGroup" runat="server" />
							<div>
								<asp:Repeater ID="_rptQuestions" runat="server">
									<ItemTemplate>
										<asp:Hyperlink ID="_hyp" runat="server" />
									</ItemTemplate>
								</asp:Repeater>
							</div>
						</ItemTemplate>
				</asp:Repeater>
				</div>
			</ContentArea>
		</lms:Modal>
	</div>
	<div class="detailInfo">
		<asp:Literal ID="_litQuestionName" runat="server" />
	</div>		
	<div style="clear:both;"></div>
</div>