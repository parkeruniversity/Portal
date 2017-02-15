<%@ Control Language="c#" AutoEventWireup="false" Codebehind="CEM_AddRecipients_View.ascx.cs" Inherits="Jenzabar.CRM.Web.Portlets.CourseEvaluationPortlet.CEM_AddRecipients_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="common" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<div class="pSection">
	<common:SubHeader ID="subHeader" Runat="Server" Text="Select Recipients" />
	<table>
		<tr>
			<th>Term:</th>
			<td>
				<asp:DropDownList ID="ddlTerm" Runat="server" Width="500" />
			</td>
		</tr>
		<tr>
			<th>Department(s):</th>
			<td>
				<asp:ListBox id="lbDept" runat="server" rows="5" selectionmode="Multiple" Width="500" />
				<asp:Button ID="btnDeptSelect" Runat="server" />
			</td>
		</tr>
		<tr>
			<th>Course(s):</th>
			<td>
				<asp:ListBox ID="lbCourses" Runat="server" Rows="5" SelectionMode="Multiple" Width="500" />
				<asp:Button ID="btnCourseSelect" Runat="server" />
			</td>
		</tr>
		<tr>
			<th>Section(s):</th>
			<td>
				<asp:ListBox ID="lbSections" Runat="server" Rows="5" SelectionMode="Multiple" Width="500" />
			</td>
		</tr>
		<tr>
			<th></th>
			<td>
				<asp:Button ID="btnSelect" Runat="server" />&nbsp;<asp:Button ID="btnCancel" Runat="server" />
			</td>
		</tr>
	</table>
</div>