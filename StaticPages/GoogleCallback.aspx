<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GoogleCallback.aspx.cs" Inherits="Jenzabar.Portal.Web.StaticPages.GoogleCallback" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label runat="server" ID="GoogleData"></asp:Label>
        <br/>
        <asp:Button runat="server" ID="Authorize" Text="Authorize" OnClick="Authorize_OnClick" />
        <br/>
        <asp:Button runat="server" ID="GetToken" Text="Get Token" OnClick="GetToken_OnClick" />
        <br/>
        <asp:Button runat="server" ID="RefreshToken" Text="Refresh Token" OnClick="RefreshToken_OnClick" />
    </div>
    </form>
</body>
</html>
