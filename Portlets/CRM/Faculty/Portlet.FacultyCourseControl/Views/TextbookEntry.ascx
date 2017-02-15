<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="True" Codebehind="TextbookEntry.ascx.cs" Inherits="Jenzabar.CRM.Faculty.Web.Portlets.FacultyCourseControlPortlet.TextbookEntry" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<div class="pSection" id="divMain" visible="True" runat="server">
	<table cellSpacing="3" cellPadding="3" width="100%" border="0">
		<tr>
			<th noWrap width="5%">
				<jenzabar:globalizedliteral id="litCourse" runat="server" TextKey="TXT_COURSE"></jenzabar:globalizedliteral>:</th>
			<td noWrap width="40%"><asp:dropdownlist id="ddlCourse" AutoPostBack="True" Runat="server" DataValueField="ERPCourseKey"
					DataTextField="DisplayedCourseCode"></asp:dropdownlist></td>
			<th noWrap width="5%">
				<jenzabar:globalizedliteral id="litTerm" runat="server" TextKey="TXT_TERM"></jenzabar:globalizedliteral>:</th>
			<td noWrap width="50%"><jenzabar:globalizedliteral id="litTermDesc" runat="server"></jenzabar:globalizedliteral></td>
		</tr>
		<tr>
			<th noWrap>
				<jenzabar:globalizedliteral id="litTitle" runat="server" TextKey="TXT_COURSE_TITLE"></jenzabar:globalizedliteral>:</th>
			<td noWrap><jenzabar:globalizedliteral id="litTitleDesc" runat="server"></jenzabar:globalizedliteral></td>
			<th nowrap>
				<jenzabar:GlobalizedLiteral id="litDivision" runat="server"></jenzabar:GlobalizedLiteral>:</th>
			<td nowrap><jenzabar:GlobalizedLiteral id="litDivisionDesc" runat="server"></jenzabar:GlobalizedLiteral></td>
		</tr>
        <tr><td colspan="4">
        	<asp:table id="tblBookstore" CssClass="hint" visible="false" runat="server" width="100%">
                <asp:tablerow><asp:tablecell colspan="4">
                    <asp:Label ID="lblBookstore" runat="server" ></asp:Label>
                    &raquo <asp:HyperLink ID="lnkBookstore" runat="server" Target="_blank" ></asp:HyperLink>
                </asp:tablecell></asp:tablerow>
            </asp:table>
        </td></tr>
		<tr >
			<td colspan="4" >
			    <asp:Image ID="imSearch" ImageUrl="~/ui/common/images/PortletImages/Icons/search.gif" runat="server" />
			    <jenzabar:GlobalizedLinkButton TextKey="TXT_FCC_SEARCH_TEXTBOOKS" id="lnkSearch" runat="server"></jenzabar:GlobalizedLinkButton>
			</td>
		</tr>
		<tr >
			<td colspan="4" >
			    <asp:Image ID="imAdd" ImageUrl="~/ui/common/images/PortletImages/Icons/add.gif" runat="server" />
			    <jenzabar:GlobalizedLinkButton TextKey="TXT_FCC_ADD_TEXTBOOK" id="lnkAdd" runat="server"></jenzabar:GlobalizedLinkButton>
			</td>
		</tr>
	</table>
