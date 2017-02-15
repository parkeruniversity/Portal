<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="CustomInfo_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.MyInfoPortlet.CustomInfo_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="framework" namespace="Jenzabar.Portal.Framework.Web.UI.Controls" assembly="Jenzabar.Portal.Framework.Web" %>
<style>.sideHeader {
	FONT-WEIGHT: bold; MARGIN: 10px 0px 3px
}
</style>
<table cellSpacing="0" cellPadding="5" border="0">
	<tr>
		<td><asp:linkbutton id="lbAddCategory" runat="server"></asp:linkbutton>&nbsp;|&nbsp;
			<asp:linkbutton id="lbReorderCategory" runat="server"></asp:linkbutton></td>
	</tr>
	<tr>
		<td><asp:linkbutton id="lbAddItem" runat="server"></asp:linkbutton></td>
	</tr>
	<tr>
		<td vAlign="top"><jenzabar:groupedgrid id="UserInfoGrid" runat="server" GroupKeyField="ID" DataKeyField="ID">
				<GROUPHEADERTEMPLATE>
					<B>
						<%# DataBinder.Eval(Container.DataItem, "Name") %>
					</B>
					<asp:ImageButton id="AddUserInfoButton" Runat="server" Visible="False" CommandName="AddUserInfo"></asp:ImageButton>
					<asp:ImageButton id="EditHeaderButton" Runat="server" Visible="False" CommandName="EditHeader"></asp:ImageButton>
					<asp:ImageButton id="DeleteHeaderButton" Runat="server" Visible="False" CommandName="DeleteHeader"></asp:ImageButton>
				</GROUPHEADERTEMPLATE>
				<COLUMNS>
					<ASP:TEMPLATECOLUMN>
						<ITEMTEMPLATE>
							<asp:CheckBox id="IsSelected" Runat="server" Visible="False"></asp:CheckBox>
						</ITEMTEMPLATE>
					</ASP:TEMPLATECOLUMN>
					<ASP:TEMPLATECOLUMN>
						<ITEMTEMPLATE>
							<B>
								<%# DataBinder.Eval(Container.DataItem, "Name") %>
								:</B>
						</ITEMTEMPLATE>
					</ASP:TEMPLATECOLUMN>
					<ASP:TEMPLATECOLUMN>
						<ITEMTEMPLATE>
							<%# DataBinder.Eval(Container.DataItem, "Info") %>
						</ITEMTEMPLATE>
					</ASP:TEMPLATECOLUMN>
					<ASP:TEMPLATECOLUMN>
						<ITEMTEMPLATE>
							<asp:ImageButton id="EditUserInfoButton" Runat="server" Visible="False" CommandName="EditUserInfo"></asp:ImageButton>
						</ITEMTEMPLATE>
					</ASP:TEMPLATECOLUMN>
					<ASP:TEMPLATECOLUMN>
						<ITEMTEMPLATE>
							<asp:ImageButton id="DeleteUserInfoButton" Runat="server" Visible="False" CommandName="DeleteUserInfo"></asp:ImageButton>
						</ITEMTEMPLATE>
					</ASP:TEMPLATECOLUMN>
				</COLUMNS>
				<GROUPHEADERCOLUMNS>
					<jenzabar:ExpandCollapseGroupedGridColumn SeparatorBefore="True" SeparatorAfter="False"></jenzabar:ExpandCollapseGroupedGridColumn>
				</GROUPHEADERCOLUMNS>
			</jenzabar:groupedgrid>
			<p><jenzabar:MoveCopyDelete ID="MultipleSelect" GridToValidate="UserInfoGrid" runat="server" /></p>
		</td>
	</tr>
</table>