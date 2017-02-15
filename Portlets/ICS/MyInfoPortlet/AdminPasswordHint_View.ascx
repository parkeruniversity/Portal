<%@ Control Language="c#" AutoEventWireup="false" Codebehind="AdminPasswordHint_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.MyInfoPortlet.AdminPasswordHint_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="common" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<div class="pSection">
	<common:Hint id="hint" runat="server" />
	<asp:ValidationSummary ID="Summary" DisplayMode="List" Runat="server" />
	<fieldset>
		<table  cellpadding="2">
			<tr>
				<th>
					<asp:Label ID="lblQuestion" Runat="server" />
				</th>
				<td>
					<asp:textbox id="txtQuestion" runat="server" MaxLength="255" Columns="40" />&nbsp; 
					<asp:RequiredFieldValidator ID="QuestionRequired" ControlToValidate="txtQuestion" Text="*" Display="Dynamic" Runat="server" />
				</td>
			</tr>
			<tr>
				<th>
					<asp:Label ID="lblAnswer" Runat="server" />
				</th>
				<td>
					<asp:textbox id="txtAnswer" runat="server" MaxLength="255" Columns="40" />&nbsp;
					<asp:RequiredFieldValidator ID="AnswerRequired" ControlToValidate="txtAnswer" Text="*" Display="Dynamic" Runat="server" />
				</td>
			</tr>
			<tr>
				<th></th>
				<td>
					<asp:button id=btnSave runat="server" />&nbsp;
					<asp:button id=btnCancel runat="server" CausesValidation="False" />
				</td>
			</tr>
		</table>
	</fieldset>
</div>