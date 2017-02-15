<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="True" Codebehind="CourseRequisites.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.CourseSchedulesPortlet.CourseRequisites" %>
<jenzabar:errordisplay id="errDisplay" Runat="server"></jenzabar:errordisplay>
<table cellSpacing="3" cellPadding="3" width="100%">
	<tr>
		<th align="left">
			<jenzabar:globalizedlabel id="lblReqFor" Runat="server" TextKey="TXT_CS_REQUISITES_FOR"></jenzabar:globalizedlabel></th>
		<td noWrap><asp:label id="lblCourseCode" Runat="server"></asp:label></td>
		<td noWrap><asp:label id="lblCourseTitle" Runat="server"></asp:label></td>
		<td noWrap><asp:label id="lblTerm" Runat="server"></asp:label></td>
		<td noWrap><asp:label id="lblDivision" Runat="server"></asp:label></td>
	</tr>
	<tr>
		<td colSpan="5"><jenzabar:globalizednote id="lblStatus" runat="server"></jenzabar:globalizednote></td>
	</tr>
</table>
<jenzabar:groupedgrid id="dgReq" runat="server" RenderTableHeaders="true" ShowHeader="true">
	<Columns>
		<jenzabar:GlobalizedBoundColumn DataField="OR" ItemStyle-Width="1%"></jenzabar:GlobalizedBoundColumn>
		<jenzabar:GlobalizedBoundColumn HeaderTextKey="TXT_CS_CONDITIONS" ItemStyle-Width="1%" DataField="Condition"></jenzabar:GlobalizedBoundColumn>
		<jenzabar:GlobalizedBoundColumn HeaderTextKey="TXT_GROUP" ItemStyle-Width="1%" DataField="Group"></jenzabar:GlobalizedBoundColumn>
		<jenzabar:GlobalizedBoundColumn HeaderTextKey="TXT_CS_REQUISITE_TYPE" DataField="Type"></jenzabar:GlobalizedBoundColumn>
		<jenzabar:GlobalizedBoundColumn HeaderTextKey="TXT_CS_REQUISITE" DataField="Desc"></jenzabar:GlobalizedBoundColumn>
	</Columns>
</jenzabar:groupedgrid>
