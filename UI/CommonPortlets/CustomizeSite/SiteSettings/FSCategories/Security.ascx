<%@ Control Language="c#" AutoEventWireup="false" CodeBehind="Security.ascx.cs" EnableViewState="false"
    Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.CustomizeSite.SiteSettings.FSCategories.Security"
    TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Import Namespace="Jenzabar.Common.Globalization" %>
<%@ Register TagPrefix="jics" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>

<script language="javascript" type="text/javascript">
    function checkPassLengths(sender, args) {
        min = document.getElementById("<%=ddlMinPass.ClientID %>").value * 1;
        max = document.getElementById("<%=ddlMaxPass.ClientID %>").value * 1;
        if (min > max) {
            args.IsValid = false;
        }
        else {
            args.IsValid = true;
        }
    }

    function showActiveAuthSettings() {
        var val = "none";
        if (document.getElementById("<%=cbAuthType.ClientID %>").checked) {
            val = getCheckedExtAuthValue();
            document.getElementById("<%=rblExtAuthType.ClientID %>_0").disabled = false;
            document.getElementById("<%=rblExtAuthType.ClientID %>_1").disabled = false;
        }
        else {
            document.getElementById("<%=rblExtAuthType.ClientID %>_0").checked = false;
            document.getElementById("<%=rblExtAuthType.ClientID %>_1").checked = false;
            document.getElementById("<%=rblExtAuthType.ClientID %>_0").disabled = true;
            document.getElementById("<%=rblExtAuthType.ClientID %>_1").disabled = true;
        }
        toggleVisibility(val, document.getElementById("<%=divSaml.ClientID %>"), "saml");
        toggleVisibility(val, document.getElementById("<%=divOther.ClientID %>"), "other");
        var sf = (val == "saml" ? "none" : "notsaml");
        toggleVisibility(sf, document.getElementById("<%=divNotSaml.ClientID %>"), "notsaml");
        if (val != "saml" && document.getElementById("<%=ddlSamlFirst.ClientID %>").value == "true") {
            toggleVisibility(sf, document.getElementById("<%=divSaml.ClientID %>"), "notsaml");
        }
        toggleVisibility(document.getElementById("<%=ddlUseCustomControl.ClientID %>").value, 
            document.getElementById("<%=divCustom.ClientID %>"), "true");
    }

    function getCheckedExtAuthValue() {
        var rbl_saml = document.getElementById("<%=rblExtAuthType.ClientID %>_0");
        var rbl_other = document.getElementById("<%=rblExtAuthType.ClientID %>_1");

        if (rbl_saml.checked) { return "saml"; }
        if (rbl_other.checked) { return "other"; }
        return "none";
    }

    function showActiveSamlAuthSettings() {
        var val = document.getElementById("<%=ddlAllowSamlAuth.ClientID %>").value;
        toggleVisibility(val, document.getElementById("<%=divSamlAuth.ClientID %>"), "true")
    }

    function toggleVisibility(val, el, eltype) {
        if (val == eltype) {
            el.style.display = 'block';
        }
        else {
            el.style.display = 'none';
        }
    }

    $(document).ready(function() {
        showActiveAuthSettings();
        $("#accordion").accordion({
            active: <%= ActivePanel %>,
            collapsible: true,
            heightStyle: "content"
        });
    });

</script>

