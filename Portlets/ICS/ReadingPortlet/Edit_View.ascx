<%@ Import namespace="Jenzabar.ICS" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Import namespace="Jenzabar.ICS.Web.Portlets.Common" %>
<%@ Import namespace="Jenzabar.ICS.Web.Portlets.ReadingPortlet" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Edit_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.ReadingPortlet.Edit_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="secured" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls.Secured" Assembly="Jenzabar.Portal.Framework.Web" %>
<div class="pSection">
	<jenzabar:ErrorDisplay id="ctlError" runat="server" />
	<div><jenzabar:PageNavigator id="pNav" AutoBind="False" runat="server" /></div>
	<jenzabar:groupedgrid id="ItemsGrid" runat="server" DataKeyField="ID" HideTableHeadersWhenGridIsEmpty="True"
		EnableAutoConfirmation="False" GroupKeyField="ID">
		<GroupHeaderTemplate>
			<span class="PortletSetTitle">
				<%# ((Header)Container.DataItem).Name %>
			</span>
			&nbsp;&nbsp;
			<asp:ImageButton ID="AddItemLink" CommandName="AddItem" Runat="server" Visible="False" />
			<asp:ImageButton ID="EditHeaderLink" CommandName="EditSet" Runat="server" Visible="False" />
			<asp:ImageButton ID="DeleteHeaderLink" CommandName="DeleteSet" Runat="server" Visible="False" />
			</GroupHeaderTemplate>
		<GroupSubHeaderTemplate>
			<div class="PortletSetDescription"><%# ((Header)Container.DataItem).Description %></div>
		</GroupSubHeaderTemplate>
		<GroupHeaderColumns>
			<jenzabar:ExpandCollapseGroupedGridColumn separatorbefore="true"></jenzabar:ExpandCollapseGroupedGridColumn>
		</GroupHeaderColumns>
		<Columns>
			<asp:TemplateColumn HeaderText="link">
				<ItemTemplate>
					
					<span class="PortletItemTitle">
						<asp:CheckBox ID="IsSelected" Runat="server" />
						<asp:Label AssociatedControlID="IsSelected" CssClass="accessibility" Runat=server>Select</asp:Label>
						<asp:LinkButton id="lnkViewDetails" runat="server" CommandName="ViewItem" CausesValidation="False">
							<%# ((Reading)Container.DataItem).Title %>
						</asp:LinkButton>
					</span>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<span class="PortletItemDescription">
						<%# (((Reading)Container.DataItem).Pages=="") ? "" : String.Format(Globalizer.GetGlobalizedString("TXT_FORMAT_PAGES_ABBR"), ((Reading)Container.DataItem).Pages) %>
					</span>
					<div class="PortletItemDescription">
						<%# ((Reading)Container.DataItem).Author %>
					</div>
					<div class="PortletItemDescription">
						<%# ((Reading)Container.DataItem).Edition %>
					</div>
					<div class="PortletItemDescription">
						<%# (((Reading)Container.DataItem).URL=="") ? "" : "<a href='"+((Reading)Container.DataItem).URL + "' target='_blank'>" + ((Reading)Container.DataItem).URLLabel + "</a>" %>
					</div>
					<div class="PortletItemStatus">
						<%# PortletUtilities.GetTextFromEnumValue(((Reading)Container.DataItem).Status) %>
					</div>
				</ItemTemplate>
			</asp:TemplateColumn>
			<asp:TemplateColumn>
				<ItemTemplate>
					<div style="white-space: nowrap">
						<asp:ImageButton ID="EditItemLink" CommandName="EditItem" Runat="server" Visible="False" />
						<asp:ImageButton ID="DeleteItemLink" CommandName="DeleteItem" Runat="server" Visible="False" />
					</div>
				</ItemTemplate>
			</asp:TemplateColumn>
		</Columns>
		<EmptyTableTemplate>
			<%=Globalizer.GetGlobalizedString("MSG_NO_READINGS_FOR_PORTLET")%>
		</EmptyTableTemplate>
	</jenzabar:groupedgrid>
</div>
<asp:PlaceHolder ID="pnEditMode" runat="server" Visible="True">
	<DIV class="pSection">
		<TABLE cellSpacing="0" cellPadding="0">
			<TR>
				<TD>
					<jenzabar:MoveCopyDelete id="MultipleSelect" runat="server" ShowFileCabinetSave="True" GridToValidate="ItemsGrid"></jenzabar:MoveCopyDelete></TD>
				<TD>&nbsp;</TD>
				<TD align="right">
					<asp:ImageButton id="AddNewReading" Visible="False" CommandName="AddItem" Runat="server"></asp:ImageButton>&nbsp;
				</TD>
				<TD>
					<jenzabar:globalizedlinkbutton id="lnkAddNewReading" runat="server" CommandName="AddItem" CausesValidation="False"
						textKey="TXT_ADD_READING"></jenzabar:globalizedlinkbutton></TD>
			</TR>
			<TR>
				<TD>
					<jenzabar:GlobalizedLinkButton id="lnkImport" runat="server" TextKey="TXT_IMPORT_READINGS_FILE_CABINET"></jenzabar:GlobalizedLinkButton></TD>
				<TD>&nbsp;</TD>
				<TD align="right">
					<asp:ImageButton id="AddNewSet" Visible="False" CommandName="AddSet" Runat="server"></asp:ImageButton>&nbsp;
				</TD>
				<TD>
					<jenzabar:globalizedlinkbutton id="lnkAddNewSet" runat="server" CommandName="AddSet" CausesValidation="False" textKey="TXT_ADD_SET"></jenzabar:globalizedlinkbutton></TD>
			</TR>
		</TABLE>
	</DIV>
</asp:PlaceHolder>
