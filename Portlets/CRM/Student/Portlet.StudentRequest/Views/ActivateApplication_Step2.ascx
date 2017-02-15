<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ActivateApplication_Step2.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.StudentRequest.ActivateApplication_Step2" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="framework" namespace="Jenzabar.Portal.Framework.Web.UI.Controls" assembly="Jenzabar.Portal.Framework.Web" %>
<h4><asp:Literal ID="litPTitle" runat="server" /></h4>
<div class="pSection">
	<table cellpadding="0" cellspacing="3" border="0" width="100%">
	    <tr>
			<td nowrap><div class="underline"><asp:Literal ID="litObjName" runat="server" /></div></td>
			<td>
			    <b><asp:Label ID="lblAppName" Runat="server" /></b>
			    <span id="spanEditForm" runat="server">(<img src="UI/Common/Images/PortletImages/Icons/edit.gif" /> <asp:HyperLink ID="hlEdit" Runat="server" />)</span>
            </td>
		</tr>
		<tr>
			<td colspan="2">&nbsp;</td>
		</tr>
		<tr>
		    <td valign="top"><div class="underline"><asp:Literal ID="litAvailability" runat="server" /></div></td>
			<td><jenzabar:displayindicator id="ctlDisplayIndicator" runat="server" ShowTime="False" Width="100%" /></td>
		</tr>
		<tr>
		    <td valign="top"><div class="underline"><asp:Literal ID="litRepeats" runat="server" /></div></td>
		    <td>
		        <asp:RadioButtonList ID="rblRepeats" runat="server">
                    <asp:ListItem Value="0" Text="Only one submission per person" />
		            <asp:ListItem Value="1" Text="No limit to the number of submissions per person" />
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td valign="top"><div class="underline">Submission review</div></td>
            <td><asp:CheckBox ID="cbAllowUsersToReview" runat="server" /> Allow users to review their submissions for this form</td>
        </tr>
        <tr>
			<td colspan="2">&nbsp;</td>
		</tr>
		<tr>
		    <td valign="top"><div class="underline"><asp:Literal ID="litDirectLinks" runat="server" /></div></td>
		    <td><jenzabar:Hint id="hntLinks" runat="server" /></td>
		</tr>
		<tr>
			<td colspan="2">
			    <asp:button ID="btnSave" runat="server" /> &nbsp; <input type="button" id="jsBtnCancel" runat="server" />
			</td>
		</tr>
	</table>
</div> 