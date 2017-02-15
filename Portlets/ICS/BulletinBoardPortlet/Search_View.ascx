<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Search_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.BulletinBoardPortlet.Search_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="jenzabar" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Import namespace="Jenzabar.ICS.Web.Portlets.Common" %>
<%@ Import namespace="Jenzabar.ICS.Web.Portlets.BulletinBoardPortlet" %>
<LINK href="Portlets/ICS/BulletinBoardPortlet/BBStyle.css" type="text/css" rel="stylesheet">
<div class="pSection">
<p>
	<asp:PlaceHolder ID="SearchForm" Runat="server">
		<table>
			<tr>
				<td vAlign=top colspan="2">
					<B><asp:label ID="lblMsgSearchInstr" Runat=Server /></B>
				</td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			<tr>
				<td vAlign=top align=right>
					<asp:label ID="lblFindInMsg" Runat=Server /></td>
				<td>
					<asp:textbox id="txtPhrase" runat="server" MaxLength="200" Columns="40" />
				</td>
			</tr>
			<tr>
				<td vAlign=top align=right>
					<asp:label ID="lblResultsMust" Runat=Server /></td>
				<td>
					<asp:radiobuttonlist id="radSearchType" runat="server">
						<asp:ListItem Value="Exact"></asp:ListItem>
						<asp:ListItem Value="Any" Selected></asp:ListItem>
						<asp:ListItem Value="All"></asp:ListItem>
					</asp:RadioButtonList>
				</td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			<tr>
				<td vAlign=top align=right>
					<asp:label ID="lblFindByAuthor" Runat=Server /></td>
				<td>
					<asp:dropdownlist id="ddAuthor" runat="server" />
				</td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			<tr>
				<td vAlign=top align=right>
					<asp:label ID="lblLookInTopics" Runat=Server /></td>
				<td>
					<asp:dropdownlist id="ddTopic" runat="server" />
				</td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			<tr>
				<TD vAlign="top" align=right>
					<asp:label ID="lblShowResultsFrom" Runat=Server /></td>
				<td>
					<jenzabar:DatePicker ID="dpFromDate" runat="server" />
				</td>
			</tr>
			<tr>
				<TD vAlign="top" align=right>
					<asp:label ID="lblTo" Runat=Server />
				</td>
				<td>
					<jenzabar:DatePicker ID="dpToDate" runat="server" />
				</td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			<tr>
				<td></td>
				<td>
					<asp:button id=btnSearch runat="server" />&nbsp;
					<asp:button id=btnCancel runat="server"  />
				</td>
			</tr>
		</table>
	</asp:PlaceHolder>
	<asp:PlaceHolder ID="SearchResults" Runat="server" Visible="False">
		<div class="forumPortlet">
			<b><asp:label ID="lblSearchResults" Runat=Server /></b>
			<span class="modifyLink">
				<asp:LinkButton ID="lnkModifySearch" CommandName="ModifySearch" Runat="server" />
			</span>
			<asp:label ID="lblNoResults" Runat="server" />
			<h5 id="PagingHeader" runat="server" align="center"></h5>
			<asp:Repeater id="MessageRptr" runat="server">
				<HeaderTemplate>
					<table class="forumSearch" cellspacing="0" border="0" width="95%">
				</HeaderTemplate>
				<ItemTemplate>
					<tr>
						<td>	
							<asp:LinkButton ID="MessageLink" CommandName="ViewMessage" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ID")%>'  Runat="server">
								<%# DataBinder.Eval(Container.DataItem, "Subject") %>
							</asp:LinkButton> 
							(<asp:LinkButton ID="ThreadLink" CommandName="ViewThread" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"Thread.ID")%>'  Runat="server">View Entire Thread</asp:LinkButton>)
						</td>
						<td width="10%" nowrap>
							| <%# DataBinder.Eval( Container.DataItem, "ForumUser.User.NameDetails" ).ToString()%> |
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
							<asp:LinkButton ID="Linkbutton1" CommandName="ViewMessage" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ID")%>'  Runat="server">
								<%# DataBinder.Eval(Container.DataItem, "Subject") %>
							</asp:LinkButton> 
							(<asp:LinkButton ID="Linkbutton2" CommandName="ViewThread" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"Thread.ID")%>'  Runat="server">View Entire Thread</asp:LinkButton>)
						</td>
						<td width="10%" nowrap>
							| <%# DataBinder.Eval( Container.DataItem, "ForumUser.User.NameDetails" ).ToString()%> | 
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
			</asp:Repeater>
		</asp:PlaceHolder>
	</div>
</p>
</div>
