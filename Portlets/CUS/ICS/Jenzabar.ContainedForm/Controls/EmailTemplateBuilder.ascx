<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EmailTemplateBuilder.ascx.cs" Inherits="Jenzabar.ContainedForm.Controls.EmailTemplateBuilder" %>
<%@ Register Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls"
    TagPrefix="cc1" %>
<%@ Register TagPrefix="jics" Namespace="Jenzabar.Portal.Framework.Web.TextEditor" Assembly="Jenzabar.Portal.Framework.Web" %>
<asp:HiddenField ID="_emlID" runat="server" />
<style>
    ._emailMask {
        border: inset;
    }
    [id*=ulEmails] {
        width: 300px;
        margin-bottom: -5px;
        margin-top: 5px;
    }
    [id*=ulEmails] li {
        background-color: lightblue;
        display: inline-block;
        margin-right: 10px;
        padding: 5px;
    }
    [id*=ulEmails] li a {
        margin-right: 5px;
        cursor: pointer;
        color: red;
    }
    ._textbox {
        width: 300px;
    }
    ._comboBox {
        width: 304px;
        height: 25px;
    }
</style>
<script>
    function saveToAddresses() {
        var arr = '';
        var count = 0;
        jQuery('[id*=ulEmails] li').each(function () {
            var obj = {};
            arr += jQuery(this).attr('xvalue') + ";";
        });
        jQuery('[id*=hdnEmailTo]').val(arr);
    }
    function bindKeyUp(ctl,e) {
        if (e.keyCode == 13 || e.keyCode == 186) {
            addEmail(ctl);
        }
    }
    function addEmailWithWrap(ctr, wrap, wrapend) {
        var val = jQuery('option:selected', ctr).text();
        if (val == '')
            val = jQuery(ctr).val();
        var eml = wrap + val + wrapend;
        if (eml != '') {
            jQuery(ctr).val('');
            var html = jQuery('[id*=ulEmails]').html();
            html += "<li xvalue='" + eml.replace(';', '') + "'><a onclick='jQuery(this).parent().remove();'>x</a><span>" + eml.replace(';', '') + "</span></li>";
            jQuery('[id*=ulEmails]').html(html);
        }
    }
    function addEmail(ctr) {
        addEmailWithWrap(ctr, '', '');
    }
</script>
<table width="100%">
    <tr>
        <td>Send Event:</td>
        <td>
            <select id="_emlSendEvent">
                <option value="Save">Save</option>
                <option value="Submit">Submit</option>
            </select>
        </td>
    </tr>
    <tr>
        <td>Email From:</td>
        <td><asp:TextBox ID="_emlEmailFrom" runat="server" CssClass="_textbox"></asp:TextBox></td>
    </tr>
    <tr>
        <td>Email To Address:</td>
        <td>
            <asp:HiddenField runat="server" ID="hdnEmailTo" />
            <asp:TextBox ID="_emlEmailTo" runat="server" CssClass="_emailBox _textbox jcf-lsr-tags" onkeyup="bindKeyUp(this,event);" onblur="addEmail(this);"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            Email To Answer:
        </td>
        <td>
            <asp:DropDownList ID="_emlQuestionChoice" runat="server" CssClass="_comboBox" data-populate="MappableQuestions"/>
            <asp:Image ID="img_add_email" runat="server" 
            ImageUrl="~/UI/Common/Images/PortletImages/Icons/add.gif"  OnClick="addEmailWithWrap(jQuery('._comboBox'),'{', '}');"
            style="cursor:pointer;"/>
            <ul id="ulEmails" runat="server">

            </ul>
        </td>
    </tr>
    <tr>
        <td>Subject:</td>
        <td><asp:TextBox ID="_emlSubject" CssClass="_textbox" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td>Include Submission:</td>
        <td><asp:CheckBox ID="_emlIncludeSub" runat="server" /></td>
    </tr>
    <tr>
        <td colspan="2">
            Message:<br />
            <jics:TextEditorControl ID="_emlMessage" runat="server" Layout="jcf-all-tags" Height="175" />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <center>
                <button type="button" onclick="saveToAddresses();Jcf.func.saveEmail();HideEmailTemplate();return false;">Save</button>
                <button type="button" onclick="javascript:if(!confirm('Are you sure you want to delete this template?')){return false;}Jcf.func.deleteEmail();HideEmailTemplate();return false;">Delete</button>
                <button type="button" onclick="javascript:Jcf.ui.clearEmailTemplate();HideEmailTemplate();">Cancel</button>
            </center>
        </td>
    </tr>
</table>