</div>
<div class="pSection" id="Div2" visible="True" runat="server">
	<table cellSpacing="0" cellPadding="0" width="100%" border="0">
		<tr>
			<td colSpan="2" class="smallTextRight" >(<strong><Jenzabar:GlobalizedLabel runat="server" TextKey = "TXT_PRICING" /></strong> = <Jenzabar:GlobalizedLabel runat="server" TextKey = "TXT_TXTBK_PRICE_HINT" />&nbsp
			<strong><Jenzabar:GlobalizedLabel runat="server" TextKey = "TXT_COST" /></strong> = <Jenzabar:GlobalizedLabel runat="server" TextKey = "TXT_TXTBK_COST_HINT" />)
			</td>
		</tr>
		<tr>
			<td colSpan="2">
				<jenzabar:GroupedGrid id="dgTextbooks" Runat="server" DataKeyField="TextbookCode" RenderTableHeaders="true"  >
					<TableHeaderTemplate>
						<jenzabar:GlobalizedLiteral id="litTextbooks" TextKey="TXT_TEXTBOOKS" runat="server"></jenzabar:GlobalizedLiteral>
                        <tr>
                            <th id="hEmpty" runat="server" ></th>
                            <th id="hPricing" runat="server" ><jenzabar:GlobalizedLiteral id="litPricing" TextKey="TXT_PRICING" runat="server"></jenzabar:GlobalizedLiteral></th>
                            <th id="hCost" runat="server" ></th>
                       </tr>
					</TableHeaderTemplate>
					<EmptyTableTemplate>
						<jenzabar:GlobalizedLiteral id="glitNoRecords" runat="server" TextKey="MSG_NO_TEXTBOOKS"></jenzabar:GlobalizedLiteral>
					</EmptyTableTemplate>
					<Columns>
			            <jenzabar:GlobalizedTemplateColumn HeaderTextKey="TXT_BOOK_TITLE">
				            <ItemTemplate>
						        <strong><%# DataBinder.Eval(Container.DataItem, "TextbookTitle")%></strong>
							    <asp:ImageButton ID="EditLink" CommandName="EditBook" Runat="server" />
							    <asp:ImageButton ID="DeleteLink" CommandName="DeleteBook" Runat="server" />
    						</ItemTemplate>
					    </jenzabar:GlobalizedTemplateColumn>
						<jenzabar:GlobalizedBoundColumn ItemStyle-VerticalAlign="top" DataField="TextbookISBN" HeaderTextKey="TXT_ISBN" />
						<jenzabar:GlobalizedBoundColumn ItemStyle-VerticalAlign="top" DataField="ISBN13" HeaderTextKey="TXT_ISBN13" />
        				<jenzabar:GlobalizedBoundColumn ItemStyle-VerticalAlign="top" DataField="TextbookPrice" HeaderTextKey="TXT_NEW" />
		        		<jenzabar:GlobalizedBoundColumn ItemStyle-VerticalAlign="top" DataField="UsedBookPrice" HeaderTextKey="TXT_USED" />
				        <jenzabar:GlobalizedBoundColumn ItemStyle-VerticalAlign="top" DataField="RentalPrice" HeaderTextKey="TXT_RENTAL" />
						<jenzabar:GlobalizedBoundColumn ItemStyle-VerticalAlign="top" DataField="WholesaleCost" HeaderTextKey="TXT_COST" />
					</Columns>
			<SubItemTemplate>
				<table cellSpacing="0" cellPadding="0" border="0" align="left" >
					<tr runat="server" visible='<%#DataBinder.Eval(Container.DataItem, "Authors").ToString().Trim() != string.Empty%>'>
						<td colspan="2" class="body">
							<strong><jenzabar:GlobalizedLiteral id="litAuthors" TextKey="LBL_AUTHOR(S)" runat="server"></jenzabar:GlobalizedLiteral></strong><%#DataBinder.Eval(Container.DataItem, "Authors")%></td>
					</tr>
					<tr runat="server" visible='<%#DataBinder.Eval(Container.DataItem, "TextbookCopyright").ToString().Trim() + DataBinder.Eval(Container.DataItem, "TextbookPublisher").ToString().Trim() != string.Empty%>'>
				        <td class="body" visible='<%#DataBinder.Eval(Container.DataItem, "TextbookCopyright").ToString().Trim() != string.Empty%>' >
				        	<strong><jenzabar:GlobalizedLiteral id="litCopyright" TextKey="LBL_COPYRIGHT" runat="server" visible='<%#DataBinder.Eval(Container.DataItem, "TextbookCopyright").ToString().Trim() != string.Empty%>'></jenzabar:GlobalizedLiteral></strong>
						    <%#DataBinder.Eval(Container.DataItem, "TextbookCopyright")%>&nbsp
		        		</td>
        				<td class="body" visible='<%#DataBinder.Eval(Container.DataItem, "TextbookPublisher").ToString().Trim() != string.Empty%>' >
				            <strong><jenzabar:GlobalizedLiteral id="litPublisher" TextKey="LBL_PUBLISHER" runat="server" visible='<%#DataBinder.Eval(Container.DataItem, "TextbookPublisher").ToString().Trim() != string.Empty%>'></jenzabar:GlobalizedLiteral></strong>
						    <%#DataBinder.Eval(Container.DataItem, "TextbookPublisher")%>
						</td>
					</tr>
					<tr runat="server" visible='<%#DataBinder.Eval(Container.DataItem, "TextbookDescription").ToString().Trim() != string.Empty%>'>
						<td colspan="2" class="body">
							<strong><jenzabar:GlobalizedLiteral id="litRemarks" TextKey="LBL_DESCRIPTION" runat="server"></jenzabar:GlobalizedLiteral></strong>
						    <Jenzabar:CollapsibleText runat="server" text='<%#DataBinder.Eval(Container.DataItem, "TextbookDescription")%>' ></Jenzabar:CollapsibleText>
						</td>
					</tr>
				</table>
			</SubItemTemplate>
				</jenzabar:GroupedGrid>
			</td>
		</tr>
	</table>
</div>
