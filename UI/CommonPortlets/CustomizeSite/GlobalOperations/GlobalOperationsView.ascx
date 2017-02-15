<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="GlobalOperationsView.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.GlobalOperationsView" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>

<cmn:Subheader id="subHeader" runat="server" />
<asp:PlaceHolder ID="plhOperations" Runat="server"></asp:PlaceHolder>
<div class="pActionsTransp">
<asp:Button id="btnSave" runat="server" />
<asp:Button id="btnCancel" runat="server" />
</div>
