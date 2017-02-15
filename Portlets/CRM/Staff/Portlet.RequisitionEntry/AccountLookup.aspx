<%@ Register TagPrefix="cc1" Namespace="Jenzabar.Portal.Web.UI.Controls" Assembly="Jenzabar.Portal.Web" %>
<%@ Page language="c#" Codebehind="AccountLookup.aspx.cs" AutoEventWireup="false" Inherits="Jenzabar.CRM.Staff.Web.Portlets.RequisitionEntryPortlet.AccountLookup" %>
<%@ Register TagPrefix="jenzabar" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Register TagPrefix="common" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<HTML>
	<HEAD>
		<title>Select GL Account</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<link href="...../UI/Common/Styles/portletStyle.css" rel="stylesheet" type="text/css">
		<link href="../clientconfig/HtmlContent/custom.css" rel="stylesheet" type="text/css">
	</HEAD>
	<BODY>
		<form id="frmAccontLookup" method="post" runat="server">
			<div class="pSection" id="divContents" runat="server">
				<h4 id="hdrMessage" style='margin: 1px 0 0 0;padding: 3px 10px; background: #bacbdd;color: #000;position: relative;
				 margin: .6em 0 1.2em 0;' runat="server">GL Account	Selection</h4>
				<TABLE cellSpacing="3" cellPadding="3" border="0">
					<TR>
						<TD colSpan="3"><cc1:jenzabarglaccountlookup id="JenzabarGLAccountLookup" runat="server"></cc1:jenzabarglaccountlookup></TD>
					</TR>
					</TR>
					<tr>
						<td></td>
					</tr>
				</TABLE>
			</div>
		</form>
	</BODY>
</HTML>
