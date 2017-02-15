<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ConfirmYourAction.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.Controls.ConfirmYourAction" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<cmn:Subheader id="subHeader" runat="server"></cmn:Subheader>
	<div class="pSection">
		<div class="PortletError" align="center"><asp:Literal id="lblStop" runat="server"></asp:Literal></div>	
		<p></p>
		<div><asp:Literal id="lblConfirm" runat="server"></asp:Literal></div>
	</div>
<div class="pActionsTransp">
<asp:Button ID="btnConfirm" Runat="server"></asp:Button>
<asp:Button ID="btnCancel" Runat="server"></asp:Button>
</div>
