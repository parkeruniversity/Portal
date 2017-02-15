<%@ Control Language="c#" AutoEventWireup="True" Codebehind="SearchResults.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.CourseSchedulesPortlet.SearchResults" %>
<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<div class="pSection" id="divMain" runat="server" visible="true">
	<jenzabar:errordisplay id="errDisplay" Runat="server"></jenzabar:errordisplay>
	<jenzabar:GlobalizedNote ID="lblStatus" Runat="server"></jenzabar:GlobalizedNote>
	<h4><jenzabar:globalizedliteral id="glitResults" runat="server" TextKey="TXT_SEARCH_RESULTS"></jenzabar:globalizedliteral></h4>
	<table cellSpacing="2" cellPadding="0" width="100%" border="0">
	<TBODY>
		<tr>
			<td colspan=1><jenzabar:globalizedlinkbutton TextKey="TXT_SEARCH_AGAIN" id="glbSearchAgain" runat="server" onclick="glbSearchAgain_Click"></jenzabar:globalizedlinkbutton></td>
			<td noWrap align="right">
				<jenzabar:GlobalizedLiteral TextKey="TXT_TERM" id="LitTerm" Runat="server"></jenzabar:GlobalizedLiteral>:</td>
			<td noWrap><asp:dropdownlist id="ddlTerm" Runat="server" DataValueField="Key" DataTextField="Description"></asp:dropdownlist></td>
			<td noWrap align="right">
				<asp:label id="lblDivision" Runat="server"></asp:label></td>
				<td noWrap colspan="3"><asp:dropdownlist id="ddlDivision" Runat="server" DataValueField="Code" DataTextField="Description"></asp:dropdownlist></td>
			<td noWrap><jenzabar:GlobalizedButton id="btnSearch" TextKey="TXT_SEARCH" Runat="server" onclick="btnSearch_Click"></jenzabar:GlobalizedButton></td>
			<td><jenzabar:hint id="hntSearch" TextKey="TXT_CS_SEARCH_RESULTS_HINT" runat="server"></jenzabar:hint></td>
		</tr>
		<tr>
			<td colspan="6">
				<jenzabar:Hint id="hntLoginRequest" runat="server">
						<jenzabar:GlobalizedLiteral id="litLoginRequest" runat="server"></jenzabar:GlobalizedLiteral>
						<BR>
						<jenzabar:GlobalizedLinkButton id="lnkRequestLogin" runat="server" TextKey="TXT_CS_REQUEST_LOGIN_PASSWORD"></jenzabar:GlobalizedLinkButton>
				</jenzabar:Hint>
			</td>
		</tr>
	</TBODY>
	</table>
	<Jenzabar:GroupedGrid id="dgCourses" runat="server" DataKeyField="ERPCourseKey" RenderTableHeaders="true" ShowHeader="true" CollapseSubItems="true">
	<Columns>
		<jenzabar:GlobalizedTemplateColumn HeaderTextKey="TXT_ADD" ItemStyle-Width="1%" ItemStyle-VerticalAlign="Top">
			<ItemTemplate>
				<asp:CheckBox ID="chkInclude" Runat="server" ></asp:CheckBox>
				<asp:Label ID="lblPublicReg" Runat="server"></asp:Label>
			</ItemTemplate>
		</jenzabar:GlobalizedTemplateColumn>
		<jenzabar:PlusMinusColumn id="pmtbk" HeaderText="Textbooks" ItemStyle-VerticalAlign="Top" ItemStyle-Width="1%" ItemStyle-HorizontalAlign="Center" />
		<jenzabar:GlobalizedTemplateColumn HeaderTextKey="TXT_COURSE_CODE" ItemStyle-VerticalAlign="Top" ItemStyle-Wrap="False">
			<ItemTemplate>
					<asp:LinkButton id="lnkCourse" CommandName="CourseDetails" Runat="server">
					<%#DataBinder.Eval(Container.DataItem, "DisplayedCourseCode")%>
				</asp:LinkButton>
			</ItemTemplate>
		</jenzabar:GlobalizedTemplateColumn>
		<jenzabar:GlobalizedBoundColumn HeaderTextKey="TXT_NAME" DataField="Title" ItemStyle-VerticalAlign="Top"></jenzabar:GlobalizedBoundColumn>
		<jenzabar:GlobalizedTemplateColumn HeaderTextKey="TXT_FACULTY" ItemStyle-VerticalAlign="Top">
			<ItemTemplate>
				<ul>
					<asp:Repeater DataSource='<%#DataBinder.Eval(Container.DataItem, "FacultyList")%>' ID="rptFaculty" Runat="server">
						<ItemTemplate>
							<li>
								<%#DataBinder.Eval(Container.DataItem, "FacultyName")%>
							</li>
						</ItemTemplate>
					</asp:Repeater>
				</ul>
			</ItemTemplate>
		</jenzabar:GlobalizedTemplateColumn>
		<jenzabar:GlobalizedTemplateColumn HeaderTextKey="TXT_SEATS_OPEN" ItemStyle-VerticalAlign="Top" ItemStyle-Wrap="False">
			<ItemTemplate><%# DataBinder.Eval( Container.DataItem, "AvailableSeats" )%>/<%# DataBinder.Eval( Container.DataItem, "TotalSeats" )%></ItemTemplate>
		</jenzabar:GlobalizedTemplateColumn>
		<jenzabar:GlobalizedBoundColumn HeaderTextKey="TXT_STATUS" DataField="CourseStatus" ItemStyle-VerticalAlign="Top"></jenzabar:GlobalizedBoundColumn>
		<jenzabar:GlobalizedTemplateColumn HeaderTextKey="TXT_SCHEDULE" ItemStyle-VerticalAlign="Top">
			<ItemTemplate>
				<ul><asp:Literal ID="litSchedule" runat="server" />
			</ItemTemplate>
		</jenzabar:GlobalizedTemplateColumn>
		<jenzabar:GlobalizedBoundColumn HeaderTextKey="TXT_CS_CREDITS" DataField="CreditHours" ItemStyle-VerticalAlign="Top"></jenzabar:GlobalizedBoundColumn>
		<jenzabar:GlobalizedBoundColumn HeaderTextKey="TXT_BEGIN_DATE" DataField="FirstBeginDate" ItemStyle-VerticalAlign="Top" />
		<jenzabar:GlobalizedBoundColumn HeaderTextKey="TXT_END_DATE" DataField="LastEndDate" ItemStyle-VerticalAlign="Top" />
	</Columns>
	<SubItemTemplate>
			<table cellSpacing="2" cellPadding="0"  width="96%">
				<tr><td >
         	<asp:table id="tblBookstore" visible="false" runat="server" width="100%">
                <asp:tablerow><asp:tablecell >
                  <asp:Label ID="lblBookstore" runat="server" Visible="false" ></asp:Label>
                  &raquo <asp:HyperLink ID="lnkBookstore" runat="server" Target="_blank" Visible="false" ></asp:HyperLink>
          </asp:tablecell></asp:tablerow>
    </asp:table>
              </td></tr>
				<tr>
					<td>
		    <Jenzabar:GroupedGrid id="ggTextbooks" runat="server" Visible='<%#DataBinder.Eval(Container.DataItem, "Textbook") != null %>' DataSource='<%#DataBinder.Eval(Container.DataItem, "Textbook")%>' DataKeyField="TextbookCode" ShowHeader="true" RenderTableHeaders="true" >
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
		    </Jenzabar:GroupedGrid>
        </td></tr></table>
	</SubItemTemplate>
    </Jenzabar:GroupedGrid>
	<table width=100%>
	    <tbody>
		<tr>
		<td>
				<jenzabar:GlobalizedButton ID="btnAddCourse" TextKey="TXT_CS_ADD_COURSES" Runat="server" onclick="btnAddCourse_Click"></jenzabar:GlobalizedButton>
		</td>
		</tr>
		<tr>
		<td align="right"><jenzabar:LetterNavigator id="ltrNav" runat="server" AutoBind="False"></jenzabar:LetterNavigator></td>
	</tr>
	</tbody></table></div>
</BODY></HTML>
