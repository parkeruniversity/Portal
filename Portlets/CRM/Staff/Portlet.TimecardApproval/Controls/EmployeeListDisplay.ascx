<%@ Control Language="c#" AutoEventWireup="True" Codebehind="EmployeeListDisplay.ascx.cs" Inherits="Portlet.TimecardApproval.Controls.EmployeeListDisplay" %>
<%@ Register TagPrefix="common" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="framework" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Import Namespace="Jenzabar.Common.Globalization" %>

<script type="text/javascript" src="<%= this.ResolveClientUrl("EmployeeListDisplay.js.aspx") %>?n=0"></script>
<script type="text/javascript">
	JCSL.element.attach_event(window, 'load', function()
		{
			//Use the checkbox IDs to load the controls.
			var checkboxIDs = [<asp:Literal ID="CheckboxClientIDArray" runat="server" />];
			var checkboxes = new Array();
			for (i=0; i < checkboxIDs.length; i++)
			{
				checkboxes[i] = document.getElementById(checkboxIDs[i]);
			}
			
			initializeEmployeeListControlData(
				'<%= this.UniqueID %>',
				checkboxes,
				[<asp:Literal ID="SubmittableClientIDArray" runat="server" />],
				document.getElementById('SelectAllBox__<%= this.UniqueID %>'),
				document.getElementById('<asp:Literal ID="SubmitToPayrollButtonClientID" runat="server" />'),
				new JCSL.ui.windows.DialogWindow(
					document.getElementById('timecardStatusWindow__<%= this.UniqueID %>'), 
					'<%= Globalizer.GetJavascriptSafeString("TXT_TIMECARD_STATUS_VALUES") %>'
					)
			);
		});
</script>

<common:ErrorDisplay ID="ErrorDisplay" visible="false" runat="server" />

<asp:Repeater ID="EmployeeList" runat="server">
<HeaderTemplate>
	<table class="tabularData">
		<caption id="Header" runat="server" />
		<thead>
			<tr id="HeaderNoteRow" class="tableNote" visible="false" runat="server">
				<td colspan="10"></td>
			</tr>
			<tr id="ColumnSuperheader" class="superHeader" runat="server">
				<td id="EmployeeInfoHeaderCell" align="center" colspan="3" runat="server">
					<common:GlobalizedLiteral ID="EmployeeInfoHeader" TextKey="TXT_EMPLOYEE_INFO" runat="server" />
				</td>
				<td id="HoursHeaderCell" align="center" colspan="7" runat="server">
					<common:GlobalizedLiteral ID="HoursHeader" TextKey="TXT_HOURS" runat="server" />
				</td>
			</tr>
			<tr id="ColumnHeader" runat="server">
				<th>
					<input id="SelectAllBox__<%= this.UniqueID %>" type="checkbox" />
				</th>
				<th class="sorted">
					<common:GlobalizedLinkButton id="NameSortButton" CommandName="NameSort" runat="server" TextKey="TXT_NAME" Visible="false" />
					<common:GlobalizedLabel id="NameLabel" TextKey="TXT_NAME" runat="server" />
				</th>
				<th>
					<common:GlobalizedLinkButton id="PositionSortButton" CommandName="PositionSort" runat="server" TextKey="TXT_POSITION" Visible="false" />
					<common:GlobalizedLabel id="PositionLabel" TextKey="TXT_POSITION" runat="server" />
				</th>
				<th></th>
				<th>
					<common:GlobalizedLinkButton id="RegularSortButton" CommandName="RegularSort" runat="server" TextKey="TXT_REGULAR" Visible="false" />
					<common:GlobalizedLabel id="RegularLabel" TextKey="TXT_REGULAR" runat="server" />
				</th>
				<th>
					<common:GlobalizedLinkButton id="OtherSortButton" CommandName="OtherSort" runat="server" TextKey="TXT_OTHER" Visible="false" />
					<common:GlobalizedLabel id="OtherNameLabel" TextKey="TXT_OTHER" runat="server" />
				</th>
				<th>
					<common:GlobalizedLinkButton id="TimeOffSortButton" CommandName="TimeOffSort" runat="server" TextKey="TXT_OFF" Visible="false" />
					<common:GlobalizedLabel id="TimeOffLabel" TextKey="TXT_OFF" runat="server" />
				</th>
				<th>
					<common:GlobalizedLinkButton id="TotalSortButton" CommandName="TotalSort" runat="server" TextKey="TXT_TOTAL" Visible="false" />
					<common:GlobalizedLabel id="TotalLabel" TextKey="TXT_TOTAL" runat="server" />
				</th>
				<th>
					<common:GlobalizedLinkButton id="FinalSortButton" CommandName="FinalSort" runat="server" TextKey="TXT_FINAL" Visible="false" />
					<common:GlobalizedLabel id="FinalLabel" TextKey="TXT_FINAL" runat="server" />
				</th>
				<th>
					<div style="float:left">
						<common:GlobalizedLinkButton id="StatusSortButton" CommandName="StatusSort" runat="server" TextKey="TXT_STATUS" Visible="false" />
						<common:GlobalizedLabel id="StatusLabel" TextKey="TXT_STATUS" runat="server" />
					</div>
					<div style="float:right;padding-left: 15px;">
						<a href="javascript:openTimecardStatusWindow('<%= this.UniqueID %>', document.getElementById('<%= this.EmployeeList.ClientID %>'))">
							<framework:PortalImage id="StatusKeyLink" ImageCategory="PortletIcon" ImageUrl="question_mark.gif" runat="server" />
						</a>
					</div>
					<div style="clear:both"></div>
				</th>
			</tr>
		</thead>
		<tbody>
			<tr id="NoEmployeesRow" visible="false" runat="server">
				<td colspan="10">
					<common:GlobalizedLiteral id="NoEmployeesMessage" TextKey="MSG_TCAPPROVALPORTLET_NO_EMPLOYEES_FOR_PERIOD" runat="server" />
				</td>
			</tr>
