<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddPageNewUI.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.AddPage.AddPageNewUI" %>
<%@ Import Namespace="Jenzabar.Portal.Framework" %>
<%@ Import Namespace="System.Data" %>

<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="cust" tagname="ContextAddPage" src="~/UI/CommonPortlets/CustomizeContext/ContextAddPage.ascx" %>


<cust:ContextAddPage id="addPage" runat="server" />

