<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ExternalLoginView.ascx.cs" Inherits="Jenzabar.ContainedForm.Views.ExternalLoginView" %>
<%@ Import Namespace="Jenzabar.Common.Globalization" %>
<%@ Import Namespace="Jenzabar.ContainedForm.Helpers" %>
<%@ Import Namespace="Jenzabar.Portal.Framework.InstalledApplications" %>
<%@ Import Namespace="Jenzabar.Common.Configuration" %>

<div class="pSection">
    <script type="text/javascript" src='<%= ResolveUrl("~/Portlets/CUS/ICS/Jenzabar.ContainedForm/Scripts/commonScripts.js?v=" + new InstalledApplicationService().GetApplicationVersion(FormResources.ApplicationName)) %>'></script>
    <script type="text/javascript" src='<%= ResolveUrl("~/Portlets/CUS/ICS/Jenzabar.ContainedForm/Scripts/formViewScripts.js?v=" + new InstalledApplicationService().GetApplicationVersion(FormResources.ApplicationName)) %>'></script>
    <script>
            Jcf.ExternalUsers = {
                    minPasswordLength: '<%= ConfigSettings.Current.PasswordManagement.MinLength %>',
                maxPasswordLength: '<%= ConfigSettings.Current.PasswordManagement.MaxLength %>',
                passwordFormat: '<%= ConfigSettings.Current.PasswordManagement.ValidationExpression %>',
                invalidMessage: '<%= String.Format(Globalizer.GetGlobalizedString(Constants.TXT_PASSWORD_NOT_VALID), ConfigSettings.Current.PasswordManagement.MinLength, ConfigSettings.Current.PasswordManagement.MaxLength) %>',
                events: {
                    onPasswordBlur: function (tbx) {
                        var val = $(tbx).val();
                        if (val.length < Jcf.ExternalUsers.minPasswordLength
                            || val.length > Jcf.ExternalUsers.maxPasswordLength
                            || (Jcf.ExternalUsers.passwordFormat != ''
                                && new RegExp(Jcf.ExternalUsers.passwordFormat).exec(val).length == 0)) {
                            alert(Jcf.ExternalUsers.invalidMessage);
                            $('[id*=btnCreateAccount]').attr('disabled', 'disabled');
                        } else {
                            $('[id*=btnCreateAccount]').removeAttr('disabled');
                        }
                    }
                }
            };
    </script>
    <center>
        <asp:Panel ID="pnlAdminLinks" runat="server"  CssClass="AdminLinks">
        <asp:LinkButton ID="lnkAdminPortlet" runat="server" 
            onclick="lnkAdminPortlet_Click">Manage Forms</asp:LinkButton>
            </asp:Panel>
        <asp:Panel ID="pnlReportLinks" runat="server" CssClass="AdminLinks">
        <asp:LinkButton ID="lnkReportView" runat="server"
            onclick="lnkReportView_Click">View Reports</asp:LinkButton>
        </asp:Panel>
    </center>
    <div class="jcf-login-container">
        <asp:Panel CssClass="jcf-login-form" runat="server" ID="pnlLoginForm" DefaultButton="btnLogin">
            <div class="form-group">
                <asp:Label runat="server" ID="tbxEmailLabel" AssociatedControlID="tbxEmail"></asp:Label>
                <asp:TextBox runat="server" TextMode="Email" CssClass="form-control" ID="tbxEmail"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label runat="server" ID="tbxPasswordLabel" AssociatedControlID="tbxPassword"></asp:Label>
                <asp:TextBox runat="server" TextMode="Password" ID="tbxPassword" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Button runat="server" ID="btnLogin" CssClass="btn btn-default" OnClick="btnLogin_OnClick" />
                <asp:LinkButton runat="server" ID="btnCreate" OnClientClick="Jcf.events.onCreateAccountClicked();return false;" />
            </div>
        </asp:Panel>
        <asp:Panel CssClass="jcf-create-login" style="display: none;" runat="server" ID="pnlCreateLogin" DefaultButton="btnCreateAccount">
            <div class="form-group">
                <asp:Label runat="server" ID="tbxCreateFirstNameLabel" AssociatedControlID="tbxCreateFirstName"></asp:Label>
                <asp:TextBox runat="server" ID="tbxCreateFirstName" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label runat="server" ID="tbxCreateLastNameLabel" AssociatedControlID="tbxCreateLastName"></asp:Label>
                <asp:TextBox runat="server" ID="tbxCreateLastName" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label runat="server" ID="tbxCreateEmailLabel" AssociatedControlID="tbxCreateEmail"></asp:Label>
                <asp:TextBox runat="server" ID="tbxCreateEmail" CssClass="form-control" onblur="Jcf.events.onCreateEmailAddressBlur();"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label runat="server" ID="tbxCreatePasswordLabel" AssociatedControlID="tbxCreatePassword"></asp:Label>
                <asp:TextBox runat="server" TextMode="Password" ID="tbxCreatePassword" CssClass="form-control" onblur="Jcf.ExternalUsers.events.onPasswordBlur(this);"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Button role="button" CssClass="btn btn-default" runat="server" ID="btnCreateAccount" OnClick="btnCreateAccount_OnClick"></asp:Button>
                <asp:LinkButton runat="server" ID="lnkCloseAccount" OnClientClick="Jcf.events.onCloseAccountClicked();return false;" />
            </div>
        </asp:Panel>
        <div class="jcf-instructions-panel">
            <%= ParentPortlet.Settings.GetStringValue("LoginInfo") %>
        </div>
    </div>
</div>