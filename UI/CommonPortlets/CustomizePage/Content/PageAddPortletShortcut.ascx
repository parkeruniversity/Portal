<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="PageAddPortletShortcut.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.Controls.PageAddPortletShortcut" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<div class="pSection">
<cmn:Hint id="hint" runat="server" />
<asp:PlaceHolder id="plhNavigate" runat="server"/>
<asp:CheckBoxList ID="chbPortlets" Runat="server"></asp:CheckBoxList>
<asp:Literal ID="lblNoItems" Runat="server"></asp:Literal>
<p></p>

	<div class="pActionsTransp">
		<asp:Button ID="btnAdd" Runat="server"></asp:Button>&nbsp;
		<asp:Button ID="btnCancel" Runat="server"></asp:Button> 
	</div>
</div>
