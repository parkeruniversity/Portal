<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ImportExistingAssignmentView.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.ImportExistingAssignmentView" EnableViewState="false" %>
<%@ Register TagPrefix="asp" Assembly="System.Web.Extensions" Namespace="System.Web.UI" %>
<%@ Register TagPrefix="framework" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Register TagPrefix="common" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register Src="Controls/FileCabinet/ExistingAssignmentGrid.ascx" TagName="FileCabinetAssignmentGrid" TagPrefix="JICS" %>
<%@ Register assembly="System.Web.Extensions" namespace="System.Web.UI" tagprefix="asp" %>
<%@ Register src="../../FileCabinetPortlet/Controls/FCViewHeader.ascx" tagname="FCViewHeader" tagprefix="FC" %>
<%@ Register TagPrefix="JICS" Namespace="Jenzabar.Portal.Web.UI.Controls" Assembly="Jenzabar.Portal.Web" %>

<script language="javascript" type="text/javascript">
    $(document).ready(function () { HookupCheckBoxes(); });

    function HookupCheckBoxes() {
        $(".assignmentGrid tbody th:first input:checkbox").click(function () {
            var checkedStatus = this.checked;
            $(".assignmentGrid tbody tr td:first-child input:checkbox").each(function () {
                this.checked = checkedStatus;
            });
        });
    }
</script>

<div class="cwkBorderButtonBar top" id="divTopBorder" runat="server">
    <div class="cwkBorderButtonBar mainScreenLink">
      <framework:PortalImageAndHyperLink ID="lnkBack" TextKey="MSG_CWK_BACK_TO_ASSIGNMENTDETAIL" ImageCategory="PortletIcon" ImageUrl="back-arrow.gif" runat="server" />
    </div>
</div>
<FC:FCViewHeader ID="FCViewHeader1" runat="server" />
<div class="assignmentTypePanel">
    <span id="spnTextShow" runat="server"></span>
    <select id="selFormat" runat="server" onchange="ImportExistingAssignmentView.selFormat_OnChange.call(this);"></select>
    <span id="spnTextAssignments" runat="server"></span>
</div>
<div style="margin:20px; width:80%;">
    <div id="divFolderInfo" style="margin-bottom:4px;" runat="server">
        <framework:PortalImageAndHyperLink id="lnkUp" TextKey="TXT_UP_ONE_LEVEL" ImageCategory="PortletIcon" ImageUrl="up_one_level.gif" runat="server" style="float:right;" />
        <a href="" id="lnkFileCabinet" runat="server"></a>
        <span id="divFolder" runat="server" ></span>
    </div>
    <asp:UpdatePanel ID="up" runat="server" UpdateMode="Conditional">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnImport" />
        </Triggers>
        <ContentTemplate>
            <JICS:FileCabinetAssignmentGrid id="grid" runat="server"></JICS:FileCabinetAssignmentGrid>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div style="margin-top:10px;">
        <JICS:Paging id="_paging" runat="server" />
    </div>
</div>
<div class="detailAction">
    <div class="buttons">
        <input id="btnImport" runat="server" type="button" onclick="ImportExistingAssignmentView.btnImport__Click();return;" />
    </div>
    <div class="detailActionInfo">
        <input id="btnCancel" runat="server" type="button" onclick="ImportExistingAssignmentView.btnCancel__Click();return;" />
    </div>
</div>

