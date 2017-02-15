<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CourseContentExport.ascx.cs"
    Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.Controls.CourseContentExport" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<script language="javascript" type="text/javascript">
    function hidePopup() {
        $find('modalPopupBehavior').hide();
    }
</script>
<div class="pSection">
    <br />
    <asp:Label ID="lblExportUse" runat="server" />
    <br />
    <asp:Label ID="lblExportNoteOne" runat="server" />
    <asp:HyperLink ID="lnkShowModal" runat="server" CssClass="link" />
    <asp:Label ID="lblExportNoteTwo" runat="server" />
    <br />
    <br />
    <div class="cciInfoExportButton">
        <asp:HyperLink ID="lnkExport" runat="server" />        
    </div>
    <br />
    <br />
    <asp:ModalPopupExtender ID="modalPopup" runat="server" BackgroundCssClass="modalPopup"
        TargetControlID="lnkShowModal" PopupControlID="pnlModalPopup" BehaviorID="modalPopupBehavior"
        CancelControlID="lnkClosePopup" />
    <!-- Start Popup -->
    <asp:Panel ID="pnlModalPopup" runat="server" Style="display: none;">
        <div class="cciInfoPopupBodyBorder">
            <div class="cciInfoSupportedContentHeader">
                <div class="cciInfoSupportedContentClose">
                    <asp:Image ID="imgClose" runat="server" OnClick="hidePopup()" CssClass="popupCloseBox" />
                </div>
                <div>
                    <asp:Label ID="lblSupportedContent" runat="server" CssClass="headerText" />
                </div>
            </div>
            <div class="cciInfoPopupBody">
                <asp:Label ID="lblSupportedContentInfo" runat="server" CssClass="cciInfo" />
                <br />
                <asp:Label ID="lblFooter" runat="server" />
                <br />
                <br />
                <br />
                <div style="margin-left: auto; margin-right: auto; width: 10%;">
                    <asp:HyperLink ID="lnkClosePopup" runat="server" CssClass="link" Style="text-align: center;" />
                </div>
            </div>
        </div>
    </asp:Panel>
    <!-- End Popup -->
</div>
