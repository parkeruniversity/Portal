<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ImportExistingQuestionView.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.ImportExistingQuestionView" EnableViewState="false" %>
<%@ Register TagPrefix="framework" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Register TagPrefix="common" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="asp" Assembly="System.Web.Extensions" Namespace="System.Web.UI" %>
<%@ Register Src="Controls/FileCabinet/ExistingAssignmentGrid.ascx" TagName="ExistingAssignmentGrid" TagPrefix="JICS" %>
<%@ Register Src="Controls/QuestionDisplay/QuestionDisplay.ascx" TagName="QuestionDisplay" TagPrefix="JICS" %>
<%@ Register src="../../FileCabinetPortlet/Controls/FCViewHeader.ascx" tagname="FCViewHeader" tagprefix="FC" %>
<%@ Register TagPrefix="LMS" TagName="Modal" Src="../../Common/Controls/Modal.ascx" %>
<%@ Register TagPrefix="LMS" TagName="GroupModal" Src="Controls/FileCabinet/ImportQuestionGroup.ascx" %>
<%@ Register TagPrefix="JICS" Namespace="Jenzabar.Portal.Web.UI.Controls" Assembly="Jenzabar.Portal.Web" %>

<script language="javascript" type="text/javascript">
    $(document).ready(function () { onLoad(); });

    function onLoad() {
        HookupCheckBoxes();
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
            HookupCheckBoxes();
        });
    }

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
      <framework:PortalImageAndHyperLink ID="lnkBack" TextKey="MSG_CWK_BACK_TO_TESTBUILDER" ImageCategory="PortletIcon" ImageUrl="back-arrow.gif" runat="server" />
    </div>
</div>

<FC:FCViewHeader ID="FCViewHeader1" runat="server" />

<div style="margin:20px 20px 0px 20px;">
    <img id="imgOnline" runat="server" src="" alt=""/>
    <span id="spnTextImport" runat="server"></span>
</div>
<div style="margin:10px 20px 10px 20px;">
    <asp:Label ID="_lblSearchBefore" runat="server" />
    <asp:HyperLink ID="_hypSearch" runat="server" />
    <asp:Label ID="_lblSearchAfter" runat="server" />
</div>
<div style="margin:20px; width:80%;">
    <div style="margin-bottom:3px;">
        <framework:PortalImageAndHyperLink id="lnkUp" TextKey="TXT_UP_ONE_LEVEL" ImageCategory="PortletIcon" ImageUrl="up_one_level.gif" runat="server" Visible="false" style="float:right;" />
        <div id="divFolder" runat="server">
            &nbsp;
        </div>
    </div>

    <JICS:ExistingAssignmentGrid id="grdAssignment" runat="server" Visible="false"></JICS:ExistingAssignmentGrid>
    <asp:UpdatePanel ID="up" runat="server">
        <ContentTemplate>
            <asp:GridView runat="server" id="grdGroup" Visible="false" Width="100%"  CssClass="assignmentGrid itemHover" AlternatingRowStyle-CssClass="altAssignmentGrid" HeaderStyle-CssClass="headerAssignmentGrid"  CellPadding="0" CellSpacing="0" AutoGenerateColumns="False" EnableViewState="false" >
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <input type="checkbox" id="chkSelect" runat="server" />
                        </ItemTemplate>
                        <HeaderTemplate>
                            <input type="checkbox" id="chkHeader" />
                        </HeaderTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="50%">
                        <ItemTemplate>
                            <a href="" id="lnkGroup" runat="server"></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="50%">
                        <ItemTemplate>
                        
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <div style="margin:20px;">
                        <div>There are no sections in this assignment</div>
                    </div>
                </EmptyDataTemplate>
            </asp:GridView>

            <asp:GridView runat="server" id="grdQuestion" Visible="false" Width="100%"  CssClass="assignmentGrid itemHover" AlternatingRowStyle-CssClass="altAssignmentGrid" HeaderStyle-CssClass="headerAssignmentGrid"  CellPadding="0" CellSpacing="0" AutoGenerateColumns="False" EnableViewState="false" >
                <Columns>
                    <asp:TemplateField HeaderStyle-Width="1px">
                        <ItemTemplate>
                            <input type="checkbox" id="chkSelect" runat="server" />
                        </ItemTemplate>
                        <HeaderTemplate>
                            <input type="checkbox" id="chkHeader" />
                        </HeaderTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="_lbtnQuestion" runat="server" />
                            <div class="previewContainer fcPreview">
                                <LMS:Modal id="_modalQuestion" runat="server">
                                    <ContentArea>
                                            <JICS:QuestionDisplay id="_qd" runat="server" ></JICS:QuestionDisplay>
                                    </ContentArea>
                                </LMS:Modal>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate></ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <div style="margin:20px;">
                        <div>There are no questions in this section.</div>
                    </div>
                </EmptyDataTemplate>
            </asp:GridView>

        </ContentTemplate>
    </asp:UpdatePanel>

    <div style="margin-top:10px;">
        <JICS:Paging id="_paging" runat="server" />
    </div>
</div>
<div class="cwkCancelButtonBar">
    <asp:Button ID="_btnCancel" CausesValidation="false" style="float:left;" runat="server" />
    <div style="text-align:right;">
        <asp:HyperLink ID="_hypSearchQuestions" runat="server" />
    </div>
</div>
<div class="cwkSaveButtonBar">
    <asp:UpdatePanel id="_upSave" runat="server">
        <ContentTemplate>
            <asp:Button id="_btnImport" runat="server" />
            <LMS:GroupModal ID="_groupModal" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
</div>





