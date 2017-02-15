<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="TextbookEntry.ascx.cs" Inherits="Jenzabar.CRM.Faculty.Web.Portlets.FacultyCourseControlPortlet.TextbookEntry" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<div class="pSection" id="divMain" visible="True" runat="server">
	<table cellSpacing="3" cellPadding="3" width="100%" border="0">
		<tr>
			<th noWrap width="5%">
				<jenzabar:globalizedliteral id="litCourse" runat="server" TextKey="TXT_COURSE"></jenzabar:globalizedliteral>:</th>
			<td noWrap width="20%"><asp:dropdownlist id="ddlCourse" AutoPostBack="True" Runat="server" DataValueField="ERPCourseKey"
					DataTextField="DisplayedCourseCode"></asp:dropdownlist></td>
			<th noWrap width="5%">
				<jenzabar:globalizedliteral id="litTerm" runat="server" TextKey="TXT_TERM"></jenzabar:globalizedliteral>:</th>
			<td noWrap width="70%"><jenzabar:globalizedliteral id="litTermDesc" runat="server"></jenzabar:globalizedliteral></td>
		</tr>
		<tr>
			<th noWrap>
				<jenzabar:globalizedliteral id="litTitle" runat="server" TextKey="TXT_COURSE_TITLE"></jenzabar:globalizedliteral>:</th>
			<td noWrap><jenzabar:globalizedliteral id="litTitleDesc" runat="server"></jenzabar:globalizedliteral></td>
			<th nowrap>
				<jenzabar:GlobalizedLiteral id="litDivision" runat="server"></jenzabar:GlobalizedLiteral>:</th>
			<td nowrap><jenzabar:GlobalizedLiteral id="litDivisionDesc" runat="server"></jenzabar:GlobalizedLiteral></td>
		</tr>
		<tr>
			<td colspan="4" nowrap><jenzabar:GlobalizedLinkButton TextKey="TXT_FCC_SEARCH_TEXTBOOKS" id="lnkSearch" runat="server"></jenzabar:GlobalizedLinkButton></td>
		</tr>
		<tr>
			<td colspan="4" nowrap><jenzabar:GlobalizedLinkButton TextKey="TXT_FCC_ADD_TEXTBOOK" id="lnkAdd" runat="server"></jenzabar:GlobalizedLinkButton></td>
		</tr>
	</table>
</div>
<div class="pSection" id="Div2" visible="True" runat="server">
	<table cellSpacing="0" cellPadding="0" width="100%" border="0">
		<tr>
			<td colSpan="2">
				<jenzabar:GroupedGrid id="dgTextbooks" Runat="server" DataKeyField="TextbookCode" RenderTableHeaders="true">
					<TableHeaderTemplate>
						<jenzabar:GlobalizedLiteral id="litTextbooks" TextKey="TXT_TEXTBOOKS" runat="server"></jenzabar:GlobalizedLiteral>
					</TableHeaderTemplate>
					<EmptyTableTemplate>
						<jenzabar:GlobalizedLiteral id="glitNoRecords" runat="server" TextKey="MSG_NO_TEXTBOOKS"></jenzabar:GlobalizedLiteral>
					</EmptyTableTemplate>
					<Columns>
						<jenzabar:GlobalizedBoundColumn ItemStyle-VerticalAlign="top" DataField="TextbookTitle" HeaderTextKey="TXT_TITLE" />
						<jenzabar:GlobalizedBoundColumn ItemStyle-VerticalAlign="top" DataField="Authors" HeaderTextKey="TXT_CS_AUTHORS" />
						<jenzabar:GlobalizedBoundColumn ItemStyle-VerticalAlign="top" DataField="TextbookPrice" HeaderTextKey="TXT_PRICE" />
						<jenzabar:GlobalizedBoundColumn ItemStyle-VerticalAlign="top" DataField="TextbookFee" HeaderTextKey="TXT_FEE" />
						<jenzabar:GlobalizedBoundColumn ItemStyle-VerticalAlign="top" DataField="TextbookISBN" HeaderTextKey="TXT_ISBN" />
						<jenzabar:GlobalizedBoundColumn ItemStyle-VerticalAlign="top" DataField="TextbookPublisher" HeaderTextKey="TXT_PUBLISHER" />
						<jenzabar:GlobalizedBoundColumn ItemStyle-VerticalAlign="top" DataField="TextbookDescription" HeaderTextKey="TXT_DESCRIPTION" />
						<asp:TemplateColumn ItemStyle-width="2%" ItemStyle-Wrap="false" ItemStyle-VerticalAlign="top" >
							<ItemTemplate>
								<asp:ImageButton ID="EditLink" CommandName="EditBook" Runat="server" />
								<asp:ImageButton ID="DeleteLink" CommandName="DeleteBook" Runat="server" />								
							</ItemTemplate>
						</asp:TemplateColumn>
					</Columns>
				</jenzabar:GroupedGrid>
			</td>
		</tr>
	</table>
</div>
