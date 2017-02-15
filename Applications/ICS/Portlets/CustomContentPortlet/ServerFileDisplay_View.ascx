<%@ Register TagPrefix="common" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ServerFileDisplay_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.CustomContentPortlet.ServerFileDisplay_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<div class="pSection">
	<div id="divEditOrAdd" runat="server" align="right">
	    <common:ImageAndTextButton ID="EditContent" TextKey="TXT_EDIT_CONTENT" ToolTipKey="TXT_EDIT_CONTENT" Runat="server" />
	</div>
	<common:ErrorDisplay id="PageErrors" runat="server" />
	<asp:Literal id="litServerFileContent" Runat="server"></asp:Literal>
</div>
