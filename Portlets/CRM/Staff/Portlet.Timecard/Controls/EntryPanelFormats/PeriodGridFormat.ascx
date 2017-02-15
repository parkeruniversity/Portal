<%@ Control Language="c#" AutoEventWireup="false" Codebehind="PeriodGridFormat.ascx.cs" Inherits="Portlet.Timecard.Controls.EntryPanelFormats.PeriodGridFormat" %>
<%@ Register TagPrefix="common" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="framework" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" Assembly="Jenzabar.Portal.Framework.Web" %>

<ul id="PeriodGridFormatTable" class="tcEntryPanel tcPeriodGridEntry" runat="server">
	<li class="tcHeadings">
		<div></div>
		<div>
			<strong><common:GlobalizedLabel ID="HoursWorkedHeader" TextKey="TXT_HOURS_WORKED" runat="server" /></strong>
			<hr />
		</div>
		<div class="tcOtherHoursColumn">
			<common:GlobalizedLabel ID="OtherHoursHeader" TextKey="TXT_OTHER_HOURS" runat="server" />
			<hr />
		</div>
		<div class="tcTimeOffHoursColumn">
			<common:GlobalizedLabel ID="TimeOffHoursHeader" TextKey="TXT_TIME_OFF_HOURS" runat="server" />
			<hr />
		</div>
		<div class="tcValue">
			<common:GlobalizedLabel ID="SubtotalHeader" TextKey="TXT_SUBTOTAL" runat="server" />
			<hr />
		</div>
	</li>
	<asp:Repeater ID="PeriodDayGrid" runat="server">
		<ItemTemplate>
			<asp:Literal ID="Day" Visible="false" runat="server" />
			<li id="DayRow" runat="server">
				<div class="tcDay">
					<asp:Label ID="DayDisplay" runat="server" />
				</div>
				<div style="text-align:center;">
					<common:NumberValidator ID="RegularHoursNumberValidator" ControlToValidate="RegularHoursEntry"
							DecimalPlaces="2" Display="Dynamic" runat="server">*</common:NumberValidator>
					<asp:RangeValidator ID="RegularHoursRangeValidator" ControlToValidate="RegularHoursEntry"
							Type="Double" MinimumValue="0.0" MaximumValue="24.0"
							Display="Dynamic" runat="server">*</asp:RangeValidator>
					<asp:Label ID="RegularMarker" Visible="false" runat="server" />
					<asp:TextBox ID="RegularHoursEntry" Columns="5" MaxLength="8" CssClass="tcHoursEntryField" runat="server" />
					<asp:Label ID="RegularHoursDisplay" Visible="false" runat="server">--</asp:Label>
				</div>
				<asp:Repeater ID="OtherHours" runat="server">
					<HeaderTemplate>
						<ul class="tcOtherHoursColumn">
					</HeaderTemplate>
					<ItemTemplate>
						<li>
							<common:NumberValidator ID="SpecialHoursNumberValidator" ControlToValidate="SpecialHoursEntry"
									DecimalPlaces="2" Display="Dynamic" runat="server">*</common:NumberValidator>
							<asp:RangeValidator ID="SpecialHoursRangeValidator" ControlToValidate="SpecialHoursEntry"
									Type="Double" MinimumValue="0.0" MaximumValue="24.0"
									Display="Dynamic" runat="server">*</asp:RangeValidator>
							<asp:Label ID="SpecialMarker" Visible="false" runat="server" />
							<asp:TextBox ID="SpecialHoursEntry" Columns="5" MaxLength="8" CssClass="tcHoursEntryField" runat="server" />
							<asp:Label ID="SpecialHoursDisplay" Visible="false" runat="server">--</asp:Label>
							<asp:DropDownList ID="SpecialHoursTypeSelect" CssClass="tcHoursEntryField" runat="server" />
							<asp:Label ID="SpecialHoursTypeDisplay" Visible="false" runat="server">--</asp:Label>
							<framework:PortalImageButton ID="AddMoreButton" ImageCategory="PortletIcon" ImageUrl="increment.gif"
									CommandName="AddTimeOffHours" CausesValidation="false" runat="server" />
						</li>
					</ItemTemplate>
					<FooterTemplate>
						</ul>
					</FooterTemplate>
				</asp:Repeater>
				<asp:Repeater ID="TimeOffHours" runat="server">
					<HeaderTemplate>
						<ul class="tcTimeOffHoursColumn">
					</HeaderTemplate>
					<ItemTemplate>
						<li>
							<common:NumberValidator ID="SpecialHoursNumberValidator" ControlToValidate="SpecialHoursEntry"
									DecimalPlaces="2" Display="Dynamic" runat="server">*</common:NumberValidator>
							<asp:RangeValidator ID="SpecialHoursRangeValidator" ControlToValidate="SpecialHoursEntry"
									Type="Double" MinimumValue="0.0" MaximumValue="24.0"
									Display="Dynamic" runat="server">*</asp:RangeValidator>
							<asp:Label ID="SpecialMarker" Visible="false" runat="server" />
							<asp:TextBox ID="SpecialHoursEntry" Columns="5" MaxLength="8" CssClass="tcHoursEntryField" runat="server" />
							<asp:Label ID="SpecialHoursDisplay" Visible="false" runat="server">--</asp:Label>
							<asp:DropDownList ID="SpecialHoursTypeSelect" CssClass="tcHoursEntryField" runat="server" />
							<asp:Label ID="SpecialHoursTypeDisplay" Visible="false" runat="server">--</asp:Label>
							<framework:PortalImageButton ID="AddMoreButton" ImageCategory="PortletIcon" ImageUrl="increment.gif" 
									CommandName="AddTimeOffHours" CausesValidation="false" runat="server" />
						</li>
					</ItemTemplate>
					<FooterTemplate>
						</ul>
					</FooterTemplate>
				</asp:Repeater>
				<div class="tcValue">
					<asp:CustomValidator ID="SubtotalValidator" Display="Dynamic" runat="server">*</asp:CustomValidator>
					<asp:Label ID="SubtotalDisplay" runat="server">--</asp:Label>
				</div>
			</li>
		</ItemTemplate>
		<SeparatorTemplate>
			<li><hr /><hr class="tcOtherHoursColumn" /><hr class="tcTimeOffHoursColumn" /><hr /><hr /></li>
		</SeparatorTemplate>
	</asp:Repeater>
	<li><hr /><hr class="tcOtherHoursColumn" /><hr class="tcTimeOffHoursColumn" /><hr /><hr /></li>
	<li class="tcFooter">
		<div class="tcLabel"><common:GlobalizedLabel ID="TotalLabel" TextKey="LBL_TOTAL" runat="server" /></div>
		<div style="text-align:center;"><asp:Label ID="RegularHoursTotal" runat="server" /></div>
		<div style="text-align:center;" class="tcOtherHoursColumn"><asp:Label ID="OtherHoursTotal" runat="server" /></div>
		<div style="text-align:center;" class="tcTimeOffHoursColumn"><asp:Label ID="TimeOffHoursTotal" runat="server" /></div>
		<div class="tcValue"><asp:Label ID="GrandTotal" runat="server" /></div>
	</li>
</ul>
