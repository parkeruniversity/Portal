<%@ Page language="c#" Codebehind="RequestValidationError.aspx.cs" AutoEventWireup="false" Inherits="Jenzabar.Portal.Web.ErrorPages.RequestValidationError" %>
<%@ Register TagPrefix="jweb" Namespace="Jenzabar.Portal.Web.UI.Controls" Assembly="Jenzabar.Portal.Web" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<title><%=PageTitle%></title>
<base href="<%=BasePath%>" />
<style type="text/css" media="all">@import url( UI/Common/Styles/siteStyle.css );</style>
<link href="favicon.ico" type="image/x-icon" rel="Shortcut Icon" />
<style type="text/css" media="all">@import url( clientconfig/HtmlContent/custom.css );</style>
</HEAD>
<body>
<table style="width:100%;" cellpadding="0" cellspacing="0" border="0"><tr><td>
    <jweb:SiteForm id="MAINFORM" method="post" runat="server">
		<jweb:SiteHeader id="siteHeader" runat="server" />
		<h1><%=PageHeader%></h1> 
		<table id="mainLayout">
			<tr><td id="portlets">
				<div><asp:Label id="lblError" runat="server"/></div>
				<p></p>
				<div><asp:LinkButton ID="lnkHome" Runat="server"/></div>
			</td></tr>
		</table>
		
	</jweb:SiteForm>
</td></tr></table>	
</body>
</HTML>
