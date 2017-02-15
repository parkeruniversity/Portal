<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="FormGrouping.ascx.cs" Inherits="Jenzabar.CRM.Common.Web.Portlets.FormBuilderPortlet.FormGrouping" %>
<jenzabar:errordisplay id="error" Runat="server" />
<div class="pSection">
	<table width="100%">
		<tr>
			<th colspan="2" align="left">
				<asp:Label ID="lblFormName" Runat="server" />
			</th>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
	</table>
	<jenzabar:groupedgrid id="dgFormGroups" DataKeyField="ID" Width="100%" RenderTableHeaders="True" runat="server">
		<Columns>
			<asp:TemplateColumn HeaderStyle-Width="5%" ItemStyle-Width="5%" ItemStyle-HorizontalAlign="Center">
				<ItemTemplate>
					<asp:CheckBox ID="cbAssigned" Runat="server" Checked='<%# DataBinder.Eval(Container.DataItem, "Assigned")%>' />
				</ItemTemplate>
			</asp:TemplateColumn>
			<asp:BoundColumn DataField="FormGroupingDesc" HeaderStyle-Width="75%" ItemStyle-Width="75%" />
			<asp:TemplateColumn HeaderStyle-Width="5%" ItemStyle-Width="5%" ItemStyle-Wrap="False">
				<ItemTemplate>
					<asp:ImageButton ID="btnEdit" CommandName="EditFormType" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "FormGroupingDesc")%>' Runat="server" />
					<asp:ImageButton ID="btnDelete" CommandName="DeleteFormType" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "FormGroupingDesc")%>' Runat="server" Visible="False" />
				</ItemTemplate>
			</asp:TemplateColumn>
		</Columns>
	</jenzabar:groupedgrid>
	<table width="100%">
		<tr>
			<td width="25%" nowrap>
				<jenzabar:GlobalizedButton ID="btnSave" Runat="server" TextKey="TXT_SAVE" />&nbsp;
				<jenzabar:GlobalizedButton ID="btnCancel" Runat="server" TextKey="TXT_CANCEL" />
			</td>
			<td width="20%">
				<jenzabar:GlobalizedLinkButton ID="lnkAdd" TextKey="TXT_FORMBUILDER_SCREEN_FORM_GROUPING_ADD" Runat="server" />
			</td>
			<td width="20%" align="right">
				<jenzabar:GlobalizedLabel TextKey="FORMBUILDER_CHKLIST_SETUP_COMPLETE_TXT" Runat="server" id="lblSetComp" />
			</td>
			<td width="35%">
				<asp:RadioButtonList ID="RadioButtonListSetupComplete" Runat="server" RepeatColumns="2">
					<asp:ListItem></asp:ListItem>
					<asp:ListItem></asp:ListItem>
				</asp:RadioButtonList>
			</td>
		</tr>
	</table>
</div>
