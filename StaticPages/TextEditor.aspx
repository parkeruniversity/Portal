<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TextEditor.aspx.cs" Inherits="Jenzabar.Portal.Web.StaticPages.TextEditor" %>
<%@ Register TagPrefix="jics" TagName="Head" Src="~\UI\Controls\Head.ascx" %>
<%@ Register TagPrefix="jics" tagname="TextEditor" src="~\UI\Controls\TextEditor.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>JICS Text Editor</title>
    <asp:Literal id="BasePath" runat="Server" />
    <jics:Head id="head" runat="server" />
</head>
<body>
    <form id="form1" action="StaticPages/TextEditor.aspx" runat="server">
        <div class="pSection">
            <div id="Content" runat="server"></div>
            <jics:TextEditor id="Editor" runat="server" />
            <asp:Button ID="Save" runat="server" Text="Save" />
            <asp:Button ID="Clear" runat="server" Text="Clear" />
        </div>
    </form>
</body>
</html>
