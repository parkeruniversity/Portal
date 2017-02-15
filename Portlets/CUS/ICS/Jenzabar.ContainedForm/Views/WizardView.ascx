<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WizardView.ascx.cs" Inherits="Jenzabar.ContainedForm.Views.WizardView" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls"
    TagPrefix="cc1" %>
<%@ Register Assembly="Jenzabar.ContainedForm" Namespace="Jenzabar.ContainedForm.Controls"
    TagPrefix="cf" %>
<%@ Register Assembly="Jenzabar.CFWFCommon" Namespace="Jenzabar.ContainedForm.Controls"
    TagPrefix="cf" %>
<%@ Register assembly="CuteEditor" namespace="CuteEditor" tagprefix="CE" %>
<%@ Register src="../Controls/SimpleItemBuilder.ascx" tagname="SimpleItemBuilder" tagprefix="cf" %>
<%@ Register TagPrefix="jics" Namespace="Jenzabar.Portal.Framework.Web.TextEditor" Assembly="Jenzabar.Portal.Framework.Web" %>
<script type="text/javascript">
    function ChangeQuestionType() {
        jQuery('.OptionsRow').hide();
        jQuery('.RequiredRow').show();
        jQuery('.UploadRow').hide();
        jQuery('.DateRow').hide();
        switch (jQuery('[id*="_itmType"]').val()) {
            case "RadioButton":
            case "CheckBox":
            case "DropDown":
                jQuery('.OptionsRow').show();
                break;
            case 'Image':
            case 'FileDownload':
                jQuery('.UploadRow').show();
            case 'Hidden':
            case 'PlaceHolder':
                jQuery('RequiredRow').hide();
                break;
            case 'DatePicker':
                jQuery('.DateRow').show();
                break;
        }
        ShowPanels();
    }
    function SendEmailChecked() {
        if(jQuery('[id*=cbxSendEmail]').is(':checked')) {
            jQuery('#EmailRow').show();
        } else {
            jQuery('#EmailRow').hide();
        }
    }
    function ShowMessageChecked() {
        if (jQuery('[id*=cbxShowMessage]').is(':checked')) {
            jQuery('#MessageRow').show();
        } else {
            jQuery('#MessageRow').hide();
        }
    }
</script>
<div class="pSection">
<asp:Panel runat="server" ID="pnlStep1">
    <%--Name and Description--%>
    <cc1:Hint runat="server" ID="hntNameDesc" Text="Enter a name for the form and a description. The name will be used as the link text and will be displayed under the form description in the form list of the portlet."></cc1:Hint>
    <table style="width:100%;">
        <tr>
            <td>Form Name:</td>
            <td><asp:TextBox runat="server" ID="tbxName"></asp:TextBox></td>
        </tr>
        <tr>
            
            <td>Description:</td>
            <td>
                <jics:TextEditorControl id="tbxDescription" runat="server" />
            </td>
        </tr>
    </table>
    <table style="width:100%;">
        <tr>
            <td style="text-align: left;"></td>
            <td style="text-align: right;">
                
                <asp:Button ID="btnNext1" runat="server" Text="Next" 
                    onclick="btnNext1_Click"/></td>
        </tr>
    </table>
</asp:Panel>
<asp:Panel runat="server" ID="pnlStep2" Visible="False">
    <cc1:Hint runat="server" ID="hntQuestions" Text="Add questions to the form. Questions can be reordered on the next screen. These questions can be modified later in the admin view and more advanced settings can be applied. A submit button will be added automatically."></cc1:Hint>
    <%--Questions--%>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:LinkButton runat="server" ID="lnkAddItem" onclick="lnkAddItem_Click">Add Item</asp:LinkButton>
            <asp:Panel runat="server" ID="pnlNewItem" Visible="False">
                <cf:SimpleItemBuilder ID="ItemBuilder1" runat="server" />
                <center><asp:Button runat="server" ID="btnSaveItem" Text="Save" 
                        onclick="btnSaveItem_Click"/></center>
            </asp:Panel>
            
            <asp:Panel runat="server" ID="pnlItemContainer"></asp:Panel>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="lnkAddItem" EventName="Click"/>
        </Triggers>
    </asp:UpdatePanel>
    <table style="width:100%;">
        <tr>
            <td style="text-align: left;"><asp:Button ID="btnBack2" runat="server" Text="Back" OnClick="btnBack2_Click"/></td>
            <td style="text-align: right;"><asp:Button ID="btnNext2" runat="server" Text="Next" OnClick="btnNext2_Click"/></td>
        </tr>
    </table>
</asp:Panel>
<asp:Panel runat="server" ID="pnlStep3" Visible="False">
    <cc1:Hint runat="server" ID="htnTimes" Text="Set the start and end times for the form to be displayed."></cc1:Hint>
    <%--Start and End Date--%>
    <table style="width:100%;">
        <tr>
            <td>Start Date:</td>
            <td><cf:JSDatePicker runat="server" ID="dpStartDate" DateFormat="UseTime"/></td>
        </tr>
        <tr>
            <td>End Date:</td>
            <td><cf:JSDatePicker runat="server" ID="dpEndDate" DateFormat="UseTime"/></td>
        </tr>
    </table>
    <table style="width:100%;">
        <tr>
            <td style="text-align: left;"><asp:Button ID="btnBack3" runat="server" Text="Back" OnClick="btnBack3_Click"/></td>
            <td style="text-align: right;"><asp:Button ID="btnNext3" runat="server" Text="Next" OnClick="btnNext3_Click"/></td>
        </tr>
    </table>
</asp:Panel>
<asp:Panel runat="server" ID="pnlStep4" Visible="False">
     <cc1:Hint runat="server" ID="Hint1" Text="Actions to execute on form submission."></cc1:Hint>
    <%--Show Message/Send Email--%>
    <table style="width:100%;">
        <tr>
            <td>Send an email:</td>
            <td><asp:CheckBox runat="server" ID="cbxSendEmail" onclick="SendEmailChecked();"/></td>
        </tr>
        <tr style="display:none;" id="EmailRow">
            <td colspan="2">
                <table style="width:100%;">
                    <tr>
                        <td>From:</td>
                        <td>
                            <asp:TextBox runat="server" ID="tbxEmailFrom"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>To:</td>
                        <td>
                            <asp:TextBox runat="server" ID="tbxEmailTo"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Subject:</td>
                        <td><asp:TextBox runat="server" ID="tbxSubject"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Include Submission:</td>
                        <td><asp:CheckBox ID="emlIncludeSub" runat="server" /></td>
                    </tr>
                    <tr>
                        <td>Body:</td>
                        <td>
                            <jics:TextEditorControl id="tbxEmailBody" runat="server" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>Show a message:</td>
            <td><asp:CheckBox runat="server" ID="cbxShowMessage" onclick="ShowMessageChecked();"/></td>
        </tr>
        <tr id="MessageRow" style="display:none;">
            <td>Text:</td>
            <td>
                <jics:TextEditorControl id="tbxMessage" runat="server" />
            </td>
        </tr>
    </table>
    <table style="width:100%;">
        <tr>
            <td style="text-align: left;"><asp:Button ID="btnBack4" runat="server" Text="Back" OnClick="btnBack4_Click"/></td>
            <td style="text-align: right;"><asp:Button ID="btnFinish" runat="server" Text="Finish" OnClick="btnFinish_Click"/></td>
        </tr>
    </table>
</asp:Panel>
</div>