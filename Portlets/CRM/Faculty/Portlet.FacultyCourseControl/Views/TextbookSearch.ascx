<%@ Control Language="c#" AutoEventWireup="True" Codebehind="TextbookSearch.ascx.cs" Inherits="Jenzabar.CRM.Faculty.Web.Portlets.FacultyCourseControlPortlet.TextbookSearch" %>
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
			<th noWrap width="20%"><cmn:globalizedliteral id="glitCourse" runat="server" TextKey="LBL_COURSE"></cmn:globalizedliteral></th>
			<td noWrap width="35%"><asp:literal id="litCourse" Runat="server"></asp:literal></td>
			<th noWrap width="10%"><cmn:globalizedliteral id="glitTerm" runat="server" TextKey="LBL_TERM"></cmn:globalizedliteral></th>
			<td noWrap width="35%"><asp:literal id="litTerm" Runat="server"></asp:literal></td>
		</tr>
		<tr>
			<th><cmn:globalizedliteral id="glitTitle" runat="server" TextKey="LBL_COURSE_TITLE"></cmn:globalizedliteral></th>
			<td><asp:literal id="litTitle" Runat="server"></asp:literal></td>
			<th><cmn:globalizedliteral id="glitDivision" runat="server" TextKey="LBL_DIVISION"></cmn:globalizedliteral></th>
			<td><asp:literal id="litDivision" Runat="server"></asp:literal></td>
		</tr>
	</table>
   <cmn:ContentBox TextKey="TXT_TEXTBOOK_SEARCH" runat="server" id="cbSearch">
	<table cellpadding="3" >
		<tr>
			<td noWrap width="20%" ><cmn:globalizedliteral id="glitBookTitle" runat="server" TextKey="LBL_FCC_BOOK_TITLE"></cmn:globalizedliteral></td>
			<td noWrap width="35%"><asp:textbox id="tbBookTitle" Runat="server" Width="128px"></asp:textbox></td>
			<td noWrap width="10%"><cmn:globalizedliteral id="glitAuthor" runat="server" TextKey="LBL_AUTHOR"></cmn:globalizedliteral></td>
			<td noWrap width="35%"><asp:textbox id="tbAuthor" Runat="server" Width="128px"></asp:textbox></td>
		</tr>
		<tr>
			<td>
			    <cmn:globalizedliteral id="glitISBN" runat="server" TextKey="LBL_FCC_ISBN"></cmn:globalizedliteral>
				<asp:RadioButton id="rb10" runat="server" Checked="True" GroupName="ISBN" />
			    <asp:RadioButton id="rb13" runat="server" GroupName="ISBN" />
			</td>
			<td>
                <asp:textbox id="tbISBN" Runat="server" Width="128px"></asp:textbox>
            </td>
			<td><cmn:globalizedliteral id="glitPublisher" runat="server" TextKey="LBL_PUBLISHER"></cmn:globalizedliteral></td>
			<td><asp:textbox id="tbPublisher" Runat="server" Width="128px"></asp:textbox></td>
		</tr>
		<tr>
			<td colSpan="4" align="center"><cmn:globalizedbutton id="gbtnSearch" Runat="server" TextKey="TXT_SEARCH"></cmn:globalizedbutton></td>
		</tr>
	</table>
	</cmn:ContentBox>
	<cmn:globalizedlinkbutton id="glnkAddNew" Runat="server" TextKey="TXT_FCC_ADD_TEXTBOOK"></cmn:globalizedlinkbutton>
