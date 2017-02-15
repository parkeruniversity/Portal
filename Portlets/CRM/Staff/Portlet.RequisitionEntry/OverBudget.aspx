<%@ Register TagPrefix="cc1" Namespace="Jenzabar.Portal.Web.UI.Controls" Assembly="Jenzabar.Portal.Web" %>
<%@ Page language="c#" Codebehind="OverBudget.aspx.cs" AutoEventWireup="false" Inherits="Jenzabar.CRM.Staff.Web.Portlets.RequisitionEntryPortlet.OverBudget" %>
<HTML>
	<HEAD>
		<title>Over Budget Account Details</title>
		<link href='<%= this.ResolveUrl("~/UI/Common/Styles/applicationStyle.css") %>' type="text/css" rel="stylesheet">
		<link href='<%= this.ResolveUrl("~/UI/Common/Styles/portletStyle.css") %>' type="text/css" rel="stylesheet">
		<link href='<%= this.ResolveUrl("~/UI/Common/Styles/controlStyle.css") %>' type="text/css" rel="stylesheet">
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<link href="../clientconfig/HtmlContent/custom.css" rel="stylesheet" type="text/css">
	</HEAD>
	<BODY>
		<form id="frmOverBudget" method="post" runat="server">
			<input id="hdnAcctCode" type="hidden" runat="server" NAME="hdnCtlIdNum">
			<div class="pSection" id="divContents" runat="server">
				<h4 id="hdrMessage" style='PADDING-RIGHT: 10px; PADDING-LEFT: 10px; BACKGROUND: #bacbdd; PADDING-BOTTOM: 3px; MARGIN: 0.6em 0px 1.2em; COLOR: #000; PADDING-TOP: 3px; POSITION: relative'
					runat="server"></h4>
				<p id="obMessage" class="feedbackError" runat="server"></p>
				<TABLE ID="tblMain" cellSpacing="3" cellPadding="3" border="0" runat="server">
				</TABLE>
			</div>
		</form>
	</BODY>
</HTML>
