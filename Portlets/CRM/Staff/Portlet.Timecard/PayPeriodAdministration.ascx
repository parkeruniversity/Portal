<%@ Control Language="c#" AutoEventWireup="false" Codebehind="PayPeriodAdministration.ascx.cs" Inherits="Jenzabar.CRM.Staff.Web.Portlets.TimecardPortlet.PayPeriodAdministration" %>
<%@ Register TagPrefix="jenzabar" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<asp:label id="lblError" Runat="server" Visible="False" CssClass="PortletError"></asp:label>
<asp:label id="lblMessage" Runat="server" Visible="False" CssClass="PortletError"></asp:label>
<asp:datagrid id="gdgPayPeriodAdmin" CssClass="groupedGrid" GridLines="None" AlternatingItemStyle-CssClass="alt"
	HeaderStyle-CssClass="alt" AutoGenerateColumns="False" runat="server" RenderTableHeaders="True"
	Width="100%" Height="56px" OnItemDataBound="gdgPayPeriodAdmin_ItemDataBound">
	<Columns>
		<asp:TemplateColumn HeaderStyle-Font-Bold="True">
			<ItemTemplate>
				<asp:checkbox ID="cbxPayPeriodDefault" Runat="server" Checked='<%# ConvertToBoolean(DataBinder.Eval(Container.DataItem, "ppaDefault").ToString())%>'>
				</asp:checkbox>
			</ItemTemplate>
		</asp:TemplateColumn>
	</Columns>
	<Columns>
		<asp:TemplateColumn HeaderStyle-Font-Bold="True">
			<ItemTemplate>
				<asp:textbox ID="lblPayPeriodDescription" Runat="server" Text='<%# DataBinder.Eval( Container.DataItem, "ppaDescription" )%>' Width="110px" />
				</asp:textbox>
			</ItemTemplate>
		</asp:TemplateColumn>
	</Columns>
	<Columns>
		<asp:TemplateColumn HeaderStyle-Font-Bold="True">
			<ItemTemplate>
				<jenzabar:DatePicker ID="lblPayPeriodBeginDate" Runat="server" TimeDisplayFormat="None" DateDisplayFormat="Short" SelectedDate='<%# DateTime.Parse(DataBinder.Eval( Container.DataItem, "ppaBeginDate").ToString()) %>' nowrap="true" Width="185px" />
				</jenzabar:DatePicker>
				<asp:textbox ID="txtPayPeriodBeginDate" Runat="server" Text='<%# DateTime.Parse(DataBinder.Eval( Container.DataItem, "ppaBeginDate").ToString()) %>' Visible=False Width="125px" />
				</asp:textbox>
			</ItemTemplate>
		</asp:TemplateColumn>
	</Columns>
	<Columns>
		<asp:TemplateColumn HeaderStyle-Font-Bold="True">
			<ItemTemplate>
				<jenzabar:DatePicker ID="lblPayPeriodEndDate" Runat="server" TimeDisplayFormat="None" DateDisplayFormat="Short" SelectedDate='<%# DateTime.Parse(DataBinder.Eval( Container.DataItem, "ppaEndDate" ).ToString()) %>' Width="185px" />
				</jenzabar:DatePicker>
				<asp:textbox ID="txtPayPeriodEndDate" Runat="server" Text='<%# DateTime.Parse(DataBinder.Eval( Container.DataItem, "ppaEndDate").ToString()) %>' Visible=False Width="125px" />
				</asp:textbox>
			</ItemTemplate>
		</asp:TemplateColumn>
	</Columns>
	<Columns>
		<asp:TemplateColumn HeaderStyle-Font-Bold="True">
			<ItemTemplate>
				<jenzabar:DatePicker ID="lblPayPeriodCheckDate" Runat="server" TimeDisplayFormat="None" DateDisplayFormat="Short" SelectedDate='<%# DateTime.Parse(DataBinder.Eval( Container.DataItem, "ppaCheckDate").ToString()) %>' Width="185px" />
				<jenzabar:DatePicker>
					<asp:textbox ID="txtPayPeriodCheckDate" Runat="server" Text='<%# DateTime.Parse(DataBinder.Eval( Container.DataItem, "ppaCheckDate").ToString()) %>' Visible=False Width="125px" />
				</asp:textbox>
			</ItemTemplate>
		</asp:TemplateColumn>
	</Columns>
	<Columns>
		<asp:TemplateColumn HeaderStyle-Font-Bold="True">
			<ItemTemplate>
				<asp:dropdownlist ID="ddlPayPeriodGroup" Runat="server" Width="160px"></asp:dropdownlist>
			</ItemTemplate>
		</asp:TemplateColumn>
	</Columns>
	<Columns>
		<asp:TemplateColumn HeaderStyle-Font-Bold="True">
			<ItemTemplate>
				<asp:CheckBox ID="cbxPayPeriodUploaded" Runat="server" Enabled=False Checked='<%# ConvertToBoolean(DataBinder.Eval(Container.DataItem, "ppaUploaded").ToString())%>' Width="50%" >
				</asp:CheckBox>
				<asp:textbox ID="ppaID" Runat="server" Text='<%# DataBinder.Eval( Container.DataItem, "ppaID" )%>' Visible=False Width="125px" />
				</asp:textbox>
			</ItemTemplate>
		</asp:TemplateColumn>
	</Columns>
</asp:datagrid>
<div align="center">
	<table>
		<tr>
			<td></td>
		</tr>
		<tr>
			<td noWrap width="100"><asp:button id="btnSave" Runat="server" Width="100px"></asp:button></td>
			<th>
			</th>
			<td noWrap width="100"><asp:button id="btnCancel" Runat="server" Width="100px"></asp:button></td>
			<th>
			</th>
			<td noWrap width="100"><asp:button id="btnAdd" Runat="server" Width="100px"></asp:button></td>
		</tr>
	</table>
</div>
