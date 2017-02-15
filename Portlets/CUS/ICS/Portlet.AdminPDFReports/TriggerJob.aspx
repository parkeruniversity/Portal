<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TriggerJob.aspx.cs" Inherits="Jenzabar.CUS.ICS.Web.Portlets.AdminPDFReportsPortlet.TriggerJob" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        Job triggered at <%= DateTime.Now.ToString() %>
    </div>
    </form>
</body>
</html>
