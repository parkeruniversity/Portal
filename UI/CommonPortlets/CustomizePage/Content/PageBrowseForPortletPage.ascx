<%@ Control Language="c#" AutoEventWireup="false" Codebehind="PageBrowseForPortletPage.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.Controls.PageBrowseForPortletPage" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="Jenzabar" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Import Namespace="Jenzabar.Portal.Web.UI.CommonPortlets"%>
<div class="pSection">
<cmn:Hint id="hint" textKey="MSG_PAGE_BROWSE_FOR_PORTLET_PAGE_HINT" runat="server"></cmn:Hint>
<asp:PlaceHolder id="plhNavigate" runat="server"/>
<blockquote>
<asp:PlaceHolder id="plhSubItems" runat="server"/>
</blockquote>
<b><cmn:GlobalizedLinkButton ID="lnkBack" textKey="TXT_BACK_TO_PAGE_CONTENT_SCREEN" Runat="server" /></b>
<br>
<br>
</div>