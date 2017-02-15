<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LetterGradeConfiguration.ascx.cs" Inherits="Jenzabar.LMS.Portlets.GradebookPortlet.Views.Controls.LetterGradeConfiguration" %>
<%@ Import Namespace="Jenzabar.LMS.Portlets.GradebookPortlet.Entities.LetterGrades" %>
<%@ Register TagPrefix="framework" Assembly="Jenzabar.Portal.Framework.Web" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" %>
<%@ Register TagPrefix="common" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>

<asp:Literal ID="ShowAddModalScript" runat="server" Visible="false">
<script type="text/javascript" language="javascript">
    $(document).ready(function () {
        $("#divAddLetterGrade").show();
    })
</script>
</asp:Literal>

<asp:Literal ID="ShowEditModalScript" runat="server" Visible="false">
<script type="text/javascript" language="javascript">
    $(document).ready(function () {
        $("#divEditLetterGrade").show();
    })
</script>
</asp:Literal>

<script type="text/javascript" language="javascript">
    function EditLetterGrade(editLetterID, letterText, minPercentage) {
        $("#divEditLetterGrade").show();
        CancelImport();
        CancelSave();

        $("#<%= hdnEditSectionLetterID.ClientID %>").val(editLetterID);
        $("#<%= txtEditGradeName.ClientID %>").val(letterText);
        $("#<%= txtEditGradeMinPercentage.ClientID %>").val(minPercentage);
    }

    function CancelEdit() {
        $("#<%= hdnEditSectionLetterID.ClientID %>").val("");
        $("#<%= txtEditGradeName.ClientID %>").val("");
        $("#<%= txtEditGradeMinPercentage.ClientID %>").val("");
        $("#divEditLetterGrade").hide();
        return false;
    }

    function AddLetterGrade() {
        $("#divAddLetterGrade").show();
        CancelEdit();
        CancelImport();
    }

    function CancelSave() {

        $("#<%= txtNewGrade.ClientID %>").val("");
        $("#<%= txtNewGradeMinPercentage.ClientID %>").val("");
        $("#divAddLetterGrade").hide();
    }

    function ImportGrades() {
        $("#divImportGrades").show();
        CancelEdit();
        CancelSave();
    }

    function CancelImport() {
        $("#divImportGrades").hide();
    }

    function ConfirmImport() {
        return confirm('<%= Globalizer.GetString("MSG_LETTER_GRADE_IMPORT_WARNING") %>');
    }

    function ConfirmDelete() {
        return confirm('<%= Globalizer.GetString("MSG_LETTER_GRADE_DELETE_CONFIRMATION") %>');
    }

</script>


<div class="pSection" style="overflow: hidden">
    <div id="rightSide" style="float: right; width: 95%;">
        <div>
            <asp:Label ID="lblLetterGradeConfig" runat="server" CssClass="headerText" />
            <br />
            <asp:Label ID="lblDescription" runat="server" />
            <br />
            <br />
            <asp:Label ID="lblEditInstructions" runat="server" style="font-style: italic" />
            <br />
            <br />
            <div>
                <div style="float: right; width: 75%;">
                    

                    <div class="divLetterGradeConfigAddGrade">
                    <div>
                            <framework:PortalImage ImageCategory="PortletIcon" ImageUrl="add.gif" runat="server" />
                            <asp:Label ID="lblAddGradeLink" runat="server" CssClass="LetterConfigLabelLink" onclick="AddLetterGrade();" />
                        </div>
                    </div>
                    <br />
                    <div>
                      <div>
                            <framework:PortalImage ImageCategory="PortletIcon" ImageUrl="16\font_go.png" runat="server" />
                            <asp:Label ID="lblChangeGradeScale" runat="server" CssClass="LetterConfigLabelLink"
                                onclick="ImportGrades();" />
                        </div>
                    </div>


                </div>
                <div class="LetterGradeList" style="width: 20%; text-align: center;">
                    <asp:Repeater ID="rptGrades" runat="server">
                        <ItemTemplate>
                            <div class="LetterGradeListItem" onclick="EditLetterGrade('<%# ((SessionSectionLetterGrade)Container.DataItem).SectionLetterGradeID %>', '<%# ((SessionSectionLetterGrade)Container.DataItem).LetterText.Replace("'", "\\'") %>', '<%# ((SessionSectionLetterGrade)Container.DataItem).MinimumPercentage %>')">
                                <asp:HiddenField ID="hdnID" runat="server" />
                                <asp:Label ID="lblGradeLetter" runat="server" CssClass="headerText" />                       
                                <asp:Label ID="lblMinGradePercentage" runat="server" />
                                <asp:Label ID="lblTo" runat="server" />
                                <asp:Label ID="lblMaxGradePercentage" runat="server" />
                            </div>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <div class="LetterGradeListItem alt" onclick="EditLetterGrade('<%# ((SessionSectionLetterGrade)Container.DataItem).SectionLetterGradeID %>', '<%# ((SessionSectionLetterGrade)Container.DataItem).LetterText.Replace("'", "\\'") %>', '<%# ((SessionSectionLetterGrade)Container.DataItem).MinimumPercentage %>')">
                                <asp:HiddenField ID="hdnID" runat="server" />
                                <asp:Label ID="lblGradeLetter" runat="server" CssClass="headerText" /> 
                                <asp:Label ID="lblMinGradePercentage" runat="server" />
                                <asp:Label ID="lblTo" runat="server" />
                                <asp:Label ID="lblMaxGradePercentage" runat="server" />
                            </div>
                        </AlternatingItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </div>
    <div id="leftSide" style="width: 5%;">
        <framework:PortalImage ImageCategory="PortletIcon" ImageUrl="32/font.png" runat="server" />
    </div>
