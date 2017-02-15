<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Main.ascx.cs" Inherits="Jenzabar.CRM.Common.Web.Portlets.FormBuilderPortlet.Main" %>
<jenzabar:subheader id=hdrFormName runat="server" />
<div class=pSection>
	<jenzabar:errordisplay id=error Runat="server" />
	<jenzabar:hint id=lblInstructions runat="server" />
	<table height=40 cellSpacing=3 cellPadding=3>
		<tr>
			<td>&nbsp;<asp:label id=lblRequiredInstructions runat="server" /></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td><asp:table id=tblQuestions runat="server" Visible="true" BorderStyle="None" /></td>
		</tr>
		<tr>
			<td>
				<asp:table id=tblSendEmail runat="server" Visible="False">
					<asp:TableRow>
						<asp:TableCell>
							<asp:Label ID="lblSendEmail" Runat="server" />
						</asp:TableCell>
						<asp:TableCell>
							<asp:RadioButtonList ID="rblSendEmail" Runat="server" />
						</asp:TableCell>
					</asp:TableRow>
				</asp:Table>
			</td>
		</tr>
		<tr>
			<td>
				<div id=divSubmitCancel>
					<asp:button id=btnSubmit runat="server" />&nbsp;&nbsp;&nbsp; 
					<asp:button id=btnCancel runat="server" CausesValidation="False" />
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div id=divSaveIncomplete>
					<asp:button id=btnSaveIncomplete runat="server" Visible="False" CausesValidation="False" />
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div id=divFormProcessingTxt style="display:none">
					<asp:literal id=litWaitMsg Runat="server" />
				</div>
			</td>
		</tr>
	</table>
</div>
<iframe id="iFrameKeepSessionAlive" frameBorder="no" width="0" height="0" runat="server"></iframe>
