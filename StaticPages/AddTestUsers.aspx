<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddTestUsers.aspx.cs" Inherits="Jenzabar.Portal.Web.StaticPages.AddTestUsers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Create test users
        <br/>
        How many: <asp:TextBox runat="server" ID="txtNumberOfUsers"/>
        <br/>
        Prefix: <asp:TextBox runat="server" ID="txtPrefix"/>
        <br/>
        <asp:Button runat="server" ID="btnCreateUsers" Text="Create Test Users" OnClick="btnCreateUsers_Click"/>
        <br/>
        <br/>
        <br/>
        <div runat="server" ID="divSuccess" Visible="False">
            Finished!
        </div>
        <div runat="server" ID="divError" Visible="False">
            There was an error:
            <br/>
            <span runat="server" ID="spanErrorMessage"></span>
        </div>
    </div>
    </form>
</body>
</html>
