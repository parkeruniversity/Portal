<%@ Control Language="c#" AutoEventWireup="false" Codebehind="APDFAddEditDropDown.ascx.cs" Inherits="Jenzabar.CUS.ICS.Web.Portlets.AdminPDFReportsPortlet.APDFAddEditDropDown" %>
<%@ Register TagPrefix="common" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<div class="pSection">
	<div>
		<h4>Drop Down Definition</h4>
		<div class="hint"><asp:Label ID="lblHint" runat="server" /></div>
		<table>
			<tr>
				<td width="175">Drop Down Name:</td>
				<td><asp:textbox id="tbDropDownName" Runat="server" MaxLength="60"></asp:textbox></td>
			</tr>
			<tr>
				<td width="175">Drop Down Select:</td>
				<td><asp:textbox id="tbDropDownSelect" Runat="server" Rows="10" Columns="100" TextMode="MultiLine" Wrap="true" Height="191px"></asp:textbox></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td colspan="3"><asp:button id="btnSaveDropDown" Text="Save" Runat="server"></asp:button></td>
			</tr>
		</table>
	</div>
</div>
