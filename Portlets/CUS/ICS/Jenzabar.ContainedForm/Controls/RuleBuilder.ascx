<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RuleBuilder.ascx.cs" Inherits="Jenzabar.ContainedForm.Controls.RuleBuilder" %>
<%@ Register src="EmailTemplateBuilder.ascx" tagname="EmailTemplateBuilder" tagprefix="uc1" %>

<script type="text/javascript">
    function HideEmailTemplate() {
        Jcf.ui.clearEmailTemplate();
        jQuery('.propertyControls').show();
    }
    function HideWorkflowTemplate() {
        jQuery('#RuleBuilder').show();
        jQuery('#WorkflowBuilder').hide();
    }
    function UpdateOrderNums() {
        var count = 0;
        jQuery('.EventDef').each(function (ui, e) {
            jQuery('[id*="tbx_order"]', this).val(count);
            count++;
        });
    }
</script>
<asp:HiddenField ID="_hdnShowEmail" runat="server" />
<div id="RuleBuilder">
    Use an asterisk (*) to reference any value, and [empty] to indicate that the user did not enter anything into the field.
    <asp:Panel runat="server" ID="pnlRules">

    </asp:Panel>
    <a href="#" style="cursor:pointer;" onclick="Jcf.ui.addEventDef();return false;">Add Step</a>
</div>
<div id="EmailTemplateBuilder" style="display:none;">
    <uc1:EmailTemplateBuilder ID="EmailTemplateBuilder1" runat="server" />
</div>
