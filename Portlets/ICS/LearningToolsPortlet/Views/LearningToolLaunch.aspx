<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LearningToolLaunch.aspx.cs" Inherits="Jenzabar.ICS.Web.Portlets.LearningToolsPortlet.Views.LearningToolLaunch" ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="_tbHtml" runat="server" Wrap="true" Rows="20" Columns="120" TextMode="MultiLine" /><asp:Label ID="_lblErr" runat="server" />
    </div>
    </form>
</body>
</html>
