<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="FWK" Namespace="Jenzabar.Portal.Framework.Web.TextEditor" Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Control Language="c#" AutoEventWireup="True" Codebehind="Edit_Introduction.ascx.cs" Inherits="Jenzabar.CRM.Candidate.Web.Portlets.ApplyOnline.Edit_Introduction" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<jenzabar:errordisplay id="error" Runat="server"></jenzabar:errordisplay>
<h4><jenzabar:globalizedliteral id="litSetup" runat="server" textkey="TXT_AO_EDIT_INTRO"></jenzabar:globalizedliteral></h4>
<div class="pSection">
	<div class="FormBuilder"><div class="ErrorMsg"><asp:Literal ID="litErr" Runat="server" /></div></div>
	<table height="40" cellSpacing="3" cellPadding="3">
		<FWK:ImagePlacementandText id="iptMain" runat="server" />
		<tr>
			<td colspan="2">&nbsp;</td>
			<td><jenzabar:globalizedbutton id="gbtnSave" textkey="TXT_SAVE" runat="server"></jenzabar:globalizedbutton><jenzabar:globalizedbutton id="gbtnCancel" textkey="TXT_CANCEL" runat="server"></jenzabar:globalizedbutton></td>
		</tr>
	</table>
</div>