</div>
<div id="divEditLetterGrade" class="LetterConfigModalPopup" style="display: none;">
    <asp:HiddenField ID="hdnEditSectionLetterID" runat="server" />
    <table cellpadding="5" cellspacing="0" width="100%">
        <tr class="LetterConfigModalPopupHeader">
            <td>
                <asp:Label ID="lblEditGrade" runat="server" CssClass="headerText" />
            </td>
            <td align="right">
                <framework:PortalImage ImageCategory="PortletIcon" ImageUrl="close_me.gif" runat="server"
                    onclick="CancelEdit();" />
            </td>
        </tr>
        <tr>
            <td>
                <span id="EditErrorMessageSpan" runat="server" class="ValidationError"></span>
            </td>
        </tr>
        <tr class="LetterConfigModalPopupBody">
            <td>
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="lblGradeName" runat="server" />
                        </td>
                        <td>
                            <asp:TextBox ID="txtEditGradeName" runat="server" MaxLength="10" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblThisGradeStartsAtEdit" runat="server" />
                        </td>
                        <td>
                            <common:NumberValidator ControlToValidate="txtEditGradeMinPercentage" DecimalPlaces="2" runat="server" />
                            <asp:TextBox ID="txtEditGradeMinPercentage" runat="server" />
                            %
                        </td>
                    </tr>
                </table>
                <br />
                <br />
                <asp:Button ID="btnSaveEditGrade" runat="server" />
                <asp:Button ID="btnCancelEditGrade" runat="server" OnClientClick="CancelEdit(); return false;" />
                <br />
                <br />
                <framework:PortalImage ImageCategory="PortletIcon" ImageUrl="delete.gif" runat="server" />
                <asp:LinkButton ID="btnDeleteGrade" runat="server" OnClientClick="return ConfirmDelete();" />
                <br />
                <br />
            </td>
            <td>
            </td>
        </tr>
    </table>
</div>
<div id="divAddLetterGrade" class="LetterConfigModalPopup" style="display: none;">
    <table cellpadding="5" cellspacing="0" width="100%">
        <tr class="LetterConfigModalPopupHeader">
            <td>
                <asp:Label ID="lblAddGrade" runat="server" CssClass="headerText" />
            </td>
            <td align="right">
                <framework:PortalImage ImageCategory="PortletIcon" ImageUrl="close_me.gif" runat="server"
                    onclick="CancelSave();" />
            </td>
        </tr>
        <tr>
            <td>
                <span id="AddErrorMessageSpan" runat="server" class="ValidationError"></span>
            </td>
        </tr>
        <tr class="LetterConfigModalPopupBody">
            <td>
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="lblNewGradeName" runat="server" />
                        </td>
                        <td>
                            <asp:TextBox ID="txtNewGrade" runat="server" MaxLength="10" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblThisGradeStartsAtSave" runat="server" />
                        </td>
                        <td>
                            <common:NumberValidator ControlToValidate="txtNewGradeMinPercentage" DecimalPlaces="2" runat="server" />
                            <asp:TextBox ID="txtNewGradeMinPercentage" runat="server" />
                            %
                        </td>
                    </tr>
                </table>
                <br />
                <asp:Button ID="btnSaveNewGrade" runat="server" />
                <asp:Button ID="btnCancelNewGrade" runat="server" OnClientClick="CancelSave(); return false;" />
                <br />
            </td>
            <td>
            </td>
        </tr>
    </table>
</div>
<div id="divImportGrades" class="LetterConfigModalPopup" style="display: none;">
    <table cellpadding="5" cellspacing="0" width="100%">
        <tr class="LetterConfigModalPopupHeader">
            <td>
                <asp:Label ID="lblChooseGradeScale" runat="server" CssClass="headerText" />
            </td>
            <td align="right">
                <framework:PortalImage ImageCategory="PortletIcon" ImageUrl="close_me.gif" runat="server"
                    onclick="CancelImport();" />
            </td>
        </tr>
        <tr class="LetterConfigModalPopupBody">
            <td>
                <asp:Label ID="lblImportInstructions" runat="server" />
                <br />
                <br />
                <asp:DropDownList ID="ddlGradeTemplates" runat="server" />
                <br />
                <br />
                <asp:Button ID="btnImportGrades" runat="server" OnClientClick="return ConfirmImport();" />
                <asp:Button ID="btnCancelImport" runat="server" OnClientClick="CancelImport(); return false;" />
                <br />
                <br />
            </td>
            <td>
            </td>
        </tr>
    </table>
</div>