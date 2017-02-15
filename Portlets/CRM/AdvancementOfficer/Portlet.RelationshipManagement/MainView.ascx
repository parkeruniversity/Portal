<%@ Register TagPrefix="Jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="MainView.ascx.cs" Inherits="Jenzabar.CRM.AdvancementOfficer.Web.Portlets.RelationshipManagementPortlet.MainView" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<jenzabar:ErrorDisplay ID="errDisplay" Runat="server" />
<div id="divAdminLink" runat="server" visible="false">
	<table class="GrayBordered" width="50%" align="center" cellpadding="3" border="0">
		<tr>
			<td align="center"><img title="" src="UI/Common/Images/PortletImages/Icons/portlet_admin_icon.gif"  >&nbsp;<asp:LinkButton ID="linkBtnAdmFB" Runat="server" /></td>
		</tr>
	</table>
</div>
<h4><asp:Label ID="lblConstName" Runat="server" /></h4>
<Jenzabar:TabStrip ID="tl" Runat="server" />
<asp:PlaceHolder ID="plcSection" Runat="server" />
<script language="javascript">
	function validateEditFields(n)
	{
		if (n.value == "")
		{
			alert('<%= Globalizer.GetGlobalizedString("ERR_REL_MGMT_VALIDATE_UPDATE") %>');
			n.focus();
			return false;
		}
		if (n.value.length > 2000)
		{
			alert('<%= Globalizer.GetGlobalizedString("ERR_REL_MGMT_VALIDATE_UPDATE_LENGTH") %>');
			n.focus();
			return false;
		}
		return true;
	}
</script>
<input type="hidden" name="AllowPostback" value="true" />