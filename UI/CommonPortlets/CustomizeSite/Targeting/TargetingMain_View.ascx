<%@ Control Language="c#" AutoEventWireup="false" Codebehind="TargetingMain_View.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.TargetingMain_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@Import namespace="Jenzabar.Common.Globalization"%>
<%@Import namespace="Jenzabar.ICS"%>
<div class="pSection">
	<div id="divTitleLinkButtons">
		<asp:LinkButton Runat="server" ID="btnAddNewMessage" />&nbsp;|&nbsp;<common:GlobalizedLinkButton Runat="server" ID="btnViewTemplates" textKey="TXT_TEMPLATES" />
	</div>
	<div id="divTitleDropdown">
		<common:GlobalizedLiteral id="litShowMessagesFor" textKey="LBL_SHOW_MESSAGES_FOR" runat="server" /><asp:DropDownList AutoPostBack="True" ID="ddMessageFilter" Runat="server" />
	</div>
	<p>
		<common:hint id="hntAlertDefinition" runat="server" textKey="TXT_ALERT_DEFINITION" />
	</p>
	<asp:PlaceHolder ID="phAlertWarning" Runat="server" Visible="False">
		<common:notice id="AlertNotice" Runat="server"></common:notice>
	</asp:PlaceHolder>
	<p>
		<common:GlobalizedLiteral id="litNoMessages" runat="server" textKey="MSG_NO_TARGETED_MESSAGES" Visible="false" />
		<common:groupedgrid id="MessagesGrid" rendertableheaders="True" runat="server" DataKeyField="ID" GroupKeyField="ID"
			HideTableHeadersWhenGridIsEmpty="True">
			<TableHeaderTemplate><common:GlobalizedLiteral ID="litTblHeader" Runat="server" textKey="TXT_CURRENT_MESSAGES" /><%# GetFilterRoleName() %></TableHeaderTemplate>
			<COLUMNS>
				<ASP:TEMPLATECOLUMN HeaderText="ALERT">
					<ITEMTEMPLATE>
						<asp:CheckBox ID="cbAlert" AutoPostBack="True" Visible="<%#  (((AlertMessage == null) || (AlertMessage != null && (AlertMessage == ((TargetedMessage)Container.DataItem)))) && ((TargetedMessage)Container.DataItem).StartDate <= DateTime.Now) %>" Checked="<%#  ((TargetedMessage)Container.DataItem).IsAlert %>" Runat=server />
					</ITEMTEMPLATE>
				</ASP:TEMPLATECOLUMN>
				<ASP:TEMPLATECOLUMN SortExpression="" HeaderText="ORDER">
					<ITEMTEMPLATE>
						<asp:TextBox ID="txtOrder" Runat=server Style="Width:20px;" Text="<%# ((TargetedMessage)Container.DataItem).DisplayOrder %>" />
						<input id="OldOrder" type="hidden" value='<%# ((TargetedMessage)Container.DataItem).DisplayOrder %>' runat="server" NAME="OldOrder">
					</ITEMTEMPLATE>
				</ASP:TEMPLATECOLUMN>
				<ASP:TEMPLATECOLUMN SortExpression="" HeaderText="MESSAGE">
					<ITEMTEMPLATE>
						<div class="MessageDetails">
							<p>
								<asp:LinkButton ID="btnMessageDetails" Font-Italic="<%# IsInactive(((TargetedMessage)Container.DataItem)) %>" CommandName="VIEW" CommandArgument='<%#  (AlertMessage == null ? Guid.Empty.ToString() : AlertMessage.ID.AsGuid.ToString()) + "|" + ((TargetedMessage)Container.DataItem).ID.ToString() %>' runat=server>
									<%# ((TargetedMessage)Container.DataItem).Subject %>
								</asp:LinkButton></p>
							<p>
								<common:GlobalizedLiteral id="lblRoles" runat="server" textKey="LBL_ROLES" /><b>
									<asp:literal Runat=server ID="litRoles" Text='&nbsp;<%# GetCommaDelimitedListOfRoles(((TargetedMessage)Container.DataItem)) %>' /></b></p>
							<asp:placeholder ID="phStatus" Runat="server" Visible="<%# (AlertMessage != null) || IsInactive(((TargetedMessage)Container.DataItem)) %>">
							<p>
								<common:GlobalizedLiteral id="litStatus" runat="server" textKey="LBL_STATUS" /> <%# GetStatusAndReason(((TargetedMessage)Container.DataItem)) %>
							</p>
							</asp:placeholder>
						</div>
					</ITEMTEMPLATE>
				</ASP:TEMPLATECOLUMN>
				<ASP:TEMPLATECOLUMN SortExpression="" HeaderText="DATE_RANGE">
					<ITEMTEMPLATE>
						<asp:Literal ID="litDate" Runat=server Text="<%# GetDateRange(((TargetedMessage)Container.DataItem)) %>" />
					</ITEMTEMPLATE>
				</ASP:TEMPLATECOLUMN>
				<ASP:TEMPLATECOLUMN SortExpression="" HeaderText="">
					<ITEMTEMPLATE>
						<asp:ImageButton ID="btnEditMessage" Runat=server CommandName="EDIT" CommandArgument="<%# ((TargetedMessage)Container.DataItem).ID.ToString() %>" />&nbsp;
						<asp:ImageButton ID="btnDeleteMessage" Runat=server CommandName="DELETE" CommandArgument="<%# ((TargetedMessage)Container.DataItem).ID.ToString() %>" />
					</ITEMTEMPLATE>
				</ASP:TEMPLATECOLUMN>
			</COLUMNS>
		</common:groupedgrid>
	</p>
	<p>
		<common:GlobalizedButton id="btnReorderMessages" textKey="TXT_REORDER_MESSAGES" runat="server" /><common:GlobalizedLinkButton visible="false" id="btnRemoveFilter" runat="server" textKey="TXT_REMOVE_FILTER" />
	</p>
</div>
