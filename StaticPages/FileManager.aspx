<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FileManager.aspx.cs" Inherits="Jenzabar.Portal.Web.StaticPages.FileManager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>JICS File Manager</title>
    <style>
        table {
            border-spacing: 20px;
            text-align: left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h2>User File Usage Summary</h2>

        <asp:Repeater ID="UserList" runat="server">
            <HeaderTemplate>
                <table class="MeetingListTable">
                    <tr>
                        <th> User Name</th>
                        <th>Total Size</th>
                        <th>Total Files</th>
                        <th>Largest File</th>
                        <th>Files Over 10 MB</th>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td>
                        <%# Eval("Name") %>
                    </td>
                    <td>
                        <%# Eval("FormattedTotalSize") %>
                    </td>
                    <td>
                        <%# Eval("TotalFiles") %>
                    </td>
                    <td>
                        <%# Eval("FormattedLargestSize") %>
                    </td>
                    <td>
                        <%# Eval("FilesOverSize") %>
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate></table></FooterTemplate>
        </asp:Repeater>
        
         <asp:Repeater ID="ContextUsage" runat="server">
            <HeaderTemplate>
                <table class="MeetingListTable">
                    <tr>
                        <th>Context Name</th>
                        <th>Total Size</th>
                        <th>Total Files</th>
                        <th>Largest File</th>
                        <th>Files Over 10 MB</th>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td>
                         <a href="<%# Eval("URL") %>"><%# Eval("Name") %></a>
                    </td>
                    <td>
                        <%# Eval("FormattedTotalSize") %>
                    </td>
                    <td>
                        <%# Eval("TotalFiles") %>
                    </td>
                    <td>
                        <%# Eval("FormattedLargestSize") %>
                    </td>
                    <td>
                        <%# Eval("FilesOverSize") %>
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate></table></FooterTemplate>
        </asp:Repeater>
    </form>
</body>
</html>
