<%@ Control Language="c#" AutoEventWireup="false" Codebehind="OrphanShortcut.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.OrphanShortcut.OrphanShortcut" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<cmn:Subheader id="subHeader" runat="server"></cmn:Subheader>
	<div class="pSection">
		<div class="PortletError" align="center"><asp:Literal id="lblWarning" runat="server"></asp:Literal></div>	
		<p></p>
		<div><asp:Label id="lblMessage" runat="server"></asp:Label></div>
	</div>
<div class="pActionsTransp">
<asp:Button ID="btnDelete" Runat="server"></asp:Button>
</div>
