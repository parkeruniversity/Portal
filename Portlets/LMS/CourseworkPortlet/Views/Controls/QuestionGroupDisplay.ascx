<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QuestionGroupDisplay.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.QuestionGroupDisplay" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<%@ Register TagPrefix="framework" Assembly="Jenzabar.Portal.Framework.Web" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" %>
<%@ Register TagPrefix="common" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="lms" TagName="Modal" Src="../../../Common/Controls/Modal.ascx" %>

<div class="questionGroup" id="_divGroup" runat="server">
	<div class="groupHeader">
		<asp:LinkButton ID="_lbtnDelete" CssClass="buttonAnchor deleteAnchor" runat="server"></asp:LinkButton>
		<asp:HyperLink ID="_hypEdit" CssClass="buttonAnchor editAnchor" runat="server"></asp:HyperLink>
		<asp:Label id="_lblName" runat="server" />
	</div>
	<asp:Panel ID="_panDetail" CssClass="tbDetail" runat="server">
        <div><asp:Label ID="lblErrMsg" runat="server" CssClass="FormTxtErr" /></div>
		<asp:Literal ID="_litDetail" runat="server" />        
	</asp:Panel>
	<div id="questions">
		<table class="assignmentGrid headerAssignmentGrid" cellpadding="0"  cellspacing="0">
			<tr>
				<th ><asp:Checkbox ID="_cbxAll" runat="server" />  <asp:Literal ID="_litHeaderQuestion" runat="server" /> </th>
				<th class="tbType"> <asp:Literal ID="_litHeaderType" runat="server" /></th>
				<th class="tbPoint" > <asp:Literal ID="_litHeaderValue" runat="server" /></th>
				<th id="_thSpacer" class="tbSpacer" runat="server" />
			</tr>
		</table>
		<div class="addQuestion">
			<framework:PortalImageAndHyperLink ID="_phiAddQuestion" ImageCategory="PortletIcon"  runat="server" />
		</div>
		<ajax:ReorderList ID="_reorderQuestions" CssClass="reorderList" EnableViewState="false" DragHandleAlignment="Right" PostBackOnReorder="true" runat="server">
		<ItemTemplate>
			<table id="_tblQuestions" runat="server" cellpadding="0" cellspacing="0">
				<tr>
					<td >
						<asp:CheckBox ID="_cbxQuestion" runat="server" />
						<asp:HyperLink ID="_hypQuestion" runat="server" />
						<asp:Image ID="_imgExtra" CssClass="tbExtra" runat="server" />
					</td>
					<td class="tbType">
						<asp:Literal ID="_litType" runat="server" />
					</td>
					<td class="tbPoint" id="_tdPoints" runat="server" >
						<asp:PlaceHolder ID="_phPoints" runat="server" />
					</td>
				</tr>
			</table>
		</ItemTemplate>
		<DragHandleTemplate>
			<div class="dragHandle" id="_divDrag" runat="server">
				&nbsp;
			</div>
		</DragHandleTemplate>
		<ReorderTemplate>
			<div class="dragReorder"></div>
		</ReorderTemplate>
		</ajax:ReorderList>
		<div id="_divActions" class="leftQAction" runat="server">
			<div class="rightQAction">
				<asp:Button ID="_btnSavePoints" runat="server" />
				<asp:Button ID="_btnCancelPoints" runat="server" />
				<asp:Literal id="_litPointValues" runat="server" />
			</div>
			<asp:LinkButton ID="_lbtnEditAllPoints" runat="server" />
			<asp:LinkButton ID="_lbtnManage" runat="server" />
			&nbsp;
		</div>
		<asp:Panel ID="_panMove" CssClass="leftQAction" runat="server">
			<common:MoveCopyDelete id="_mcdMove" runat="server" />
		</asp:Panel>
		<div id="_divFinish" class="finishEdits" runat="server">
			<asp:LinkButton ID="_lbtnFinish" runat="server" />
		</div>
	</div>
	<lms:Modal id="_modalExtraCredit"  runat="server">
		<ContentArea>
			<div class="ecOverride">
				<div>
					<asp:Literal ID="_litMesg" runat="server" />
				</div>
				<div class="ecProceed">
					<asp:Literal ID="_litProceed" runat="server" />
				</div>
				<div class="ecAction">
					<asp:LinkButton ID="_lbtnRemoveEC" runat="server" />
				</div>
				<div class="ecAction">
					<asp:LinkButton ID="_lbtnMakePoolEC" runat="server" />
				</div>				

				<asp:LinkButton ID="_lbtnCancel" runat="server" />
			</div>
		</ContentArea>
	</lms:Modal>
</div>