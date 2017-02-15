<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Import namespace="Jenzabar.Portal.Framework" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Register TagPrefix="fwk" namespace="Jenzabar.Portal.Framework.Web.UI.Controls" assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ConfigureFormProperties.ascx.cs" Inherits="Jenzabar.CRM.Common.Web.Portlets.FormBuilderPortlet.ConfigureFormProperties" %>
<script language="JavaScript">
function CheckDates()
{
	var frm = document.MAINFORM;
	var activationDate;	
	var expirationDate;
		
	for (i=0; i<frm.length; i++)
	{ 
		if(frm.elements[i].name.indexOf('dpActivationDate') != -1) 
		{
				activationDate = frm.elements[i].value;
		}
		if(frm.elements[i].name.indexOf('dpExpirationDate') != -1) 
		{
				expirationDate = frm.elements[i].value;
		}
	}
	
	var retValue = ValidateDates(activationDate, expirationDate);
	return retValue;
}

function ValidateDates(activationDate, expirationDate)
{
		
	var dateValueActivationDate;
	var dateValueExpirationDate;
	var now = new Date();
	
	if (activationDate !='')
	{
		dateValueActivationDate = new Date(activationDate);
	}
	
	if (expirationDate !='')
	{
		dateValueExpirationDate = new Date(expirationDate);
	}
	if (now.getFullYear() > dateValueExpirationDate.getFullYear()){
		alert('<%=Globalizer.GetGlobalizedString("TXT_FORMBUILDER_EXPIRATION_IN_PAST")%>');
		return true; // This is a warning message, so we'll still return true so that the save will continue.
	}
	else if (now.getFullYear() == dateValueExpirationDate.getFullYear()){
		if (now.getMonth() > dateValueExpirationDate.getMonth()){
			alert('<%=Globalizer.GetGlobalizedString("TXT_FORMBUILDER_EXPIRATION_IN_PAST")%>');
			return true; // This is a warning message, so we'll still return true so that the save will continue.
		}
		else if (now.getMonth() == dateValueExpirationDate.getMonth()){
			if (now.getDate() > dateValueExpirationDate.getDate()){
				alert('<%=Globalizer.GetGlobalizedString("TXT_FORMBUILDER_EXPIRATION_IN_PAST")%>');
				return true; // This is a warning message, so we'll still return true so that the save will continue.
			}
		}
	}
	
	return true;
}
</script>
<div class="pSection" runat="server" ID="Div1">
	<TABLE cellPadding="3" width="100%">
		<tr>
			<TD vAlign="top" noWrap align="left" colSpan="2"><asp:label id="lblErrorMsg" runat="server" ForeColor="Red"></asp:label></TD>
		</tr>
		<TR>
			<TD vAlign="top" align="left" colSpan="2"><asp:label id="lblScreenMessage" runat="server"></asp:label></TD>
		</TR>
		<TR>
			<TD vAlign="top" align="left" colspan="2"></TD>
		</TR>
		<TR>
			<TD vAlign="top" noWrap align="left" Width="20%"><asp:label id="lblUseThisForm" runat="server"></asp:label></TD>
			<TD vAlign="top" align="left"><asp:textbox id="txtNewFormName" runat="server" Width="100%"></asp:textbox></TD>
		</TR>
		<TR>
			<TD vAlign="top" noWrap align="left"><asp:label id="lblAllowIncomplete" runat="server"></asp:label></TD>
			<TD vAlign="top" align="left">
				<asp:RadioButtonList id="rblAllowIncomplete" runat="server" Height="8px" RepeatDirection="Horizontal"
					RepeatLayout="Flow"></asp:RadioButtonList></TD>
		</TR>
		<tr>
			<td vAlign="top" noWrap align="left"><cmn:globalizedlabel id="lblActivationDate" runat="server" TextKey="TXT_FORMBUILDER_ACTIVATION_DATE"></cmn:globalizedlabel></td>
			<td vAlign="top" align="left"><cmn:datepicker id="dpActivationDate" runat="server" TimeDisplayFormat="None" DateDisplayFormat="Short"></cmn:datepicker></td>
		<tr>
			<td vAlign="top" noWrap align="left"><cmn:globalizedlabel id="lblExpirationDate" runat="server" TextKey="TXT_FORMBUILDER_EXPIRATION_DATE"></cmn:globalizedlabel></td>
			<td vAlign="top" align="left"><cmn:datepicker id="dpExpirationDate" runat="server" TimeDisplayFormat="None" DateDisplayFormat="Short"></cmn:datepicker></td>
		<TR>
			<TD vAlign="top" noWrap align="left"><asp:label id="lblSetupComplete" runat="server"></asp:label></TD>
			<TD vAlign="top" align="left">
				<asp:RadioButtonList id="rblSetupComplete" runat="server" Height="8px" RepeatDirection="Horizontal"
					RepeatLayout="Flow"></asp:RadioButtonList></TD>
		</TR>
		<TR>
			<TD align="left" valign="top" colspan="2">
				<asp:Button id="btnModify" runat="server"></asp:Button>&nbsp;
				<asp:Button id="btnCancel" runat="server"></asp:Button></TD>
		</TR>
	</TABLE>
</div>
