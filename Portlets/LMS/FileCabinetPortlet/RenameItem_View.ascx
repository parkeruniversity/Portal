<%@ Control Language="c#" AutoEventWireup="false" Codebehind="RenameItem_View.ascx.cs" Inherits="Jenzabar.LMS.Portlets.FileCabinetPortlet.RenameItem_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<cmn:SubHeader id="hdr" runat="server" />
<div class="pSection">
	<cmn:GlobalizedValidationSummary id="valSummary" runat="server" /> 
	<fieldset>
		<table>
			<tr>
				<th><cmn:formlabel id="lblName" ForControl="txtName" TextKey="TXT_NAME" runat="server" /></th>
				<td>
					<asp:TextBox id="txtName" runat="server" />
					<cmn:GlobalizedRequiredFieldValidator id="valName" runat="server" ControlToValidate="txtName" ErrorMessageKey="ERR_NAME_IS_REQUIRED" />
				</td>
			</tr>
			<tr>
				<th>&nbsp;</th>
				<td>
					<cmn:GlobalizedButton id="btnSave" textkey="TXT_SAVE" runat="server" />
					<cmn:GlobalizedButton id="btnCancel" textkey="TXT_CANCEL" causesvalidation="false" runat="server" />
				</td>
			</tr>
		</table>
	</fieldset>
</div>