<tr>
    <td>
        <div id="divError" runat="server" class="ApplicationError" />
        <div>
            <%= Globalizer.GetGlobalizedString("MSG_FS_SECURITY") %>
        </div>
        <br />
        <div id="accordion">
            <h3><%= Globalizer.GetGlobalizedString("TXT_FS_MANAGE_AUTH")%></h3>
            <div>
                <h5>
                    <%= Globalizer.GetGlobalizedString("TXT_FS_EXTERNAL_AUTHENTICATION_TYPE")%></h5>
                <div class="pSection">
                    <%= Globalizer.GetGlobalizedString("MSG_FS_EXTERNAL_AUTHENTICATION_TYPE")%>
                </div>
                <div class="option">
                    <asp:CheckBox ID="cbAuthType" runat="server" onclick="javascript:showActiveAuthSettings();" />
                    Authenticate using an external system 
                </div>
                <div id="divExternalOptions" runat="server" class="subOption">
                    <asp:RadioButtonList ID="rblExtAuthType" runat="server">
                        <asp:ListItem Value="saml" Text="SAML identity provider" />
                        <asp:ListItem Value="other" Text="Other source as defined in web.config (Active Directory, LDAP, etc.)" />
                    </asp:RadioButtonList>
                </div>

                    <h5>
                        <%= Globalizer.GetGlobalizedString("TXT_FS_ATTEMPT_SAML_FIRST")%></h5>
                    <div class="pSection">
                        <%= Globalizer.GetGlobalizedString("MSG_FS_ATTEMPT_SAML_FIRST")%>
                    </div>
                    <div class="pSection">
                        <asp:DropDownList ID="ddlSamlFirst" runat="server" onchange="javascript:showActiveAuthSettings();">
                            <asp:ListItem Value="true" Text="True" />
                            <asp:ListItem Value="false" Text="False" Selected="True" />
                        </asp:DropDownList>
                    </div>
                <div id="divNotSaml" runat="server">
                    <h5>
                        <%= Globalizer.GetGlobalizedString("TXT_FS_USE_EMAIL_FOR_LOGIN")%></h5>
                    <div class="pSection">
                        <%= Globalizer.GetGlobalizedString("MSG_FS_USE_EMAIL_FOR_LOGIN")%>
                    </div>
                    <div class="pSection">
                        <asp:DropDownList ID="ddlUseEmailForLogin" runat="server">
                            <asp:ListItem Value="true" Text="True" />
                            <asp:ListItem Value="false" Text="False" Selected="False" />
                        </asp:DropDownList>
                    </div>
                </div>
                <div id="divSaml" runat="server">
                    <h5>
                        <%= Globalizer.GetGlobalizedString("TXT_FS_SAML_SSO_PROVIDER_NAME")%></h5>
                    <div class="pSection">
                        <%= Globalizer.GetGlobalizedString("MSG_FS_SAML_SSO_PROVIDER_NAME")%>
                    </div>
                    <div class="pSection">
                        <asp:TextBox ID="txtSamlProviderName" runat="server" Width="100" />
                        <span id="spSamlProviderNameReq" class="ValidationMessage" runat="server">
                            <%= Globalizer.GetGlobalizedString("TXT_FB_REQUIRED")%></span>
                    </div>
                    <h5>
                        <%= Globalizer.GetGlobalizedString("TXT_FS_SAML_SSO_AUDIENCE")%></h5>
                    <div class="pSection">
                        <%= Globalizer.GetGlobalizedString("MSG_FS_SAML_SSO_AUDIENCE")%>
                    </div>
                    <div class="pSection">
                        <asp:DropDownList ID="ddlSamlAudience" runat="server">
                            <asp:ListItem Value="providerName" Text="Provider name" />
                            <asp:ListItem Value="recipientUrl" Text="Recipient URL" Selected="True" />
                        </asp:DropDownList>
                    </div>
                    <h5>
                        <%= Globalizer.GetGlobalizedString("TXT_FS_SAML_SSO_LOGIN_URL")%></h5>
                    <div class="pSection">
                        <%= Globalizer.GetGlobalizedString("MSG_FS_SAML_SSO_LOGIN_URL")%>
                    </div>
                    <div class="pSection">
                        <asp:TextBox ID="txtSamlLoginUrl" runat="server" Width="500" />
                        <span id="spSamlLoginUrlReq" class="ValidationMessage" runat="server">
                            <%= Globalizer.GetGlobalizedString("TXT_FB_REQUIRED")%></span>
                    </div>
                    <h5>
                        <%= Globalizer.GetGlobalizedString("TXT_FS_SAML_SSO_LOGOUT_URL")%></h5>
                    <div class="pSection">
                        <%= Globalizer.GetGlobalizedString("MSG_FS_SAML_SSO_LOGOUT_URL")%>
                    </div>
                    <div class="pSection">
                        <asp:TextBox ID="txtSamlLogoutUrl" runat="server" Width="500" />
                    </div>
                    <h5>
                        <%= Globalizer.GetGlobalizedString("TXT_FS_SAML_SSO_CERT_FILE_LOC")%></h5>
                    <div class="pSection">
                        <%= Globalizer.GetGlobalizedString("MSG_FS_SAML_SSO_CERT_FILE_LOC")%>
                    </div>
                    <div class="pSection">
                        <asp:TextBox ID="txtSamlCertFile" runat="server" Width="500" />
                        <span id="spSamlCertFileReq" class="ValidationMessage" runat="server">
                            <%= Globalizer.GetGlobalizedString("TXT_FB_REQUIRED")%></span>
                    </div>
                    <h5>
                        <%= Globalizer.GetGlobalizedString("TXT_FS_SAML_SSO_PROT_BINDING")%></h5>
                    <div class="pSection">
                        <%= Globalizer.GetGlobalizedString("MSG_FS_SAML_SSO_PROT_BINDING")%>
                    </div>
                    <div class="pSection">
                        <asp:TextBox ID="txtSamlProtBinding" runat="server" Width="500" />
                        <span id="spSamlProtBindingReq" class="ValidationMessage" runat="server">
                            <%= Globalizer.GetGlobalizedString("TXT_FB_REQUIRED")%></span>
                    </div>
                    <h5>
                        <%= Globalizer.GetGlobalizedString("TXT_FS_SAML_SSO_NAMEID_FORMAT")%></h5>
                    <div class="pSection">
                        <%= Globalizer.GetGlobalizedString("MSG_FS_SAML_SSO_NAMEID_FORMAT")%>
                    </div>
                    <div class="pSection">
                        <asp:TextBox ID="txtSamlNameIdFormat" runat="server" Width="500" />
                        <span id="spSamlNameIdFormatReq" class="ValidationMessage" runat="server">
                            <%= Globalizer.GetGlobalizedString("TXT_FB_REQUIRED")%></span>
                    </div>
                    <h5>
                        <%= Globalizer.GetGlobalizedString("TXT_FS_SAML_SSO_USE_TAG_PREFIXES")%></h5>
                    <div class="pSection">
                        <%= Globalizer.GetGlobalizedString("MSG_FS_SAML_SSO_USE_TAG_PREFIXES")%>
                    </div>
                    <div class="pSection">
                        <asp:DropDownList ID="ddlSamlUseTagPrefixes" runat="server">
                            <asp:ListItem Value="true" Text="True" />
                            <asp:ListItem Value="false" Text="False" Selected="True" />
                        </asp:DropDownList>
                    </div>
                    <h5>
                        <%= Globalizer.GetGlobalizedString("TXT_FS_SAML_SSO_IFRAME_OR_REDIRECT")%></h5>
                    <div class="pSection">
                        <%= Globalizer.GetGlobalizedString("MSG_FS_SAML_SSO_IFRAME_OR_REDIRECT")%>
                    </div>
                    <div class="pSection">
                        <asp:DropDownList ID="ddlSamlLoginUsingIframeOrRedirect" runat="server">
                            <asp:ListItem Value="iframe" Text="IFrame" Selected="True"/>
                            <asp:ListItem Value="redirect" Text="Redirect" />
                        </asp:DropDownList>
                    </div>
                </div>
                <div id="divOther" runat="server">
                    <h5>
                        <%= Globalizer.GetGlobalizedString("TXT_FS_LOGIN_CONTEXT")%></h5>
                    <div class="pSection">
                        <%= Globalizer.GetGlobalizedString("MSG_FS_LOGIN_CONTEXT")%>
                    </div>
                    <div class="pSection">
                        <asp:TextBox ID="txtLoginContext" runat="server" Width="500" />
                        <span id="spLoginContextReq" class="ValidationMessage" runat="server">
                            <%= Globalizer.GetGlobalizedString("TXT_FB_REQUIRED")%></span>
                    </div>
                </div>
                <div>
                    <h5>
                        <%= Globalizer.GetGlobalizedString("TXT_FS_USE_CUSTOM_LOGIN_CONTROL")%></h5>
                    <div class="pSection">
                        <%= Globalizer.GetGlobalizedString("MSG_FS_USE_CUSTOM_LOGIN_CONTROL")%>
                    </div>
                    <div class="pSection">
                        <asp:DropDownList ID="ddlUseCustomControl" runat="server" onchange="javascript:showActiveAuthSettings();">
                            <asp:ListItem Value="true" Text="True" />
                            <asp:ListItem Value="false" Text="False" Selected="True" />
                        </asp:DropDownList>
                    </div>
                </div>
                <div id="divCustom" runat="server">
                    <h5>
                        <%= Globalizer.GetGlobalizedString("TXT_FS_CUSTOM_LOGIN_CONTROL")%></h5>
                    <div class="pSection">
                        <%= Globalizer.GetGlobalizedString("MSG_FS_CUSTOM_LOGIN_CONTROL")%>
                    </div>
                    <div class="pSection">
                        <asp:TextBox ID="txtCustomControl" runat="server" Width="500" />
                        <span id="spCustomControlReq" class="ValidationMessage" runat="server">
                            <%= Globalizer.GetGlobalizedString("TXT_FB_REQUIRED")%></span>
                    </div>
                </div>
            </div>
            <h3><%= Globalizer.GetGlobalizedString("TXT_FS_MANAGE_PASSWORDS")%></h3>
            <div>
                <h5>
                    <%= Globalizer.GetGlobalizedString("TXT_FS_ALLOW_PASSWORD_CHANGES")%></h5>
                <div class="pSection">
                    <%= Globalizer.GetGlobalizedString("MSG_FS_ALLOW_PASSWORD_CHANGES")%>
                </div>
                <div class="pSection">
                    <asp:DropDownList ID="ddlAllowPassChanges" runat="server">
                        <asp:ListItem Value="true" Text="True" Selected="True" />
                        <asp:ListItem Value="false" Text="False" />
                    </asp:DropDownList>
                </div>
                <h5>
                    <%= Globalizer.GetGlobalizedString("TXT_FS_MIN_PASSWORD_LENGTH")%></h5>
                <div class="pSection">
                    <%= Globalizer.GetGlobalizedString("MSG_FS_MIN_PASSWORD_LENGTH")%>
                </div>
                <div class="pSection">
                    <asp:DropDownList ID="ddlMinPass" runat="server">
                    </asp:DropDownList>
                    <asp:CustomValidator ID="cvPassLengths" runat="server" Display="Dynamic" ClientValidationFunction="checkPassLengths" />
                </div>
                <h5>
                    <%= Globalizer.GetGlobalizedString("TXT_FS_MAX_PASSWORD_LENGTH")%></h5>
                <div class="pSection">
                    <%= Globalizer.GetGlobalizedString("MSG_FS_MAX_PASSWORD_LENGTH")%>
                </div>
                <div class="pSection">
                    <asp:DropDownList ID="ddlMaxPass" runat="server">
                    </asp:DropDownList>
                </div>
                <h5>
                    <%= Globalizer.GetGlobalizedString("TXT_FS_PASSWORD_VALIDATION_EXPRESSION")%></h5>
                <div class="pSection">
                    <%= Globalizer.GetGlobalizedString("MSG_FS_PASSWORD_VALIDATION_EXPRESSION")%>
                </div>
                <div class="pSection">
                    <asp:TextBox ID="txtPassValidExpr" runat="server" Width="500" />
                </div>
            </div>
            <h3><%= Globalizer.GetGlobalizedString("TXT_FS_MAKE_JICS_SAML_IP")%></h3>
            <div>
                <h5>
                    <%= Globalizer.GetGlobalizedString("TXT_FS_ALLOW_SAML_AUTH")%></h5>
                <div class="pSection">
                    <%= Globalizer.Format("MSG_FS_ALLOW_SAML_AUTH", Request.Url.Scheme + "://" + Request.Url.Authority + ResolveUrl("~"))%>
                </div>
                <div class="pSection">
                    <asp:DropDownList ID="ddlAllowSamlAuth" runat="server" onchange="javascript:showActiveSamlAuthSettings();">
                        <asp:ListItem Value="true" Text="True" />
                        <asp:ListItem Value="false" Text="False" Selected="True" />
                    </asp:DropDownList>
                </div>
                <div id="divSamlAuth" runat="server">
                    <h5>
                        <%= Globalizer.GetGlobalizedString("TXT_FS_SAML_SSO_PFX_FILE_LOC")%></h5>
                    <div class="pSection">
                        <%= Globalizer.GetGlobalizedString("MSG_FS_SAML_SSO_PFX_FILE_LOC")%>
                    </div>
                    <div class="pSection">
                        <asp:TextBox ID="txtSamlPfxFile" runat="server" Width="500" />
                        <span id="spSamlPfxFileReq" class="ValidationMessage" runat="server">
                            <%= Globalizer.GetGlobalizedString("TXT_FB_REQUIRED")%></span>
                    </div>
                </div>
                <div id="divMetadata" runat="server" Visible="False">
                    <h5><%= Globalizer.GetGlobalizedString("TXT_FS_SAML_SSO_METADATA")%></h5>
                    <div class="pSection">
                        <%= Globalizer.GetGlobalizedString("MSG_FS_SAML_SSO_METADATA")%>             
                    </div>
                    <div class="pSection">
                        <ul>
                            <li>
                                <a id="lnkBase64" runat="server" target="_blank"><%= Globalizer.GetGlobalizedString("TXT_FS_BASE64_RESPONSE")%></a>
                            </li>
                            <li>
                                <a id="lnkPlainText" runat="server" target="_blank"><%= Globalizer.GetGlobalizedString("TXT_FS_PLAIN_TEXT_RESPONSE")%></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <h3><%= Globalizer.GetGlobalizedString("TXT_DIRECT_PORTLET_LINKING")%></h3>
            <div>
                <h5>
                    <%= Globalizer.GetGlobalizedString("TXT_FS_ALLOW_DIRECT_PORTLET_LINKING")%></h5>
                <div class="pSection">
                    <%= Globalizer.GetGlobalizedString("MSG_FS_ALLOW_DIRECT_PORTLET_LINKING")%>
                </div>
                <div class="pSection">
                    <asp:DropDownList ID="ddlDirectLinking" runat="server">
                        <asp:ListItem Value="true" Text="True" />
                        <asp:ListItem Value="false" Text="False" Selected="True" />
                    </asp:DropDownList>
                </div>
            </div>
        </div>
    </td>
</tr>
