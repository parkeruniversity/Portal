<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ContentEdit_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.CustomContentPortlet.ContentEdit_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="common" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<SCRIPT language="javascript">
<!--
function ConfirmDelete(msg)
{
	return confirm(msg);
}
//-->
</SCRIPT>
<div class="pSection">
<asp:PlaceHolder ID="_phLightbox" runat="server" />
<common:ErrorDisplay id="PageErrors" runat="server" />
<div align="right" class="pSection"><asp:LinkButton ID="lnkAdd" Runat="Server"/></div>
	<asp:Repeater id="rptElements" Runat="server">
		<ItemTemplate>
			<div class="reorder" id="divEditDeleteElement">
				<asp:TextBox Width="20" ID="txtOrder" Runat="server"></asp:TextBox>&nbsp;&nbsp;
				<asp:ImageButton ID="imgEdit" Runat="server"></asp:ImageButton>&nbsp;
				<asp:ImageButton ID="imgDelete" Runat="server"></asp:ImageButton>
			</div>
			<div id="divElementContent" style="border:thin dashed lightblue;">
				<asp:Literal ID="litContent" runat="server"></asp:Literal>
                <asp:Panel ID="_panGallery" CssClass="pSection ccGallery" runat="server"></asp:Panel>
				<input type="hidden" runat="server" id="OldOrder" NAME="OldOrder">
			</div>
		</ItemTemplate>
	</asp:Repeater>
<p><asp:Button ID="btnReorder" Runat="server"></asp:Button></p>
<h4 id="ExitModeH4" runat="server"><asp:button id="btnExitEditMode" CssClass="h4" Runat="server"></asp:button></h4>
</div>