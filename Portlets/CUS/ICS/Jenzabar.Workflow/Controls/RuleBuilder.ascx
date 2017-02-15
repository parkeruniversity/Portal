<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RuleBuilder.ascx.cs" Inherits="Jenzabar.Workflow.Controls.RuleBuilder" %>
<script>
    var rules = [];
    jQuery(document).ready(function () {

        var rls = JSON.parse(jQuery('[id*=hdnRules]').val());
        for(var x in rls)
        {
            addRuleToGrid(rls[x]);
        }

        jQuery('#tblRules tbody').sortable({ handle: '.ruleDragHandle' });
        jQuery('.ruleBuilder [id*=drpAction]').change(actionChanged);
        actionChanged();
    });
    function actionChanged() {
        var action = jQuery('.ruleBuilder [id*=drpAction]').val();
        clearAction();
        switch(action) {
            case 'AddComment':
                $('.jwf-rule-comment-box').show();
                break;
            default:
                break;
        }
    }
    function clearAction() {
        $('.jwf-rule-comment-box').hide();
    }
    function addRule()
    {
        var rule = {};
        rule.Event = jQuery('.ruleBuilder [id*=drpEvent]').val();
        rule.Conjunction = jQuery('.ruleBuilder [id*=drpConjunction]').val();
        rule.DataPoint = jQuery('.ruleBuilder [id*=drpDP]').val();
        rule.DataPointText = jQuery('.ruleBuilder [id*=drpDP] option:selected').text();
        rule.Operator = jQuery('.ruleBuilder [id*=drpOperator]').val();
        rule.Value = jQuery('.ruleBuilder [id*=tbxValue]').val();
        rule.Action = jQuery('.ruleBuilder [id*=drpAction]').val();
        rule.Text = jQuery('.ruleBuilder [id*=tbxText]').val();
        addRuleToGrid(rule);

        jQuery('.ruleBuilder [id*=drpEvent]').val('');
        jQuery('.ruleBuilder [id*=drpConjunction]').val('');
        jQuery('.ruleBuilder [id*=drpDP]').val('');
        jQuery('.ruleBuilder [id*=drpOperator]').val('');
        jQuery('.ruleBuilder [id*=tbxValue]').val('');
        jQuery('.ruleBuilder [id*=drpAction]').val('');
        jQuery('.ruleBuilder [id*=tbxText]').val('');
        clearAction();
    }
    function addRuleToGrid(rule)
    {
        var tr = '<tr>' +
                    '<td>' +
                        '<img class="link" src="<%= ResolveUrl("~/UI/Common/Images/PortletImages/Icons/delete-new.png") %>" onclick="jQuery(this).parent().parent().remove();"/>' +
                    '</td>' +
                    '<td>' +
                        '<div style="height:20px;"><div class="ruleCommandDiv">'+
                            '<div class="ruleDragHandle">&nbsp;</div>'+
                        '</div></div>' +
                    '</td>' + 
                    '<td id="event">' + rule.Event + '</td>' +
                    '<td id="conjunction">' + rule.Conjunction + '</td>' +
                    '<td id="datapoint">' + rule.DataPointText + '<input type="hidden" id="hdnDP" value="' + rule.DataPoint + '"/></td>' +
                    '<td id="operator">' + rule.Operator + '</td>' +
                    '<td id="value">' + rule.Value + '</td>' +
                    '<td id="action">' + rule.Action + '</td>' +
                    '<td id="text">' + rule.Text + '</td>' + 
                 '</tr>';
        jQuery('#tblRules').append(tr);
    }
    function prepRules()
    {
        jQuery('#tblRules tr').each(function () {
            var rule = {};
            rule.Event = jQuery('#event', this).html();
            rule.Conjunction = jQuery('#conjunction', this).html();
            rule.DataPoint = jQuery('#hdnDP', this).val();
            rule.Operator = jQuery('#operator', this).html();
            rule.Value = jQuery('#value', this).html();
            rule.Action = jQuery('#action', this).html();
            rule.Text = jQuery('#text', this).html();
            rules[rules.length] = rule;
        });
        jQuery('[id*=hdnRules]').val(JSON.stringify(rules));
    }
</script>
<style>
    #tblRules tr td:first-child{
        width:15px;
    }
    #tblRules tr td:nth-child(2) {
        width:15px;
    }
    #tblRules tr td:nth-child(3)
    {
        width:160px;
    }
    .link
    {
        cursor:pointer;
    }
    .jwf-rule-comment-box {
        display: none;
    }
</style>
<asp:HiddenField runat="server" ID="hdnRules" />
<table class="ruleBuilder">
    <tr>
        <td colspan="4">
            <asp:DropDownList runat="server" ID="drpEvent"></asp:DropDownList>
            <asp:DropDownList runat="server" ID="drpConjunction"></asp:DropDownList>
            <asp:DropDownList runat="server" ID="drpDP"></asp:DropDownList>
            <asp:DropDownList runat="server" ID="drpOperator"></asp:DropDownList>
            <asp:TextBox runat="server" ID="tbxValue"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td colspan="3">
            
            <asp:DropDownList runat="server" ID="drpAction"></asp:DropDownList>
            <span class="jwf-rule-comment-box">
                <asp:TextBox runat="server" ID="tbxText"></asp:TextBox>
            </span>
        </td>
        <td>
            <asp:Button runat="server" ID="btnAdd" Text="Add" OnClientClick="addRule();return false;" />
        </td>
    </tr>
</table>
<table id="tblRules" style="width:100%;">

</table>