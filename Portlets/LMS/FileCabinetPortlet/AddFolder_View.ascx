<%@ Control Language="c#" AutoEventWireup="false" Codebehind="AddFolder_View.ascx.cs" Inherits="Jenzabar.LMS.Portlets.FileCabinetPortlet.AddFolder_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<div xmlns:cmn="http://schemas.jenzabar.com/JICS/CommonControls">
	<div class="pSection">
		<cmn:GlobalizedValidationSummary id="valSummary" runat="server" /> 
		<fieldset>
			<table>
				<tr>
					<th><cmn:formlabel id="lblName" forcontrol="txtName" textkey="TXT_NAME" runat="server" /></th>
					<td>
						<asp:TextBox id="txtName" width="200" maxlength="25" runat="server"  />
						<cmn:GlobalizedRequiredFieldValidator id="valName" runat="server" controltovalidate="txtName" errormessagekey="ERR_NAME_IS_REQUIRED" />
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
</div>