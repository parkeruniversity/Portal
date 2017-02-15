<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ContextSecurity.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.Controls.ContextSecurity" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Import Namespace="Jenzabar.Common.Globalization" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="jenz" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" Assembly="Jenzabar.Portal.Framework.Web" %>
<cmn:Subheader id="hdr" runat="server" />

<asp:LinkButton ID="AdditionalStudentsLink" runat="server" CssClass="manageRosterLink" Visible="false" />

<jenz:SecurityGrid id="SecGrid" runat="server" />