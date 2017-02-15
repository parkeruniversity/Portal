<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RuleManager.ascx.cs" Inherits="Jenzabar.ContainedForm.Controls.Rules.RuleManager" %>
<%@ Register Src="TemplateRule.ascx" TagPrefix="uc1" TagName="TemplateRule" %>
<script type="text/javascript" src='<%= ResolveUrl("~/Portlets/CUS/ICS/Jenzabar.ContainedForm/Scripts/ruleManagerScripts.js") %>'></script>
<div class="jcf-rule-manager">
    <asp:HiddenField runat="server" ID="hdnRules" />
    <uc1:TemplateRule runat="server" id="TemplateRule" />
    <div class="jcf-rule-manager-rules">

    </div>
</div>