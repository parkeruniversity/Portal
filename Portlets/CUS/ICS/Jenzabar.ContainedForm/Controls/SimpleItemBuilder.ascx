<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SimpleItemBuilder.ascx.cs" Inherits="Jenzabar.ContainedForm.Controls.SimpleItemBuilder" %>
<%@ Register Assembly="Jenzabar.ContainedForm" Namespace="Jenzabar.ContainedForm.Controls"
    TagPrefix="cf" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls"
    TagPrefix="cc1" %>
<%@ Register src="Options.ascx" tagname="Options" tagprefix="cf" %>
<%@ Register TagPrefix="jics" Namespace="Jenzabar.Portal.Framework.Web.TextEditor" Assembly="Jenzabar.Portal.Framework.Web" %>
<style>
    .OptionsRow {
        display: none;
    }
    .RequiredRow {
        display: none;
    }
    .UploadRow {
        display: none;
    }
    .DateRow {
        display: none;
    }
</style>
<asp:Panel runat="server" ID="pnlItem">
    <table style="width: 100%;">
        <tr>
            <td>Type:<asp:HiddenField ID="_itmID" runat="server" />
            </td>
            <td>
                <asp:DropDownList ID="_itmType" runat="server" onchange="javascript:ChangeQuestionType();" style="width:100%;"></asp:DropDownList>
            </td>
        </tr>
        <tr class="TextOptsRow">
            <td>Text:</td>
            <td>
                <jics:TextEditorControl id="_itmTextTbx" runat="server" />
            </td>
        </tr>
        <tr class="RequiredRow">
            <td>Required:</td>
            <td>
                <asp:CheckBox runat="server" ID="cbxRequired"/>
            </td>
        </tr>
        <tr class="DateRow">
            <td>Show Time Picker:</td>
            <td>
                <asp:CheckBox runat="server" ID="cbxUseTime"/>
            </td>
        </tr>
        <tr class="UploadRow">
            <td>File:</td>
            <td>
                <asp:FileUpload runat="server" ID="uplFile"/>
            </td>
        </tr>
        <tr class="OptionsRow">
            <td>Options:</td>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
                    <ContentTemplate>
                        <cf:Options ID="Options1" runat="server" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
</asp:Panel>