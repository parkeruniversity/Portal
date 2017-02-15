<%@ Import Namespace="Jenzabar.Portal.Web.UI.CommonPortlets" %>
<%@ Import Namespace="Jenzabar.Portal.Web" %>
<%@ Import Namespace="Jenzabar.Common.Globalization" %>
<%@ Import Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" %>
<%@ Import Namespace="Jenzabar.Portal.Framework" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="cmn" Src="../../CommonControls/PageTypeView.ascx" TagName="PageTypeView" %>
<%@ Control Language="c#" AutoEventWireup="false" CodeBehind="PageAddPortlet.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.Controls.PageAddPortlet" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<script language="JavaScript" src="UI/Common/Scripts/PortletUtils.js"></script>


<div class="pSection">
    <cmn:Hint ID="hntAddPortlets" runat="server" />
    <asp:Label ID="valLabel" EnableViewState="False" CssClass="ValidationError" Visible="False" runat="server"></asp:Label>
    <p></p>
    <cmn:PageTypeView ID="pageTypeView" runat="server" />
    <p>
        <cmn:GlobalizedButton ID="btnSave" Visible="False" TextKey="TXT_ADD_PORTLETS_TO_PAGE" runat="server" />&nbsp;
        <cmn:GlobalizedButton ID="btnCancel" TextKey="TXT_CANCEL" runat="server" />
    </p>
</div>
