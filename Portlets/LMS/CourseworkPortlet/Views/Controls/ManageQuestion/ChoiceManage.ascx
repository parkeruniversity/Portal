<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ChoiceManage.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.ManageQuestion.ChoiceManage" %>
<%@ Register Src="../RichTextEditorModal.ascx" TagName="RichText" TagPrefix="cwk" %>
<%@ Register Src="../RichTextDisplay.ascx" TagName="RichTextDisplay" TagPrefix="cwk" %>
<%@ Register TagPrefix="cmn" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="framework" Assembly="Jenzabar.Portal.Framework.Web" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" %>

<div class="choiceManage">
	<asp:TextBox ID="_txtSimple" runat="server" />
	<cwk:RichTextDisplay id="_richDisplay" runat="server" />
	<cwk:RichText ID="_richText" runat="server" />
	<framework:PortalImageAndHyperLink ID="_pihRich" ImageCategory="PortletIcon"  runat="server" />
</div>