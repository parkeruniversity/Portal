<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="True" Codebehind="SetOptions.ascx.cs" Inherits="Jenzabar.CRM.Faculty.Web.Portlets.CourseAuthorizationPortlet.SetOptions" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<div class="pSection" id="divError" visible="false" runat="server"><jenzabar:errordisplay id="ctlError" RunAt="server"></jenzabar:errordisplay></div>
<div class="pSection" id="divMessage" visible="False" runat="server"><asp:label id="lblMessage" Runat="server"></asp:label></div>
<h4><jenzabar:globalizedliteral id="caPageSettings" runat="server" TextKey="TXT_PORTAL_USER_OPTIONS"></jenzabar:globalizedliteral></h4>
<div id="divDetail" class="pSection" visible="True" runat="server">
	<jenzabar:hint id="hintTitle" runat="server"></jenzabar:hint>	
	<table runat="server" cellpadding="3" cellspacing="3" ID="Table1">
		<tr>
			<td width="100%" colSpan="4"><asp:label id="lblSubHeader1" runat="server" Visible="True" Font-Bold="True"></asp:label></td>
		</tr>
		<tr>
			<td width="50%"><jenzabar:hint id="lblInstruction" runat="server" Visible="True"></jenzabar:hint></td>
		</tr>
		<tr>
			<td>
				<table cellSpacing="3" cellPadding="3" width="100%" border="0">
					<tr>
						<td align="left" width="10%"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:checkbox id="cbxPhoneticMatch" runat="server" Checked="True"></asp:checkbox></td>
						<td width="40%"><asp:label id="lblPhoneticMatch" runat="server"></asp:label></td>
						<td></td>
					</tr>
					<tr>
						<td align="left" width="10%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:checkbox id="cbxPrimaryName" runat="server" Checked="True"></asp:checkbox></td>
						<td width="40%"><asp:label id="lblPrimaryName" runat="server"></asp:label></td>
						
					</tr>
					<tr>
						<td align="left" width="10%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:checkbox id="cbxAlternateNameType" runat="server" Checked="True"></asp:checkbox></td>
						<td width="40%"><asp:label id="lblAlternateNameType" runat="server"></asp:label></td>
						<td></td>
					</tr>
					<tr>
						<td>&nbsp;
						</td>
						<td></td>
						<td></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td width="100%" colSpan="4"><asp:label id="lblSubHeader2" runat="server" Visible="True" Font-Bold="True" ></asp:label></td>
		</tr>
		<tr>
			<td width="50%"><jenzabar:hint id="lblSortColumnDesc" runat="server" Visible="True"></jenzabar:hint></td>
		</tr>		
		<tr>
			<td>
				<table cellSpacing="3" cellPadding="3" width="100%" border="0">
					<tr>
						<td align="left" width="5%" nowrap="true">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:label id="lblSortColumn" runat="server"></asp:label></td>
						<td width="30%"><asp:dropdownlist id="ddlSortColumn" runat="server"></asp:dropdownlist></td>						
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>
				<table cellSpacing="3" cellPadding="3" width="100%" border="0">
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					</tr>
					<tr>						
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:button id="btnSave" runat="server" Width="75px" onclick="btnSave_Click"></asp:button>&nbsp;&nbsp;&nbsp;<asp:button id="btnCancel" runat="server" Width="75px" CausesValidation="False" onclick="btnCancel_Click"></asp:button></td>
						<td></td>
						<td></td>
					</tr>
				</table>
			</td>
		</tr>
	</TABLE>
</DIV>
