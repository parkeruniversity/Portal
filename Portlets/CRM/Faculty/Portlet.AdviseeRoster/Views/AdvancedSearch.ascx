<%@ Control Language="c#" AutoEventWireup="True" Codebehind="AdvancedSearch.ascx.cs" Inherits="Jenzabar.CRM.Faculty.Web.Portlets.AdviseeRosterPortlet.AdvancedSearch" %>
<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<jenzabar:SubHeader id="hdrSearch" Textkey="TXT_ADVANCED_SEARCH_CRITERIA" runat="server"></jenzabar:SubHeader>
<div class="pSection"><jenzabar:errordisplay id="errDisplay" Runat="server"></jenzabar:errordisplay></div>
<div class="pSection">
	<jenzabar:Hint id="hntInstr" runat="server"></jenzabar:Hint>
	<table cellSpacing="2" cellPadding="2" width="100%" border="0">
		<tr>
			<th align="right"><jenzabar:globalizedlabel id="lblStatus" runat="server" TextKey="TXT_AR_ADVISEE_STATUS"></jenzabar:globalizedlabel>:</th>
			<td><asp:dropdownlist id="ddlStatus" Runat="server"></asp:dropdownlist></td>
			<th align="right"><jenzabar:globalizedlabel id="lblID" runat="server" TextKey="TXT_ID"></jenzabar:globalizedlabel>:</th>
			<td><asp:textbox id="txtID" Runat="server"></asp:textbox></td>
		</tr>
		<tr>
			<th align="right"><jenzabar:globalizedlabel id="lblDivision" runat="server"></jenzabar:globalizedlabel>:</th>
			<td><asp:dropdownlist id="ddlDivision" Runat="server"></asp:dropdownlist></td>
			<th align="right"><div id="termLabelDiv" runat="server"><jenzabar:GlobalizedLiteral id="lblTerm" runat="server" TextKey="TXT_TERM"></jenzabar:GlobalizedLiteral>:</div></th>
			<td><div id="termDiv" runat="server"><asp:dropdownlist id="ddlTerm" Runat="server"></asp:dropdownlist></div></td>
		</tr>
		<tr>
			<th align="right"><jenzabar:globalizedlabel id="lblDegree" runat="server" TextKey="LBL_DEGREE"></jenzabar:globalizedlabel></th>
			<td><asp:dropdownlist id="ddlDegree" Runat="server"></asp:dropdownlist></td>
			<th align="right"><jenzabar:globalizedlabel id="lblMajor" runat="server" TextKey="TXT_MAJOR"></jenzabar:globalizedlabel>:</th>
			<td><asp:dropdownlist id="ddlMajor" Runat="server"></asp:dropdownlist></td>
		</tr>
		<tr>
			<th align="right"><jenzabar:globalizedlabel id="lblCity" runat="server" TextKey="TXT_CITY"></jenzabar:globalizedlabel>:</th>
			<td><asp:textbox id="txtCity" Runat="server"></asp:textbox></td>
			<th align="right"><jenzabar:globalizedlabel id="lblState" runat="server" TextKey="TXT_STATE"></jenzabar:globalizedlabel>:</th>
			<td><asp:DropDownList ID="ddlState" Runat="server"></asp:DropDownList></td>
		</tr>
	</table>
	<br>
	<table cellSpacing="2" cellPadding="2" width="100%" border="0">
		<tr>
			<th align="right"><jenzabar:globalizedlabel id="lblLastName" runat="server" TextKey="TXT_LAST_NAME"></jenzabar:globalizedlabel>:</th>
			<td><asp:DropDownList ID="ddlOption1" Runat="server"></asp:DropDownList>&nbsp;<asp:textbox id="txtLastName" Runat="server"></asp:textbox></td>
			<td rowspan="3">
				<table cellSpacing="1" cellPadding="1" width="100%" border="0">
					<tr>
						<th nowrap>
							<jenzabar:globalizedlabel id="lblSearchOptions" runat="server" TextKey="TXT_AR_NAME_SEARCH_OPTIONS"></jenzabar:globalizedlabel></th>
					</tr>
					<tr>
						<td nowrap>
							<jenzabar:GlobalizedCheckBox id="chkPhonetic" TextKey="TXT_AR_USE_PHONETIC_MATCH" runat="server"></jenzabar:GlobalizedCheckBox>
						</td>
					</tr>
					<tr>
						<td nowrap>
							<jenzabar:GlobalizedCheckBox id="chkPrimaryName" Checked="True" TextKey="TXT_AR_USE_PRIMARY_NAME" runat="server"></jenzabar:GlobalizedCheckBox>
						</td>
					</tr>
					<tr>
						<td nowrap>
							<jenzabar:GlobalizedCheckBox id="chkAlternateName" TextKey="TXT_AR_USE_ALTERNATE_NAME" runat="server"></jenzabar:GlobalizedCheckBox>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<th align="right"><jenzabar:globalizedlabel id="lblFirstName" runat="server" TextKey="TXT_FIRST_NAME"></jenzabar:globalizedlabel>:</th>
			<td><asp:DropDownList ID="ddlOption2" Runat="server"></asp:DropDownList>&nbsp;<asp:textbox id="txtFirstName" Runat="server"></asp:textbox></td>
		</tr>
		<tr>
			<th align="right"><jenzabar:globalizedlabel id="lblMiddleName" runat="server" TextKey="TXT_MIDDLE_NAME"></jenzabar:globalizedlabel>:</th>
			<td><asp:DropDownList ID="ddlOption3" Runat="server"></asp:DropDownList>&nbsp;<asp:textbox id="txtMiddleName" Runat="server"></asp:textbox></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>
				<jenzabar:GlobalizedButton id="btnSave" runat="server" TextKey="TXT_SEARCH"></jenzabar:GlobalizedButton>&nbsp;
				<jenzabar:GlobalizedButton id="btnCancel" runat="server" TextKey="TXT_CANCEL"></jenzabar:GlobalizedButton>
			</td>
		</tr>
	</table>
	
