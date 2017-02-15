<%@ Control Language="c#" AutoEventWireup="false" Codebehind="EmailAccounts2View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.MessageCenterPortlet.EmailAccounts2View" %>
<%@ Register TagPrefix="jenz" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<div xmlns:cmn="http://schemas.jenzabar.com/JICS/CommonControls">

<div class="pSection">
<fieldset>
<table>
<tr><th><cmn:formlabel id="lblProvider" forcontrol="ddlProvider" textkey="LBL_PROVIDER" runat="server" /></th><td><asp:DropDownList id="ddlProvider" runat="server" /></td></tr>
<tr><th><cmn:formlabel id="lblUserName" forcontrol="txtUserName" textkey="LBL_USER_NAME" runat="server" /></th><td><asp:TextBox id="txtUserName" runat="server" /></td></tr>
<tr><th><cmn:formlabel id="lblPassword" forcontrol="txtPassword" textkey="LBL_PASSWORD" runat="server" /></th><td><asp:TextBox id="txtPassword" textmode="Password" runat="server" /></td></tr>
<tr><th>&nbsp;</th><td><cmn:GlobalizedButton id="btnSave" textkey="TXT_SAVE" runat="server" /><cmn:GlobalizedButton id="btnCancel" textkey="TXT_CANCEL" runat="server" /></td></tr>
</table>
</fieldset>
</div>

</div>