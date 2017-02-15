<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Default_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.CustomContentPortlet.Default_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="common" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<SCRIPT language="javascript">
<!--
    function ConfirmDelete(msg) {
        return confirm(msg);
    }
//-->
</SCRIPT>

<asp:PlaceHolder ID="_phLightbox" runat="server" />

<common:ErrorDisplay id="PageErrors" runat="server" />
<div align="right" class="pSection" ID="divEditOrAdd" Runat="server"><asp:LinkButton ID="lnkEdit" Runat="Server"/></div>
<asp:Repeater id="rptElements" Runat="server">
    <ItemTemplate>
        <asp:Literal ID="litContent" runat=server></asp:Literal>
        <asp:Panel ID="_panGallery" CssClass="pSection ccGallery" runat="server"></asp:Panel>
        <div style="clear:both"></div>
    </ItemTemplate>
</asp:Repeater>
