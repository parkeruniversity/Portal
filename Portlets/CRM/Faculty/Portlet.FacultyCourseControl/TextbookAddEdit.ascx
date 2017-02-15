<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Register TagPrefix="cmn" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="TextbookAddEdit.ascx.cs" Inherits="Jenzabar.CRM.Faculty.Web.Portlets.FacultyCourseControlPortlet.TextbookAddEdit" %>

<script language="javascript">

	function checkInputValues()
	{
		var bookTitle = document.getElementById('<%= this.tbBookTitle.ClientID %>');
		var bookISBN = document.getElementById('<%= this.tbISBN.ClientID %>');
		var bookPrice = document.getElementById('<%= this.tbPrice.ClientID %>');
		var bookFee = document.getElementById('<%= this.tbFee.ClientID %>');
		
		if (bookTitle.value == "")
		{
			alert('<%= Globalizer.GetGlobalizedString("ERR_TEXTBOOK_TITLE_REQUIRED") %>');
			bookTitle.focus();
			return false;
		}
		
		if (!IsNumeric(bookPrice.value))
		{
			alert('<%= Globalizer.GetGlobalizedString("ERR_TEXTBOOK_PRICE_NON_NUMERIC") %>');
			bookPrice.focus();
			return false;
		}
		
		if (!IsNumeric(bookFee.value))
		{
			alert('<%= Globalizer.GetGlobalizedString("ERR_TEXTBOOK_FEE_NON_NUMERIC") %>');
			bookFee.focus();
			return false;
		}
		
		return true;
	}
	
	function checkLength(control)
	{
		var maxLength = <%=base.getDescriptionMaxLength()%>;
		if (control.value.length > maxLength)
			control.value = String(control.value).substring(0, maxLength);
		
	}
	function match(field)
	{
		var re = /[a-z0-9]{10,10}/i;
		if (re.test(field.value)){
		return true;
		}
		else
		{
			alert('<%= Globalizer.GetGlobalizedString("ERR_ISBN_VALIDATE") %>');
			field.focus();
			return false;
		}
	}
	

	function IsNumeric(sText)
	{
		var ValidChars = '0123456789.'; 
		var IsNumber=true; 
		var Char;
		for (i = 0; i < sText.length && IsNumber == true; i++) 
		{ 
			Char = sText.charAt(i);
			if (ValidChars.indexOf(Char) == -1) 
			{
				IsNumber = false; 
			}
		} 
		return IsNumber;
	}
	
</script>

<div id="divMsg" visible="False" runat="server"><cmn:GlobalizedNote id="ntStatus" Runat="server"></cmn:GlobalizedNote></div>

<div class="pSection">
	<table width="100%" cellpadding="2" cellspacing="2" border="0">
		<tr>
			<th width="10%" nowrap>
				<cmn:globalizedliteral id="glitCourse" runat="server" TextKey="LBL_COURSE"></cmn:globalizedliteral></th>
			<td width="40%" nowrap><asp:literal id="litCourse" Runat="server"></asp:literal></td>
			<th width="10%" nowrap>
				<cmn:globalizedliteral id="glitTerm" runat="server" TextKey="LBL_TERM"></cmn:globalizedliteral></th>
			<td width="40%" nowrap><asp:literal id="litTerm" Runat="server"></asp:literal></td>
		</tr>
		<tr>
			<th nowrap>
				<cmn:globalizedliteral id="glitTitle" runat="server" TextKey="LBL_COURSE_TITLE"></cmn:globalizedliteral></th>
			<td nowrap><asp:literal id="litTitle" Runat="server"></asp:literal></td>
			<th nowrap>
				<cmn:globalizedliteral id="glitDivision" runat="server" TextKey="LBL_DIVISION"></cmn:globalizedliteral></th>
			<td nowrap><asp:literal id="litDivision" Runat="server"></asp:literal></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
	</table>
	<table width="100%" cellpadding="2" cellspacing="2" border="0">
		<tr>
			<th width="8%" nowrap><cmn:globalizedliteral id="glitBookTitle" runat="server" TextKey="LBL_FCC_BOOK_TITLE"></cmn:globalizedliteral>*</th>
			<td width="20%"><asp:textbox id="tbBookTitle" Runat="server" MaxLength="32"></asp:textbox></td>
			<td width="8%" nowrap><cmn:globalizedliteral id="glitAuthor" runat="server" TextKey="LBL_AUTHOR"></cmn:globalizedliteral></td>
			<td width="20%" nowrap><asp:textbox id="tbAuthor" Runat="server" MaxLength="24"></asp:textbox></td>
			<td width="50%"><cmn:Hint id="hntMultiAuthor" TextKey="TXT_FCC_MULTI_AUTHOR_HINT" runat="server"></cmn:Hint></td>
		</tr>
		<tr>
			<td nowrap><cmn:globalizedliteral id="glitPrice" runat="server" TextKey="TXT_PRICE_WITH_CURRENCY"></cmn:globalizedliteral>:</td>
			<td><asp:textbox id="tbPrice" Runat="server"></asp:textbox></td>
			<td nowrap><cmn:globalizedliteral id="glitFee" runat="server" TextKey="TXT_FEE_WITH_CURRENCY"></cmn:globalizedliteral>:</td>
			<td><asp:textbox id="tbFee" Runat="server"></asp:textbox></td>
		</tr>
		<tr>
			<td nowrap><cmn:globalizedliteral id="glitISBN" runat="server" TextKey="LBL_FCC_ISBN"></cmn:globalizedliteral></td>
			<td><asp:textbox id="tbISBN" MaxLength="10" Runat="server"></asp:textbox></td>
			<td nowrap><cmn:globalizedliteral id="glitPublisher" runat="server" TextKey="LBL_PUBLISHER"></cmn:globalizedliteral></td>
			<td><asp:textbox id="tbPublisher" Runat="server" MaxLength="24"></asp:textbox></td>
		</tr>
		<tr>
			<td valign="top"><cmn:globalizedliteral id="glitDesc" runat="server" TextKey="TXT_DESCRIPTION"></cmn:globalizedliteral>:</td>
			<td colspan="4"><asp:textbox id="tbDesc" Columns="75" Rows="4" TextMode="MultiLine" Runat="server" MaxLength="64"></asp:textbox></td>
		</tr>
		<tr>
			<td colSpan="4">
				<cmn:globalizedbutton id="gbtnSave" Runat="server" TextKey="TXT_SAVE"></cmn:globalizedbutton>&nbsp;
				<cmn:globalizedbutton id="gbtnApply" Runat="server" TextKey="TXT_FCC_SAVE_AND_ADD_ANOTHER"></cmn:globalizedbutton>&nbsp;
				<cmn:GlobalizedButton id="gbtnCancel" runat="server" TextKey="TXT_CANCEL" />
			</td>
		</tr>
	</table>
</div>
