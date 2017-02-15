<%@ Control Language="c#" AutoEventWireup="false" Codebehind="FormGroupingAddEdit.ascx.cs" Inherits="Jenzabar.CRM.Common.Web.Portlets.FormBuilderPortlet.FormGroupingAddEdit" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<jenzabar:errordisplay id="error" Runat="server"></jenzabar:errordisplay>
<div class="pSection">
	<table width="100%">
		<tr>
			<th align="left" colSpan="2">
				<asp:label id="lblFormName" Runat="server"></asp:label></th></tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td width="25%"><jenzabar:globalizedlabel id="lblGroupText" Runat="server"></jenzabar:globalizedlabel></td>
			<td width="75%"><asp:textbox id="tbFormGroup" Runat="server" Width="384px" MaxLength="255"></asp:textbox></td>
		</tr>
	</table>
	<table width="100%">
		<tr>
			<td>
				<jenzabar:groupedgrid id="dgFormGrpRoles" DataKeyField="SecurityGroupID" Width="100%" RenderTableHeaders="True"
					runat="server">
					<Columns>
						<asp:TemplateColumn HeaderStyle-Width="5%" ItemStyle-Width="5%" ItemStyle-HorizontalAlign="Center">
							<ItemTemplate>
								<asp:CheckBox ID="cbAssigned" Runat="server" Checked='<%# DataBinder.Eval(Container.DataItem, "Assigned")%>' />
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:BoundColumn DataField="DisplayName" HeaderStyle-Width="95%" ItemStyle-Width="95%" />
					</Columns>
				</jenzabar:groupedgrid>
			</td>
		</tr>
	</table>
	<table width="100%">
		<tr>
			<td width="15%" nowrap>
				<jenzabar:GlobalizedButton ID="btnSave" Runat="server" TextKey="TXT_SAVE" />&nbsp;
				<jenzabar:GlobalizedButton ID="btnCancel" Runat="server" TextKey="TXT_CANCEL" />
			</td>
			<td width="85%">&nbsp;</td>
		</tr>
	</table>
</div>
