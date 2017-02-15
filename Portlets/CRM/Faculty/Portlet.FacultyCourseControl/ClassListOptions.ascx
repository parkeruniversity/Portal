<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ClassListOptions.ascx.cs" Inherits="Jenzabar.CRM.Faculty.Web.Portlets.FacultyCourseControlPortlet.ClassListOptions" %>
<%@ Register TagPrefix="cmn" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<cmn:SubHeader id="hdrOptions" TextKey="TXT_PORTAL_USER_OPTIONS" Runat="server"></cmn:SubHeader>
<div class="pSection">
	<cmn:Hint id="hntOptions" TextKey="TXT_PORTAL_USER_OPTIONS_HINT" Runat="server"></cmn:Hint>
	<table>
		<tr>
			<th align="left" nowrap>
				<cmn:GlobalizedLiteral id="glitSearchOptions" Runat="server" TextKey="TXT_SEARCH_OPTIONS" />
			</th>
			<th align="left" nowrap>
				<cmn:GlobalizedLiteral id="glitDisplayOptions" Runat="server" TextKey="TXT_DISPLAY_OPTIONS" />
			</th>
		</tr>
		<tr>
			<td nowrap>
				<cmn:GlobalizedCheckBox id="gcbIncludeReg" Runat="server" TextKey="FCC_SETTINGS_INCLUDE_REGISTERED" />
			</td>
			<td nowrap>
				<cmn:GlobalizedCheckBox id="gcbShowIfGrad" Runat="server" TextKey="FCC_SETTINGS_SHOW_IF_GRADUATING" />
			</td>
		</tr>
		<tr>
			<td nowrap>
				<cmn:GlobalizedCheckBox id="gcbIncludeWith" Runat="server" TextKey="FCC_SETTINGS_INCLUDE_WITHDRAWN" />
			</td>
			<td nowrap>
				<cmn:GlobalizedCheckBox id="gcbShowGradingType" Runat="server" TextKey="FCC_SETTINGS_SHOW_GRADING_TYPE" />
			</td>
		</tr>
		<tr>
			<td nowrap>
				<cmn:GlobalizedCheckBox id="gcbIncludeWait" Runat="server" TextKey="FCC_SETTINGS_INCLUDE_WAITLISTED" />
			</td>
			<td nowrap>
				<cmn:GlobalizedCheckBox id="gcbShowGrade" Runat="server" TextKey="FCC_SETTINGS_SHOW_GRADE_IF_PERM" />
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td nowrap>
				<cmn:GlobalizedCheckBox id="gcbShowOnlyGradStu" Runat="server" TextKey="FCC_SETTINGS_INCLUDE_GRADUATING_ONLY" />
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>
				<cmn:GlobalizedButton id="gbtnSave" runat="server" TextKey="TXT_SAVE" />&nbsp;&nbsp;&nbsp;
				<cmn:GlobalizedButton id="gbtnCancel" runat="server" TextKey="TXT_CANCEL" />
			</td>
			<td>&nbsp;</td>
		</tr>
	</table>
</div>
