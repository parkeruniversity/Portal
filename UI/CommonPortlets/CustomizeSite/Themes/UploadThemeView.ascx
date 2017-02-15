<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UploadThemeView.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.CustomizeSite.Themes.UploadThemeView" %>
<%@ Import Namespace="Jenzabar.Common.Globalization"%>
<%@ Register TagPrefix="jics" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<div class="themeAdmin" >
    <h4><%= Globalizer.GetString("TXT_UPLOAD_THEME") %></h4>
    <div class="pSection">
        <p><%= Globalizer.GetString("MSG_UPLOAD_THEME") %></p>
        <div>
            <asp:FileUpload ID="fuZip" runat="server" />
        </div>
        <ul class="links">
            <li><jics:GlobalizedButton ID="btnUpload" runat="server" TextKey="TXT_UPLOAD" /></li>
            <li><jics:GlobalizedButton ID="btnCancel" runat="server" TextKey="TXT_CANCEL" /></li>
        </ul>
    </div>
</div>    