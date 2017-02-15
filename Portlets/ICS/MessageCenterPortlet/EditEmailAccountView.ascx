<%@ Control Language="c#" AutoEventWireup="false" Codebehind="EditEmailAccountView.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.MessageCenterPortlet.EditEmailAccountView" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<div xmlns:cmn="http://schemas.jenzabar.com/JICS/CommonControls">

<div class="pSection">
<cmn:GlobalizedValidationSummary id="valSummary" runat="server" /> 
<fieldset>
<table>
<tr><th><cmn:formlabel id="lblProvider" forcontrol="ddlProvider" textkey="LBL_PROVIDER" runat="server" /></th><td><asp:DropDownList id="ddlProvider" runat="server" /></td></tr>
<tr><th><cmn:formlabel id="lblUserName" forcontrol="txtUserName" textkey="LBL_USER_NAME" runat="server" /></th><td><asp:TextBox id="txtUserName" runat="server" /><cmn:GlobalizedRequiredFieldValidator id="valUserRequired" runat="server" controltovalidate="txtUserName" errormessagekey="ERR_USER_NAME_IS_REQUIRED" /></td></tr>
<tr><th>&nbsp;</th><td><cmn:GlobalizedLinkButton id="lnkChangePassword" runat="server" textkey="TXT_CHANGE_PASSWORD" tooltipkey="MSG_CHANGE_EMAIL_PASSWORD" causesvalidation="false" /></td></tr>
<tr><th>&nbsp;</th><td><cmn:GlobalizedButton id="btnSave" textkey="TXT_SAVE" runat="server" /><cmn:GlobalizedButton id="btnCancel" textkey="TXT_CANCEL" runat="server" causesvalidation="false" /></td></tr>
</table>
</fieldset>
</div>

</div>