</div>
<cmn:GroupedGrid id="ggTextbooks" runat="server" DataKeyField="TextbookCode" RenderTableHeaders="true" >
	<TableHeaderTemplate>
		<%=Globalizer.GetGlobalizedString("TXT_TEXTBOOKS")%>
	</TableHeaderTemplate>
	<Columns>
		<cmn:GlobalizedTemplateColumn HeaderTextKey="TXT_SELECT" ItemStyle-VerticalAlign="Top" ItemStyle-HorizontalAlign="center" ItemStyle-Width="1%">
			<ItemTemplate>
				<asp:CheckBox ID="cbSelect" Runat="server" />
			</ItemTemplate>
		</cmn:GlobalizedTemplateColumn>
		<cmn:GlobalizedTemplateColumn HeaderTextKey="TXT_BOOK_TITLE">
		    <ItemTemplate>
			    <strong><%# DataBinder.Eval(Container.DataItem, "TextbookTitle")%></strong>
    		</ItemTemplate>
		</cmn:GlobalizedTemplateColumn>
		<cmn:GlobalizedBoundColumn ItemStyle-VerticalAlign="top" DataField="TextbookISBN" HeaderTextKey="TXT_ISBN" />
		<cmn:GlobalizedBoundColumn ItemStyle-VerticalAlign="top" DataField="ISBN13" HeaderTextKey="TXT_ISBN13" />
        <cmn:GlobalizedBoundColumn ItemStyle-VerticalAlign="top" DataField="TextbookPrice" HeaderTextKey="TXT_NEW" />
		<cmn:GlobalizedBoundColumn ItemStyle-VerticalAlign="top" DataField="UsedBookPrice" HeaderTextKey="TXT_USED" />
		<cmn:GlobalizedBoundColumn ItemStyle-VerticalAlign="top" DataField="RentalPrice" HeaderTextKey="TXT_RENTAL" />
		<cmn:GlobalizedBoundColumn ItemStyle-VerticalAlign="top" DataField="WholesaleCost" HeaderTextKey="TXT_COST" />
	</Columns>
	<SubItemTemplate>
		<table cellSpacing="0" cellPadding="0" border="0" align="left" >
			<tr id="Tr1" runat="server" visible='<%#DataBinder.Eval(Container.DataItem, "Authors").ToString().Trim() != string.Empty%>'>
				<td colspan="2" class="body">
					<strong><cmn:GlobalizedLiteral id="litAuthors" TextKey="LBL_AUTHOR(S)" runat="server"></cmn:GlobalizedLiteral></strong><%#DataBinder.Eval(Container.DataItem, "Authors")%></td>
			</tr>
			<tr id="Tr2" runat="server" visible='<%#DataBinder.Eval(Container.DataItem, "TextbookCopyright").ToString().Trim() + DataBinder.Eval(Container.DataItem, "TextbookPublisher").ToString().Trim() != string.Empty%>'>
				<td class="body" visible='<%#DataBinder.Eval(Container.DataItem, "TextbookCopyright").ToString().Trim() != string.Empty%>' >
					<strong><cmn:GlobalizedLiteral id="litCopyright" TextKey="LBL_COPYRIGHT" runat="server" ></cmn:GlobalizedLiteral></strong>
				    <%#DataBinder.Eval(Container.DataItem, "TextbookCopyright")%>
				</td>
				<td class="body" visible='<%#DataBinder.Eval(Container.DataItem, "TextbookPublisher").ToString().Trim() != string.Empty%>' >
				    <strong><cmn:GlobalizedLiteral id="litPublisher" TextKey="LBL_PUBLISHER" runat="server" ></cmn:GlobalizedLiteral></strong>
				    <%#DataBinder.Eval(Container.DataItem, "TextbookPublisher")%>
				</td>
			</tr>
			<tr id="Tr3" runat="server" visible='<%#DataBinder.Eval(Container.DataItem, "TextbookDescription").ToString().Trim() != string.Empty%>'>
				<td colspan="2" class="body">
					<strong><cmn:GlobalizedLiteral id="litRemarks" TextKey="LBL_DESCRIPTION" runat="server"></cmn:GlobalizedLiteral></strong>
				    <cmn:CollapsibleText runat="server" text='<%#DataBinder.Eval(Container.DataItem, "TextbookDescription")%>' ></cmn:CollapsibleText>
				</td>
			</tr>
		</table>
	</SubItemTemplate>
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
