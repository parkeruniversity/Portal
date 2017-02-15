<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EquationQuestionDisplay.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.QuestionDisplay.EquationQuestionDisplay" %>
<%@ Register TagPrefix="framework" Assembly="Jenzabar.Portal.Framework.Web" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" %>
<asp:PlaceHolder ID="_phEquation" runat="server" />
 <framework:PortalImageAndHyperLink ID="_piEquation" ImageCategory="PortletIcon"  runat="server" />
<asp:PlaceHolder ID="_phEditorJS" runat="server" />
<asp:Button ID="_btnHidden" style="display:none" runat="server" />
