<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SelectAssignmentFormat.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.SelectAssignmentFormat" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>
<asp:ModalPopupExtender ID="modalFormatSelection" runat="server" TargetControlID="lnkShowModal" PopupControlID="pnlModalPopup" OkControlID="btnModalDone" BackgroundCssClass="modalPopup" />
<asp:HyperLink ID="lnkShowModal" runat="server" Text="Show Popup" CssClass="assignmentFormatSelectionHiddenControl" />
<asp:Panel ID="pnlModalPopup" runat="server" Style="display: none;" Visible="false">
    <div class="assignmentFormatMainDiv">
        <div class="assignmentFormatHeader">
            <asp:Label ID="lblStepOne" runat="server" CssClass="assignmentFormatStepOne" />
            <div class="pSection">
                <asp:Label ID="lblHowStudentsWillCompleteAssignment" runat="server" CssClass="assignmentFormatHelpTxt" />
            </div>
        </div>
        <div class="assignmentFormatContainer">
            <div class="assignmentFormatHighlightContainer">
                <asp:LinkButton ID="lnkOnlineFormat" runat="server" CssClass="selectAssignment selectOnline" CausesValidation="false">
                        <asp:Label ID="lblOnlineFormat" CssClass="selectAssignmentHeader" runat="server"/>
                        <asp:Label ID="lblOnlineDescription" runat="server" />
                </asp:LinkButton>
                <asp:LinkButton ID="lnkUploadFormat" runat="server" CssClass="selectAssignment selectUpload" CausesValidation="false">
                       <asp:Label ID="lblUploadFormat" runat="server" CssClass="selectAssignmentHeader" />
                       <asp:Label ID="lblUploadDescription" runat="server" />
                </asp:LinkButton>
            </div>
            <div class="pSection">
                <asp:Label ID="lblOtherFormats" runat="server" CssClass="assignmentFormatHelpTxt" />
            </div>
            <div class="assignmentFormatHighlightContainer">
                <asp:LinkButton ID="lnkOfflineFormat" runat="server" CssClass="selectAssignment selectOffline" CausesValidation="false">
                    <asp:Label ID="lblOfflineFormat" runat="server" CssClass="selectAssignmentHeader" />
                    <asp:Label ID="lblOfflineDescription" runat="server" />
                </asp:LinkButton>
            </div>
        </div>
        <div class="lineSeparator" id="divImportSep" runat="server"></div>
        <div class="assignmentFormatSection" id="divImport" runat="server">
            <asp:Label ID="lblImportExisitingAssignmentInfo" runat="server" />
        </div>        
        <div class="lineSeparator"></div>
        <div class="assignmentFormatSection">
            <asp:Label ID="lblDontWantToMakeAssignment" runat="server" CssClass="headerText" />
            <asp:Label ID="lblGoBackToMainScreen" runat="server" />
        </div>
        <asp:Button ID="btnModalDone" runat="server" CssClass="assignmentFormatSelectionHiddenControl" />       
    </div>
</asp:Panel>