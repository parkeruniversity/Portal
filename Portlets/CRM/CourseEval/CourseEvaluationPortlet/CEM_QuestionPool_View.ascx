<%@ Control Language="c#" AutoEventWireup="false" Codebehind="CEM_QuestionPool_View.ascx.cs" Inherits="Jenzabar.CRM.Web.Portlets.CourseEvaluationPortlet.CEM_QuestionPool_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="cmn" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<div class="pSection">
	<asp:Table ID="tblError" Runat="server" Width="100%" Visible="False">
		<asp:TableRow>
			<asp:TableCell>
				<asp:Label ID="lblError" Runat="server" CssClass="PortletError" />
			</asp:TableCell>
		</asp:TableRow>
	</asp:Table>
	<h4><cmn:globalizedliteral id="glblSrchQstns" Runat="server" TextKey="CUS_TXT_SEARCH_QUESTIONS"></cmn:globalizedliteral></h4>
	<table cellSpacing="0" cellPadding="0" width="100%" border="0">
		<tr>
			<td><asp:textbox id="tbSearch" Runat="server" Width="256px" MaxLength="250"></asp:textbox>&nbsp;&nbsp;&nbsp;
				<cmn:globalizedbutton id="gbtnSearch" Runat="server" TextKey="TXT_SEARCH"></cmn:globalizedbutton></td>
			<td align="right"><cmn:globalizedlinkbutton id="glnkShowAllQuestions" Runat="server" TextKey="CUS_TXT_SHOW_ALL_QUESTIONS"></cmn:globalizedlinkbutton></td>
		</tr>
	</table>
	<table cellSpacing="0" cellPadding="0" width="100%" border="0">
		<tr>
			<td>
				<div id="divQuestions" runat="server" visible="False">
					<cmn:GroupedGrid ID="ggQuestions" Runat="server" GroupKeyField="ID" DataKeyField="ID" RenderGroupHeaders="true">
						<Columns>
							<asp:TemplateColumn>
								<ItemTemplate>
									<asp:CheckBox ID="cbSelected" Runat="server" />
								</ItemTemplate>
							</asp:TemplateColumn>
							<cmn:GlobalizedBoundColumn HeaderTextKey="TXT_QUESTION" DataField="Question" />
							<asp:BoundColumn DataField="QuestionType" Visible="False" />
							<asp:BoundColumn DataField="Required" Visible="False" />
							<cmn:GlobalizedTemplateColumn HeaderTextKey="CUS_TXT_QUESTION_TYPE">
								<ItemTemplate>
									<%# GetQuestionType(DataBinder.Eval(Container.DataItem, "QuestionType").ToString())%>
								</ItemTemplate>
							</cmn:GlobalizedTemplateColumn>
							<cmn:GlobalizedTemplateColumn HeaderTextKey="CUS_TXT_REQUIRED">
								<ItemTemplate>
									<%# DataBinder.Eval(Container.DataItem, "Required").ToString()%>
								</ItemTemplate>
							</cmn:GlobalizedTemplateColumn>
							<cmn:EditButtonColumn />
							<cmn:DeleteButtonColumn />
						</Columns>
					</cmn:GroupedGrid>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<cmn:GlobalizedButton ID="gbtnImport" TextKey="TXT_IMPORT_SELECTED" Runat="server" Enabled="False" />&nbsp;&nbsp;&nbsp;
				<cmn:GlobalizedButton ID="gbtnCancel" TextKey="TXT_CANCEL" Runat="server" />
			</td>
		</tr>
		<tr>
			<td>
				<cmn:GlobalizedLinkButton ID="glnkAddQuestion" TextKey="CUS_ADD_QUESTION" Runat="server" />
			</td>
		</tr>
	</table>
</div>
<script>
function QuestionChecked()
{

	var frm = document.MAINFORM;
	for (i=0; i<frm.length; i++)
	{
		if(isChecked(i, frm, 'cbSelected'))
			return true;
	}
	alert('<%= Globalizer.GetGlobalizedString("CUS_MSG_STOP_IMPORT_QUESTION") %>');
	return false;
}

function isChecked(iIndex, frm, cbName)
{
	if(frm.elements[iIndex].name.indexOf(cbName) != -1)
		return frm.elements[iIndex].checked;
	return false;
}
</script>
