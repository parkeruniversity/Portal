<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="DefaultView.ascx.cs" Inherits="Jenzabar.CRM.AdvancementOfficer.Web.Portlets.RelationshipManagementPortlet.DefaultView" %>
<input type="hidden" name="AllowPostback" value="true" />
<div>
	<div id="divAdminLink" runat="server" visible="false">
		<table class="GrayBordered" width="50%" align="center" cellpadding="3" border="0">
			<tr>
				<td align="center"><img title="" src="UI/Common/Images/PortletImages/Icons/portlet_admin_icon.gif"  >&nbsp;<asp:LinkButton ID="linkBtnAdmFB" Runat="server" /></td>
			</tr>
		</table>
	</div>
</div>
<table width="100%" cellpadding="2" cellspacing="0">
	<tr>
		<td>&nbsp;</td>
		<td><b><asp:Label ID="lblPersonSearch" Runat="server" /></b></td>
	</tr>
	<tr>
		<td width="10%" nowrap align="right"><asp:Label ID="lblID" Runat="server">:</asp:Label></td>
		<td width="90%"><asp:TextBox ID="txtID" Runat="server" /></td>
	</tr>
	<tr>
		<td nowrap align="right"><asp:Label ID="lblLastName" Runat="server" /></td>
		<td><asp:TextBox ID="txtLastName" Runat="server" /></td>
	</tr>
	<tr>
		<td nowrap align="right"><asp:Label ID="lblFirstName" Runat="server" /></td>
		<td><asp:TextBox ID="txtFirstName" Runat="server" /></td>
	</tr>
	<tr>
		<td nowrap align="right"><asp:Label ID="lblMiddleName" Runat="server" /></td>
		<td><asp:TextBox ID="txtMiddleName" Runat="server" /></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><b><asp:Label ID="lblCompanySearch" Runat="server" /></b></td>
	</tr>
	<tr>
		<td nowrap align="right"><asp:Label ID="lblCompanyName" Runat="server" /></td>
		<td><asp:TextBox ID="txtCompanyName" Runat="server" /></td>
	</tr>
	<tr>
		<td nowrap align="right"><asp:Button ID="btnSearch" Runat="server" /></td>
		<td><asp:LinkButton ID="lnkAdvanceSearch" Runat="server" />&nbsp;&nbsp;<asp:LinkButton ID="lnkSetup" Runat="server" /></td>
	</tr>
	<tr>
		<td nowrap align="right"></td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td><asp:Label ID="lblValidationError" CssClass="PortletError" Runat="server" /></td>
	</tr>
</table>