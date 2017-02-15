<%@ Control Language="c#" AutoEventWireup="True" Codebehind="PeriodFormat.ascx.cs" Inherits="Portlet.Timecard.Controls.EntryPanelFormats.PeriodFormat" %>
<%@ Register TagPrefix="common" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="framework" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" Assembly="Jenzabar.Portal.Framework.Web" %>

<ul class="tcPeriodEntry tcEntryPanel">
	<li id="RegularHoursRow" runat="server">
		<div class="tcLabel">
			<strong><common:GlobalizedLabel ID="HoursWorkedHeader" TextKey="TXT_HOURS_WORKED" runat="server" /></strong>
		</div>
		<div class="tcValue">
			<common:NumberValidator ID="RegularHoursNumberValidator" ControlToValidate="RegularHoursEntry"
					DecimalPlaces="2" Display="Dynamic" runat="server">*</common:NumberValidator>
			<asp:RangeValidator ID="RegularRangeValidator" ControlToValidate="RegularHoursEntry"
					Type="Double" MinimumValue="0.0" Display="Dynamic" runat="server">*</asp:RangeValidator>
			<asp:Label ID="RegularMarker" Visible="false" runat="server" />
			<asp:TextBox ID="RegularHoursEntry" Columns="5" MaxLength="8" CssClass="tcHoursEntryField" runat="server" />
			<asp:Label ID="RegularHoursDisplay" Visible="false" runat="server" />
		</div>
		<div></div>
	</li>
	<li><hr /><hr /><hr /></li>
	<asp:Repeater ID="OtherHours" runat="server">
		<HeaderTemplate>
			<li>
				<div class="tcLabel">
					<common:GlobalizedLabel ID="OtherHoursHeader" TextKey="TXT_OTHER_HOURS" runat="server" />
				</div>
		</HeaderTemplate>
		<ItemTemplate>
				<div class="tcValue">
					<common:NumberValidator ID="SpecialHoursNumberValidator" ControlToValidate="SpecialHoursEntry"
							DecimalPlaces="2" Display="Dynamic" runat="server">*</common:NumberValidator>
					<asp:RangeValidator ID="SpecialRangeValidator" ControlToValidate="SpecialHoursEntry"
							Type="Double" MinimumValue="0.0" Display="Dynamic" runat="server">*</asp:RangeValidator>
					<asp:Label ID="SpecialMarker" Visible="false" runat="server" />
					<asp:TextBox ID="SpecialHoursEntry" Columns="5" MaxLength="8" CssClass="tcHoursEntryField" runat="server" />
					<asp:Label ID="SpecialHoursDisplay" Visible="false" runat="server" />
				</div>
				<div>
					<asp:DropDownList ID="TypeOfPaySelect" CssClass="tcHoursEntryField" runat="server" />
					<asp:Label ID="TypeOfPayDisplay" Visible="false" runat="server" />
					<framework:PortalImageButton ID="AddMoreButton" ImageCategory="PortletIcon" ImageUrl="increment.gif"
							CommandName="AddOtherHours" CausesValidation="false" EnableViewState="false" runat="server" />
				</div>
		</ItemTemplate>
		<SeparatorTemplate>
			</li>
			<li>
				<div class="tcLabel"></div>
		</SeparatorTemplate>
		<FooterTemplate>
			</li>
			<li><hr /><hr /><hr /></li>
		</FooterTemplate>
	</asp:Repeater>
	<asp:Repeater ID="TimeOffHours" runat="server">
		<HeaderTemplate>
			<li>
				<div class="tcLabel">
					<common:GlobalizedLabel ID="TimeOffHoursHeader" TextKey="TXT_TIME_OFF_HOURS" runat="server" />
				</div>
		</HeaderTemplate>
		<ItemTemplate>
				<div class="tcValue">
					<common:NumberValidator ID="SpecialHoursNumberValidator" ControlToValidate="SpecialHoursEntry" 
							DecimalPlaces="2" Display="Dynamic" runat="server">*</common:NumberValidator>
					<asp:RangeValidator ID="SpecialRangeValidator" ControlToValidate="SpecialHoursEntry" 
							Type="Double" MinimumValue="0.0" Display="Dynamic" runat="server">*</asp:RangeValidator>
					<asp:Label ID="SpecialMarker" Visible="false" runat="server" />
					<asp:TextBox ID="SpecialHoursEntry" Columns="5" MaxLength="8" CssClass="tcHoursEntryField" runat="server" />
					<asp:Label ID="SpecialHoursDisplay" Visible="false" runat="server" />
				</div>
				<div>
					<asp:DropDownList ID="TypeOfPaySelect" CssClass="tcHoursEntryField" runat="server" />
					<asp:Label ID="TypeOfPayDisplay" Visible="false" runat="server" />
					<framework:PortalImageButton ID="AddMoreButton" ImageCategory="PortletIcon" ImageUrl="increment.gif"
							CommandName="AddTimeOffHours" CausesValidation="false" EnableViewState="false" runat="server" />
				</div>
		</ItemTemplate>
		<SeparatorTemplate>
			</li>
			<li>
				<div class="tcLabel"></div>
		</SeparatorTemplate>
		<FooterTemplate>
			</li>
			<li><hr /><hr /><hr /></li>
		</FooterTemplate>
	</asp:Repeater>
	<li class="tcFooter">
		<div class="tcLabel"><common:GlobalizedLabel ID="TotalLabel" TextKey="LBL_TOTAL" runat="server" /></div>
		<div class="tcValue">
			<asp:CustomValidator ID="TotalHoursValidator" Display="Dynamic" runat="server">*</asp:CustomValidator>
			<asp:Label id="TotalPeriodHours" runat="server" />
		</div>
		<div></div>
	</li>
</ul>
