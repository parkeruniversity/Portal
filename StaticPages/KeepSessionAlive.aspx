<%@ Page language="c#" Codebehind="KeepSessionAlive.aspx.cs" AutoEventWireup="false" Inherits="Jenzabar.Portal.Web.StaticPages.KeepSessionAlive" %>
<html>
<head>
<noscript>
<meta http-equiv="refresh" content="900">
</noscript>

<script language="javascript">
<!--
var sURL = unescape(window.location.pathname);

function doLoad()
{
   setTimeout( "refresh()", 300 * 1000 );
}

function refresh()
{
    window.location.href = sURL;
}
//-->
</script>
</head>

<body onload="doLoad()">
</body>
</html>