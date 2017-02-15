function ruleManagerAddTrigger(triggerId, conditionsArr, rebind) {
    var condition = jQuery('#jcf-template-condition').clone();
    condition.prepend('<h5 data-trigger="' + triggerId + '">' + jQuery('[id*=ruleTrigger] option[value="' + triggerId + '"]').text() + '</h5>');
    condition.append("<a onclick='ruleManagerAddCondition(this);'>Add Action</a>");
    condition.append("<table class='jcf-rules-added'><tr></tr></table>");
    condition.show();
    jQuery('.jcf-rule-manager-rules').append(condition);
    for (var i in conditionsArr) {
        ruleManagerAddConditionWithRule(conditionsArr[i], condition, rebind);
    }
}
function ruleManagerActionChanged(itm) {
    var parent = jQuery(itm).closest('.jcf-rule-conditions');

    jQuery('#jcf-pay-profiles', parent).hide();
    jQuery('#jcf-groups', parent).hide();
    jQuery('#jcf-tracks', parent).hide();
    jQuery('#jcf-emails', parent).hide();
    jQuery('#jcf-tabs', parent).hide();

    switch (jQuery('[id*=ruleAction]', parent).val()) {
        case "0":
        case "1":
            jQuery('#jcf-pay-profiles', parent).show();
            break;
        case "2":
        case "3":
        case "4":
        case "5":
        case "11":
            jQuery('#jcf-groups', parent).show();
            break;
        case "6":
            jQuery('#jcf-tracks', parent).show();
            break;
        case "7":
            jQuery('#jcf-emails', parent).show();
            break;
        case "13":
            jQuery('#jcf-tabs', parent).show();
            break;
        default:
            break;
    }
}
function ruleManagerAddConditionWithRule(rule, parent, rebind) {
    switch (rule.action) {
        case "0":
        case "1":
            if(!rebind)
                rule.actionParam = jQuery('[id*=rulePayProfiles]', parent).val();
            rule.actionText = jQuery('[id*=rulePayProfiles] option[value="' + rule.actionParam + '"]', parent).text();
            break;
        case "2":
        case "3":
        case "4":
        case "5":
        case "11":
            if (!rebind)
                rule.actionParam = jQuery('[id*=ruleGroups]', parent).val();
            rule.actionText = jQuery('[id*=ruleGroups] option[value="' + rule.actionParam + '"]', parent).text();
            break;
        case "6":
            if (!rebind)
                rule.actionParam = jQuery('[id*=ruleTracks]', parent).val();
            rule.actionText = jQuery('[id*=ruleTracks] option[value="' + rule.actionParam + '"]', parent).text();
            break;
        case "7":
            if (!rebind)
                rule.actionParam = jQuery('[id*=ruleEmails]', parent).val();
            rule.actionText = jQuery('[id*=ruleEmails] option[value="' + rule.actionParam + '"]', parent).text();
            break;
        case "13":
            if (!rebind)
                rule.actionParam = jQuery('[id*=ruleTabs]', parent).val();
            rule.actionText = jQuery('[id*=ruleTabs] option[value="' + rule.actionParam + '"]', parent).text();
            break;
        default:
            break;
    }
    jQuery('.jcf-rules-added', parent).append(
            '<tr>' +
                '<td data-value="' + rule.iff + '">' + jQuery('[id*=ruleIf] option[value="' + rule.iff + '"]', parent).text() + '</td>' +
                '<td data-value="' + rule.question + '">' + jQuery('[id*=ruleQuestion] option[value="' + rule.question + '"]', parent).text() + '</td>' +
                '<td data-value="' + rule.comparison + '">' + jQuery('[id*=ruleComparison] option[value="' + rule.comparison + '"]', parent).text() + '</td>' +
                '<td data-value="' + rule.value + '">' + rule.value + '</td>' +
                '<td data-value="' + rule.action + '">' + jQuery('[id*=ruleAction] option[value="' + rule.action + '"]', parent).text() + '</td>' +
                '<td data-value="' + rule.actionParam + '">' + (rule.actionText != null ? rule.actionText : '') + '</td>' +
                '<td><a class="jcf-delete-rule" onclick="ruleManagerRemoveRule(this);">x</a></td>' +
            '</tr>'
        );
}
function ruleManagerRemoveRule(itm) {
    jQuery(itm).closest('tr').remove();
}
function ruleManagerAddCondition(itm) {
    var parent = jQuery(itm).closest('.jcf-rule-conditions');
    var rule = {};
    rule.iff = jQuery('[id*=ruleIf]',parent).val();
    rule.question = jQuery('[id*=ruleQuestion]', parent).val();
    rule.comparison = jQuery('[id*=ruleComparison]', parent).val();
    rule.value = jQuery('[id*=ruleValue]', parent).val();
    rule.action = jQuery('[id*=ruleAction]', parent).val();

    ruleManagerAddConditionWithRule(rule, parent);
}
jQuery(document).ready(function () {
    var r = JSON.parse(jQuery('.jcf-rule-manager [id*=hdnRules]').val());
    var trigger = null;
    var rules = [];
    for (var i in r) {
        var rule = r[i];
        if (trigger != rule.trigger) {
            if (trigger != null) {
                ruleManagerAddTrigger(trigger, rules, true);
            }
            trigger = rule.trigger;
            rules = [];
        }
        rules[rules.length] = rule;
    }
    ruleManagerAddTrigger(trigger, rules, true);
});