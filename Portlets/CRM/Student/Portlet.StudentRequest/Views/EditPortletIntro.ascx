<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditPortletIntro.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.StudentRequest.EditPortletIntro" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="FWK" Namespace="Jenzabar.Portal.Framework.Web.TextEditor" Assembly="Jenzabar.Portal.Framework.Web" %>
<h4><asp:Literal ID="litPTitle" runat="server" /></h4>
<div class="pSection">
    <div class="FormBuilder"><div class="ErrorMsg"><asp:Literal ID="litErr" Runat="server" /></div></div>
    <table height="40" cellSpacing="3" cellPadding="3">
		<FWK:ImagePlacementandText id="iptMain" runat="server" />
		<tr>
		    <td colspan="2"></td>
		    <td>
		        <asp:Button ID="btnSave" runat="server" /> &nbsp; <input type="button" id="jsBtnCancel" runat="server" />
		    </td>
		</tr>
    </table>
</div> 