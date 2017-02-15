<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TemplateRule.ascx.cs" Inherits="Jenzabar.ContainedForm.Controls.Rules.TemplateRule" %>
<div class="jcf-rule">
    <span class="jcf-rule-trigger">
        On <asp:DropDownList runat="server" ID="ruleTrigger"></asp:DropDownList> action: <a onclick="ruleManagerAddTrigger(jQuery('[id*=ruleTrigger]').val(),[]);">Add</a>
    </span>
    <div class="jcf-rule-conditions" id="jcf-template-condition" style="display:none;">
        <span class="jcf-rule-column">
            <asp:DropDownList runat="server" ID="ruleIf">
                <asp:ListItem Value="0" Text="If"></asp:ListItem>
                <asp:ListItem Value="1" Text="Else If"></asp:ListItem>
                <asp:ListItem Value="2" Text="Else"></asp:ListItem>
                <asp:ListItem Value="3" Text="And"></asp:ListItem>
                <%--<asp:ListItem Value="4" Text="Or"></asp:ListItem>--%>
            </asp:DropDownList>
        </span>
        <span class="jcf-rule-column">
            <asp:DropDownList runat="server" ID="ruleQuestion"></asp:DropDownList>
        </span>
        <span class="jcf-rule-column">
            <asp:DropDownList runat="server" ID="ruleComparison">
                <asp:ListItem Value="0" Text="="></asp:ListItem>
            </asp:DropDownList>
        </span>
        <span class="jcf-rule-column">
            <asp:TextBox runat="server" ID="ruleValue"></asp:TextBox>
        </span>
        <div class="jcf-rule-action">
            <span class="jcf-rule-column">
                <asp:DropDownList runat="server" ID="ruleAction" onchange="ruleManagerActionChanged(this);">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Text="Use Payment Profile" Value="0"></asp:ListItem>
                    <asp:ListItem Text="Clear Payment Profile" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Override Balance" Value="12"></asp:ListItem>
                    <asp:ListItem Text="Show Question Group" Value="2"></asp:ListItem>
                    <asp:ListItem Text="Hide Question Group" Value="3"></asp:ListItem>
                    <asp:ListItem Text="Make Group Required" Value="4"></asp:ListItem>
                    <asp:ListItem Text="Make Group Not Required" Value="5"></asp:ListItem>
                    <asp:ListItem Text="Clear Question Group" Value="11"></asp:ListItem>
                    <asp:ListItem Text="Add To Grid" Value="14"></asp:ListItem>
                    <asp:ListItem Text="Use Workflow Track" Value="6"></asp:ListItem>
                    <asp:ListItem Text="Send Email" Value="7"></asp:ListItem>
                    <asp:ListItem Text="Show Message" Value="8"></asp:ListItem>
                    <asp:ListItem Text="Set Question Datasource" Value="10"></asp:ListItem>
                    <asp:ListItem Text="Change Tab" Value="13"></asp:ListItem>
                    <asp:ListItem Text="Submit Form" Value="9"></asp:ListItem>
                    <asp:ListItem Text="Save Form" Value="15"></asp:ListItem>
                </asp:DropDownList>
            </span>
            <div class="jcf-rule-column">
                <div id="jcf-groups">
                    <asp:DropDownList runat="server" ID="ruleGroups"></asp:DropDownList>
                </div>
                <div id="jcf-tracks">
                    <asp:DropDownList runat="server" ID="ruleTracks"></asp:DropDownList>
                </div>
                <div id="jcf-pay-profiles">
                    <asp:DropDownList runat="server" ID="rulePayProfiles"></asp:DropDownList>
                </div>
                <div id="jcf-emails">
                    <asp:DropDownList runat="server" ID="ruleEmails"></asp:DropDownList>
                </div>
                <div id="jcf-tabs">
                    <asp:DropDownList runat="server" ID="ruleTabs"></asp:DropDownList>
                </div>
                <div id="jcf-datasource">

                </div>
            </div>
        </div>
    </div>
</div>