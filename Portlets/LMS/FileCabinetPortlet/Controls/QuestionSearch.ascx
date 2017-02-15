<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QuestionSearch.ascx.cs" Inherits="Jenzabar.LMS.Portlets.FileCabinetPortlet.Controls.QuestionSearch" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register src="FCViewHeader.ascx" tagname="FCViewHeader" tagprefix="FC" %>
<%@ Register TagPrefix="LMS" TagName="Modal" Src="../../Common/Controls/Modal.ascx" %>
<%@ Register Src="../../CourseworkPortlet/Views/Controls/QuestionDisplay/QuestionDisplay.ascx" TagName="QuestionDisplay" TagPrefix="JICS" %>

<link rel="Stylesheet" type="text/css" href="Portlets/LMS/CourseworkPortlet/Style/CourseworkPortletStyle.aspx" />


<script language="javascript" src="UI/Common/Scripts/jquery.blockui.js"></script>
<script language="javascript" type="text/javascript">

    function pageLoad() { onLoad(); }
    $(document).ready(function () { onLoad(); });

    function onLoad() {
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(function () {
            $.blockUI({ message: $('#divBlock'), css: { border: 'none', background: 'transparent' }, overlayCSS: { backgroundColor: '#000', opacity: 0.3} });
        });
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
            $.unblockUI();
        });
        HookupCheckBoxes();
    }

    function HookupCheckBoxes() {
        $(".assignmentGrid input:first").click(function () {
            var checkedStatus = this.checked;
            $(".assignmentGrid tbody tr td:first-child input:checkbox").each(function () {
                this.checked = checkedStatus;
            });
        });
    }
    
    function ClearCheckBoxes() {
        $(".assignmentGrid input:checkbox").each(function () {
            this.checked = false;
        });
    }
</script>

<FC:FCViewHeader ID="FCViewHeader1" runat="server" />
<asp:UpdatePanel id="_up" runat="server" UpdateMode="Conditional" >
    <ContentTemplate>
        <div style="margin:10px 0px 20px 20px;">
            <asp:Label ID="_lblSearch" Font-Bold="true" runat="server"></asp:Label>
            <div style="margin:10px 0px 20px 10px; line-height:30px;">
                <div>
                    <asp:Label ID="_lblCriteria" runat="server" />
                    <asp:TextBox ID="_txtCriteria" runat="server" />
                    <asp:Label ID="_lblIn" runat="server" />
                    <asp:DropDownList ID="_ddlTypes" runat="server" />
                    <asp:Label ID="_lblQuestions" runat="server" />
                </div>
                <div>
                    <asp:CheckBox ID="_cbxIncludeChoices" runat="server" />
                </div>
                <div>
                    <asp:Button ID="_btnSearch" runat="server" />
                    &nbsp;
                    <asp:HyperLink ID="_hypBack" runat="server" />
                </div>
            </div>
            <div >
                <asp:GridView ID="_gvResults" CssClass="assignmentGrid itemHover" cellspacing="0" cellpadding="0" border="1"  AutoGenerateColumns="false" runat="server">
                    <Columns>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                <input type="checkbox" id="cbxHeader" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="_cbxQuestion" runat="server" />
                                <asp:HiddenField ID="_hfID" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="_lbtnQuestion" runat="server" />
                                <LMS:Modal id="_modalQuestion" runat="server">
                                    <ContentArea>
                                        <div style="margin:10px;" class="previewContainer">
                                            <JICS:QuestionDisplay id="_qd" runat="server" ></JICS:QuestionDisplay>
                                        </div>
                                    </ContentArea>
                                </LMS:Modal>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Literal ID="_litType" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:HyperLink ID="_hypFolder" runat="server" />
                                <asp:Literal ID="_litFolder" runat="server" />
                                <asp:HyperLink ID="_hypAssignment" runat="server" />
                                <asp:Literal ID="_litAssignment" runat="server" />
                                <asp:HyperLink ID="_hypGroup" runat="server" />
                                <asp:Literal ID="_litGroup" runat="server" />   
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>
<asp:UpdateProgress id="_uProgress" runat="server">
    <ProgressTemplate>
        <div id="divBlock" style="display:none;" >
            <img src="<%=GetAJAXImageUrl()%>" />
        </div>
    </ProgressTemplate>
</asp:UpdateProgress>