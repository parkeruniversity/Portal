<%@ Control Language="c#" AutoEventWireup="false" Codebehind="GradebookSiteSettings.ascx.cs" Inherits="Jenzabar.LMS.Portlets.GradebookPortlet.Views.GradebookSiteSettings" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="portlet" TagName="LGConfig" Src="Controls/LetterGradeConfiguration.ascx" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register TagPrefix="framework" Assembly="Jenzabar.Portal.Framework.Web" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" %>
<link rel="stylesheet" type="text/css" href="<%= ResolveUrl("~/Portlets/LMS/GradebookPortlet/Style/GradebookPortletStyle.aspx") %>" />
<h4><common:globalizedliteral id="glitGlobalSettings" TextKey="TXT_GRADEBOOK_GLOBAL_SETTINGS" runat="server" /></h4>
<div class="pSection" id="divError" visible="False" runat="server">
    <common:errordisplay id="ctlError" RunAt="server" />
</div>
<div class="gradebookPortlet">
    <div class="letterGradeScreen">
        <framework:PortletFeedback ID="Feedback" runat="server" />
        <portlet:LGConfig ID="LGConfig" runat="server" />
    </div>
</div>
<asp:PlaceHolder ID="phErp" runat="server">
<div class="pSection">
	<script language="javascript" type="text/javascript">
		function processChecks() {
			var inputs = document.getElementsByTagName("input");
			var cbEnable, cbAbsences, cbAbsencesRequired, cbLDOA, cbLDOARequired;

			//calling getElementByID with the ClientID wasnt working as intended.  This fixes that issue.
			for (var i = 0; i < inputs.length; i++) {
				if (inputs[i].type == "checkbox") {
					if (inputs[i].name == '<%= this.cbEnableSubmission.ClientID.Replace("_", ":") %>') cbEnable = inputs[i];
					if (inputs[i].name == '<%= this.cbEnableAbsences.ClientID.Replace("_", ":") %>') cbAbsences = inputs[i];
					if (inputs[i].name == '<%= this.cbRequireAbsences.ClientID.Replace("_", ":") %>') cbAbsencesRequired = inputs[i];
					if (inputs[i].name == '<%= this.cbEnableLDOA.ClientID.Replace("_", ":") %>') cbLDOA = inputs[i];
					if (inputs[i].name == '<%= this.cbRequireLDOA.ClientID.Replace("_", ":") %>') cbLDOARequired = inputs[i];
				}
			}
			if (!cbEnable.checked) {
				cbAbsences.checked = false;
				cbAbsences.enabled = false;
				cbAbsencesRequired.checked = false;
				cbAbsencesRequired.enabled = false;
				cbLDOA.checked = false;
				cbLDOA.enabled = false;
				cbLDOARequired.checked = false;
				cbLDOARequired.enabled = false;
			}

			if (!cbAbsences.checked) {
				cbAbsencesRequired.checked = false;
				cbAbsencesRequired.enabled = false;
			}
			if (!cbLDOA.checked) {
				cbLDOARequired.checked = false;
				cbLDOARequired.enabled = false;
			}
		}
	</script>
	<table cellSpacing="0" cellPadding="3" width="100%">
		<tr>
			<td colspan="4"><b><common:globalizedliteral id="Globalizedliteral6" TextKey="TXT_GRADEBOOK_GLOBAL_SETTINGS_BAR" runat="server" />
					<hr>
				</b>
			</td>
		</tr>
		<tr>
			<td colspan="4">&nbsp;</td>
		</tr>
		<tr>
			<td valign="top" width="8"><asp:CheckBox ID="cbEnableSubmission" Runat="server" /></td>
			<td colspan="3" valign="top"><asp:literal id="litEnableSubmission" runat="server" /></td>
		</tr>
		<tr>
			<td colspan="2">&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td valign="top"><asp:CheckBox ID="cbEnableAbsences" Runat="server" /></td>
			<td colspan="2" valign="top"><common:globalizedliteral TextKey="TXT_GRADEBOOK_SETUP_ENABLE_ABSENCES" runat="server" ID="Globalizedliteral1" /></td>
		</tr>
		<tr>
			<td width="8">&nbsp;</td>
			<td width="8">&nbsp;</td>
			<td valign="top" width="8"><asp:CheckBox ID="cbRequireAbsences" Runat="server" /></td>
			<td valign="top"><common:globalizedliteral TextKey="TXT_GRADEBOOK_SETUP_REQUIRE_ABSENCES" runat="server" ID="Globalizedliteral2" /></td>
		</tr>
		<tr>
			<td colspan="4">&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td valign="top"><asp:CheckBox ID="cbEnableLDOA" Runat="server" /></td>
			<td colspan="2" valign="top"><common:globalizedliteral TextKey="TXT_GRADEBOOK_SETUP_ENABLE_LDOA" runat="server" ID="Globalizedliteral3" /></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td valign="top"><asp:CheckBox ID="cbRequireLDOA" Runat="server" /></td>
			<td valign="top"><common:globalizedliteral TextKey="TXT_GRADEBOOK_SETUP_REQUIRE_LDOA" runat="server" ID="Globalizedliteral4" /></td>
		</tr>
		<tr>
			<td colspan="4">&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td colspan="3"><common:globalizedbutton id="gbSave" TextKey="TXT_SAVE" runat="server" />&nbsp;
				<common:globalizedbutton TextKey="TXT_CANCEL" runat="server" ID="gbCancel" /></td>
		</tr>
	</table>
	<script language="javascript" type="text/javascript">
		processChecks();
	</script>
</div>
</asp:PlaceHolder>