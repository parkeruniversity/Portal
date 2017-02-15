<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LetterGradeConfigurationView.ascx.cs" Inherits="Jenzabar.LMS.Portlets.GradebookPortlet.Views.LetterGradeConfigurationView" %>
<%@ Register TagPrefix="portlet" TagName="NavBar" Src="Controls/NavigationBar.ascx" %>
<%@ Register TagPrefix="portlet" TagName="LGConfig" Src="Controls/LetterGradeConfiguration.ascx" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register TagPrefix="framework" Assembly="Jenzabar.Portal.Framework.Web" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" %>

<div class="letterGradeScreen">
    <portlet:NavBar ID="NavBar" runat="server" />
    <br />
    <framework:PortletFeedback ID="Feedback" runat="server" />
    <portlet:LGConfig ID="LGConfig" runat="server" />
</div>
