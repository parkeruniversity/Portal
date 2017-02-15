<%@ Control Language="c#" AutoEventWireup="false" Codebehind="NewSystemAlertView.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.MessageCenterPortlet.NewSystemAlertView" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="txt" Namespace="Jenzabar.Portal.Framework.Web.TextEditor" Assembly="Jenzabar.Portal.Framework.Web" %>
<script language="JavaScript" src="<%= this.ResolveUrl("~/UI/Common/Scripts/jenz.js") %>"></script>
<div class="pSection" xmlns:cmn="http://schemas.jenzabar.com/JICS/CommonControls">
<asp:ValidationSummary id="valSummary" runat="server" showsummary="True" />
<fieldset>
<table>
<tr><th><cmn:FormLabel id="lblSubject" runat="server" forcontrol="txtSubject" textkey="LBL_SUBJECT" /></th><td><asp:TextBox id="txtSubject" runat="server" Maxlength="200" /><cmn:GlobalizedRequiredFieldValidator id="valSubjectRequired" runat="server" controltovalidate="txtSubject" errormessagekey="ERR_SUBJECT_REQUIRED" /></td></tr>
<tr><th><cmn:GlobalizedLiteral id="glit" runat="server" textkey="LBL_TO" /></th><td class="warning"><cmn:GlobalizedLiteral id="Globalizedliteral1" runat="server" textkey="MSG_SYSTEM_ALERTS_SENT_TO_ALL_USERS" /></td></tr>
<tr><th><cmn:FormLabel id="lblPriority" runat="server" forcontrol="ddlPriority" textkey="LBL_PRIORITY" /></th><td><asp:DropDownList id="ddlPriority" runat="server" /></td></tr>
<tr>
    <th><cmn:FormLabel id="lblMessage" runat="server" forcontrol="txtMessage" textkey="LBL_MESSAGE" /></th>
    <td><txt:TextEditorControl id="txtMessage" MaxLength="6000" runat="server" /></td>
</tr>
<tr><th>&nbsp;</th><td><cmn:GlobalizedButton id="btnSend" runat="server" textkey="TXT_SEND" /><cmn:GlobalizedButton id="btnCancel" runat="server" textkey="TXT_CANCEL" causesvalidation="false" /></td></tr>
</table>
</fieldset>
</div>
