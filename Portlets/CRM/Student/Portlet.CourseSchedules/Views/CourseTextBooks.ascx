<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="True" Codebehind="CourseTextBooks.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.CourseSchedulesPortlet.CourseTextBooks" %>
<div class="pSection">
	<jenzabar:errordisplay id="errDisplay" Runat="server"></jenzabar:errordisplay>
	<table cellSpacing="3" cellPadding="3" width="100%">
		<tr>
			<th align="left" colSpan="4">
				<jenzabar:globalizedlabel id="lblTextbooksFor" Runat="server" TextKey="TXT_CS_TEXTBOOKS_FOR"></jenzabar:globalizedlabel></th></tr>
		<tr>
			<td noWrap><asp:label id="lblCourseCode" Runat="server"></asp:label></td>
			<td noWrap><asp:label id="lblCourseTitle" Runat="server"></asp:label></td>
			<td noWrap><asp:label id="lblTerm" Runat="server"></asp:label></td>
			<td noWrap><asp:label id="lblDivision" Runat="server"></asp:label></td>
		</tr>
		<tr>
			<td colspan="4"><jenzabar:GlobalizedNote id="lblStatus" runat="server"></jenzabar:GlobalizedNote></td>
		</tr>
	</table>
	<asp:table id="tblBookstore" CssClass="hint" visible="false" runat="server" width="100%">
        <asp:tablerow><asp:tablecell colspan="4">
            <asp:Label ID="lblBookstore" runat="server" ></asp:Label>
            &raquo <asp:HyperLink ID="lnkBookstore" runat="server" Target="_blank" ></asp:HyperLink>
        </asp:tablecell></asp:tablerow>
    </asp:table>
<jenzabar:GroupedGrid id="ggTextbooks" runat="server" DataKeyField="TextbookCode" RenderTableHeaders="true" >
   <HeaderStyle CssClass="GrdHeaderStyle" />                        
   <TableHeaderTemplate>
		<jenzabar:GlobalizedLiteral id="litTextbooks" TextKey="TXT_TEXTBOOKS" runat="server"></jenzabar:GlobalizedLiteral>
   <tr>
        <th id="hEmpty" runat="server" ></th>
        <th id="hPricing" runat="server" ><jenzabar:GlobalizedLiteral id="litPricing" TextKey="TXT_PRICING" runat="server"></jenzabar:GlobalizedLiteral></th>
        </tr>
    </TableHeaderTemplate>
	<Columns>
		<jenzabar:GlobalizedTemplateColumn HeaderTextKey="TXT_BOOK_TITLE">
		    <ItemTemplate>
			    <strong><%# DataBinder.Eval(Container.DataItem, "TextbookTitle")%></strong>
    		</ItemTemplate>
		</jenzabar:GlobalizedTemplateColumn>
		<jenzabar:GlobalizedBoundColumn ItemStyle-VerticalAlign="top" DataField="TextbookISBN" HeaderTextKey="TXT_ISBN" />
		<jenzabar:GlobalizedBoundColumn ItemStyle-VerticalAlign="top" DataField="ISBN13" HeaderTextKey="TXT_ISBN13" />
        <jenzabar:GlobalizedBoundColumn ItemStyle-VerticalAlign="top" DataField="TextbookPrice" HeaderTextKey="TXT_NEW" />
		<jenzabar:GlobalizedBoundColumn ItemStyle-VerticalAlign="top" DataField="UsedBookPrice" HeaderTextKey="TXT_USED" />
		<jenzabar:GlobalizedBoundColumn ItemStyle-VerticalAlign="top" DataField="RentalPrice" HeaderTextKey="TXT_RENTAL" />
	</Columns>
	<SubItemTemplate>
		<table cellSpacing="0" cellPadding="0" border="0" align="left" >
			<tr id="Tr1" runat="server" visible='<%#DataBinder.Eval(Container.DataItem, "Authors").ToString().Trim() != string.Empty%>'>
				<td colspan="2" class="body">
					<strong><jenzabar:GlobalizedLiteral id="litAuthors" TextKey="LBL_AUTHOR(S)" runat="server"></jenzabar:GlobalizedLiteral></strong><%#DataBinder.Eval(Container.DataItem, "Authors")%></td>
			</tr>
			<tr id="Tr2" runat="server" visible='<%#DataBinder.Eval(Container.DataItem, "TextbookCopyright").ToString().Trim() + DataBinder.Eval(Container.DataItem, "TextbookPublisher").ToString().Trim() != string.Empty%>'>
				<td class="body" visible='<%#DataBinder.Eval(Container.DataItem, "TextbookCopyright").ToString().Trim() != string.Empty%>' >
					<strong><jenzabar:GlobalizedLiteral id="litCopyright" TextKey="LBL_COPYRIGHT" runat="server" ></jenzabar:GlobalizedLiteral></strong>
				    <%#DataBinder.Eval(Container.DataItem, "TextbookCopyright")%>
				</td>
				<td class="body" visible='<%#DataBinder.Eval(Container.DataItem, "TextbookPublisher").ToString().Trim() != string.Empty%>' >
				    <strong><jenzabar:GlobalizedLiteral id="litPublisher" TextKey="LBL_PUBLISHER" runat="server" ></jenzabar:GlobalizedLiteral></strong>
				    <%#DataBinder.Eval(Container.DataItem, "TextbookPublisher")%>
				</td>
			</tr>
			<tr id="Tr3" runat="server" visible='<%#DataBinder.Eval(Container.DataItem, "TextbookDescription").ToString().Trim() != string.Empty%>'>
				<td colspan="2" class="body">
					<strong><jenzabar:GlobalizedLiteral id="litRemarks" TextKey="LBL_DESCRIPTION" runat="server"></jenzabar:GlobalizedLiteral></strong>
				    <jenzabar:CollapsibleText runat="server" text='<%#DataBinder.Eval(Container.DataItem, "TextbookDescription")%>' ></jenzabar:CollapsibleText>
				</td>
			</tr>
		</table>
	</SubItemTemplate>
</jenzabar:GroupedGrid>
</div>
