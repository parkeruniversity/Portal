<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Modal.ascx.cs" Inherits="Jenzabar.LMS.Portlets.Common.Controls.Modal" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<%@ Register Assembly="System.Web.Extensions"Namespace="System.Web.UI" TagPrefix="asp" %>

<ajax:ModalPopupExtender ID="_mainModalPopup" PopupControlID="_divModal" BackgroundCssClass="modalPopup" runat="server" />
<asp:Repeater ID="Extenders" runat="server">
	<ItemTemplate>
		<ajax:ModalPopupExtender ID="_modalPopup" TargetControlID="<%# Container.DataItem %>" PopupControlID="_divModal" BackgroundCssClass="modalPopup" runat="server" />
	</ItemTemplate>
</asp:Repeater>

<asp:Panel ID="_divModal" runat="server" class="modalDiv" DefaultButton="_btnSave" style="display:none;">
    <div id="innerModal">
        <div id="modalHeading">
            <asp:Image ID="_imgClose" class="modalHeadingImg" runat="server" />
            <asp:Label ID="_lblHeading" runat="server" />
        </div>

        <asp:PlaceHolder ID="_phContent" runat="server" />

        <div id="modalButtons">
            <asp:Button ID="_btnSave" runat="server"/>
            <asp:Button ID="_btnCancel" runat="server" UseSubmitBehavior="false" />
        </div>
    </div>
</asp:Panel>
