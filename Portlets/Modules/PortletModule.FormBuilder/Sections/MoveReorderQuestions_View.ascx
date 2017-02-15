<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Import namespace="Jenzabar.FRM" %>
<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="MoveReorderQuestions_View.ascx.cs" Inherits="Jenzabar.Portal.Framework.Web.PortletModules.FormBuilder.Sections.MoveReorderQuestions_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Import namespace="Jenzabar.Common.Web.UI.Controls"%>
<script language=javascript>
function SelectAll(allQuestionsBox, containerID)
{
	var table = document.getElementById(containerID);
	var checkboxes = table.getElementsByTagName('input');
	
	for(var i=0;i<checkboxes.length;i++)
	{
		if((checkboxes[i].type=='checkbox')
		  && (checkboxes[i].id != allQuestionsBox.id))
		{
			checkboxes[i].checked = allQuestionsBox.checked
		}				
	}
}
</script>
<div class=FormBuilder>
<div class="MainHeader MainHeaderSecondary">
<h4><i><%= Globalizer.GetGlobalizedString("LBL_FORM_BUILDER") %></I>&nbsp;<asp:literal id=litFormName 
Runat="server"></asp:Literal></H4></DIV>
<div class=pSection id=divControls 
Runat="server"><common:superbreadcrumbs id=brdCrumbs 
runat="server"></common:SuperBreadcrumbs>
<h5><strong><common:globalizedliteral id=MoveReorderQuestionLiteral Runat="server" 
TextKey="TXT_MOVE_REORDER_QUESTIONS"></common:GlobalizedLiteral></STRONG>
</h5>

<div class=ErrorMsg><asp:literal id=litErrorMsg Runat="server" Visible="False"></asp:Literal></div>
<table>
  <tr>
    <td>
      <table class="GridStyle GridStyleFullWidth" id=questionGrid cellSpacing=0 cellPadding=0>
        <thead>
        <tr>
          <td colSpan=4><asp:image ImageUrl="~/UI/Common/Images/folder.gif"></asp:Image><i><asp:literal id=litQuestionReorderHeader Runat="server"></asp:Literal></I></TD>
        </TR>
        <tr id="trHeader" runat="server">
          <th><asp:checkbox id=cbSelectAll Runat="server"></asp:CheckBox></TH>
          <th><common:globalizedliteral id=GlobalizedLiteral1 Runat="server" TextKey="TXT_ORDER"></common:GlobalizedLiteral></TH>
          <th><common:globalizedliteral id=Globalizedliteral3 Runat="server" TextKey="TXT_QUESTION"></common:GlobalizedLiteral></TH>
          <th class=RightTableCell><common:globalizedliteral id=GlobalizedLiteral2 Runat="server" TextKey="TXT_QUESTION_TYPE"></common:GlobalizedLiteral></TH></TR></THEAD>
        <tbody><asp:repeater id=rptReorderQuestions runat="server">
								<ItemTemplate>
									<tr id="trRow" runat="server">
										<td id="CheckboxCell">
											<asp:CheckBox ID="cbSelectQuestion" Runat="server" />
										</td>
										<td class="ReorderCell">
											<asp:TextBox id="tbQuestionOrder" Width="60" Runat="server" />
										</td>
										<td>
											<asp:HyperLink id="hypQuestion" Runat="server" />
										</td>
										<td class="RightTableCell">
											<asp:literal id="litQuestionType" Runat="server" />
										</td>
										<td class="HiddenCell">
											<input type="hidden" id="inQuestionOldOrder" runat="server" NAME="inQuestionID">
											<input type="hidden" id="inQID" runat="server" name="inQIDName">
										</td>
									</tr>
								</ItemTemplate>
							</asp:Repeater></TBODY></TABLE></TD></TR>
  <tr>
    <td>
		<div id="divMoveQuestion" runat="server">
			<table id=tblMoveQuestion cellPadding=6 width="100%">
				<tr>
				<td class=SmallText><common:globalizedliteral id=litMoveSelectedTo Runat="server" TextKey="MSG_MOVE_SELECTED_TO" /></td>
				<td><asp:dropdownlist id=ddlSectionList Runat="server" /></td>
				<td><common:globalizedbutton id=btnMoveQuestion Runat="server" TextKey="TXT_MOVE_QUESTIONS" /></td>
				</tr>
			</table>
		</div>
	</td>
  </tr>
  <tr>
    <td>
      <table id=tblReorderDone cellPadding=5>
        <tr>
          <td><common:globalizedbutton id=btnReorder Runat="server" TextKey="TXT_REORDER"></common:GlobalizedButton></TD>
          <td><common:globalizedlinkbutton id=lnkbtnDone Runat="server" TextKey="TXT_DONE_REORDERING"></common:GlobalizedLinkButton></TD></TR></TABLE></TD></TR></TABLE></DIV>
<div class="pSection ErrorMsg" id=divNoQuestions 
Runat="server"><common:globalizedliteral id="gLitNoQues" Runat="server" TextKey="TXT_SECTION_HAS_NO_QUESTIONS" /><br><br><common:globalizedlinkbutton id=lnkbtnBack runat="server" TextKey="TXT_BACK_TO_MAIN" /></DIV></DIV>