</div>
<script language="javascript">
//	function validateInput()
//	{
//		if((document.MAINFORM.<%=this.txtLastName.ClientID%>.value.replace(/^\s+/g, '').replace(/\s+$/g, '') != "" ||
//			document.MAINFORM.<%=this.txtFirstName.ClientID%>.value.replace(/^\s+/g, '').replace(/\s+$/g, '') != "" ||
//			document.MAINFORM.<%=this.txtMiddleName.ClientID%>.value.replace(/^\s+/g, '').replace(/\s+$/g, '') != "" ) && 
//			(document.MAINFORM.<%=this.chkPrimaryName.ClientID%>.checked == false && document.MAINFORM.<%=this.chkAlternateName.ClientID%>.checked == false))
//			{
//				alert('<%= Globalizer.GetGlobalizedString("TXT_AR_ADV_SEARCH_VALIDATION")%>');
//				return false;
//			}
//			
//	}
//	function showHideTerm(){
//		if(document.MAINFORM.<%=this.ddlStatus.ClientID%> != null){
//			var status = document.MAINFORM.<%=this.ddlStatus.ClientID%>.options[document.MAINFORM.<%=this.ddlStatus.ClientID%>.selectedIndex].value;
//			if (status == 'ACT' || status == 'INACT' || status == 'ALL')
//			{
//				hidediv('<%=this.termLabelDiv.ClientID%>');
//				hidediv('<%=this.termDiv.ClientID%>');			 
//			}
//			else
//			{
//				showdiv('<%=this.termLabelDiv.ClientID%>');
//				showdiv('<%=this.termDiv.ClientID%>');
//				
//			}
//		}
//			 
//		return;
//	}
//	
//	function hidediv(id) {
//		//safe function to hide an element with a specified id
//		if (document.getElementById) { // DOM3 = IE5, NS6
//			document.getElementById(id).style.display = 'none';
//		}
//		else {
//			if (document.layers) { // Netscape 4
//				document.id.display = 'none';
//			}
//			else { // IE 4
//				document.all.id.style.display = 'none';
//			}
//		}
//	}

//	function showdiv(id) {
//		//safe function to show an element with a specified id
//			  
//		if (document.getElementById) { // DOM3 = IE5, NS6
//			document.getElementById(id).style.display = 'block';
//		}
//		else {
//			if (document.layers) { // Netscape 4
//				document.id.display = 'block';
//			}
//			else { // IE 4
//				document.all.id.style.display = 'block';
//			}
//		}
//	}
</script>
