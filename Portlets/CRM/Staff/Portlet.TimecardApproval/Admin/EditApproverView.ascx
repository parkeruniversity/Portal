<%@ Control Language="c#" AutoEventWireup="True" Codebehind="EditApproverView.ascx.cs" Inherits="Portlet.TimecardApproval.Admin.EditApproverView" %>
<%@ Register TagPrefix="common" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="framework" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Register TagPrefix="approval" Namespace="Portlet.TimecardApproval.Utils" Assembly="Portlet.TimecardApproval" %>

<common:Subheader ID="PageHeader" TextKey="TXT_EDIT_ALTERNATE_APPROVERS" runat="server" />
<div id="MainSection" class="pSection" runat="server">
	<table width="99%" cellpadding="0" cellspacing="0">
	<tr>
	    <td class="tcaAltApproversByGroupHeader"><common:GlobalizedLiteral TextKey="TXT_EDIT_ALTERNATE_APPROVERS" runat="server" /></td>
	</tr>
	<tr>
	    <td>
	    <table width="100%" cellpadding="8" cellspacing="0" border="0" class="tcaAltApproversEditBlueBorder">
	    
	        <tr class="tcaAltApproversByGroupBodyRow">
	            <td colspan="2">
					<framework:PortalImage ID="AlternateApprovalIcon" ImageCategory="PortletIcon" ImageUrl="supervisor-alt-app-icon.gif" 
							CssClass="tcaFloatLeft" runat="server" />
					<common:GlobalizedLiteral id="glitAltApproverDescription" TextKey="MSG_TCAPPROVAL_EDIT_APPROVER_DESCRIPTION" runat="server" />
				</td>
	        </tr>
	        <tr class="tcaAltApproversByGroupBodyRow">
	            <td align="center" colspan="2"><asp:Literal ID="litTitle" runat="server" /><hr width="85%" /></td>
	        </tr>
	        <tr class="tcaAltApproversByGroupBodyRow">
                <td width="40%">&nbsp;</td>
	            <td><approval:TCAPrincipalSelector id="psUsers" runat="server" align="center" /></td>
	        </tr>
	        <tr>
	            <td class="tcaAltApproversByGroupButtonRow" align="center" colspan="2">
					<common:GlobalizedButton ID="btnSaveApprovers" TextKey="TXT_SAVE_APPROVERS" runat="server" />
					<common:GlobalizedButton ID="btnCancel" TextKey="TXT_CANCEL" runat="server" />
				</td>
	        </tr>
	    </table>
	    </td>
	</tr>
	   <tr>
            <td>
                <common:GlobalizedLinkButton id="BackButton" runat="server" TextKey="TXT_BACK_TO_ALTERNATE_APPROVERS" />
            </td>
        </tr>
    </table>
</div>
