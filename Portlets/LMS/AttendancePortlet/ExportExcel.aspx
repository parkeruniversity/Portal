<%@ Page language="c#" Codebehind="ExportExcel.aspx.cs" AutoEventWireup="false" Inherits="Jenzabar.LMS.Portlets.AttendancePortlet.ExportExcel" %>
<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" > 

<html>
  <head>
    <title>ExportExcel</title>
    <meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" Content="C#">
    <meta name=vs_defaultClientScript content="JavaScript">
    <meta name=vs_targetSchema content="http://schemas.microsoft.com/intellisense/ie5">
  </head>
  <body MS_POSITIONING="GridLayout">
	
    <form id="Form1" method="post" runat="server">

		<common:GroupedGrid ID="gridAttendance" RenderGroupHeaders="True" CssClass="groupedGrid attGroupedGrid" AllowSorting="True" DataKeyField="ID" runat="server" Style="border: 1px solid black">
		</common:GroupedGrid>
		<common:GroupedGrid ID="gridAttendanceWithdrawn" RenderGroupHeaders="True" CssClass="groupedGrid attGroupedGrid" AllowSorting="True" DataKeyField="ID" runat="server" Style="border: 1px solid black">
		</common:GroupedGrid>
     </form>
	
  </body>
</html>
