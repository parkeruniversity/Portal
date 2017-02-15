<%@ Control Language="C#" EnableViewState="false" AutoEventWireup="true" CodeBehind="ReviewContainer.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.ReviewDisplay.ReviewContainer" %>
<%@ Register TagPrefix="framework" Assembly="Jenzabar.Portal.Framework.Web" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" %>
<%@ Register TagPrefix="cwk" TagName="ReviewDisplay" Src="ReviewDisplay.ascx" %>
<%@ Register TagPrefix="JICS" Namespace="Jenzabar.Portal.Web.UI.Controls" Assembly="Jenzabar.Portal.Web" %>
<%@ Register Src="../../../../Common/Controls/Modal.ascx" TagName="Modal" TagPrefix="lms" %>
<script language="javascript" type="text/javascript">
    function ClearBonus<%=_modal.ClientID %>() {
        $('#<%= TextBonusClientID %>').val("<%=BonusOrigVal %>");
        $('#<%= ErrBonusClientID %>').text("");
    }
</script>
<asp:PlaceHolder ID="_phLightbox" runat="server" />
<asp:HiddenField ID="_hPage" runat="server" />
<asp:HiddenField ID="_hShow" runat="server" />
<div class="questionReviewContainer">
	<div class="reviewHeaderFooter">
		<asp:HyperLink ID="_hypBonus" NavigateUrl="javascript:" CssClass="attemptBonus" runat="server" />

		<framework:PortalImageAndHyperLink id="_phiExpand"  runat="server" />
		<framework:PortalImageAndHyperLink id="_phiCollapse" runat="server" />

		<lms:Modal id="_modal" runat="server">
			<ContentArea>
				<div class="bonusModalContainer">
					<div>
						<asp:Literal ID="_litBonusInfo" runat="server" />
					</div>
                    <asp:Label ID="_lblError" runat="server" />
					<div>
						<asp:Literal ID="_litBonusAction" runat="server" /> <asp:TextBox ID="_txtBonus" MaxLength="5" runat="server" /> <asp:Literal ID="_litBonusPoints" runat="server" />
					</div>
				</div>
			</ContentArea>
		</lms:Modal>
		
        <asp:LinkButton ID="_lbtnShow" CssClass="showPaging" runat="server"></asp:LinkButton>
	</div>
	<div>
		<asp:Panel ID="_panEC" CssClass="ecReview" runat="server" >
			<asp:Label ID="_lblBonus" runat="server" />
			<div class="<%=GetECClass() %>">
				<asp:Literal ID="_litEC" runat="server" />
			</div>
			<asp:Literal ID="_litECInfo" runat="server" />
		</asp:Panel>
		<asp:Repeater ID="_rpt" runat="server" EnableViewState="false">
			<ItemTemplate>
				<div class="reviewSection">
					<asp:Literal id="_litGroup" runat="server" />
				</div>
				<div class="reviewQuestions">
					<asp:Repeater id="_rptQuestions" runat="server">
						<ItemTemplate>
							<cwk:ReviewDisplay id="_rd" runat="server" />
						</ItemTemplate>
					</asp:Repeater>
				</div>
			</ItemTemplate>
		</asp:Repeater>
	</div>
	<div class="reviewHeaderFooter">

		<JICS:Paging id="_paging" runat="server" />
		<div style="clear:both;"></div>
	</div>
</div>