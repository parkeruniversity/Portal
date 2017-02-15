<%@ Control Language="c#" AutoEventWireup="false" Codebehind="TextbookSearch.ascx.cs" Inherits="Jenzabar.CRM.Faculty.Web.Portlets.FacultyCourseControlPortlet.TextbookSearch" %>
<%@ Register TagPrefix="cmn" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<script>

	function checkSearchValues()
	{
		var bookTitle = document.getElementById('<%= this.tbBookTitle.ClientID %>').value;
		var author = document.getElementById('<%= this.tbAuthor.ClientID %>').value;
		var isbn = document.getElementById('<%= this.tbISBN.ClientID %>').value;
		var publisher = document.getElementById('<%= this.tbPublisher.ClientID %>').value;
		
		if (bookTitle == "" && author == "" && isbn == "" && publisher == "")
		{
			alert('<%= Globalizer.GetGlobalizedString("ERR_NO_SEARCH_CRITERIA") %>');
			return false;
		}
		
		return true;
	}
	function selectCheck()
	{
		var frm = document.MAINFORM;
		
		for (i=0; i<frm.length; i++)
			if(isChecked(i, frm, 'cbSelect'))
				return true;
		alert('<%= Globalizer.GetGlobalizedString("ERR_FCC_STOP_ADD_TEXTBOOK") %>');
		return false;
	}
	function isChecked(iIndex, frm, cbName)
	{
		if(frm.elements[iIndex].name.indexOf(cbName) != -1)
			return frm.elements[iIndex].checked;
		return false;
	}
	
</script>
<div class="pSection">
	<table>
		<tr>
			<th><cmn:globalizedliteral id="glitCourse" runat="server" TextKey="LBL_COURSE"></cmn:globalizedliteral></th>
			<td><asp:literal id="litCourse" Runat="server"></asp:literal></td>
			<td>&nbsp;&nbsp;</td>
			<th><cmn:globalizedliteral id="glitTerm" runat="server" TextKey="LBL_TERM"></cmn:globalizedliteral></th>
			<td><asp:literal id="litTerm" Runat="server"></asp:literal></td>
		</tr>
		<tr>
			<th><cmn:globalizedliteral id="glitTitle" runat="server" TextKey="LBL_COURSE_TITLE"></cmn:globalizedliteral></th>
			<td><asp:literal id="litTitle" Runat="server"></asp:literal></td>
			<td>&nbsp;&nbsp;</td>
			<th><cmn:globalizedliteral id="glitDivision" runat="server" TextKey="LBL_DIVISION"></cmn:globalizedliteral></th>
			<td><asp:literal id="litDivision" Runat="server"></asp:literal></td>
		</tr>
		<tr>
			<td><cmn:globalizedliteral id="glitBookTitle" runat="server" TextKey="LBL_FCC_BOOK_TITLE"></cmn:globalizedliteral></td>
			<td><asp:textbox id="tbBookTitle" Runat="server" Width="128px"></asp:textbox></td>
			<td>&nbsp;&nbsp;</td>
			<td><cmn:globalizedliteral id="glitAuthor" runat="server" TextKey="LBL_AUTHOR"></cmn:globalizedliteral></td>
			<td><asp:textbox id="tbAuthor" Runat="server" Width="128px"></asp:textbox></td>
		</tr>
		<tr>
			<td><cmn:globalizedliteral id="glitISBN" runat="server" TextKey="LBL_FCC_ISBN"></cmn:globalizedliteral></td>
			<td><asp:textbox id="tbISBN" Runat="server" Width="128px"></asp:textbox></td>
			<td>&nbsp;&nbsp;</td>
			<td><cmn:globalizedliteral id="glitPublisher" runat="server" TextKey="LBL_PUBLISHER"></cmn:globalizedliteral></td>
			<td><asp:textbox id="tbPublisher" Runat="server" Width="128px"></asp:textbox></td>
		</tr>
		<tr>
			<td colSpan="5"><cmn:globalizedbutton id="gbtnSearch" Runat="server" TextKey="TXT_SEARCH"></cmn:globalizedbutton></td>
		</tr>
		<tr>
			<td colSpan="5"><cmn:globalizedlinkbutton id="glnkAddNew" Runat="server" TextKey="TXT_FCC_ADD_TEXTBOOK"></cmn:globalizedlinkbutton></td>
		</tr>
	</table>
</div>
<cmn:GroupedGrid id="ggTextbooks" runat="server" DataKeyField="TextbookCode" RenderTableHeaders="true">
	<TableHeaderTemplate>
		<%=Globalizer.GetGlobalizedString("TXT_TEXTBOOKS")%>
	</TableHeaderTemplate>
	<Columns>
		<cmn:GlobalizedTemplateColumn HeaderTextKey="TXT_SELECT" ItemStyle-VerticalAlign="Top" ItemStyle-HorizontalAlign="center" ItemStyle-Width="1%">
			<ItemTemplate>
				<asp:CheckBox ID="cbSelect" Runat="server" />
			</ItemTemplate>
		</cmn:GlobalizedTemplateColumn>
		<cmn:GlobalizedBoundColumn DataField="TextbookTitle" HeaderTextKey="TXT_TITLE" ItemStyle-VerticalAlign="Top" />
		<cmn:GlobalizedBoundColumn DataField="Authors" HeaderTextKey="TXT_CS_AUTHORS" ItemStyle-Wrap="False" ItemStyle-VerticalAlign="Top" />
		<cmn:GlobalizedBoundColumn DataField="TextbookPrice" HeaderTextKey="TXT_PRICE" ItemStyle-VerticalAlign="Top" />
		<cmn:GlobalizedBoundColumn DataField="TextbookFee" HeaderTextKey="TXT_FEE" ItemStyle-VerticalAlign="Top" />
		<cmn:GlobalizedBoundColumn DataField="TextbookISBN" HeaderTextKey="TXT_ISBN" ItemStyle-VerticalAlign="Top" />
		<cmn:GlobalizedBoundColumn DataField="TextbookPublisher" HeaderTextKey="TXT_PUBLISHER" ItemStyle-VerticalAlign="Top" />
		<cmn:GlobalizedBoundColumn DataField="TextbookDescription" HeaderTextKey="TXT_DESCRIPTION" ItemStyle-VerticalAlign="Top" />
	</Columns>
	<EmptyTableTemplate>
		<div class="PortletError" runat="server">
			<%=Globalizer.GetGlobalizedString("TXT_THERE_WAS_NO_DATA_FOR_THE_SPECIFIC_CRITERIA")%>
		</div>
	</EmptyTableTemplate>
</cmn:GroupedGrid>
<div class="pSection">
	<table>
		<tr>
			<td>
				<cmn:GlobalizedButton id="gbtnAssignTextbooks" runat="server" TextKey="TXT_FCC_ASSIGN_SELECTED_TEXTBOOKS" />
			</td>
			<td>
				<cmn:GlobalizedButton id="gbtnCancel" runat="server" TextKey="TXT_CANCEL" />
			</td>
		</tr>
	</table>
</div>
