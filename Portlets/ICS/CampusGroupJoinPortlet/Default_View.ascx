<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Default_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.CampusGroupJoinPortlet.Default_View" %>
<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<div id="MainSection" class="pSection" runat="server">
	<p id="MainText" runat="server"></p>
	<p style="color:red;"><common:GlobalizedLiteral id="DelayWarning" TextKey="MSG_CAMPUSGROUPJOIN_FORMAT_WAITNOTICE" Visible="false" runat="server" /></p>
	<asp:LinkButton ID="ApplyButton" Visible="False" Runat="server"></asp:LinkButton>
	<asp:Button ID="JoinButton" Visible="False" Runat="server"></asp:Button>
</div>
<common:ErrorDisplay ID="ContextInvalidError" Visible="false" runat="server" />
