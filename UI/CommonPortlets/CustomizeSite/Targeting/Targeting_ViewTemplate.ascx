<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Targeting_ViewTemplate.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.Targeting_ViewTemplate" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@Import namespace="Jenzabar.Common.Globalization"%>
<%@Import namespace="Jenzabar.ICS"%>
<div class="pSection">
	<div id="divTitleLinkButtons">
		<asp:LinkButton Runat="server" ID="btnAddTemplate" />&nbsp;|&nbsp;<common:GlobalizedLinkButton Runat="server" ID="btnBackToMessages" textKey="TXT_BACK_TO_MESSAGES" />
	</div>
	<div id="divTitleDropdown">
		<common:GlobalizedLiteral id="litShowMessagesFor" textKey="LBL_SHOW_TEMPLATES_FOR" runat="server" /><asp:DropDownList AutoPostBack="True" ID="ddMessageFilter" Runat="server" />
	</div>
	<p>
		<common:GlobalizedLiteral id="litNoMessages" runat="server" textKey="MSG_NO_TARGETED_TEMPLATES" Visible="false" />
		<common:groupedgrid id="TemplatesGrid" rendertableheaders="True" runat="server" DataKeyField="ID" GroupKeyField="ID"
			HideTableHeadersWhenGridIsEmpty="True">
			<TableHeaderTemplate><common:GlobalizedLiteral ID="litTblHeader" Runat="server" textKey="TXT_MESSAGE_TEMPLATES" /></TableHeaderTemplate>
			<COLUMNS>
				<ASP:TEMPLATECOLUMN HeaderText="DELETE">
					<ITEMTEMPLATE>
						<asp:CheckBox ID="cbDelete" Runat="server" />
					</ITEMTEMPLATE>
				</ASP:TEMPLATECOLUMN>
				<ASP:TEMPLATECOLUMN SortExpression="" HeaderText="MESSAGE">
					<ITEMTEMPLATE>
						<div class="MessageDetails">
							<p>
								<asp:LinkButton ID="btnMessageDetails" CommandName="VIEW" CommandArgument="<%# ((TargetedMessage)Container.DataItem).ID.ToString() %>" runat=server>
									<%# ((TargetedMessage)Container.DataItem).Subject %>
								</asp:LinkButton></p>
							<p>
								<common:GlobalizedLiteral id="lblRoles" runat="server" textKey="LBL_ROLES" /><b>
									<asp:literal ID="litRoles" Runat=server Text="<%# GetCommaDelimitedListOfRoles(((TargetedMessage)Container.DataItem)) %>" /></b></p>
						</div>
					</ITEMTEMPLATE>
				</ASP:TEMPLATECOLUMN>
				<ASP:TEMPLATECOLUMN SortExpression="" HeaderText="ACTIVATE">
					<ITEMTEMPLATE>
						<asp:LinkButton ID="btnActivateTemplate" CommandName="ACTIVATE" CommandArgument="<%# ((TargetedMessage)Container.DataItem).ID.ToString() %>" runat=server>
							<%# Globalizer.GetGlobalizedString("TXT_ACTIVATE_A_COPY") %>
						</asp:LinkButton>
					</ITEMTEMPLATE>
				</ASP:TEMPLATECOLUMN>
				<ASP:TEMPLATECOLUMN SortExpression="" HeaderText="">
					<ITEMTEMPLATE>
						<asp:ImageButton ID="btnEditMessage" Runat=server CommandName="EDIT" CommandArgument="<%# ((TargetedMessage)Container.DataItem).ID.ToString() %>" />&nbsp;
						<asp:ImageButton ID="btnDeleteMessage" Runat=server CommandName="DELETE" CommandArgument="<%# ((TargetedMessage)Container.DataItem).ID.ToString() %>" />
					</ITEMTEMPLATE>
				</ASP:TEMPLATECOLUMN>
			</COLUMNS>
			<EmptyTableTemplate>
				<%#Globalizer.GetGlobalizedString("MSG_NO_TARGETED_TEMPLATES")%>
			</EmptyTableTemplate>
		</common:groupedgrid>
	</p>
	<p>
		<common:GlobalizedButton id="btnDelete" textKey="TXT_DELETE_SELECTED" runat="server" />&nbsp;&nbsp;<common:GlobalizedLinkButton visible="false" id="btnRemoveFilter" runat="server" textKey="TXT_REMOVE_FILTER" />
	</p>
</div>
