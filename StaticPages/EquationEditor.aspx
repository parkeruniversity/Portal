<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" CodeBehind="EquationEditor.aspx.cs" Inherits="Jenzabar.Portal.Web.StaticPages.EquationEditor" %>
<%@ Register TagPrefix="jics" TagName="Head" Src="~\UI\Controls\Head.ascx" %>
<%@ Register TagPrefix="jics" tagname="EqEditor" src="~\UI\Controls\EquationEditor.ascx" %>
<%@ Register TagPrefix="jics" tagname="EqDisplay" src="~\UI\Controls\EquationDisplay.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Equation Editor</title>
    <asp:Literal id="BasePath" runat="Server" enableviewstate="false" />
    <jics:Head id="head" runat="server" />
</head>
<body>
    <form id="form1" action="StaticPages/EquationEditor.aspx" runat="server">
        <div style="margin: 10px 5px 10px 5px">
            <jics:EqEditor id="eqEditor" runat="server" />
            <div style="margin: 20px 0px 20px 0px;">
                <asp:Literal ID="litEquationInfo" runat="server" />
            </div>
            <jics:EqDisplay id="eqDisplay" runat="server" />
        </div>
    </form>
</body>
</html>
