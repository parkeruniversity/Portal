<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AssignmentFileUploader.ascx.cs"
    Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.AssignmentFileUploader" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="EditFilePopup.ascx" TagName="EditFilePopup" TagPrefix="CWK" %>
<script type="text/javascript" language="javascript">
    function modalCloseClick() {
        $find("modalPopupBehavior").hide();
        return false;
    }
    function modalCancel() {
        $('#<%= txtFileLabel.ClientID %>').val("");
        $('#<%= txtFileDescription.ClientID %>').val("");
        $('#<%= lblErrMsg.ClientID %>').text("");
        var container = document.getElementById('_fileContainer');
        container.innerHTML = container.innerHTML;
    }
</script>
<asp:UpdatePanel ID="upFileUploadList" runat="server">
    <ContentTemplate>
        <asp:Repeater ID="rptUploadedFile" runat="server">
            <ItemTemplate>
				<div  class="fileDisplay">
					<asp:HyperLink ID="_hyp" runat="server" /> (<asp:Literal ID="_lit" runat="server" />)
					<asp:ImageButton ID="btnEdit" runat="server" />
					<asp:ImageButton ID="btnDelete" runat="server" />
					<div>
						<asp:Literal ID="_litDescrip" runat="server" />
					</div>
				</div>
                <asp:Panel ID="pnlEditFile" runat="server" CssClass="modalDiv">
                    <div id="innerModal">
                        <CWK:EditFilePopup ID="EditFilePopup" runat="server" />
                    </div>
                </asp:Panel>
                <asp:ModalPopupExtender ID="modalEditFile" runat="server" TargetControlID="btnEdit"
                    PopupControlID="pnlEditFile" BackgroundCssClass="modalPopup" />
            </ItemTemplate>
        </asp:Repeater>
    </ContentTemplate>
</asp:UpdatePanel>
<br />
<asp:Panel ID="_panFileContainer" runat="server">
	<asp:Image ID="imgAdd" runat="server" />
	<asp:HyperLink ID="lnkAddFile" runat="server" CssClass="link" />

	<asp:ModalPopupExtender ID="modalAddFile" BehaviorID="modalPopupBehavior" runat="server"
		TargetControlID="lnkAddFile" PopupControlID="pnlAddFile" CancelControlID="btnCancel" BackgroundCssClass="modalPopup" />
	<asp:Panel ID="pnlAddFile" runat="server" CssClass="modalDiv" style="display:none;">
		<div id="innerModal">
			<div class="uploadFilePanelHeader">
				<div class="closeIcon">
					<asp:Image ID="imgClose" runat="server" onclick="modalCloseClick()" />
				</div>
				<div>
					<asp:Label ID="lblUploadFile" runat="server" CssClass="headerText" />
				</div>
			</div>
			<table>
				<tr>
					<td colspan="2"><asp:Label ID="lblErrMsg" runat="server" CssClass="ValidationError" /></td>
				</tr>
				<tr>
					<td valign="top" align="right">
						<asp:Label ID="lblFile" runat="server" />
					</td>
					<td>
						<div id="_fileContainer"><asp:FileUpload ID="fileUploader" runat="server" /></div>
					</td>
				</tr>
				<tr>
					<td valign="top" align="right">
						<asp:Label ID="lblFileLabel" runat="server" />
					</td>
					<td>
						<asp:TextBox ID="txtFileLabel" runat="server" Width="210" MaxLength="100" />
					</td>
				</tr>
				<tr>
					<td valign="top" align="right">
						<asp:Label ID="lblFileDescription" runat="server" />
					</td>
					<td>
						<asp:TextBox ID="txtFileDescription" runat="server" TextMode="MultiLine" Height="40px"
							Width="210px" MaxLength="2000" />
					</td>
				</tr>
				<tr>
					<td>
					</td>
					<td>
						<div>
							<asp:Button ID="btnAddFile" runat="server" />
							<asp:Button ID="btnCancel" runat="server" />
						</div>
					</td>
				</tr>
			</table>
		</div>
	</asp:Panel>
</asp:Panel>