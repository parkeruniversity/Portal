<%@ Control Language="c#" AutoEventWireup="True" Codebehind="HourlyFormat.ascx.cs" Inherits="Portlet.Timecard.Controls.EntryPanelFormats.HourlyFormat" %>
<%@ Register TagPrefix="common" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="validation" Namespace="Jenzabar.Common.Web.UI.Controls.Validation" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="framework" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" Assembly="Jenzabar.Portal.Framework.Web" %>

<div class="tcTimeEntries">
    <ul id="EntryTable" class="tcHourlyEntry tcEntryPanel" runat="server">
	<li class="tcHeadings">
		<div></div>
		<div>
			<common:GlobalizedLabel ID="ClockInHeader" TextKey="TXT_CLOCK_IN" runat="server" />
			<hr />
		</div>
		<div>
			<common:GlobalizedLabel ID="ClockOutHeader" TextKey="TXT_CLOCK_OUT" runat="server" />
			<hr />
		</div>
		<div>
			<common:GlobalizedLabel ID="HoursTypeHeader" TextKey="TXT_HOURS_TYPE" runat="server" />
			<hr />
		</div>
		<div class="tcValue">
			<common:GlobalizedLabel ID="SubtotalHeader" TextKey="TXT_SUBTOTAL" runat="server" />
			<hr />
		</div>
	</li>
	<asp:Repeater ID="HourlyDayGrid" runat="server">
		<ItemTemplate>
			<asp:Literal ID="Day" Visible="false" runat="server" />
			<li id="DayRow" runat="server">
				<div class="tcDay">
					<asp:Label ID="DayDisplay" runat="server" />
				</div>
				<asp:Repeater ID="HourlyGrid" runat="server">
					<ItemTemplate>
						<div class="tcTime">
							<validation:TimePickerValidator 
									ID="StartTimeValidator" 
									ControlToValidate="RangeStartEntry" 
									Display="Dynamic" 
									runat="server">*</validation:TimePickerValidator>
							<validation:TimePickerRangeOrderValidator 
									ID="RangeValidator" 
									StartControlToValidate="RangeStartEntry" 
									EndControlToValidate="RangeEndEntry" 
									ErrorMessageKey="MSG_FORMAT_TIMECARDPORTLET_TIMEPICKERVALIDATOR_INVALIDRANGEORDER" 
									Display="Dynamic" 
									runat="server">*</validation:TimePickerRangeOrderValidator>
							<validation:TimePickerEndOnlyValidator
									ID="NoStartTimeValidator"
									StartControlToValidate="RangeStartEntry" 
									EndControlToValidate="RangeEndEntry" 
									ErrorMessageKey="MSG_FORMAT_TIMECARDPORTLET_TIMEPICKERVALIDATOR_NOSTARTTIME" 
									Display="Dynamic" 
									runat="server">*</validation:TimePickerEndOnlyValidator>
							<validation:TimePickerRangeOverlapValidator
									ID="OverlapValidator"
									StartControlToValidate="RangeStartEntry" 
									EndControlToValidate="RangeEndEntry" 
									ErrorMessageKey="MSG_FORMAT_TIMECARDPORTLET_TIMEPICKERVALIDATOR_RANGEOVERLAP" 
									Display="Dynamic" 
									runat="server">*</validation:TimePickerRangeOverlapValidator>
							<asp:PlaceHolder ID="RangeStartValidators" runat="server" />
							<common:TimePicker ID="RangeStartEntry" runat="server" />
							<asp:Label ID="RangeStartDisplay" Visible="false" runat="server">-- --</asp:Label>
						</div>
						<div class="tcTime">
							<validation:TimePickerValidator 
									ID="EndTimeValidator" 
									ControlToValidate="RangeEndEntry" 
									Display="Dynamic" 
									runat="server">*</validation:TimePickerValidator>
							<asp:PlaceHolder ID="RangeEndValidators" runat="server" />
							<common:TimePicker ID="RangeEndEntry" runat="server" />
							<asp:Label ID="RangeEndDisplay" Visible="false" runat="server">-- --</asp:Label>
						</div>
						<div>
							<asp:DropDownList ID="TypeOfPaySelect" CssClass="tcHoursEntryField" runat="server" />
							<asp:Label ID="TypeOfPayDisplay" Visible="false" runat="server">--</asp:Label>
							<framework:PortalImageButton ID="AddMoreButton" ImageCategory="PortletIcon" ImageUrl="increment.gif"
									CommandName="AddTimeOffHours" CausesValidation="false" runat="server" />
                            <span>&nbsp;</span>
						</div>
						<div class="tcValue">
							<asp:Label ID="Marker" Visible="false" style="float:right;" runat="server" />
							<asp:Label ID="SubtotalDisplay" runat="server">--</asp:Label>
						</div>
					</ItemTemplate>
					<SeparatorTemplate>
						</li>
						<li id="SeparatorDayRow" runat="server">
							<div></div>
						<!--</li>-->
					</SeparatorTemplate>
				</asp:Repeater>
			</li>
		</ItemTemplate>
		<SeparatorTemplate>
				<li><hr /><hr /><hr /><hr /><hr /></li>
		</SeparatorTemplate>
	</asp:Repeater>
	<li><hr /><hr /><hr /><hr /><hr /></li>
	<li class="tcFooter">
		<div></div>
		<div></div>
		<div></div>
		<div class="tcLabel"><common:GlobalizedLabel ID="TotalLabel" TextKey="LBL_TOTAL" runat="server" /></div>
		<div class="tcValue"><asp:Label id="TotalHourlyHours" runat="server" /></div>
	</li>
</ul>
</div>