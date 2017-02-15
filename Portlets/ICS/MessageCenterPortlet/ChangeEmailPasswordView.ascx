<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ChangeEmailPasswordView.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.MessageCenterPortlet.ChangeEmailPasswordView" targetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<div xmlns:cmn="http://schemas.jenzabar.com/JICS/CommonControls">

<div class="pSection">
<cmn:GlobalizedValidationSummary id="valSummary" runat="server" /> 
<fieldset>
<table>
<tr><th><cmn:formlabel id="lblOldPassword" forcontrol="txtOldPassword" textkey="LBL_OLD_PASSWORD" runat="server" /></th><td><asp:TextBox id="txtOldPassword" textmode="Password" runat="server" /><cmn:GlobalizedRequiredFieldValidator id="valOldPassRequired" runat="server" controltovalidate="txtOldPassword" errormessagekey="ERR_OLD_PASSWORD_REQUIRED" /><cmn:GlobalizedCustomValidator id="valOldPassCust" runat="server" controltovalidate="txtOldPassword" errormessagekey="TXT_INVALID_OLD_PASSWORD" /> </td></tr>
<tr><th><cmn:formlabel id="lblNewPassword1" forcontrol="txtNewPassword1" textkey="LBL_NEW_PASSWORD" runat="server" /></th><td><asp:TextBox id="txtNewPassword1" textmode="Password" runat="server" /><cmn:GlobalizedRequiredFieldValidator id="valNewPassRequired1" runat="server" controltovalidate="txtNewPassword1" errormessagekey="ERR_OLD_PASSWORD_REQUIRED" /></td></tr>
<tr><th><cmn:formlabel id="lblNewPassword2" forcontrol="txtNewPassword2" textkey="LBL_CONFIRM_NEW_PASSWORD" runat="server" /></th><td><asp:TextBox id="txtNewPassword2" textmode="Password" runat="server" /><cmn:GlobalizedRequiredFieldValidator id="valNewPassRequired2" runat="server" controltovalidate="txtNewPassword2" errormessagekey="ERR_OLD_PASSWORD_REQUIRED" /><cmn:GlobalizedCompareValidator id="valPass2Same" runat="server" controltovalidate="txtNewPassword2" controltocompare="txtNewPassword1" valuetocompare="Text" type="String" errormessagekey="ERR_PASSWORDS_DO_NOT_MATCH" /></td></tr>
<tr><th>&nbsp;</th><td><cmn:GlobalizedButton id="btnSave" textkey="TXT_SAVE" runat="server" /><cmn:GlobalizedButton id="btnCancel" textkey="TXT_CANCEL" runat="server" causesvalidation="false" /></td></tr>
</table>
</fieldset>
</div>

</div>