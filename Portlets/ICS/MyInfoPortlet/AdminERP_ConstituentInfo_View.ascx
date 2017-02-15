<%@ Import namespace="Jenzabar.ICS" %>
<%@ Register TagPrefix="framework" namespace="Jenzabar.Portal.Framework.Web.UI.Controls" assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="AdminERP_ConstituentInfo_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.MyInfoPortlet.AdminERP_ConstituentInfo_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>



<common:subheader id="shUpdateConsituentInfo" runat="server"></common:subheader>
<fieldset>
	<div class="pSection"><common:errordisplay id="errDisplay" Runat="server"></common:errordisplay>
		<table cellSpacing="0" cellPadding="0" width="100%">
			<tr>
				<td align="left" colSpan="2"><b><asp:label id="lblConstituent" runat="server"></asp:label></b></td>
			</tr>
			<tr>
				<td align="left" colSpan="2"><asp:label id="lblConstituentName" runat="server"></asp:label>
					<hr>
				</td>
			</tr>
			<tr>
				<th>
					<asp:label id="lblConstituentDegree" runat="server"></asp:label></th>
				<td align="left" width="100%"><asp:dropdownlist id="ddlConstituentDegree" runat="server"></asp:dropdownlist></td>
			</tr>
			<tr>
				<th>
					<asp:label id="lblConstituentMajor" runat="server"></asp:label></th>
				<td align="left" width="100%"><asp:dropdownlist id="ddlConstituentMajor" runat="server"></asp:dropdownlist></td>
			</tr>
			<tr>
				<th>
					<asp:label id="lblConstituentClassYear" runat="server"></asp:label></th>
				<td align="left" width="100%"><asp:dropdownlist id="ddlConstituentClassYear" runat="server"></asp:dropdownlist></td>
			</tr>
			<tr>
				<th>
					<asp:label id="lblConstituentCompany" runat="server"></asp:label></th>
				<td align="left" width="100%"><asp:textbox id="txtConstituentCompanyName" runat="server"></asp:textbox></td>
			</tr>
			<tr>
				<th>
				</th>
				<td align="left" width="100%"><b><asp:checkbox id="cbConsituentMatchGift" runat="server"></asp:checkbox></b></td>
			</tr>
			<tr>
				<td align="left" colSpan="2"><b><common:GlobalizedLabel textkey="TXT_SPOUSE" id="lblSpouse" runat="server"></common:GlobalizedLabel></b>
					<hr>
				</td>
			</tr>
			<tr>
				<th>
					<asp:label id="lblSpouseTitle" runat="server"></asp:label></th>
				<td align="left" width="100%"><asp:dropdownlist id="ddlSpouseTitle" runat="server"></asp:dropdownlist></td>
			</tr>
			<tr>
				<th>
					<asp:label id="lblSpouseName" runat="server"></asp:label></th>
				<td align="left" width="100%"><asp:textbox id="txtSpouseFirstName" runat="server"></asp:textbox>&nbsp;
					<asp:textbox id="txtSpouseMiddleName" runat="server" Width="32px"></asp:textbox>&nbsp;
					<asp:textbox id="txtSpouseLastName" runat="server"></asp:textbox></td>
			</tr>
			<tr>
				<th>
					<asp:label id="lblSpouseDegree" runat="server"></asp:label></th>
				<td align="left" width="100%"><asp:dropdownlist id="ddlSpouseDegree" runat="server"></asp:dropdownlist></td>
			</tr>
			<tr>
				<th>
					<asp:label id="lblSpouseMajor" runat="server"></asp:label></th>
				<td align="left" width="100%"><asp:dropdownlist id="ddlSpouseMajor" runat="server"></asp:dropdownlist></td>
			</tr>
			<tr>
				<th>
					<asp:label id="lblSpouseClassYear" runat="server"></asp:label></th>
				<td align="left" width="100%"><asp:dropdownlist id="ddlSpouseClassYear" runat="server"></asp:dropdownlist></td>
			</tr>
			<tr>
				<th>
					<asp:label id="lblSpouseCompany" runat="server"></asp:label></th>
				<td align="left" width="100%"><asp:textbox id="txtSpouseCompanyName" runat="server"></asp:textbox></td>
			</tr>
			<tr>
				<th>
				</th>
				<td align="left" width="100%"><b><asp:checkbox id="cbSpouseMatchGift" runat="server"></asp:checkbox></b></td>
			</tr>
			<tr>
				<th>
					&nbsp;</th>
				<td height="5">&nbsp;</td>
			</tr>
			<tr>
				<th>
					&nbsp;</th>
				<td align="left"><asp:button id="btnSubmit" runat="server"></asp:button>&nbsp;&nbsp;
					<asp:button id="btnCancel" runat="server"></asp:button></td>
			</tr>
		</table>
	</div>
</fieldset>
