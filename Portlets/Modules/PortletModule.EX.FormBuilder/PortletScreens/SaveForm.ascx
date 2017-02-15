<%@ Control Language="c#" AutoEventWireup="false" Codebehind="SaveForm.ascx.cs" Inherits="Jenzabar.CRM.Common.Web.PortletModule.EX.FormBuilder.PortletScreens.SaveForm" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<script language="javascript" type="text/javascript">function resizeTheDiv(){};function initIETOC(){}</script>
<jenzabar:errordisplay id="error" Runat="server" />
<h4><asp:Label id="lblHeaderBar" runat="server" /></h4>
<div class="pSection"><div class="FormBuilder"><div class="ErrorMsg"><asp:Literal ID="litMsg" Runat="server" /></div></div></div>
<table class="GrayBordered" width="95%" align="center" cellpadding="3" border="0">
	<tr>
		<td align="center"><asp:Label ID="lblHeaderTitle" Runat="server" /></td>
	</tr>
	<tr>
		<td align="center">&nbsp;</td>
	</tr>
	<tr>
		<td><asp:Label ID="lblHeaderMessage" Runat="server" /></td>
	</tr>
	<tr>
		<td><jenzabar:GlobalizedLabel id="glblBookmark" runat="server" TextKey="TXT_AO_BOOKMARK" /></td>
	</tr>
</table>
<div class="pSection">
	<div id="divGuest" runat="server" visible="false">
		<table cellSpacing="0" cellPadding="0" width="100%">
			<tr>
				<td colspan="3"><h5><b><jenzabar:GlobalizedLabel id="Globalizedlabel1" runat="server" TextKey="TXT_AO_EMAIL_HEADER" /></b></h5></td>
			</tr>
			<tr>
				<td width="20">&nbsp;</td>
				<td colspan="2"><jenzabar:GlobalizedLabel id="glblAppText" runat="server" TextKey="TXT_AO_EMAIL_TEXT" /></td>
			</tr>
			<tr>
				<td width="20">&nbsp;</td>
				<td width="40">&nbsp;</td>
				<td>
					Your email address:&nbsp;<asp:TextBox ID="tbEmail" Runat="server" Width="175" />&nbsp;
					<jenzabar:globalizedbutton id="gbSendEmail" runat="server" TextKey="TXT_AO_EMAIL_KEY" />
				</td>
			</tr>
		</table>
	</div>
	<table cellSpacing="0" cellPadding="0" width="100%">
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>
			    <a href="<%=this.ParentPortlet.GetNextScreenURL("Main")%>"><%=Globalizer.Format("TXT_AO_RETURN_APP_LIST", _portlettext)%></a>
				|
				<asp:linkbutton id="lbContinueApp" runat="server" /></td>
		</tr>
	</table>
</div>
