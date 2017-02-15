<%@ Control Language="c#" AutoEventWireup="True" Codebehind="PayMustPayCourses.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.CourseSchedulesPortlet.PayMustPayCourses" %>
<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<div class="pSection"><jenzabar:errordisplay id="errDisplay" Runat="server"></jenzabar:errordisplay>
<jenzabar:hint id="hntPay" runat="server"></jenzabar:hint><br>
	<table width="100%" cellpadding="0" cellspacing="2" border="0">
		<tr>
			<th width="100%" align="right">
				<jenzabar:GlobalizedButton id="btnRecalculate" TextKey="TXT_RECALCULATE_AMOUNT" runat="server"></jenzabar:GlobalizedButton>&nbsp;&nbsp;
				<jenzabar:globalizedlabel id="lblTotal" TextKey="TXT_CS_TOTAL_AMOUNT" runat="server"></jenzabar:globalizedlabel>:&nbsp;
				<jenzabar:globalizedlabel id="lblTotalAmount" runat="Server"></jenzabar:globalizedlabel>&nbsp;&nbsp;
			</th>
		</tr>
	</table>
	<jenzabar:groupedgrid id="dgCourses" DataKeyField="ERPStudentCourseKey" runat="server" RenderTableHeaders="true" ShowHeader="true">
		<Columns>
			<jenzabar:GlobalizedTemplateColumn HeaderTextKey="TXT_CS_PAY" ItemStyle-HorizontalAlign="center" ItemStyle-Width="4%">
				<ItemTemplate>
					<asp:CheckBox ID="chkPay" Checked="True" Runat="server"></asp:CheckBox>
					<asp:Literal ID="ltAlert" Runat="server"></asp:Literal>
				</ItemTemplate>
			</jenzabar:GlobalizedTemplateColumn>
			<jenzabar:GlobalizedBoundColumn HeaderTextKey="TXT_TERM" DataField="Term"></jenzabar:GlobalizedBoundColumn>
			<jenzabar:GlobalizedBoundColumn HeaderTextKey="TXT_COURSE" DataField="Course"></jenzabar:GlobalizedBoundColumn>
			<jenzabar:GlobalizedBoundColumn HeaderTextKey="TXT_TITLE" DataField="Title"></jenzabar:GlobalizedBoundColumn>
			<jenzabar:GlobalizedBoundColumn HeaderTextKey="TXT_AMOUNT" DataField="Amount"></jenzabar:GlobalizedBoundColumn>
			<jenzabar:GlobalizedBoundColumn DataField="FeeKey" Visible="false"></jenzabar:GlobalizedBoundColumn>
			<jenzabar:GlobalizedBoundColumn DataField="AccountCode" Visible="false"></jenzabar:GlobalizedBoundColumn>
			<jenzabar:GlobalizedBoundColumn DataField="ERPCourseKey" Visible="false"></jenzabar:GlobalizedBoundColumn>
		</Columns>
	</jenzabar:groupedgrid>
	<table width="100%" cellpadding="0" cellspacing="2" border="0">
		<tr>
			<td width="100%" align="center">
			<jenzabar:globalizedbutton id="btnCancel" runat="server" TextKey="TXT_CANCEL"></jenzabar:globalizedbutton>&nbsp;&nbsp;
			<jenzabar:globalizedbutton id="btnPay" runat="server" TextKey="TXT_CS_PAY_NOW"></jenzabar:globalizedbutton>
			</td>
			
		</tr>
	</table>
</div>
<script language="javascript">
function validateForm()
{
	if (!checkBoxChecked('chkPay'))
	{
	alert('<%= Globalizer.GetGlobalizedString("MSG_CS_SELECT_COURSE_VALIDATE") %>');
	return false;
	}
}
function checkBoxChecked(cbWhat)
	{
		var frm = document.MAINFORM;
		for (i=0; i<frm.length; i++)
		{
			if(isChecked(i, frm, cbWhat))
				return true;
		}
		return false;
	}
	
	function isChecked(iIndex, frm, cbName)
	{
		if(frm.elements[iIndex].name.indexOf(cbName) != -1)
			return frm.elements[iIndex].checked;
		return false;
	}
	
</script>

