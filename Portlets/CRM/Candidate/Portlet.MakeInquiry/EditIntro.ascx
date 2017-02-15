<%@ Control Language="c#" AutoEventWireup="false" Codebehind="EditIntro.ascx.cs" Inherits="Jenzabar.CRM.Candidate.Web.Portlets.MakeInquiry.EditIntro" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="FWK" Namespace="Jenzabar.Portal.Framework.Web.TextEditor" Assembly="Jenzabar.Portal.Framework.Web" %>
<jenzabar:errordisplay id="error" Runat="server" />
<h4><jenzabar:globalizedliteral id="litSetup" runat="server" textkey="TXT_AO_EDIT_INTRO" /></h4>
<div class="pSection">
	<div class="FormBuilder"><div class="ErrorMsg"><asp:Literal ID="litErr" Runat="server" /></div></div>
	<table height="40" cellSpacing="3" cellPadding="3">
		<tr>
			<td colspan=3><h5><b><jenzabar:globalizedliteral id="lblHeader" runat="server" TextKey="TXT_OI_INQUIRY_LINK" /></b></h5></td>
		</tr>
		<tr>
			<td align="right"><jenzabar:globalizedliteral id=glitLinkText runat=server TextKey="TXT_OI_LINK_LABEL" /></td>
			<td>&nbsp;</td>
			<td><asp:TextBox ID=tbLinkLabel Runat=server /></td>
		</tr>
		<tr>
			<td colspan=3>&nbsp;</td>
		</tr>
			
		<tr>
			<td colspan=3><h5><b><jenzabar:globalizedliteral id="lbHeader2" runat="server" TextKey="TXT_OI_MAIN_SCREEN_CONTENT" /></b></h5></td>
		</tr>
		<FWK:ImagePlacementandText ID="_iptDefault" runat="server"/>
		<tr>
			<td colspan="2">&nbsp;</td>
			<td><jenzabar:globalizedbutton id="gbtnSave" textkey="TXT_SAVE" runat="server" /><jenzabar:globalizedbutton id="gbtnCancel" textkey="TXT_CANCEL" runat="server" /></td>
		</tr>
	</table>
</div>