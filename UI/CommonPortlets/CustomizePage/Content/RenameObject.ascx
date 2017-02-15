<%@ Control Language="c#" AutoEventWireup="false" Codebehind="RenameObject.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.Controls.RenameObject" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>

	<div class="pSection">
		<cmn:Subheader id="shHeader" runat="server" />
		<asp:ValidationSummary ID="valSummary" Runat="server" />
		<fieldset>
			<table>
				<tr>
					<th>
						<cmn:GlobalizedLiteral id="litName" runat="server" textKey="TXT_NAME" />
					</th>
					<td>
						<asp:TextBox id="txtName" runat="server" MaxLength="50" />
						<asp:RequiredFieldValidator ID="vldName" Text="*" ControlToValidate="txtName" Runat="server" />
						<asp:RegularExpressionValidator ID="vldName2" Text="*" ControlToValidate="txtName" Runat="server" />
					</td>
				</tr>
		<tr>
			<th>&nbsp;</th>
			<td><cmn:GlobalizedButton id="btnConfirm" textKey="TXT_RENAME" runat="server" />
				&nbsp;
				<cmn:GlobalizedButton id="btnCancel" textKey="TXT_CANCEL" CausesValidation="False" runat="server" />
			</td>
		</tr>
		</table>
		</fieldset>
	</div>
