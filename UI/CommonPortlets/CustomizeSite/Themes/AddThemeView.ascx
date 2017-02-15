<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddThemeView.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.CustomizeSite.Themes.AddThemeView" %>
<%@ Register TagPrefix="jics" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Import Namespace="Jenzabar.Common.Globalization"%>
<div class="themeAdmin" >
    <h4><%= Globalizer.GetString("TXT_ADD_NEW_THEME") %></h4>
    <div class="pSection">
        <p><%= Globalizer.GetString("MSG_ADD_NEW_THEME_FORM") %></p>
        <fieldset>
            <table cellpadding="5">     
                <tbody>     
                    <tr>
                        <th><%= Globalizer.GetString("LBL_NAME") %></th>
                        <td>
                            <asp:TextBox ID="txtName" runat="server" Columns="80" MaxLength="100" />
                            <span class="ValidationMessage"><%= Globalizer.GetString("TXT_FB_REQUIRED")%></span>
                            <p class="ValidationMessage"><%= Globalizer.GetString("MSG_THM_VAL_NAME") %></p>
                        </td>
                    </tr>
                    <tr>
                        <th><%= Globalizer.GetString("LBL_DISPLAY_NAME") %></th>
                        <td>
                            <asp:TextBox ID="txtDisplayName" runat="server" Columns="80" MaxLength="100" />
                            <span class="ValidationMessage"><%= Globalizer.GetString("TXT_FB_REQUIRED")%></span>
                            <p class="ValidationMessage"><%= Globalizer.GetString("MSG_THM_VAL_DISPLAY_NAME")%></p>
                        </td>
                    </tr>
                    <tr>
                        <th><%= Globalizer.GetString("LBL_AUTHOR") %></th>
                        <td>
                            <asp:TextBox ID="txtAuthor" runat="server" Columns="80" MaxLength="100" />
                        </td>
                    </tr>
                    <tr>
                        <th><%= Globalizer.GetString("LBL_DESCRIPTION") %></th>
                        <td>
                            <asp:TextBox ID="txtDesc" Columns="80" TextMode="MultiLine" Rows="8" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <th></th>
                        <td>
                            <ul class="links">
                                <li><jics:GlobalizedButton ID="btnAdd" runat="server" TextKey="TXT_ADD" /></li>
                                <li><jics:GlobalizedButton ID="btnCancel" runat="server" TextKey="TXT_CANCEL" /></li>
                            </ul>
                        </td>
                    </tr>
                </tbody>
            </table>
        </fieldset>
    </div>
</div>