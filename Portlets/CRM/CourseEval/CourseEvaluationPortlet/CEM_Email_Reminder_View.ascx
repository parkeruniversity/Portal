<%@ Control Language="c#" AutoEventWireup="false" Codebehind="CEM_Email_Reminder_View.ascx.cs" Inherits="Jenzabar.CRM.Web.Portlets.CourseEvaluationPortlet.CEM_Email_Reminder_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="common" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<div class="pSection">
Click 'Send' to BCC the below email to all users who have course evaluations that have not been yet taken.  The email body below is customizable.  The 'To:' value should be a valid email address for someone at the college who will administer this email.
	<table>
		<tr><th width="15%"></th><td></td></tr>
		<tr>
			<th width="15%">
				<common:GlobalizedLabel ID="glTo" Runat="server" TextKey="LBL_TO" />
			</th>
			<td>
				<asp:TextBox ID="txtTo" Runat="server" Columns="61" />
				<common:GlobalizedRequiredFieldValidator id="ToValue" runat="server" textKey="CUS_MSG_REQUIRED_FIELD" ControlToValidate="txtTo" Display="dynamic" />
			</td>
		</tr>
		<tr>
			<th width="15%">
				<common:GlobalizedLabel ID="glFrom" Runat="server" TextKey="LBL_FROM" />
			</th>
			<td>
				<asp:TextBox ID="txtFrom" Runat="server" Columns="61" />
				<common:GlobalizedRequiredFieldValidator id="FromValue" runat="server" textKey="CUS_MSG_REQUIRED_FIELD" ControlToValidate="txtFrom" Display="dynamic" />
			</td>
		</tr>
		<tr>
			<th width="15%">
				<common:GlobalizedLabel ID="glSubject" Runat="server" TextKey="LBL_SUBJECT" />
			</th>
			<td>
				<asp:TextBox ID="txtSubject" Runat="server" Columns="61" />
				<common:GlobalizedRequiredFieldValidator id="SubjectValue" runat="server" textKey="CUS_MSG_REQUIRED_FIELD" ControlToValidate="txtSubject" Display="dynamic" />
			</td>
		</tr>
		<tr>
			<th width="15%">
				<common:GlobalizedLabel ID="glEmailBody" Runat="server" TextKey="CUS_EMAIL_BODY" />
			</th>
			<td>
				<asp:TextBox ID="txtEmailBody" Runat="server" Rows="6" MaxLength="2000" Wrap="True" TextMode="MultiLine" Font-Size="x-small" Columns="85" />
				<common:GlobalizedRequiredFieldValidator id="EmailBodyValue" runat="server" textKey="CUS_MSG_REQUIRED_FIELD" ControlToValidate="txtEmailBody" Display="dynamic" />
			</td>
		</tr>
		<tr>
			<th width="15%"></th>
			<td>
				<span class="ceTextAreaNote">
					<common:GlobalizedLabel ID="glMaxChars" Runat="server" TextKey="CUS_EMAIL_BODY_LIMIT" />
				</span>
			</td>
		</tr>
		<tr>
			<th width="15%">
				<common:GlobalizedLabel ID="glEmailFormat" Runat="server" TextKey="CUS_EMAIL_FORMAT" />
			</th>
			<td>
				<asp:RadioButtonList ID="rbEmailFormat" Runat="server">
					<asp:ListItem ID="text" Runat="server" Value="Text" Selected="True" />
					<asp:ListItem ID="html" Runat="server" Value="HTML" />
				</asp:RadioButtonList>
			</td>
		</tr>
		<tr></tr>
		<tr>
			<th width="15%"></th>
			<td>
				<asp:Button ID="btnSendEmail" Runat="server" />&nbsp
				<asp:Button ID="btnCancel" CausesValidation="False" Runat="server" />
			</td>
		</tr>
	</table>
	<span class="ceErrorMessage">
		<asp:Label ID="lblNoRecordsFound" Runat="server" />
	</span>
</div>