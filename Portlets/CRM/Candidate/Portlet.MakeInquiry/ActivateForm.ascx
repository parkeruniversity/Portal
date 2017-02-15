<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ActivateForm.ascx.cs" Inherits="Jenzabar.CRM.Candidate.Web.Portlets.MakeInquiry.ActivateForm" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<script language="javascript" type="text/javascript">
function disableoption(control,option){
	var formObj = document.forms[0];
	for (i = 0; i < formObj.length; i ++){
		fldObj = formObj.elements[i];
		if (fldObj.type == 'radio'){
			var name = control + '_' + option;
			if (fldObj.id.indexOf(name) > -1){
				fldObj.disabled = true;
			}
		}
	}
}
</script>
<jenzabar:errordisplay id="error" Runat="server" />
<h4><jenzabar:globalizedliteral id="litSetup" runat="server" textkey="TXT_OI_ACTIVATE_FORM" /></h4>
<div class="pSection">
	<table class="GrayBordered" width="100%" cellpadding="3" border="0">
		<tr>
			<td>
				<jenzabar:globalizedliteral id="glitText" runat="server" textkey="TXT_OI_CHOOSE_FORM_TXT" />
				<span id="spanHeader" runat="server">Click <a href=<%=this.ParentPortlet.GetNextScreenURL(@"FormBuilder//Main_View")%>>here</a> to add a new one.</span>
			</td>
		</tr>
	</table>
	<div class="FormBuilder"><div class="ErrorMsg"><asp:literal id=litErrorMsg Runat="server" Visible="False" /></div></div>
	<asp:radiobuttonlist id="radForms" runat="server" DataValueField="formid" DataTextField="Name" />
	<table>
		<tr>
			<td><jenzabar:globalizedbutton id="gbtnChooseForm" runat="server" textkey="TXT_OI_CHOOSE_FORM" /></td>
			<td><jenzabar:globalizedbutton id="gbtnCancel" runat="server" textkey="TXT_CANCEL" /></td>
			<td id="tdBackToAdminScreen" runat="server"><asp:LinkButton ID="lbBackToAdmin" Runat="server" /></td>
			<td id=tdAddNew runat=server> &nbsp; <a href=<%=this.ParentPortlet.GetNextScreenURL(@"FormBuilder//Main_View")%>><IMG title="" src="UI/Common/Images/PortletImages/Icons/add.gif">&nbsp;<jenzabar:globalizedliteral id="glitAddNewForm" runat="server" textkey="TXT_OI_ADD_NEW_INQUIRY_FORM" /></a></td>
		</tr>
	</table>
</div>