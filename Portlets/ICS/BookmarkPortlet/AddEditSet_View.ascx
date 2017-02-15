<%@ Register TagPrefix="jenzabar" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="framework" namespace="Jenzabar.Portal.Framework.Web.UI.Controls" assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="AddEditSet_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.BookmarkPortlet.AddEditSet_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Register TagPrefix="secured" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls.Secured" Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Register TagPrefix="jenzabar" Namespace="Jenzabar.Portal.Framework.Web.TextEditor" Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Import namespace="Jenzabar.ICS.Web.Portlets.BookmarkPortlet" %>
<script language="JavaScript" src="<%= this.ResolveUrl("~/UI/Common/Scripts/jenz.js") %>"></script>
<div class="pSection">
	<fieldset>
		<table>
			<tr>
				<th><asp:label id="lblLabel" runat="server" /></th>
				<td><asp:textbox id="txtLabel" runat="server" MaxLength="250" Columns="40" />&nbsp;
					<asp:requiredfieldvalidator id="RequiredFieldValidator1" runat="server" ControlToValidate="txtLabel" Display="Dynamic"></asp:requiredfieldvalidator></td>
			</tr>
			<tr>
				<th>
					<asp:label id="lblDescription" runat="server"></asp:label></th>
			    <td><jenzabar:TextEditorControl id="txtDescription" MaxLength="2000" runat="server" /></td>
			</tr>
			<tr>
				<th>
				</th>
				<td vAlign="top" align="right"><asp:label runat="server" id="txtDescMaxChar"></asp:label>
				</td>
			</tr>
			<asp:placeholder id="ShowPositions" Runat="server" Visible="False">
				<tr>
					<th><asp:label id="lblPosition" runat="server" /></th>
					<td><asp:dropdownlist id="ddPositions" runat="server" /></td>
				</tr>
			</asp:placeholder>
			<asp:placeholder id="ReorderPlaceHolder" Runat="server" Visible="False">
				<TR>
					<th>&nbsp;</th>
					<td>
						<jenzabar:GroupedGrid id="BookmarkGrid" runat="server" DataKeyField="ID" GroupKeyField="ID">
							<GroupHeaderColumns>
								<jenzabar:ExpandCollapseGroupedGridColumn SeparatorAfter="False" SeparatorBefore="True"></jenzabar:ExpandCollapseGroupedGridColumn>
							</GroupHeaderColumns>
							<GroupHeaderTemplate>
								<b>
									<asp:Label ID="lblReorder" Runat="server"></asp:Label>&nbsp;<%# DataBinder.Eval(Container.DataItem, "Name") %></b>
							</GroupHeaderTemplate>
							<Columns>
								<asp:TemplateColumn>
									<ItemTemplate>
										<asp:CheckBox id="IsSelected" Runat="server"></asp:CheckBox>
										<INPUT id="OldOrder" type="hidden" value='<%# DataBinder.Eval(Container.DataItem, "Order") %>' name="OldOrder" runat="server">
										<asp:TextBox id="NewOrder" Runat="server" MaxLength="3" Text='<%# DataBinder.Eval(Container.DataItem, "Order") %>' Width="25px" />
										<%# DataBinder.Eval(Container.DataItem, "Name") %>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn>
									<ItemTemplate>
										<div nowrap>
											<asp:ImageButton ID="EditLink" CommandName="EditBookmark" Runat="server" />
											<asp:ImageButton ID="DeleteLink" CommandName="DeleteBookmark" Runat="server" />
										</div>
									</ItemTemplate>
								</asp:TemplateColumn>
							</Columns>
							<EmptyTableTemplate>
								<%=Globalizer.GetGlobalizedString("MSG_NO_BOOKMARKS_FOR_PORTLET")%>
							</EmptyTableTemplate>
						</jenzabar:GroupedGrid></td>
				</tr>
				<TR>
					<TH>
					</TH>
					<TD>
						<TABLE>
							<TR>
								<TD>
									<asp:DropDownList id="ddAction" runat="server" AutoPostBack="True"></asp:DropDownList>&nbsp;
									<asp:Label id="lblSelected" runat="server" ></asp:Label>&nbsp;
									<asp:DropDownList id="ddTarget" runat="server" ></asp:DropDownList>
								</TD>
								<TD nowrap>
									<div><asp:ImageButton id="AddNewBookmark" Visible="False" Runat="server" CommandName="AddItem"></asp:ImageButton>&nbsp;<secured:slinkbutton id="lnkAddNewBookmark" runat="server" CausesValidation="False" IsSecured="True"
										AccessCheckType="Union" OperationNames="CanManageBookmarks"></secured:slinkbutton></div>
								</TD>
							</TR>
						</TABLE>
					</TD>
				</TR>
			</asp:placeholder>
			<tr>
				<th>&nbsp;</th>
				<td><asp:button id="btnSave" runat="server" />&nbsp;
					<asp:button id="btnSaveAnd" runat="server" />&nbsp;
					<asp:button id="btnCancel" runat="server" CausesValidation="False" /></td>
			</tr>
		</table>
	</fieldset>
</div>
