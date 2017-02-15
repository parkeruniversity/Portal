<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="CourseTextBooks.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.CourseSchedulesPortlet.CourseTextBooks" %>
<div class="pSection">
	<jenzabar:errordisplay id="errDisplay" Runat="server"></jenzabar:errordisplay>
	<table cellSpacing="3" cellPadding="3" width="100%">
		<tr>
			<th align="left" colSpan="4">
				<jenzabar:globalizedlabel id="lblTextbooksFor" Runat="server" TextKey="TXT_CS_TEXTBOOKS_FOR"></jenzabar:globalizedlabel></th></tr>
		<tr>
			<td noWrap><asp:label id="lblCourseCode" Runat="server"></asp:label></td>
			<td noWrap><asp:label id="lblCourseTitle" Runat="server"></asp:label></td>
			<td noWrap><asp:label id="lblTerm" Runat="server"></asp:label></td>
			<td noWrap><asp:label id="lblDivision" Runat="server"></asp:label></td>
		</tr>
		<tr>
			<td colspan="4"><jenzabar:GlobalizedNote id="lblStatus" runat="server"></jenzabar:GlobalizedNote></td>
		</tr>
	</table>
	<jenzabar:groupedgrid id="dgBooks" runat="server"></jenzabar:groupedgrid>
</div>
