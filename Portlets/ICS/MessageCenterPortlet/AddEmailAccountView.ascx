<%@ Control Language="c#" AutoEventWireup="false" CodeBehind="AddEmailAccountView.ascx.cs"
    Inherits="Jenzabar.ICS.Web.Portlets.MessageCenterPortlet.AddEmailAccountView"
    TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<div xmlns:cmn="http://schemas.jenzabar.com/JICS/CommonControls">
    <div class="pSection">
        <cmn:globalizedvalidationsummary id="valSummary" runat="server" />
        <fieldset>
            <table>
                <tr>
                    <th>
                        <cmn:formlabel id="lblProvider" forcontrol="ddlProvider" textkey="LBL_PROVIDER" runat="server" />
                    </th>
                    <td>
                        <asp:DropDownList ID="ddlProvider" runat="server" />
                    </td>
                </tr>
                <tr>
                    <th>
                        <cmn:formlabel id="lblUserName" forcontrol="txtUserName" textkey="LBL_USER_NAME"
                            runat="server" />
                    </th>
                    <td>
                        <asp:TextBox ID="txtUserName" MaxLength="250" runat="server" />
                        <cmn:globalizedrequiredfieldvalidator id="valUserRequired" runat="server" controltovalidate="txtUserName" errormessagekey="ERR_USER_NAME_IS_REQUIRED" EnableClientScript="false" />
                    </td>
                </tr>
                <tr>
                    <th>
                        <cmn:formlabel id="lblPassword1" forcontrol="txtPassword1" textkey="LBL_PASSWORD"
                            runat="server" />
                    </th>
                    <td>
                        <asp:TextBox ID="txtPassword1" MaxLength="250" TextMode="Password" runat="server" /><cmn:globalizedrequiredfieldvalidator
                            id="valPass1Required" runat="server" controltovalidate="txtPassword1" errormessagekey="ERR_PASSWORD_IS_REQUIRED" EnableClientScript="false" />
                    </td>
                </tr>
                <tr>
                    <th>
                        <cmn:formlabel id="lblPassword2" forcontrol="txtPassword2" textkey="LBL_CONFIRM_PASSWORD"
                            runat="server" />
                    </th>
                    <td>
                        <asp:TextBox ID="txtPassword2" MaxLength="250" TextMode="Password" runat="server" /><cmn:globalizedrequiredfieldvalidator
                            id="valPass2Required" runat="server" controltovalidate="txtPassword2" errormessagekey="ERR_PASSWORD_CONFIRMATION_IS_REQUIRED" EnableClientScript="false" /><cmn:globalizedcomparevalidator
                                id="valPass2Same" runat="server" controltovalidate="txtPassword2" controltocompare="txtPassword1"
                                valuetocompare="Text" type="String" errormessagekey="ERR_PASSWORDS_DO_NOT_MATCH" />
                    </td>
                </tr>
                <tr>
                    <th>
                        &nbsp;
                    </th>
                    <td>
                        <cmn:globalizedbutton id="btnAdd" textkey="TXT_ADD" runat="server" /><cmn:globalizedbutton
                            id="btnCancel" textkey="TXT_CANCEL" causesvalidation="false" runat="server" />
                    </td>
                </tr>
            </table>
        </fieldset>
    </div>
</div>
