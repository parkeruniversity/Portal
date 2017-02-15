<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Register TagPrefix="cmn" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="True" Codebehind="TextbookAddEdit.ascx.cs" Inherits="Jenzabar.CRM.Faculty.Web.Portlets.FacultyCourseControlPortlet.TextbookAddEdit" %>

<script language="javascript">

	function checkInputValues()
	{
		var bookTitle = document.getElementById('<%= this.tbBookTitle.ClientID %>');
		var bookISBN = document.getElementById('<%= this.tbISBN.ClientID %>');
		var bookPrice = document.getElementById('<%= this.tbPrice.ClientID %>');
		var bookUsed = document.getElementById('<%= this.tbUsed.ClientID %>');
		var bookRental = document.getElementById('<%= this.tbRental.ClientID %>');
		var bookCost = document.getElementById('<%= this.tbCost.ClientID %>');
		
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
		
		if (!IsNumeric(bookUsed.value))
		{
			alert('<%= Globalizer.GetGlobalizedString("ERR_TEXTBOOK_USED_NON_NUMERIC") %>');
			bookUsed.focus();
			return false;
		}
		
		if (!IsNumeric(bookRental.value))
		{
			alert('<%= Globalizer.GetGlobalizedString("ERR_TEXTBOOK_RENTAL_NON_NUMERIC") %>');
			bookRental.focus();
			return false;
		}
		
		if (!IsNumeric(bookCost.value))
		{
			alert('<%= Globalizer.GetGlobalizedString("ERR_TEXTBOOK_FEE_NON_NUMERIC") %>');
			bookCost.focus();
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
            <td colspan="4" ><div class="dashedline">&nbsp;</div></td>
		</tr>
	</table>
	<table width="100%" cellpadding="2" cellspacing="2" border="0">
		<tr>
			<th width="8%" nowrap><cmn:globalizedliteral id="glitBookTitle" runat="server" TextKey="LBL_FCC_BOOK_TITLE"></cmn:globalizedliteral>*</th>
			<td width="60%" colspan="5" ><asp:textbox id="tbBookTitle" Runat="server" Width="80%" MaxLength="36"></asp:textbox></td>
		</tr>
		<tr>
			<td nowrap><cmn:globalizedliteral id="glitAuthor" runat="server" TextKey="LBL_AUTHOR(S)"></cmn:globalizedliteral></td>
			<td nowrap colspan="5" ><asp:textbox id="tbAuthor" Runat="server" Width="80%" MaxLength="24"></asp:textbox></td>
		</tr>
		<tr>
			<td /><td  colspan="5" class="smallText" >(<cmn:globalizedliteral id="glitMultiAuthor" TextKey="TXT_FCC_MULTI_AUTHOR_HINT" runat="server"></cmn:globalizedliteral>)</td>
		</tr>
		<tr>
			<td nowrap><cmn:globalizedliteral id="glitPublisher" runat="server" TextKey="LBL_PUBLISHER"></cmn:globalizedliteral></td>
			<td colspan="5" ><asp:textbox id="tbPublisher" Runat="server" Width="80%" MaxLength="24"></asp:textbox></td>
		</tr>
		<tr>
			<td nowrap><cmn:globalizedliteral id="glitCopyright" runat="server" TextKey="LBL_COPYRIGHT"></cmn:globalizedliteral></td>
			<td><asp:textbox id="tbCopyright" MaxLength="10" Runat="server"></asp:textbox></td>
			<td nowrap><cmn:globalizedliteral id="glitISBN" runat="server" TextKey="LBL_ISBN10"></cmn:globalizedliteral></td>
			<td><asp:textbox id="tbISBN" MaxLength="10" Runat="server"></asp:textbox></td>
			<td nowrap><cmn:globalizedliteral id="glitISBN13" runat="server" TextKey="LBL_ISBN13"></cmn:globalizedliteral></td>
			<td><asp:textbox id="tbISBN13" MaxLength="13" Runat="server"></asp:textbox></td>
		</tr>
		<tr>
            <td colspan="6" ><div class="dashedline">&nbsp;</div></td>
		</tr>
		<tr>
		    <td colspan="6"><strong><cmn:GlobalizedLabel runat="server" TextKey = "TXT_PRICING" /></strong>&nbsp<span class="smallText" >(<cmn:GlobalizedLabel runat="server" TextKey = "TXT_TXTBK_PRICE_HINT" />)</span></td>
		</tr>
		<tr>
			<td nowrap><cmn:globalizedliteral id="glitPrice" runat="server" TextKey="TXT_NEW_WITH_CURRENCY"></cmn:globalizedliteral></td>
			<td><asp:textbox id="tbPrice" Runat="server"></asp:textbox></td>
			<td nowrap><cmn:globalizedliteral id="glitUsed" runat="server" TextKey="TXT_USED_WITH_CURRENCY"></cmn:globalizedliteral></td>
			<td><asp:textbox id="tbUsed" Runat="server"></asp:textbox></td>
			<td nowrap><cmn:globalizedliteral id="glitRental" runat="server" TextKey="TXT_RENTAL_WITH_CURRENCY"></cmn:globalizedliteral></td>
			<td><asp:textbox id="tbRental" Runat="server"></asp:textbox></td>
		</tr>
		<tr>
            <td colspan="6" ><div class="dashedline">&nbsp;</div></td>
		</tr>
		<tr>
			<td nowrap><cmn:globalizedliteral id="glitCost" runat="server" TextKey="TXT_COST_WITH_CURRENCY"></cmn:globalizedliteral></td>
			<td colspan="5" ><asp:textbox id="tbCost" Runat="server"></asp:textbox>&nbsp<span class="smallText" >(<cmn:GlobalizedLabel runat="server" TextKey = "TXT_TXTBK_COST_HINT" />)</span></td>
		</tr>
		<tr>
            <td colspan="6" ><div class="dashedline">&nbsp;</div></td>
		</tr>
		<tr>
			<td valign="top"><cmn:globalizedliteral id="glitDesc" runat="server" TextKey="TXT_DESCRIPTION"></cmn:globalizedliteral>:</td>
			<td colspan="5"><asp:textbox id="tbDesc" Columns="75" Rows="4" TextMode="MultiLine" Runat="server" MaxLength="64"></asp:textbox></td>
		</tr>
		<tr>
            <td colspan="6" ><div class="dashedline">&nbsp;</div></td>
		</tr>
		<tr>
			<td colSpan="6" align="center">
				<cmn:globalizedbutton id="gbtnSave" Runat="server" TextKey="TXT_SAVE"></cmn:globalizedbutton>&nbsp;
				<cmn:globalizedbutton id="gbtnApply" Runat="server" TextKey="TXT_FCC_SAVE_AND_ADD_ANOTHER"></cmn:globalizedbutton>&nbsp;
				<cmn:GlobalizedButton id="gbtnCancel" runat="server" TextKey="TXT_CANCEL" />
			</td>
		</tr>
	</table>
</div>
