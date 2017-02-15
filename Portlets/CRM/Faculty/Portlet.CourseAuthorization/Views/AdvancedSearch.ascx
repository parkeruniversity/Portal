<%@ Control Language="c#" AutoEventWireup="True" Codebehind="AdvancedSearch.ascx.cs" Inherits="Jenzabar.CRM.Faculty.Web.Portlets.CourseAuthorizationPortlet.AdvancedSearch" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<div class="pView" xmlns:common="http://schemas.jenzabar.com/JICS/CommonControls">
	<style>
	.caValidationBox { PADDING-RIGHT: 10px; PADDING-LEFT: 10px }
	</style>
	<asp:ValidationSummary ID="Validations" CssClass="caValidationBox" runat="server" />
	<asp:CustomValidator ID="SearchOptionsValidator" OnServerValidate="ValidateSearchOptions" Display="None"
		runat="server" />
	<asp:CustomValidator ID="SearchFieldsValidator" OnServerValidate="ValidateSearchFields" Display="None"
		runat="server" />
	<common:Subheader ID="OptionsHeader" TextKey="TXT_NAME_SEARCH_OPTIONS" runat="server" />
	<table>
		<tr>
			<td valign="top">
				<ul>
					<li>
						<asp:Checkbox ID="PhoneticMatch" runat="server" />
						<common:FormLabel ID="PhoneticMatchLabel" ForControl="PhoneticMatch" TextKey="TXT_SEARCH_USING_PHONETIC_MATCH"
							runat="server" />
					<li>
						<asp:Checkbox ID="PrimaryName" runat="server" />
						<common:FormLabel ID="PrimaryNameLabel" ForControl="PrimaryName" TextKey="TXT_SEARCH_USING_THE_PRIMARY_NAME"
							runat="server" />
					<li>
						<asp:Checkbox ID="AlternateNameTypes" runat="server" />
						<common:FormLabel ID="AlternateNameTypesLabel" ForControl="AlternateNameTypes" TextKey="TXT_SEARCH_USING_ALTERNATE_NAME_TYPES"
							runat="server" />
					</li>
				</ul>
			</td>
			<td valign="top">
				<common:Hint ID="OptionsNote" TextKey="MSG_COURSEAUTHORIZATION_OPTIONS_NOTE" runat="server" />
			</td>
		</tr>
	</table>
	<common:Subheader ID="FieldsHeader" TextKey="TXT_NAME_SEARCH_FIELDS" runat="server" />
	<div class="pSection">
		<table>
			<tr>
				<td>
					<ul>
						<li>
							<asp:RadioButton ID="AnyCriteria" runat="server" GroupName="Criteria" />
							<common:FormLabel ID="AnyCriteriaLabel" ForControl="AnyCriteria" TextKey="TXT_ANY_OF_CRITERIA" runat="server" />
						<li>
							<asp:RadioButton ID="AllCriteria" runat="server" GroupName="Criteria" Checked="True" />
							<common:FormLabel ID="AllCriteriaLabel" ForControl="AllCriteria" TextKey="TXT_ALL_OF_CRITERIA" runat="server" />
						</li>
					</ul>
				</td>
				<td valign="top">
					<common:Hint ID="FieldsNote" TextKey="MSG_COURSEAUTHORIZATION_FIELDS_NOTE" runat="server" />
				</td>
			</tr>
		</table>
		<common:Hint ID="NoUsersFound" TextKey="MSG_COURSEAUTHORIZAION_NO_USERS_FOUND" Visible="false"
			Runat="server" />
		<table>
			<tr>
				<td><common:FormLabel ID="IDLabel" TextKey="LBL_ID" ForControl="IDSearch" Runat="server" /></td>
				<td></td>
				<td><asp:TextBox ID="IDSearch" Columns="15" Runat="server" /></td>
				<td colspan="4"></td>
			</tr>
			<tr>
				<td><common:FormLabel ID="LastNameLabel" TextKey="LBL_LAST_NAME" ForControl="LastNameSearch" Runat="server" /></td>
				<td><asp:DropDownList ID="LastNameMatch" Runat="server" /></td>
				<td><asp:TextBox ID="LastNameSearch" Runat="server" /></td>
				<td style="WIDTH:50px"></td>
				<td><common:FormLabel ID="CityLabel" TextKey="LBL_CITY" ForControl="CitySearch" Runat="server" /></td>
				<td><asp:DropDownList ID="CityMatch" Runat="server" /></td>
				<td><asp:TextBox ID="CitySearch" Runat="server" /></td>
			</tr>
			<tr>
				<td><common:FormLabel ID="FirstNameLabel" TextKey="LBL_FIRST_NAME" ForControl="FirstNameSearch" Runat="server" /></td>
				<td><asp:DropDownList ID="FirstNameMatch" Runat="server"></asp:DropDownList></td>
				<td><asp:TextBox ID="FirstNameSearch" Runat="server" /></td>
				<td style="WIDTH:50px"></td>
				<td><common:FormLabel ID="StateLabel" TextKey="LBL_STATE" ForControl="StateSearch" Runat="server" /></td>
				<td><asp:DropDownList ID="StateMatch" Runat="server" /></td>
				<td><asp:TextBox ID="StateSearch" Runat="server" /></td>
			</tr>
			<tr>
				<td><common:FormLabel ID="MiddleNameLabel" TextKey="LBL_MIDDLE_NAME" ForControl="MiddleNameSearch" Runat="server" /></td>
				<td><asp:DropDownList ID="MiddleNameMatch" Runat="server" /></td>
				<td><asp:TextBox ID="MiddleNameSearch" Runat="server" /></td>
				<td colspan="4"></td>
			</tr>
		</table>
		<common:GlobalizedButton ID="SearchButton" TextKey="TXT_SEARCH_FOR_NAME" runat="server" />
	</div>
</div>
