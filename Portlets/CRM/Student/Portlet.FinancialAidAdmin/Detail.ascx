<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Detail.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.FinancialAidAdminPortlet.FinancialAidDetails" %>
<jenzabar:SubHeader id="hdrName" runat="server"></jenzabar:SubHeader>
<div class="pSection" id="contents" runat="server">
	<jenzabar:hint id=hntDetail runat="server" TextKey="TXT_FAA_DETAIL_HINT"></jenzabar:hint>
	<jenzabar:GlobalizedLiteral ID="ltFinAidAwards" Runat="server"></jenzabar:GlobalizedLiteral>
	<jenzabar:globalizedlinkbutton id=lnkFAA runat="server" TextKey="TXT_FAA_VIEW_FAA"></jenzabar:GlobalizedLinkButton><br>
	<jenzabar:globalizedlinkbutton id=lnkFAD runat="server" TextKey="TXT_FAA_VIEW_FAD"></jenzabar:GlobalizedLinkButton>
</DIV>
