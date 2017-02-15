<%@ Control CodeBehind="ActivateForm.ascx.cs" Language="c#" AutoEventWireup="false" Inherits="Jenzabar.CRM.Candidate.Web.Portlets.ApplyOnline.ActivateForm" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="framework" namespace="Jenzabar.Portal.Framework.Web.UI.Controls" assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<script language="JavaScript" src="<%= this.ResolveUrl("~/UI/Common/Scripts/jenz.js") %>"></script>
<jenzabar:errordisplay id="error" Runat="server" />
<h4><jenzabar:globalizedlabel id="lblHeaderBar" TextKey="TXT_AO_ACTIVATE_AN_APPLICATION" runat="server" /></h4>
<div class="pSection">
	<table cellpadding="0" cellspacing="3">
		<tr>
			<td>Application Name: <b><asp:Label ID="lblAppName" Runat="server" /></b></td>
			<td id="tdEditForm" runat="server">
				&nbsp;(<asp:HyperLink ID="hlEdit" Runat="server"><IMG title="" src="UI/Common/Images/PortletImages/Icons/edit.gif" alt="*"><jenzabar:globalizedliteral id="glit" TextKey="TXT_AO_EDIT_THIS_APPLICATION" runat="server" /></asp:HyperLink>)
			</td>
		</tr>
		<tr>
			<td colspan="2">&nbsp;</td>
		</tr>
		<tr>			
			<td colspan="2"><jenzabar:displayindicator id="ctlDisplayIndicator" runat="server" ShowTime="False" /></td>
		</tr>
		<tr>
			<td colspan="2"><jenzabar:globalizedbutton id="gbtnSave" TextKey="TXT_SAVE" runat="server" />&nbsp;<jenzabar:globalizedbutton id="gbtnCancel" TextKey="TXT_CANCEL" runat="server" /></td>
		</tr>
	</table>
	<jenzabar:Hint id="hntLinks" runat="server" />
</div>