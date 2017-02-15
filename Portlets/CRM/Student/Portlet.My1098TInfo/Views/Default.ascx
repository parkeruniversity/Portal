<%@ Register TagPrefix="cmn" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="True" Codebehind="Default.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.My1098TInfoPortlet.Default"%>
<div>
	<table cellSpacing="3" cellPadding="3" border="0" width="100%">
		<tr>
			<td nowrap>
				<cmn:globalizedLabel id="lblunavailable" runat="server" Visible="False" />
			</td>
		</tr>
		<tr>
			<td nowrap>
				<cmn:globalizedlinkbutton id="hlunavailable" runat="server" TextKey="TXT_1098_T_GO_TO_MY_1098_T_INFO" Visible="False" />
			</td>
		</tr>
	</table>
</div>