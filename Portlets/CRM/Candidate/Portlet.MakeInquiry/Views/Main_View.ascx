<%@ Control Language="c#" AutoEventWireup="True" Codebehind="Main_View.ascx.cs" Inherits="Jenzabar.CRM.Candidate.Web.Portlets.MakeInquiry.Main_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<script language="javascript" type="text/javascript">function initIETOC(){};function resizeTheDiv(){}</script>
<jenzabar:errordisplay id="error" Runat="server" />
<div id="divAdminLink" runat="server" visible="false">
	<table class="GrayBordered" width="50%" align="center" cellpadding="3" border="0">
		<tr>
			<td align="center"><IMG title="" src="UI/Common/Images/PortletImages/Icons/portlet_admin_icon.gif">&nbsp;<jenzabar:globalizedlinkbutton id="glnkAdmin" runat="server" TextKey="TXT_AO_ADMIN_THIS_PORTLET" /></td>
		</tr>
	</table>
</div>
<div class="pSection">
	<table cellSpacing="0" cellPadding="0" width="100%">
		<tr>
			<td colspan="3"><jenzabar:complexcontentdisplay id="ccdMain" runat="server" /></td>
		</tr>
		<tr id="trCcdMainSpacer" runat="server">
			<td width="15px">&nbsp;</td>
			<td width="15px">&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<asp:Repeater ID="rptMainGrid" Runat="server">
			<HeaderTemplate />
			<ItemTemplate>
				<tr>
					<td colspan="3" align="center">
						<table class="GrayBordered" width="50%" align="center" cellpadding="3" border="0">
							<tr>
								<td align="center"><asp:LinkButton ID="lbStart" Runat="server" /></td>
							</tr>
						</table>
					</td>
				</tr>
			</ItemTemplate>
			<FooterTemplate />
		</asp:Repeater>
		<tr>
			<td colspan="3" align="center">
				<table class="GrayBordered" width="50%" align="center" cellpadding="3" border="0" id="tableMissingForm" runat="server">
					<tr>
						<td align="center"><asp:Literal ID="litMissingForm" Runat="server" /></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</div>
