<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ThanksView.ascx.cs" Inherits="Jenzabar.ContainedForm.Views.ThanksView" %>
<div class="pSection">
<script>
    jQuery(document).ready(function () {
        if (jQuery('[id*="_hdnRedirectURL"]').val()) {
            setTimeout(function () { window.location = jQuery('[id*="_hdnRedirectURL"]').val() }, 7000);
        }
    });
</script>

<asp:HiddenField ID="_hdnRedirectURL" runat="server" />
<asp:Label ID="_lblThanksMessage" runat="server"></asp:Label>
    <center>
        <asp:LinkButton runat="server" ID="btnReturnToForm" OnClick="btnReturnToForm_Click" Text="< Return to form" Visible="false" />
    </center>
</div>