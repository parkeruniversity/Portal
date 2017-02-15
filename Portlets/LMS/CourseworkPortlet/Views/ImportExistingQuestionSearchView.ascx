<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ImportExistingQuestionSearchView.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.ImportExistingQuestionSearchView" %>
<%@ Register TagPrefix="framework" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Register src="../../FileCabinetPortlet/Controls/QuestionSearch.ascx" tagname="QuestionSearch" tagprefix="FC" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register TagPrefix="LMS" TagName="GroupModal" Src="Controls/FileCabinet/ImportQuestionGroup.ascx" %>

<div class="cwkBorderButtonBar top">
    <div class="cwkBorderButtonBar mainScreenLink">
      <framework:PortalImageAndHyperLink ID="lnkBack" TextKey="MSG_CWK_BACK_TO_TESTBUILDER" ImageCategory="PortletIcon" ImageUrl="back-arrow.gif" runat="server" />
    </div>
</div>

<FC:QuestionSearch id="_questionSearch" runat="server" />

<div class="cwkCancelButtonBar">
    <asp:Button ID="_btnCancel" CausesValidation="false" style="float:left;" runat="server" />
    <div style="text-align:right;">
        <asp:HyperLink ID="_hypCancel" runat="server" />
    </div>
</div>
<div class="cwkSaveButtonBar">
    <asp:UpdatePanel id="_up" runat="server">
        <ContentTemplate>
            <asp:Button id="_btnImport" runat="server" />
            <LMS:GroupModal ID="_groupModal" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
</div>

