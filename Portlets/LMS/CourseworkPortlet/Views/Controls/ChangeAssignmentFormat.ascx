<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ChangeAssignmentFormat.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.ChangeAssignmentFormat" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>
<asp:UpdatePanel ID="upChangeFormat" runat="server">
    <ContentTemplate>
        <asp:ModalPopupExtender ID="modalFormatChange" runat="server" TargetControlID="lnkChangeFormat"
            PopupControlID="pnlModalPopup" BackgroundCssClass="modalPopup" BehaviorID="modalChangeFormatBehavior"
            CancelControlID="lnkKeepCurrentFormat" />
        <asp:HyperLink ID="lnkChangeFormat" runat="server" CssClass="link" />
        <asp:Panel ID="pnlModalPopup" runat="server" Style="display: none;">
            <div class="assignmentFormatMainDiv">
                <asp:Label ID="lblTheCurrentFormat" runat="server" />
                <br />
                <br />
                <div class="assignmentFormatContainer">
                    <div class="assignmentFormatHighlightContainer">
                        <div class="assignmentFormatCurrent selectAssignment" runat="server" id="_divCurrent">
                            <asp:Label ID="lblCurrentFormat" CssClass="selectAssignmentHeader" runat="server"  />
                            <asp:Label ID="lblCurrentFormatDescription" runat="server" />
                        </div>
                    </div>
                </div>
                <br />
                <br />
                <asp:Label ID="lblSelectNewFormat" runat="server" />
                <br />
                <br />
                <div class="assignmentFormatContainer">
                    <div class="assignmentFormatHighlightContainer">
                        <asp:LinkButton ID="lnkOfflineFormat" runat="server" CssClass="selectAssignment selectOffline" CausesValidation="false">
                            <asp:Label ID="lblOfflineFormat" runat="server" CssClass="selectAssignmentHeader" />
                            <asp:Label ID="lblOfflineDescription" runat="server" />
                        </asp:LinkButton>
                        <asp:LinkButton ID="lnkOnlineFormat" runat="server" CssClass="selectAssignment selectOnline" CausesValidation="false">
                            <asp:Label ID="lblOnlineFormat" runat="server" CssClass="selectAssignmentHeader" />
                            <asp:Label ID="lblOnlineDescription" runat="server" />
                        </asp:LinkButton>
                        <asp:LinkButton ID="lnkUploadFormat" runat="server" CssClass="selectAssignment selectUpload" CausesValidation="false">
                            <asp:Label ID="lblUploadFormat" runat="server" CssClass="selectAssignmentHeader" />
                            <asp:Label ID="lblUploadDescription" runat="server" />
                        </asp:LinkButton>
                    </div>
                </div>
                <br />
                <br />
                <asp:HyperLink ID="lnkKeepCurrentFormat" runat="server" CssClass="link" />
            </div>
            <asp:ModalPopupExtender ID="modalFormatWarning" runat="server" BackgroundCssClass="modalPopup" TargetControlID="hdnModalFormatWarning"  PopupControlID="pnlModalWarning" BehaviorID="modalChangeFormatWarningBehavior" CancelControlID="lnkKeepFormat" />
            <asp:HiddenField ID="hdnModalFormatWarning" runat="server" />
        </asp:Panel>
        <asp:Panel ID="pnlModalWarning" runat="server" style="display: none;">
            <div class="formatChangeWarningPanel">
                <div class="formatChangeWarning">
                    <div class="formatChangeFormatImage">
                        <img id="imgWarning" runat="server" />
                    </div>
                    <div style="overflow: hidden; display: block;">
                        <asp:Label ID="lblFormatChangeWarning" runat="server" />
                        <br />
                        <div class="formatChangeWarning">
                           <div class="formatChangeFormatImage">
                                <img id="imgOldFormat" runat="server" />
                                <img id="imgFormatChangeArrow" runat="server" class="changeDivider" />
                                <img id="imgNewFormat" runat="server" />
                            </div>
                            <div>
                                <asp:Label ID="lblAreYouSure" runat="server" />
                                <br />
                                <div class="fromFormatToFormat">
                                  <asp:Label ID="lblFromFormatToFormat" runat="server" />
                                </div>                            
                            </div>
                        </div>
                        <asp:Button ID="btnChangeFormat" runat="server" Width="240" /><br /><br />
                        <asp:HyperLink ID="lnkKeepFormat" runat="server" CssClass="link" />
                    </div>
                </div>
                <br />                
            </div>
        </asp:Panel>
    </ContentTemplate>
</asp:UpdatePanel>
