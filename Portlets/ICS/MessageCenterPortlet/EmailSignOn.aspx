<%@ Page language="c#" Codebehind="EmailSignOn.aspx.cs" AutoEventWireup="false" Inherits="Jenzabar.LMS.Web.Portlets.FileCabinetPortlet.EmailSignOn" %>
<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" > 

<html>
  <head>
    <title>EmailSignOn</title>
    <meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" Content="C#">
    <meta name=vs_defaultClientScript content="JavaScript">
    <meta name=vs_targetSchema content="http://schemas.microsoft.com/intellisense/ie5">
  </head>
  <body MS_POSITIONING="GridLayout">
	<form id="Form1" method="post" runat="server">
	</form>
	
	<common:ErrorDisplay ID="ErrorMessage" ErrorMessageKey="MSG_MESSAGECENTER_NO_EMAIL_ACCT_SET_UP" Visible="False" Runat="server" />
	
  </body>
</html>
