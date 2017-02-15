<%@Import namespace="Jenzabar.Common.Globalization"%>
<%@Import namespace="Jenzabar.Portal.Framework"%>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="SiteAddEditTab.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.SiteAddEditTab" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<cmn:Subheader id="subHeaderMain" runat="server"></cmn:Subheader>
<div class="pSection">
	<asp:ValidationSummary ID="valSummary" Runat="server"></asp:ValidationSummary>
	<fieldset>
		<table>
			<tr>
				<th>
					<cmn:FormLabel id="lblName" runat="server" forcontrol="txtName"></cmn:FormLabel></th>
				<td><asp:TextBox id="txtName" runat="server" MaxLength="25" />
					<asp:RequiredFieldValidator Text="*" ID="vldName" ControlToValidate="txtName" Runat="server"></asp:RequiredFieldValidator>
					<asp:RegularExpressionValidator ID="vldName2" Text="*" ControlToValidate="txtName" Runat="server"></asp:RegularExpressionValidator>
					<cmn:FormLabel ID="lblNameLimit" Runat="server" forcontrol="txtName" />
				</td>
			</tr>
			<tr id="trChangeURL" runat="server">
				<th>
					&nbsp;</th>
				<td><cmn:GlobalizedCheckBox id="chkChangeURL" runat="server" textKey="TXT_CHANGE_URL" /><BR>
					<cmn:Hint id="hntChangeURL" runat="server" textKey="MSG_CHANGE_URL_HINT" /></td>
			</tr>
			<tr>
				<th>
					<cmn:FormLabel id="lblOrder" runat="server" forcontrol="ddlOrder"></cmn:FormLabel></th>
				<td>
					<asp:DropDownList ID="ddlOrder" Runat="server"></asp:DropDownList>
				</td>
			</tr>
		</table>
	</fieldset>
</div>
<!-- datagrid section -->
<cmn:Subheader id="subHeader" runat="server"></cmn:Subheader>
<div class="pSection">
	<p></p>
	<cmn:groupedgrid id="ItemsGrid" runat="server" DataKeyField="ID" HideTableHeadersWhenGridIsEmpty="True"
		GroupKeyField="ID" rendertableheaders="True" allowsorting="true">
		<COLUMNS>
			<ASP:TEMPLATECOLUMN HeaderText="TXT_PORTLETS">
				<ITEMTEMPLATE>
					<%# ((PortletTemplate)Container.DataItem).DisplayName %>
				</ITEMTEMPLATE>
			</ASP:TEMPLATECOLUMN>
			<ASP:TEMPLATECOLUMN HeaderText="<input type='Checkbox'>">
				<ITEMTEMPLATE>
					<input type="checkbox" ID="TemplateSelected" runat="server">
				</ITEMTEMPLATE>
			</ASP:TEMPLATECOLUMN>
		</COLUMNS>
		<EmptyTableTemplate>
			<%#Globalizer.GetGlobalizedString("MSG_NO_ITEMS_TO_DISPLAY")%>
		</EmptyTableTemplate>
	</cmn:groupedgrid>
	<p></p>
</div>
<div class="pActionsTransp">
	<asp:Button id="btnSubmit" runat="server" />
	&nbsp;
	<asp:Button id="btnCancel" CausesValidation="False" runat="server" />
</div>
