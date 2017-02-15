<%@ Register TagPrefix="secured" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls.Secured" Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Register TagPrefix="jenzabar" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="jenz" Namespace="Jenzabar.Portal.Framework.Web.TextEditor" Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="AddEditSet_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.HandoutPortlet.AddEditSet_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<script language="JavaScript" src="<%= this.ResolveUrl("~/UI/Common/Scripts/jenz.js") %>"></script>
<div class="pSection">
    <table>
		<tr>
			<td vAlign="top" align="right"><asp:label id="lblLabel" Runat="server" AssociatedControlID="txtLabel" /></td>
			<td><asp:textbox id="txtLabel" runat="server" MaxLength="250" Columns="40"></asp:textbox>&nbsp;
				<asp:requiredfieldvalidator id="RequiredFieldValidator1" runat="server" ControlToValidate="txtLabel" Display="Dynamic"></asp:requiredfieldvalidator></td>
		</tr>
		<tr>
			<td vAlign="top" align="right"><asp:label id="lblDescription" Runat="server"/>
			</td>
			
			<td><jenz:TextEditorControl id="_textEditorDescription" runat="server" MaxLength="2000" /></td>
		</tr>
		<tr>
			<td></td>
			<td vAlign="top" align="right"><asp:label id="lblMaxChars" Runat="server" /></td>
		</tr>
		<asp:placeholder id="ShowPositions" Runat="server" Visible="False">
			<TR>
				<TD vAlign="top" align="right">
					<asp:label id="lblPosition" Runat="server"></asp:label></TD>
				<TD>
					<asp:dropdownlist id="ddPositions" runat="server"></asp:dropdownlist></TD>
			</TR>
		</asp:placeholder>
		<asp:placeholder id="ReorderPlaceHolder" Runat="server" Visible="False">
			<TR>
				<TD>&nbsp;</TD>
				<TD><BR>
					<jenzabar:GroupedGrid id="HandoutGrid" runat="server" GroupKeyField="ID" DataKeyField="ID">
						<GroupHeaderColumns>
							<jenzabar:ExpandCollapseGroupedGridColumn SeparatorAfter="False" SeparatorBefore="True"></jenzabar:ExpandCollapseGroupedGridColumn>
						</GroupHeaderColumns>
						<GroupHeaderTemplate>
							<b>
								<asp:label id="lblTmplPosition" Runat="server" /><%# DataBinder.Eval(Container.DataItem, "Name") %></b>
						</GroupHeaderTemplate>
						<Columns>
							<asp:TemplateColumn>
								<ItemTemplate>
									<asp:Label id="lblForIsSelected" Text='Select <%# DataBinder.Eval(Container.DataItem, "Name") %>' CssClass="accessibility" AssociatedControlID="IsSelected" runat="server"></asp:Label><asp:CheckBox id="IsSelected" Runat="server"></asp:CheckBox>
									<INPUT id="OldOrder" type="hidden" value='<%# DataBinder.Eval(Container.DataItem, "Order") %>' name="OldOrder" runat="server">
									<asp:Label id="lblForNewOrder" Text='Order of <%# DataBinder.Eval(Container.DataItem, "Name") %>' CssClass="accessibility" AssociatedControlID="NewOrder" runat="server"></asp:Label>
									<asp:TextBox id="NewOrder" Runat="server" MaxLength="3" Text='<%# DataBinder.Eval(Container.DataItem, "Order") %>' Width="25px" />
									<%# DataBinder.Eval(Container.DataItem, "Name") %>
								</ItemTemplate>
							</asp:TemplateColumn>
							<asp:TemplateColumn>
								<ItemTemplate>
									<asp:ImageButton ID="EditLink" CommandName="EditHandout" Runat="server" />
									<asp:ImageButton ID="DeleteLink" CommandName="DeleteHandout" Runat="server" />
								</ItemTemplate>
							</asp:TemplateColumn>
						</Columns>
						<GroupFooterTemplate></GroupFooterTemplate>
						<EmptyTableTemplate>
							<%=Globalizer.GetGlobalizedString("MSG_NO_HANDOUTS_FOR_PORTLET")%>
						</EmptyTableTemplate>
					</jenzabar:GroupedGrid></TD>
			</TR>
			<TR>
				<TD></TD>
				<TD>
					<TABLE>
						<TR>
							<TD>
								<DIV id="divDDAction" noWrap runat="server">
								    <asp:Label AssociatedControlID="ddAction" Text="Action" CssClass="accessibility" runat="server"></asp:Label>
									<asp:DropDownList id="ddAction" runat="server" AutoPostBack="True"></asp:DropDownList>&nbsp;
									<asp:Label id="lblSelected" runat="server"></asp:Label>&nbsp;
									<asp:Label AssociatedControlID="ddTarget" Text="Target" CssClass="accessibility" runat="server"></asp:Label>
									<asp:DropDownList id="ddTarget" runat="server"></asp:DropDownList>
									
									</DIV>
							</TD>
							<TD noWrap>
								<div>
								<asp:ImageButton id="AddNewHandout" Runat="server" Visible="False" CommandName="AddItem" AlternateText="Add Item"></asp:ImageButton>&nbsp;
								<secured:slinkbutton id="lnkAddNewHandout" runat="server" OperationNames="CanManageHandouts"
									AccessCheckType="Union" IsSecured="True" CausesValidation="False"></secured:slinkbutton>
								</div>
								<div>
								<asp:ImageButton id="AddNewSet" Runat="server" Visible="False" CommandName="AddSet" AlternateText="Add Set"></asp:ImageButton>&nbsp;
								<secured:slinkbutton id="lnkAddNewSet" runat="server" OperationNames="CanManageSets"
									AccessCheckType="Union" IsSecured="True" CausesValidation="False"></secured:slinkbutton>
								</div>
							</TD>
						</TR>
					</TABLE>
				</TD>
			</TR>
		</asp:placeholder>
		<tr>
			<td></td>
			<td><asp:button id="btnSave" runat="server"></asp:button>&nbsp;
				<asp:button id="btnSaveAnd" runat="server"></asp:button>&nbsp;
				<asp:button id="btnCancel" runat="server" CausesValidation="False"></asp:button></td>
		</tr>
	</table>
</div>
