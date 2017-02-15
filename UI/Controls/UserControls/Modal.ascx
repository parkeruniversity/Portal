<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Modal.ascx.cs" Inherits="Jenzabar.Portal.Framework.Web.UI.Controls.ModalBase,Jenzabar.Portal.Framework.Web" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>

<ajax:ModalPopupExtender ID="_mainModalPopup" PopupControlID="_divModal" BackgroundCssClass="modalPopup" runat="server" />

<asp:Repeater ID="Extenders" runat="server">
	<ItemTemplate>
		<ajax:ModalPopupExtender ID="_modalPopup" TargetControlID="<%# Container.DataItem %>" PopupControlID="_divModal" BackgroundCssClass="modalPopup" runat="server" />
	</ItemTemplate>
</asp:Repeater>

<asp:Panel ID="_divModal" runat="server" class="modalDiv ui-dialog ui-widget ui-widget-content ui-corner-all ui-front" DefaultButton="_btnSave" style="display:none;">
<div id="innerModal">
    <div class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix">
        <button ID="_btnClose" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only ui-dialog-titlebar-close" runat="server">
            <span class="ui-button-icon-primary ui-icon ui-icon-closethick" />
        </button>
        <asp:Label ID="_lblHeading" CssClass="ui-dialog-title" runat="server" />
    </div>

    <asp:PlaceHolder ID="_phContent" runat="server" />

    <div id="modalButtons">
        <asp:Button ID="_btnSave" runat="server"/>
        <asp:Button ID="_btnCancel" runat="server" UseSubmitBehavior="false" />
    </div>
</div>
</asp:Panel>
