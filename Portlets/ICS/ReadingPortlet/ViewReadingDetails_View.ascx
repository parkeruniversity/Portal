
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ViewReadingDetails_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.ReadingPortlet.ViewReadingDetails_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<jenzabar:ErrorDisplay id="ctlError" runat=server />
<div class="pSection">
<fieldset>
<table cellpadding="3" cellspacing="0" width="100%">
	<tr>
		<td>
			<span class="PortletItemTitle">
				<asp:Label ID="lblTitle" Runat="Server"></asp:Label></span> &nbsp;&nbsp; <span nowrap>
				<asp:ImageButton ID="EditItemLink" CommandName="EditItem" AlternateText="edit item" Runat="server"
					Visible="False" />
				<asp:ImageButton ID="DeleteItemLink" CommandName="DeleteItem" AlternateText="delete item" Runat="server"
					Visible="False" />
			</span>
			<br>
			<div class="PortletItemDescription"><cmn:GlobalizedLabel runat=server textkey="LBL_AUTHOR"/> <asp:Label ID="lblAuthor" Runat="Server"></asp:Label></div>
			<div class="PortletItemDescription"><cmn:GlobalizedLabel runat=server textkey="LBL_EDITION_PUBLISHER"/> <asp:Label ID="lblEdition" Runat="Server"></asp:Label></div>
			<div class="PortletItemDescription"><asp:Label ID="lblPagesLabel" Runat="server"></asp:Label>&nbsp;<asp:Label ID="lblPages" Runat="Server"></asp:Label></div>
			<div class="PortletItemStatus"><cmn:GlobalizedLabel runat=server textkey="LBL_STATUS"/> <asp:Label ID="lblStatus" Runat="Server"></asp:Label></div>
			<div class="PortletItemDescription">
			<asp:HyperLink ID="lnkURL" Runat="Server" Target="_blank">
					<asp:Label ID="lblURLLabel" Runat="Server"></asp:Label>
			</asp:HyperLink>
			</div>
			<br>
			<div class="PortletItemDescription"><asp:Label ID="lblDescription" Runat="Server"></asp:Label></div>
		</td>
	</tr>
</table>
</fieldset>
</div>