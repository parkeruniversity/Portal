<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ThemeHead.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.Controls.ThemeHead" EnableViewState="false" %>
<asp:Literal ID="litTheme" runat="server" />
<asp:Literal ID="litPreviewJS" runat="server" Visible="false" >
    <script type="text/javascript">
        $(document).ready(function() {
            $('body').prepend("<div class='invisibleLayer'></div>");
        });
    </script>
</asp:Literal>
