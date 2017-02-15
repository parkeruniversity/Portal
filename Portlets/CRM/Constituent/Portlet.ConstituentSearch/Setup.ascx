<%@ Control Language="c#" AutoEventWireup="True" CodeBehind="Setup.ascx.cs" Inherits="Jenzabar.CRM.Constituent.Web.Portlets.ConstituentSearchPortlet.Setup" %>
<%@ Register TagPrefix="cmn" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common"%>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<div id="divError" runat="server"><cmn:errordisplay id="ctlError" RunAt="server"></cmn:errordisplay></div>
<h4>Constituent Search Settings</h4>
<div class="pSection">
	<jenzabar:hint id="lblPortalSettingsHint" Visible="True" runat="server" TextKey="TXT_PORTAL_SETTINGS_HINT"></jenzabar:hint>
    <table>
         <tr>
            <td>
                <span class="BoldText">Display Settings</span>
            </td>
        </tr>
        <tr>
            <td>
                <hr />
            </td>
        </tr>
        <tr>
            <td>
                <table class="IndentMargin">
                    <tr>
                        <td>
                            <table class="IndentMargin">
                                <tr>
                                    <td>
                                        <asp:CheckBox ID="chkCompanySearch" runat="server" />
                                    </td>
                                    <td>
                                        <asp:Label ID="lblCompanySearch" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
	<br/>
	<cmn:GlobalizedButton ID="btnSave" Runat="server" TextKey="TXT_SAVE"></cmn:GlobalizedButton>
	&nbsp;&nbsp;
	<cmn:GlobalizedButton ID="btnCancel" Runat="server" TextKey="TXT_CANCEL"></cmn:GlobalizedButton></div>
