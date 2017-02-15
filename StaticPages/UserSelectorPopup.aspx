<%@ Page language="c#" Codebehind="UserSelectorPopup.aspx.cs" AutoEventWireup="false" Inherits="Jenzabar.Portal.Web.StaticPages.UserSelectorPopup" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Register TagPrefix="jnz" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" Assembly="Jenzabar.Portal.Framework.Web" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" > 

<html>
  <head>
    <title><%= Globalizer.GetGlobalizedString("TXT_SELECT_USERS") %></title>
    <meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" Content="C#">
    <meta name=vs_defaultClientScript content="JavaScript">
    <meta name=vs_targetSchema content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../UI/Common/Styles/siteStyle.css" type="text/css" rel="stylesheet" />
    <script language="JavaScript" type="text/javascript" src="../UI/Common/Scripts/AJAX.js"></script>
    <script type="text/javascript">
    
		function preventDefaultEvent(event, value)
		{
			if ((event != null && typeof(event.type) === "string") && (value === false || value == null))
			{		
				if (event.preventDefault)
				{
					event.preventDefault();
				}
				else if ("returnValue" in event)
				{
					event.returnValue = false;
				}
				else
				{
					throw new Error("The browser does not support known DOM Level II event cancellation.");
				}
			}
			
			return value;
		}
		
    </script>
  </head>
  <body MS_POSITIONING="GridLayout">
	
    <form id="Form1" method="post" runat="server">
		<jnz:UserSelector id="usUserSelector" runat="server" />
     </form>
	
  </body>
</html>
