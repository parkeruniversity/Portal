<%@ Register TagPrefix="jenz" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="NewMessageView.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.MessageCenterPortlet.NewMessageView" targetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="txt" Namespace="Jenzabar.Portal.Framework.Web.TextEditor" Assembly="Jenzabar.Portal.Framework.Web" %>
<script language="JavaScript" src="<%= this.ResolveUrl("~/UI/Common/Scripts/jenz.js") %>"></script>
<div class="pSection" xmlns:cmn="http://schemas.jenzabar.com/JICS/CommonControls">
	<asp:ValidationSummary id="valSummary" runat="server" showsummary="True" />
	<fieldset>
		<table>
			<tr>
				<th>
					<cmn:FormLabel id="lblSubject" runat="server" forcontrol="txtSubject" textkey="LBL_SUBJECT" />
				</th>
				<td>
					<asp:TextBox id="txtSubject" runat="server" maxlength="200" />
					<cmn:GlobalizedRequiredFieldValidator id="valSubjectRequired" runat="server" controltovalidate="txtSubject" EnableClientScript="False" ErrorMessageKey="ERR_SUBJECT_REQUIRED" />
				</td>
			</tr>
			<tr>
				<th class="psTitleCell">
					<cmn:GlobalizedLiteral runat="server" textkey="LBL_TO" id="GlobalizedLiteral1" />
				</th>
				<td class="psCell">
					<asp:Literal ID="litAuthorName" Visible="false" Text="" runat="server"></asp:Literal>
					<jenz:PrincipalSelector id="psTo" runat="server" />
				</td>
			</tr>
			<tr>
				<th>
					<cmn:GlobalizedLiteral runat="server" textkey="LBL_ATTACHMENTS" id="GlobalizedLiteral2" />
				</th>
				<td>
					<cmn:MultiFileUpload id="mfuAttachments" runat="server" />
				</td>
			</tr>
			<tr>
				<th>
					<cmn:FormLabel id="lblMessage" runat="server" forcontrol="txtMessage" textkey="LBL_MESSAGE" />
				</th>
				<td>
					<txt:TextEditorControl id="txtMessage" MaxLength="6000" runat="server" />
					<cmn:GlobalizedLinkButton id="lnkQuote" textkey="TXT_QUOTE_ORIGINAL" runat="server" />
					<div style="TEXT-ALIGN:right">
						<asp:Literal ID="litMaxChars" Runat="server" />
					</div>
				</td>
			</tr>
			<tr>
				<th>
					&nbsp;
				</th>
				<td>
					<cmn:GlobalizedButton id="btnSend" runat="server" textkey="TXT_SEND" />
					<cmn:GlobalizedButton id="btnCancel" runat="server" textkey="TXT_CANCEL" causesvalidation="false" />
				</td>
			</tr>
			<tr id="trOriginalMessage" runat="server">
				<th>
					<cmn:FormLabel id="lblOriginalMessage" runat="server" forcontrol="litOriginalMessage" textkey="LBL_ORIGINAL_MESSAGE" />
				</th>
				<td>
					<asp:Literal id="litOriginalMessage" runat="server" />
				</td>
			</tr>
		</table>
	</fieldset>
</div>
