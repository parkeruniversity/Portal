<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AnswerFieldEditor.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.ManageQuestion.AnswerFieldEditor" %>
<%@ Register TagPrefix="cmn" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register Src="../../../../Common/Controls/FeedbackEditor.ascx" TagName="Feedback" TagPrefix="cwk" %>

<table class="questionTable saTable" cellspacing="0" cellpadding="0">
	<caption><asp:Literal ID="_litCaption" runat="server" /></caption>
	<tr>
		<td>
			<div>
				<asp:Label ID="_lblLabel" runat="server" />
			</div>
			<asp:Label id="_lblAutoScoring" runat="server" CssClass="extraInfo typeInfo" />
			<asp:Repeater id="_rptMatch" runat="server" EnableViewState="false">
				<ItemTemplate>
					<div class="shortAnswerMatch">
						<asp:HiddenField ID="_hideOrder" runat="server" />
                        <div>
                            <asp:Label ID="_lblErr" runat="server" />
                        </div>
						<div>
							<asp:Literal ID="_litAuto" runat="server" />  <asp:DropDownList ID="_ddlCredit" runat="server" /> <asp:Literal ID="_litCredit" runat="server" />
						</div>
						<div class="match">
                            <div><asp:Label ID="lblErrMatchGeneral" runat="server" /></div>
							<asp:DropDownList ID="_ddlMatch" runat="server" /> <asp:TextBox id="_txtMatch" runat="server" MaxLength="100" />
							<div class="betweenMatch" id="_divBetween" runat="server">
								<asp:Literal ID="_litAnd" runat="server" /> <asp:TextBox ID="_txtBetween" runat="server" CssClass="betweenText" /> <asp:Literal id="_litInclusive" runat="server" /> 
							</div>
							<asp:Panel ID="_panHiddenFeedback" style="display:none;" runat="server" />
							<cwk:Feedback id="_feedback" runat="server" />
							<asp:LinkButton ID="_lbtnRemove" CssClass="clearButton" runat="server" />
						</div>
					</div>
				</ItemTemplate>
			</asp:Repeater>
			<div class="addMatch">
				<cmn:ImageAndTextButton id="_itbAdd"  runat="server" />
				<asp:HiddenField ID="_hideOrder" runat="server" />
			</div>
			<div class="otherResponses">
				<asp:Literal ID="_litOther" runat="server" /> <asp:DropDownList ID="_ddlResponse" runat="server" />
			</div>
		</td>
	</tr>
	<tr id="_trRemove" runat="server">
		<td class="shortRemove" >
			<cmn:ImageAndTextButton id="_itbRemove"  runat="server" />
		</td>
	</tr>
</table>