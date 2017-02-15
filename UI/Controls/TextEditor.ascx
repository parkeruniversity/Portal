<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TextEditor.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.Controls.TextEditor" %>
<script type="text/javascript">
    jQuery(document).ready(function ($) {
        textEditor.create($('#<%=Editor.ClientID%>')<%= GetOptions() %>);
    });
</script>
<div>
	<textarea id="Editor" runat="server" class="tinymce"></textarea>
</div>