<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AttachmentUploaderControl.ascx.cs" Inherits="Jenzabar.EX.Common.AttachmentUploaderControl" %>
<%@ Import Namespace="Jenzabar.EX.Common" %>
<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="ajaxToolkit" Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" %>

<script type="text/javascript">

    Sys.Application.add_load(AttachmentUploaderLoad);

    function AttachmentUploaderLoad() {
        $("#<%# fileUpload.ClientID %>").click(function () {
            $("#<%# lblUploadInfo.ClientID %>").hide();
        });
        $("#<%# btnCancel.ClientID %>").click(function () {
            $("#<%# lblUploadInfo.ClientID %>").hide();
        });
        $("#<%# btnImage.ClientID %>").click(function () {
            $("#<%# lblUploadInfo.ClientID %>").hide();
        });
    }

</script>

<asp:Panel ID="pnlInstantUpload" runat="server">
    <asp:Label ID="lblInstantUploadInfo" runat="server" />
</asp:Panel>

<asp:Panel ID="pnlSingleUpload" runat="server">
    <asp:ImageButton ID="imgSingleUploadDelete" runat="server" ImageUrl="<%# Page.ResolveUrl(Constants.GetIconDelete()) %>" OnClick="imgSingleUploadDelete_Click" Visible="false" CausesValidation="false" />
</asp:Panel>

<asp:Panel ID="pnlMultiUpload" runat="server">
    <asp:Label ID="lblMultiNumFilesAttached" CssClass="AUFloatLeft" runat="server" /><br />
    <asp:Repeater ID="rMultiExisting" runat="server">
        <ItemTemplate>
            <p style="margin: 5px">
                <asp:Label ID="lblMultiExistingFileName" runat="server" Text='<%# Eval("FileNameWithExtension") %>' />
                <asp:ImageButton ID="imgMultiExistingDelete" runat="server" ImageUrl="<%# Page.ResolveUrl(Constants.GetIconDelete()) %>"
                    CommandName="FileName" CommandArgument='<%# Container.ItemIndex %>' OnCommand="imgMultiExistingDelete_Command" CausesValidation="false" />
            </p>
        </ItemTemplate>
    </asp:Repeater>
    <asp:Repeater ID="rMultiUpload" runat="server">
        <ItemTemplate>
            <p style="margin: 5px 0;">
                <asp:Label ID="lblMultiUploadFileName" runat="server" Text='<%# Eval("FileNameWithExtension") %>' />
                <asp:ImageButton ID="imgMultiUploadDelete" runat="server" ImageUrl="<%# Page.ResolveUrl(Constants.GetIconDelete()) %>"
                    CommandName="FileName" CommandArgument='<%# Container.ItemIndex %>' OnCommand="imgMultiUploadDelete_Command" CausesValidation="false" />
            </p>
        </ItemTemplate>
    </asp:Repeater>
</asp:Panel>

<asp:Image runat="server" ID="imgAddFile" ImageUrl="<%# Page.ResolveUrl(Constants.GetIconAddFile()) %>"
    CssClass="AUVAlignMiddle" />
<jenzabar:GlobalizedLinkButton ID="lbAddFile" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_ADD_FILE"
    CssClass="AUVAlignMiddle" />

<ajaxToolkit:ModalPopupExtender ID="modalUpload" runat="server" TargetControlID="lbAddFile" PopupControlID="pnlUpload"
PopupDragHandleControlID="pnlModalHeader" BackgroundCssClass="AUModalBackground" BehaviorID="ModalUploadBehaviorID"  />
<asp:Panel ID="pnlUpload" runat="server" CssClass="AUModalPopup AUModalWidth"
    Style="text-align: left;">
    <div class="AUModalInner">
        <asp:Panel ID="pnlModalHeader" runat="server" CssClass="AUModalHeader">
            <jenzabar:GlobalizedLiteral ID="txtHeader" runat="server" TextKey="TXT_TEST" />            
            <asp:ImageButton ID="btnImage" runat="server" CssClass="AUModalHeaderImg" ImageUrl='<%# Page.ResolveUrl(Constants.GetIconClose()) %>' OnClientClick="$find('ModalUploadBehaviorID').hide(); return false;" />         
        </asp:Panel>
        <div style="text-align:center;">
            <div style="margin:20px;">
                <asp:FileUpload ID="fileUpload" runat="server" CssClass="AUModalWidth" />
            </div>
            <div>
                <asp:Label ID="lblUploadInfo" runat="server" />
            </div>
            <div class="AUModalButtons">
                <jenzabar:GlobalizedButton ID="btnSave" runat="server" TextKey="TXT_COMMON_EX_COMMON_SAVE" CausesValidation="false" />
                <jenzabar:GlobalizedButton ID="btnCancel" runat="server" TextKey="TXT_COMMON_EX_COMMON_CANCEL" CausesValidation="false" />
            </div>
        </div>
    </div>
</asp:Panel>