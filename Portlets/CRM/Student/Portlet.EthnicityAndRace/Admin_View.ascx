<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Admin_View.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.EthnicityAndRacePortlet.Admin_View" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<cmn:Subheader ID="shdr" TextKey="TXT_ETH_RACE_EDIT_INTRO_TEXT" runat="server" />
<div class="pSection">
    <fieldset>
        <table>
            <tr>
                <td>
                    <%=Globalizer.GetGlobalizedString("LBL_ETH_RACE_INTRO_TEXT")%>
                </td>
                <td>                
                    <div>
                        <em><%=Globalizer.GetGlobalizedString("MSG_ETH_RACE_INTRO_TEXT")%></em>
                        <br />
                        <br />
                    </div>
                    <div>
                        <asp:TextBox ID="txtIntroText" runat="server" Columns="60" Rows="4" TextMode="MultiLine" />
                        <br /><asp:RequiredFieldValidator ID="rfVal" ControlToValidate="txtIntroText" runat="server" Display="Dynamic" />
                        <br />
                        <br />
                    </div>
                    <div>
                        <cmn:GlobalizedButton ID="btnSave" runat="server" TextKey="TXT_SAVE" />
                        &nbsp;
                        &nbsp;
                        <cmn:GlobalizedButton ID="btnCancel" runat="server" CausesValidation="false" TextKey="TXT_CANCEL" />
                     </div>

                </td>
            </tr>
        </table>
    </fieldset>
</div>