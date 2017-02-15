<%@ Page language="c#" Codebehind="Error.aspx.cs" AutoEventWireup="false" Inherits="Jenzabar.Portal.Web.ErrorPages.Error" %>
<%@ Register TagPrefix="jweb" Namespace="Jenzabar.Portal.Web.UI.Controls" Assembly="Jenzabar.Portal.Web" %>
<HTML lang="en">
<HEAD>
<title><%=PageTitle%></title>
<link href="<%=BasePath%>UI/Common/Styles/siteStyle.css" type="text/css" rel="stylesheet" >
  </HEAD>
<body id="body">
<div>
</div>
    <form id="Form1" method="post" action="" runat="server">
    
    <jweb:SiteHeader id="siteHeader" runat="server" />
	<h1><%=PageHeader%></h1>    
    <table width="70%" align="left">
    <tr><td>
    <div><asp:Label id="lblError" runat="server"></asp:Label></div>
    <p></p>
    <asp:LinkButton ID="lnkHome" Runat="server"></asp:LinkButton>
    </td></tr>
    </table>
     </form>
	
</body>
</HTML>
