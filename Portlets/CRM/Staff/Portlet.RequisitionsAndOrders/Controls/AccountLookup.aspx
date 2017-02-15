<%@ Register TagPrefix="cc1" Namespace="Jenzabar.Portal.Web.UI.Controls" Assembly="Jenzabar.Portal.Web" %>
<%@ Page Language="c#" CodeBehind="AccountLookup.aspx.cs" AutoEventWireup="True" Inherits="Portlet.RequisitionsAndOrders.Controls.AccountLookup" %>
<%@ Register TagPrefix="jenzabar" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Register TagPrefix="common" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<html>
	<head>
		<title>Select GL Account</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR"/>
		<meta content="C#" name="CODE_LANGUAGE"/>
		<meta content="JavaScript" name="vs_defaultClientScript"/>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema"/>
		<link href="../UI/Common/Styles/portletStyle.css" rel="stylesheet" type="text/css"/>
		<link href="../clientconfig/HtmlContent/custom.css" rel="stylesheet" type="text/css"/>
	</head>
	<body>
		<form id="frmAccontLookup" method="post" runat="server">
			<div class="pSection" id="divContents" runat="server">
				<h4 id="hdrMessage" style='margin: 1px 0 0 0;padding: 3px 10px; background: #bacbdd;color: #000;position: relative;
				 margin: .6em 0 1.2em 0;' runat="server">GL Account	Selection</h4>
				<table cellspacing="3" cellpadding="3" border="0">
					<tr>
						<td colspan="3"><cc1:jenzabarglaccountlookup id="JenzabarGLAccountLookup" runat="server"></cc1:jenzabarglaccountlookup></td>
					</tr>
					<tr>
						<td></td>
					</tr>
				</table>
			</div>
		</form>
	</body>
</html>
