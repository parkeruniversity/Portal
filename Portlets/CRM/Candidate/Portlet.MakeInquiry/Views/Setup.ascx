<%@ Control Language="c#" AutoEventWireup="True" Codebehind="Setup.ascx.cs" Inherits="Jenzabar.CRM.Candidate.Web.Portlets.MakeInquiry.Setup" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<jenzabar:errordisplay id="error" Runat="server"></jenzabar:errordisplay>
<h4><jenzabar:globalizedliteral id="litSetup" runat="server" textkey="TXT_OI_ADMIN_SCREEN"></jenzabar:globalizedliteral></h4>
<div class="pSection" id="divMain" runat="server" visible="true">
	<div id="divHeader" style="MARGIN-BOTTOM: 3px;" runat="server" visible="True">
		<table cellSpacing="3" cellPadding="3" border="0">
			<tr>
				<td colspan="2"><IMG title="" src="UI/Common/Images/PortletImages/Icons/edit.gif">&nbsp;<jenzabar:globalizedlinkbutton id="glnkEditIntro" runat="server" TextKey="TXT_OI_EDIT_MAIN_SCREEN_CONTENT" /></td>
			</tr>
			<tr>
				<td valign="top"><b><jenzabar:globalizedliteral id="glitCurrentForm" runat="server" TextKey="TXT_OI_CURRENT_INQUIRY_FORM" />&nbsp;</b></td>
				<td><asp:Literal ID="litActiveForm" Runat="server" /> <asp:Literal ID="litFormLinks" Runat="server" /></td>			
			</tr>
			<tr id="trFormControls" runat="server">
				<td>&nbsp;</td>
				<td><asp:HyperLink id=hlEdit Runat=server><IMG title=""  src="UI/Common/Images/PortletImages/Icons/edit.gif"><jenzabar:globalizedliteral id=glitEditForm runat=server TextKey="TXT_OI_EDIT_THIS_FORM"></jenzabar:globalizedliteral></asp:HyperLink> &nbsp;|&nbsp;<jenzabar:globalizedlinkbuttonwithicon id="glwiDeactivate" runat="server" TextKey="TXT_OI_DEACTIVATE_THIS_FORM" IconSrc="UI/Common/Images/PortletImages/Icons/delete.gif" ></jenzabar:globalizedlinkbuttonwithicon ></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td><jenzabar:globalizedlinkbuttonwithicon id="glwiActivate" runat="server" TextKey="TXT_OI_ACTIVATE_DIFFERENT_FORM" IconSrc="UI/Common/Images/PortletImages/Icons/arrows_horiz.gif" /></td>
			</tr>
			<tr id="trAdmin" runat=server>
				<td>&nbsp;</td>
				<td><jenzabar:globalizedlinkbuttonwithicon id="glwiManage" runat="server" TextKey="TXT_OI_MANAGE_INQUIRY_FORMS" IconSrc="UI/Common/Images/PortletImages/Icons/edit.gif" /> | <a id="aAddForm" runat="server"><IMG title="" src="UI/Common/Images/PortletImages/Icons/add.gif"> <asp:Literal ID="litAddForm" Runat="server"/></a></td>
			</tr>
		</table>
	</div>
</div>
