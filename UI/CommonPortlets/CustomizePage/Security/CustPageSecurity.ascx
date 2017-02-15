<%@ Control Language="c#" AutoEventWireup="false" Codebehind="CustPageSecurity.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.CustomizePage.CustPageSecurity" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="jenz" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" Assembly="Jenzabar.Portal.Framework.Web" %>
<cmn:Subheader id="hdr" textKey="TXT_DEFINE_PERMISSIONS" runat="server" />
<jenz:SecurityGrid id="SecGrid" runat="server" />

