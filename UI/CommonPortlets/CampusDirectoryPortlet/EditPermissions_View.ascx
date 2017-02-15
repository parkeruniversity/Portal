<%@ Control Language="c#" AutoEventWireup="false" Codebehind="EditPermissions_View.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.CampusDirectoryPortlet.EditPermissions_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>

<%@ Register TagPrefix="cmn" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Import namespace="Jenzabar.Common" %>
<%@ Import namespace="Jenzabar.Portal.Framework" %>
<%@ Register TagPrefix="framework" namespace="Jenzabar.Portal.Framework.Web.UI.Controls" assembly="Jenzabar.Portal.Framework.Web" %>
<script language="JavaScript" src='<%=JCUtilities.ResolveUrl("~/UI/Common/Scripts/PortletUtils.js")%>'></script>
<script language="JavaScript" src='<%=JCUtilities.ResolveUrl("~/UI/CommonPortlets/CampusDirectoryPortlet/CampusDirectory.js")%>'></script>
<cmn:Subheader id="subHeader" runat="server"/>

<div class="pSection">
	<cmn:ErrorDisplay id="ctlError" runat=server />
	<fieldset>
	<div></div>
	<asp:PlaceHolder ID="plhPermissions" EnableViewState="True" Runat="server"/>
	</fieldset>
</div>
<div class="pActionsTransp">
	<asp:Button id="btnSubmit" runat="server" />
	&nbsp;
	<asp:Button id="btnCancel" CausesValidation="False" runat="server" />
</div>
