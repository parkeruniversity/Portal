<%@ Control Language="c#" AutoEventWireup="True" Codebehind="TimecardApprovalHeader.ascx.cs" Inherits="Portlet.TimecardApproval.Controls.TimecardApprovalHeader" %>
<%@ Register TagPrefix="common" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>

<common:Subheader ID="PageHeader" runat="server">
	<span id="FormatDisplay" class="tcaHeaderFormatDisplay" visible="false" runat="server">
		<common:GlobalizedLabel ID="FormatLabel" TextKey="LBL_TIMECARD_FORMAT" runat="server" />
		<strong><span id="FormatText" runat="server" /></strong>
		<common:EmbeddedLinkButton ID="ChangeButton" OuterText="({0})"  TextKey="TXT_CHANGE" runat="server" />
	</span>
</common:Subheader>
