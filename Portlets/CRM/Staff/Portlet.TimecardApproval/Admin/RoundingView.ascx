<%@ Control Language="c#" AutoEventWireup="True" Codebehind="RoundingView.ascx.cs" Inherits="Portlet.TimecardApproval.Admin.RoundingView" %>
<%@ Register TagPrefix="common" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="framework" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" Assembly="Jenzabar.Portal.Framework.Web" %>

<common:Subheader ID="PageHeader" TextKey="TXT_ROUNDING_OF_HOURS" runat="Server" />

<div class="pSection tcaAdminPage">
	<common:ContentBox ID="RoundingContent" TextKey="TXT_DEFINE_ROUNDING" runat="server">
		<p class="tcaDescription">
			<framework:PortalImage ID="RoundingIcon" ImageCategory="PortletIcon" ImageUrl="rounding-icon.gif" 
						CssClass="tcaFloatLeft" runat="server" />
			<common:GlobalizedLabel ID="RoundingDescription" TextKey="MSG_TCAPPROVALPORTLET_ROUNDING_DESCRIPTION" runat="server" />
		</p>
		<hr />
		<ul>
			<li class="tcaHeader">
				<common:GlobalizedLabel ID="IncrementHeader" TextKey="TXT_ROUNDING_INCREMENT" runat="server" />
			</li>
			<li>
				<asp:RadioButton ID="IncrementFiveMinutes" GroupName="Increment" runat="server" />
				<common:GlobalizedLabel ID="IncrementFiveMinutesDescription" 
						TextKey="MSG_TCAPPROVALPORTLET_ROUNDING_FIVE_MINUTES_DESCRIPTION" runat="server" />
			</li>
			<li>
				<asp:RadioButton ID="IncrementFifteenMinutes" GroupName="Increment" runat="server" />
				<common:GlobalizedLabel ID="IncrementFifteenMinutesDescription" 
						TextKey="MSG_TCAPPROVALPORTLET_ROUNDING_FIFTEEN_MINUTES_DESCRIPTION" runat="server" />
			</li>
			<li>
				<asp:RadioButton ID="IncrementThirtyMinutes" GroupName="Increment" runat="server" />
				<common:GlobalizedLabel ID="IncrementThirtyMinutesDescription" 
						TextKey="MSG_TCAPPROVALPORTLET_ROUNDING_THIRTY_MINUTES_DESCRIPTION" runat="server" />
			</li>
			<li>
				<asp:RadioButton ID="IncrementNone" GroupName="Increment" runat="server" />
				<common:GlobalizedLabel ID="IncrementNoneDescription" 
						TextKey="MSG_TCAPPROVALPORTLET_ROUNDING_NONE_DESCRIPTION" runat="server" />
			</li>
		</ul>
		<hr />
		<ul>
			<li class="tcaHeader">
				<common:GlobalizedLabel ID="DirectionHeader" TextKey="TXT_ROUNDING_DIRECTION" runat="server" />
			</li>
			<li>
				<asp:RadioButton ID="DirectionClosest" GroupName="Direction" runat="server" />
				<common:GlobalizedLabel ID="DirectionClosestDescription" 
						TextKey="MSG_TCAPPROVALPORTLET_ROUNDING_CLOSEST_DESCRIPTION" runat="server" />
			</li>
			<li>
				<asp:RadioButton ID="DirectionUp" GroupName="Direction" runat="server" />
				<common:GlobalizedLabel ID="DirectionUpDescription" 
						TextKey="MSG_TCAPPROVALPORTLET_ROUNDING_UP_DESCRIPTION" runat="server" />
			</li>
			<li>
				<asp:RadioButton ID="DirectionDown" GroupName="Direction" runat="server" />
				<common:GlobalizedLabel ID="DirectionDownDescription" 
						TextKey="MSG_TCAPPROVALPORTLET_ROUNDING_DOWN_DESCRIPTION" runat="server" />
			</li>
		</ul>
		<hr />
		<div class="buttonBarCenteredVer2">
			<common:GlobalizedButton ID="SaveButton" TextKey="TXT_SAVE_ROUNDING" runat="server"/>
			<common:GlobalizedButton ID="CancelButton" TextKey="TXT_CANCEL" runat="server"/>
		</div>
	</common:ContentBox>
	
	<p><common:GlobalizedLinkButton ID="BackButton" TextKey="TXT_BACK_TO_ADMIN_OPTIONS" runat="server" /></p>
</div>
