<%@ Import namespace="Jenzabar.Common.Globalization"%>
<%@ Import namespace="Jenzabar.ICS.Web.Portlets.ForumPortlet" %>
<%@ Import namespace="Jenzabar.ICS.Web.Portlets.Common" %>
<%@ Register TagPrefix="jenzabar" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Search_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.ForumPortlet.Search_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<div class="pSection">
	<p>
		<asp:PlaceHolder ID="SearchForm" Runat="server">
			<TABLE>
				<TR>
					<TD vAlign="top" colSpan="2"><B>
							<asp:label id="lblMsgSearchInstr" Runat="Server"></asp:label></B></TD>
				</TR>
				<TR>
					<TD>&nbsp;</TD>
				</TR>
				<TR>
					<TD vAlign="top" align="right">
						<asp:label id="lblFindInMsg" Runat="Server"></asp:label></TD>
					<TD>
						<asp:textbox id="txtPhrase" Columns="40" MaxLength="200" runat="server"></asp:textbox></TD>
				</TR>
				<TR>
					<TD vAlign="top" align="right">
						<asp:label id="lblResultsMust" Runat="Server"></asp:label></TD>
					<TD>
						<asp:radiobuttonlist id="radSearchType" runat="server">
							<asp:ListItem Value="Exact"></asp:ListItem>
							<asp:ListItem Value="Any" Selected></asp:ListItem>
							<asp:ListItem Value="All"></asp:ListItem>
						</asp:radiobuttonlist></TD>
				</TR>
				<TR>
					<TD>&nbsp;</TD>
				</TR>
				<TR>
					<TD vAlign="top" align="right">
						<asp:label id="lblFindByAuthor" Runat="Server"></asp:label></TD>
					<TD>
						<asp:dropdownlist id="ddAuthor" runat="server"></asp:dropdownlist></TD>
				</TR>
				<TR>
					<TD>&nbsp;</TD>
				</TR>
				<TR>
					<TD vAlign="top" align="right">
						<asp:label id="lblLookInTopics" Runat="Server"></asp:label></TD>
					<TD>
						<asp:dropdownlist id="ddTopic" runat="server"></asp:dropdownlist></TD>
				</TR>
				<TR>
					<TD>&nbsp;</TD>
				</TR>
				<TR>
					<TD vAlign="top" align="right">
						<asp:label id="lblShowResultsFrom" Runat="Server"></asp:label></TD>
					<TD>
						<jenzabar:DatePicker id="dpFromDate" runat="server"></jenzabar:DatePicker></TD>
				</TR>
				<TR>
					<TD vAlign="top" align="right">
						<asp:label id="lblTo" Runat="Server"></asp:label></TD>
					<TD>
						<jenzabar:DatePicker id="dpToDate" runat="server"></jenzabar:DatePicker></TD>
				</TR>
				<TR>
					<TD>&nbsp;</TD>
				</TR>
				<TR>
					<TD></TD>
					<TD>
						<asp:button id="btnSearch" runat="server"></asp:button>&nbsp;
						<asp:button id="btnCancel" runat="server"></asp:button></TD>
				</TR>
			</TABLE>
		</asp:PlaceHolder>
		<asp:PlaceHolder ID="SearchResults" Runat="server" Visible="False">
			<DIV class="forumPortlet"><B>
					<asp:label id="lblSearchResults" Runat="Server"></asp:label></B><SPAN class="modifyLink">
					<asp:LinkButton id="lnkModifySearch" Runat="server" CommandName="ModifySearch"></asp:LinkButton></SPAN>
				<asp:label id="lblNoResults" Runat="server"></asp:label>
				<H5 id="PagingHeader" align="center" runat="server"></H5>
				<asp:Repeater id="MessageRptr" runat="server">
					<HeaderTemplate>
						<table class="forumSearch" cellspacing="0" border="0" width="95%">
					</HeaderTemplate>
					<ItemTemplate>
						<tr>
							<td>
								<asp:LinkButton ID="MessageLink" CommandName="ViewMessage" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ID")%>' Runat="server">
									<%# DataBinder.Eval(Container.DataItem, "Subject") %>
								</asp:LinkButton>
								(
								<asp:LinkButton ID="ThreadLink" CommandName="ViewThread" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"Thread.ID")%>' Runat="server">View Entire Thread</asp:LinkButton>)
							</td>
							<td width="10%" nowrap>
								|
								<%# GetNameDetails(Container) %>
								|
								<%# DataBinder.Eval(Container.DataItem, "Created") %>
							<td>
						</tr>
						<tr>
							<td colspan="2">
								<%# DataBinder.Eval(Container.DataItem, "Message").ToString().Length > 400 ? DataBinder.Eval(Container.DataItem, "Message").ToString().Substring(0,200) + "..." : DataBinder.Eval(Container.DataItem, "Message").ToString() %>
							<td>
						</tr>
					</ItemTemplate>
					<AlternatingItemTemplate>
						<tr class="altEntry">
							<td>
								<asp:LinkButton ID="Linkbutton1" CommandName="ViewMessage" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ID")%>' Runat="server">
									<%# DataBinder.Eval(Container.DataItem, "Subject") %>
								</asp:LinkButton>
								(
								<asp:LinkButton ID="Linkbutton2" CommandName="ViewThread" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"Thread.ID")%>' Runat="server">View Entire Thread</asp:LinkButton>)
							</td>
							<td width="10%" nowrap>
								|
								<%# GetNameDetails(Container) %>
								|
								<%# DataBinder.Eval(Container.DataItem, "Created") %>
							<td>
						</tr>
						<tr class="altEntry">
							<td colspan="2">
								<%# DataBinder.Eval(Container.DataItem, "Message") %>
							<td>
						</tr>
					</AlternatingItemTemplate>
					<FooterTemplate>
					</table>
				</FooterTemplate>
				</asp:Repeater></DIV>
		</asp:PlaceHolder>
	<P></P>
</div>