</HeaderTemplate>
<ItemTemplate>
			<tr id="EmployeeRow" runat="server">
				<td>
					<asp:Literal ID="Key" Visible="false" runat="server" />
					<asp:CheckBox ID="EmployeeSelectBox" runat="server" />
				</td>
				<td class="sorted">
					<framework:PortalImageAndTextButton ID="EmployeeViewButton" 
							ImageCategory="PortletIcon" ImageUrl="view-icon.gif" 
							CommandName="ViewEmployee" EnableViewState="true" runat="server" />
				</td>
				<td><asp:Label ID="Position" runat="server" /></td>
				<td>
					<framework:PortalImageButton ID="EditButton" ImageCategory="PortletIcon" ImageUrl="edit.gif"
							CommandName="EditTimecard" runat="server" />
				</td>
				<td id="RegularHoursColumn" class="numeric" runat="server">
					<asp:Label ID="RegularHours" runat="server" />
					<asp:TextBox ID="RegularHoursEntry" Columns="6" MaxLength="8" Visible="false" runat="server" />
				</td>
				<td id="OtherHoursColumn" class="numeric" runat="server"><asp:Label ID="OtherHours" runat="server" /></td>
				<td id="TimeOffHoursColumn" class="numeric" runat="server"><asp:Label ID="TimeOffHours" runat="server" /></td>
				<td class="numeric highlight"><asp:Label ID="TotalHours" runat="server" /></td>
				<td style="text-align:center">
					<framework:PortalImage ID="FinalImage" ImageCategory="PortletIcon" ImageUrl="check_yellow.gif" 
							visible="false" runat="server" />
				</td>
				<td class="highlight"><asp:Label ID="Status" runat="server" /></td>
			</tr>
</ItemTemplate>
<FooterTemplate>
		</tbody>
		<tfoot>
			<tr id="TableFooterRow" runat="server">
				<td colspan="10" runat="server">
					<div style="float:left">
						<framework:PortalImageAndTextButton ID="ContactButton"
								ImageCategory="PortletIcon" ImageUrl="email.gif" TextKey="TXT_CONTACT_SELECTED_EMPLOYEES" 
								CommandName="ContactEmployees" runat="server" />
					</div>
					<div style="float:right">
						<framework:PortalImageAndTextButton ID="EditAllButton" 
								ImageCategory="PortletIcon" ImageUrl="edit.gif" TextKey="TXT_EDIT_ALL_REGULAR_HOURS" 
								CommandName="EditAllTimecards" runat="server" />
					</div>
				</td>
			</tr>
			<tr id="PageFooterRow" runat="server">
				<td style="padding: 0px;" colspan="10">
					<table id="tblButtonBar" width="100%">
						<tr id="SubmitButtonRow" runat="server">
							<td class="buttonBarCenteredVer2">
								<div>
									<common:GlobalizedButton ID="SubmitToPayrollButton" CommandName="SubmitToPayroll" 
											TextKey="TXT_SUBMIT_SELECTED_TIMECARDS_TO_PAYROLL" 
											OnClientClick="checkTimecardSubmit(this)" runat="server"/>
									<common:GlobalizedButton ID="SaveButton" CommandName="Save" TextKey="TXT_SAVE_HOURS" 
											visible="false" runat="server"/>
									<common:GlobalizedButton ID="CancelButton" CommandName="Cancel" TextKey="TXT_CANCEL" 
											visible="false" runat="server"/>
								</div>
							</td>
						</tr>
    					<tr id="PayPeriodDisplayRow" runat="server">
    						<td class="tcaNoBorder" style="padding:5px;text-align:center;">
    							<div id="PayPeriodDisplay" runat="server" />
    						</td>
    					</tr>
					</table>
				</td>
			</tr>
		</tfoot>
	</table>
</FooterTemplate>
</asp:Repeater>

<!-- Status Popup Window -->
<div id="timecardStatusWindow__<%= this.UniqueID %>" class="tcaStatusDescriptions" style="display:none">
	<asp:Repeater ID="StatusDescriptionList" runat="server">
		<HeaderTemplate><ul></HeaderTemplate>
		<ItemTemplate><li><%# Container.DataItem %></li></ItemTemplate>
		<FooterTemplate></ul></FooterTemplate>
	</asp:Repeater>
	<div style="text-align:center">
		<a href="javascript:closeTimecardStatusWindow('<%= this.UniqueID %>')"><common:GlobalizedLiteral TextKey="TXT_CLOSE" runat="server" /></a>
	</div>
</div>
