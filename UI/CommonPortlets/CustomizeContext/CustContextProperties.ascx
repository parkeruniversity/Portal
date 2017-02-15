<%@ Control Language="c#" AutoEventWireup="false" Codebehind="CustContextProperties.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.Controls.CustContextProperties" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
	<div class="pSection"><asp:ValidationSummary id="valSummary" runat="server"></asp:ValidationSummary>
		<fieldset>
		<table>
			<tr>
				<th>
					<cmn:FormLabel id="lblContextName" runat="server" forcontrol="txtContextName" />
				</th>
				<td>
					<asp:TextBox id="txtContextName" runat="server" MaxLength="70" Width="500"/>&nbsp;<asp:RequiredFieldValidator id="vldContextName" runat="server" ControlToValidate="txtContextName"></asp:RequiredFieldValidator>
					<asp:RegularExpressionValidator id="vldContextName2" ControlToValidate="txtContextName" runat="server"></asp:RegularExpressionValidator>
				</td>
			</tr>
           <asp:PlaceHolder runat="server" ID="MoxieManagerSettings">
            <tr id="sharedFolderForContext">
                <th>
					<cmn:FormLabel id="lblSharedFolders" runat="server" />
				</th>
                <td><cmn:GlobalizedCheckBox id="chAllowSharedFolderForContext" runat="server" Visible="false" textKey="TXT_ALLOW_SHARED_FOLDER_FOR_THIS_CONTEXT"/><BR><cmn:Hint id="Hint1" runat="server" textKey="MSG_CHANGE_URL_HINT" Visible="false"/></td>    
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td><cmn:GlobalizedCheckBox id="chAllowSharedFolderForSubContext" runat="server" Visible="false" textKey="TXT_ALLOW_SHARED_FOLDER_FOR_SUB_CONTEXT" /><BR><cmn:Hint id="Hint3" runat="server" textKey="MSG_CHANGE_URL_HINT" Visible="False"/></td>
            </tr>
            </asp:PlaceHolder>
			<tr>
				<td>&nbsp;</td>
				<td><cmn:GlobalizedCheckBox id="chkChangeURL" runat="server" textKey="TXT_CHANGE_URL"/><BR><cmn:Hint id="hntChangeURL" runat="server" textKey="MSG_CHANGE_URL_HINT"/><cmn:Hint ID="hntCampGrpAdminOnly" runat="server" TextKey="MSG_CAMPUSGROUP_CONTEXT_CAN_ONLY_BE_CHANGED_BY_ADMIN" Visible="false" /></td>
			</tr>
			<tr id="LogUsageStatsRow" runat="server">
				<th>
					<cmn:FormLabel runat="server" ID="lblUsageStats"  />
				</th>
				<td class="doNotLogUsageStatsColumn">
					<cmn:GlobalizedCheckBox runat="server" ID="chkDoNotLogUsageStats" textKey="MSG_DO_NOT_LOG_STATS"/>
				</td>
			</tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr id="_trHideFromStudentsBefore" runat="server">
                <th>
                    <cmn:FormLabel runat="server" ID="lblHideFromStudents"/>
                </th>
                <td>
                    <asp:Label runat="server" ID="lblHideFromStudentsBefore"/> <cmn:DatePicker ID="_dpHideFromStudentsBefore" runat="server"  />
                </td>
            </tr>
		</table>
		</fieldset>
	</div>
	<div class="pActionsTransp">
	<asp:Button ID="btnSave" Runat="server"></asp:Button>
	</div>
	<asp:PlaceHolder ID="phFileCabinet" Runat="server" Visible="False">
		<cmn:SubHeader id="shFCOptions" TextKey="TXT_FILE_CABINET_OPTIONS" runat="server" />
		<div class="pSection">
			<cmn:GlobalizedLinkButton id="lnkSaveTemplate" runat="server" textkey="TXT_SAVE_COURSE_TEMPLATE_TO_FC" />
		</div>
		<div class="pSection">
			<cmn:GlobalizedLinkButton id="lnkImportTemplate" runat="server" textkey="TXT_IMPORT_COURSE_TEMPLATE_FROM_FC" />
		</div>
	</asp:PlaceHolder>
