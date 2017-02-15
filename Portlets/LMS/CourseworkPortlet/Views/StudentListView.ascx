<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="StudentListView.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.StudentListView" EnableViewState="false" %>
<%@ Register TagPrefix="framework" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Register TagPrefix="common" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="cwk" TagName="StudentListGrid" Src="Controls/StudentListGrid.ascx" %>
<div class="cwkBorderButtonBar top" id="divTopBorder" runat="server">
    <div class="cwkBorderButtonBar mainScreenLink">
      <framework:PortalImageAndHyperLink ID="lnkBackToMain" TextKey="TXT_BACK_TO_MAIN_SCREEN" ToolTipKey="TXT_BACK" ImageCategory="PortletIcon" ImageUrl="back-arrow.gif"  runat="server" />
    </div>
</div>
<common:GlobalizedLabel TextKey="HDR_STUDENT_LIST" CssClass="cwkHeader" runat="server" />
<common:GlobalizedLabel TextKey="MSG_CWK_STUDENT_LIST_DESC" CssClass="cwkText" runat="server" ID="_glDesc" />
<cwk:StudentListGrid ID="slgActiveStudents" runat="server" />
<cwk:StudentListGrid ID="slgWithdrawnStudents" runat="server" />
<cwk:StudentListGrid ID="slgGuestStudents" runat="server" />
<asp:Panel runat="server" ID="_panNoStu" CssClass="cwkText"></asp:Panel>