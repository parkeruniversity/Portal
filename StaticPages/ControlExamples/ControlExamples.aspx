<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ControlExamples.aspx.cs" Inherits="Jenzabar.Portal.Web.StaticPages.ControlExamples.ControlExamples" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register TagPrefix="jics" Namespace="Jenzabar.Portal.Web.UI.Controls" Assembly="Jenzabar.Portal.Web" %>
<%@ Register TagPrefix="jics" Namespace="Jenzabar.ICS.Web.Portlets.LoginPortlet" Assembly="Portlet.Login" %>
<%@ Register TagPrefix="jics" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Register TagPrefix="jics" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="jics" TagName="Head" Src="~/UI/Controls/Head.ascx" %>
<%@ Register TagPrefix="jics" TagName="ThemeHead" Src="~/UI/Controls/ThemeHead.ascx" %>
<%@ Register TagPrefix="jics" TagName="CustomHead" Src="~/ClientConfig/Controls/CustomHead.ascx" %>
<%@ Register TagPrefix="jics" TagName="CustomBody" Src="~/ClientConfig/Controls/CustomBody.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JICS Control Examples</title>
    <asp:Literal id="BasePath" runat="Server" enableviewstate="false" />
    <jics:Head id="head" runat="server" />
    <jics:CustomHead id="customHead" runat="server" />
    <jics:ThemeHead id="themeHead" runat="server" />
    <style type="text/css" media="all" id="printStyleSheet" visible="false" runat="server">@import url( UI/Common/Styles/print.css );</style>
</head>
<body>
    <form id="form1" runat="server" action="StaticPages/ControlExamples/ControlExamples.aspx">
            
            <div class="pSection">
                <a href="StaticPages/DeveloperTools.aspx">Back to Developer Tools</a>
                <h3>JICS Control Examples</h3>
                <ul>
                    <li><a href="StaticPages/ControlExamples/ControlExamples.aspx#DI">Display Indicator</a></li>
                    <li><a href="StaticPages/ControlExamples/ControlExamples.aspx#HINT">Hint</a></li>
                    <li><a href="StaticPages/ControlExamples/ControlExamples.aspx#PAGE">Paging</a></li>
                    <li><a href="StaticPages/ControlExamples/ControlExamples.aspx#TBE">Text Box Editor</a></li>
                </ul>
            </div>
            <br />
            
            <a name="DI"></a>
            <h4>Display Indicator</h4>
            <div class="pSection">
                <p><b>Location:</b> Jenzabar.Common.Web.UI.Controls.DisplayIndicator, Jenzabar.Common.dll</p>
                <p><b>Usage:</b> Control that allows the user to pick a start and end date.</p>
                <p><b>Example:</b></p>
                <div>
                    <jics:DisplayIndicator ID="diCtl" runat="server" /><br />
                </div>
            </div>
            
             <a name="HINT"></a>
            <h4>Hint</h4>
            <div class="pSection">
                <p><b>Location:</b> Jenzabar.Common.Web.UI.Controls.Hint, Jenzabar.Common.dll</p>
                <p><b>Usage:</b> Provides a consistent look for hint text.</p>
                <p><b>Example:</b></p>
                <div>
                    <jics:Hint ID="hintCtl" runat="server" /> 
                </div>
            </div>
            
             <a name="PAGE"></a>
            <h4>Paging</h4>
            <div class="pSection">
                <p><b>Location:</b> Jenzabar.Portal.Web.UI.Controls.Paging, Jenzabar.Portal.Web.dll</p>
                <p><b>Usage:</b> Provides a paging bar that can be used with other controls.  The Paging control will track what the "current" page is.</p>
                <p><b>Example:</b></p>
                <div>
                    <jics:Paging ID="pageCtl" runat="server" />
                </div>
            </div>
            
             <a name="TBE"></a>
            <h4>Text Box Editor</h4>
            <div class="pSection">
                <p><b>Location:</b> Jenzabar.Common.Web.UI.Controls.TextBoxEditor, Jenzabar.Common.dll</p>
                <p><b>Usage:</b> A WYSIWYG text editor.</p>
                <p><b>Example:</b></p>
                <div>
                    <jics:TextBoxEditor ID="tbeCtl" runat="server" />
                </div>
            </div>
       
           
    </form>
</body>
</html>
