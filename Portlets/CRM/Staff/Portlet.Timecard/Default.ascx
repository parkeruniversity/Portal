<%@ Register TagPrefix="jenzabar" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Default.ascx.cs" Inherits="Jenzabar.CRM.Staff.Web.Portlets.TimecardPortlet.Default" %>
<div id="divAdminLink" runat="server" style="margin:5px;" visible="false">
	<table style="background-color: #EFEFEF; border: 1px solid #B2B2B2; padding: 10px;" width="50%" align="center" cellpadding="3" border="0">
		<tr>
			<td align="center"><IMG title="" alt="*" src="UI\Common\Images\PortletImages\Icons\portlet_admin_icon.gif">&nbsp;<jenzabar:globalizedlinkbutton id="glnkAdmin" runat="server" TextKey="TXT_CS_ADMIN_THIS_PORTLET"></jenzabar:globalizedlinkbutton></td>
		</tr>
	</table>
</div>
<div  id="MainSection" class="pSection" runat="server">
	<asp:label id="lblError" CssClass="PortletError" Visible="False" Runat="server"></asp:label>
	<table width="100%">
		<tr>
			<td><asp:linkbutton id="lnkEnterTimecard" Visible="False" Runat="server" Width="75%"></asp:linkbutton></td>
		</tr>
		<tr>
			<td><asp:label id="lblNeedToLogon" Visible="False" Runat="server" Width="75%"></asp:label></td>
		</tr>
		<tr>
			<td><asp:linkbutton id="lnkPayPeriodAdministration" Visible="False" Runat="server" Width="75%"></asp:linkbutton></td>
		</tr>
		<tr>
			<td noWrap width="50%"><asp:button id="btnUpdateTimeCards" Visible="False" Runat="server" Width="100%"></asp:button></td>
			<td noWrap width="50%"><asp:Label Runat=server AssociatedControlID="ddlbPayPeriodList" CssClass="accessibility">Pay Period</asp:Label>
			<asp:dropdownlist id="ddlbPayPeriodList" Visible="False" Runat="server" Width="85%" AutoPostBack="True"
					OnSelectedIndexChanged="ddlbPayPeriodList_SelectedIndexChanged"></asp:dropdownlist></td>
		</tr>
		<tr id="ViewAllPeriodsRow" Visible="false" runat="server">
			<td></td>
			<td><jenzabar:GlobalizedLinkButton ID="ViewAllPeriodsButton" TextKey="MSG_TIMECARDPORTLET_VIEWALLPAYPERIODS_LINK" Runat="server" /></td>
		</tr>
		<tr id="SubmitAllRow" visible="false" runat="server">
			<td colspan="2">
				<div style="margin-top: 10px;">
					<asp:CheckBox ID="SubmitAllCheck" Runat="server" /> 
					<jenzabar:FormLabel ID="SubmitAllMessage" TextKey="MSG_TIMECARDPORTLET_CHECKTOSUBMITALL" ForControl="SubmitAllCheck" runat="server" />
				</div>
			</td>
		</tr>
		<tr id="SubmitAllEmployeesRow" visible="false" runat="server">
			<td colspan="2">
				<div style="margin-top: 10px;">
					<asp:CheckBox ID="SubmitAllEmployeesCheck" Runat="server" /> 
					<jenzabar:FormLabel ID="SubmitAllEmployeesMessage" TextKey="MSG_TIMECARDPORTLET_CHECKTOSUBMITALLEMPLOYEES" ForControl="SubmitAllEmployeesCheck" runat="server" />
				</div>
			</td>
		</tr>
	</table>
	<table width="100%">
		<tr>
			<td><asp:datagrid id="tcErrorGrid" CssClass="groupedGrid" Visible="False" Width="90%" GridLines="None"
					AlternatingItemStyle-CssClass="alt" HeaderStyle-CssClass="alt" AutoGenerateColumns="False"
					RenderTableHeaders="True" runat="server" Height="56px">
					<Columns>
						<asp:TemplateColumn HeaderStyle-Font-Bold="True">
							<ItemTemplate>
								<asp:Label ID="lblErrorText" Runat="server" Text='<%# DataBinder.Eval( Container.DataItem, "ErrorText" )%>' Width="95%" />
								</asp:Label>
							</ItemTemplate>
						</asp:TemplateColumn>
					</Columns>
				</asp:datagrid></td>
		</tr>
	</table>
</div>
