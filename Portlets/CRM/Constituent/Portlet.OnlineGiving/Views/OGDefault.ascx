<%@ Control Language="c#" AutoEventWireup="True" Codebehind="OGDefault.ascx.cs" Inherits="Jenzabar.CRM.Constituent.Web.Portlets.OnlineGivingPortlet.OGDefault" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<div class="pSection" id="divMain" runat="server">
		<table cellSpacing="3" cellPadding="3" width="100%">
			<tr>
				<td><jenzabar:globalizedlinkbutton ID="lnkGiveAGift" Runat="server" textkey="TXT_ONLINE_GIVING_GIVE_A_GIFT_OR_PLEDGE" onclick="lnkGiveAGift_Click"></jenzabar:globalizedlinkbutton></td>
			</tr>
		</table>
</div>
