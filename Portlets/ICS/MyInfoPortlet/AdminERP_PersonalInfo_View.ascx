<%@ Control Language="c#" AutoEventWireup="false" Codebehind="AdminERP_PersonalInfo_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.MyInfoPortlet.AdminERP_PersonalInfo_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="framework" namespace="Jenzabar.Portal.Framework.Web.UI.Controls" assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Import namespace="Jenzabar.ICS" %>
<common:subheader id="shUpdatePersonalInfo" runat="server"></common:subheader>
<fieldset>
	<div class="pSection">
		<table cellSpacing="5" cellPadding="0" width="100%">
			<tr>
				<th noWrap align="right">
					<b>
						<asp:label id="lblTitle" Runat="server"></asp:label></b></th>
				<td align="left" width="100%"><asp:dropdownlist id="ddlTitle" Runat="server"></asp:dropdownlist></td>
			</tr>
			<tr>
				<th noWrap align="right">
					<b>
						<asp:label id="lblFirstLastInit" runat="server"></asp:label></b></th>
				<td align="left" width="100%"><asp:textbox id="txtFirstName" runat="server"></asp:textbox>&nbsp;&nbsp;
					<asp:textbox id="txtMiddleName" runat="server"></asp:textbox>&nbsp;&nbsp;
					<asp:textbox id="txtLastName" runat="server"></asp:textbox></td>
			</tr>
			<tr>
				<th noWrap align="right">
					<b>
						<common:GlobalizedLabel textkey="LBL_HIDE_MIDDLE_NAME" id="lblHideMiddleName" runat="server"></common:GlobalizedLabel></b></th>
				<td align="left" width="100%"><asp:checkbox id="cbHideMiddleName" Text="" runat="server"></asp:checkbox></td>
			</tr>
			<tr>
				<th noWrap align="right">
					<b>
						<common:GlobalizedLabel textkey="LBL_EMAIL_ADDRESS" id="lblEmailAddress" runat="server"></common:GlobalizedLabel></b></th>
				<td align="left" width="100%"><asp:textbox id="txtEmailAddress" runat="server"></asp:textbox><asp:regularexpressionvalidator id="valEmailFormat" runat="server" ControlToValidate="txtEmailAddress" ValidationExpression="^.+@[^\.].*\.[A-Za-z]{2,}$"></asp:regularexpressionvalidator>
				</td>
			</tr>
			<tr>
				<th noWrap align="right">
					<b>
						<asp:label id="lblNickname" runat="server"></asp:label></b></th>
				<td align="left" width="100%"><asp:textbox id="txtNickname" runat="server"></asp:textbox></td>
			</tr>
			<tr>
				<th vAlign="top" noWrap align="right" rowSpan="3">
					<b>
						<asp:label id="lblAddress" runat="server"></asp:label></b></th>
				<td align="left" width="100%"><asp:textbox id="txtAddress1" runat="server"></asp:textbox></td>
			</tr>
			<tr>
				<td align="left" width="100%"><asp:textbox id="txtAddress2" runat="server"></asp:textbox></td>
			</tr>
			<tr>
				<td align="left" width="100%"><asp:textbox id="txtAddress3" runat="server"></asp:textbox></td>
			</tr>
			<tr>
				<th noWrap align="right">
					<b>
						<asp:label id="lblCityStateZip" runat="server"></asp:label></b></th>
				<td align="left" width="100%"><asp:textbox id="txtCity" runat="server"></asp:textbox>&nbsp;&nbsp;
					<asp:dropdownlist id="ddlState" Runat="server"></asp:dropdownlist>&nbsp;&nbsp;
					<asp:textbox id="txtZip" runat="server"></asp:textbox>
					<asp:regularexpressionvalidator id="valZipFormat" runat="server" ControlToValidate="txtZip" ValidationExpression="(^[^|]{1,10}$)"></asp:regularexpressionvalidator>
				</td>
			</tr>
			<tr>
				<th noWrap align="right">
					<b>
						<asp:label id="lblCountry" runat="server"></asp:label></b></th>
				<td align="left" width="100%"><asp:dropdownlist id="ddlCountry" Runat="server"></asp:dropdownlist></td>
			</tr>
			<tr>
				<th noWrap align="right">
					<b>
						<asp:label id="lblCounty" runat="server"></asp:label></b></th>
				<td align="left" width="100%"><asp:dropdownlist id="ddlCounty" Runat="server"></asp:dropdownlist></td>
			</tr>
			<tr>
				<th noWrap align="right">
					<b>
						<asp:label id="lblLocality" runat="server"></asp:label></b></th>
				<td align="left" width="100%"><asp:dropdownlist id="ddlLocality" Runat="server"></asp:dropdownlist></td>
			</tr>
			<tr>
				<th noWrap align="right">
					<b>
						<asp:label id="lblPhone" runat="server"></asp:label></b></th>
				<td align="left" width="100%"><asp:textbox id="txtPhone" runat="server"></asp:textbox>&nbsp;<span class="fieldHint">(555) 
						555-5555</span>&nbsp;&nbsp;<b><asp:label id="lblExt" runat="server"></asp:label></b>&nbsp;&nbsp;
					<asp:textbox id="txtExtention" runat="server" Columns="40" Width="40"></asp:textbox>
				</td>
			</tr>
			<tr>
				<th noWrap align="right">
					<b>
						<asp:label id="lblBirthdate" runat="server"></asp:label></b></th>
				<td align="left" width="100%"><asp:textbox id="txtBirthdate" runat="server"></asp:textbox>&nbsp;<span class="fieldHint">mm/dd/yyyy</span></td>
			</tr>
			<tr>
				<th noWrap align="right">
					<b>
						<asp:label id="lblMaritalStatus" runat="server"></asp:label></b></th>
				<td align="left" width="100%"><asp:dropdownlist id="ddlMaritalStatus" Runat="server"></asp:dropdownlist></td>
			</tr>
			<tr>
				<th noWrap align="right">
					<b>
						<asp:label id="lblGender" runat="server"></asp:label></b></th>
				<td align="left" width="100%"><asp:dropdownlist id="ddlGender" Runat="server"></asp:dropdownlist></td>
			</tr>
			<tr>
				<th noWrap align="right">
					<b>
						<asp:label id="lblEthnicity" runat="server"></asp:label></b></th>
				<td align="left" width="100%"><asp:dropdownlist id="ddlEthnicity" Runat="server"></asp:dropdownlist></td>
			</tr>
		</table>
		<table cellSpacing="5" cellPadding="0" width="100%">
			<tr>
				<th height="5">
					&nbsp;</th>
				<td height="5">&nbsp;</td>
			</tr>
			<tr>
				<td><jenzabar:hint id="lblBioHint" Visible="True" runat="server"></jenzabar:hint></td>
			</tr>

		</table>

		<table cellSpacing="5" cellPadding="0" width="100%">
			<tr>
				<th height="5">
					&nbsp;</th>
				<td height="5">&nbsp;</td>
			</tr>
			<tr>
				<th align="left">
				</th>
				<td align="left"><asp:button id="btnSubmit" runat="server"></asp:button>&nbsp;&nbsp;
					<asp:button id="btnCancel" runat="server" CausesValidation="False"></asp:button></td>
			</tr>
		</table>
	</div>
</fieldset>
