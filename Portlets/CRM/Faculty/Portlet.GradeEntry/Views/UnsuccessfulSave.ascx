<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UnsuccessfulSave.ascx.cs" Inherits="Jenzabar.CRM.Faculty.Web.Portlets.GradeEntryPortlet.UnsuccessfulSave" %>
<div id="divErrorHeader">
	<table cellSpacing="3" cellPadding="3" width="100%">
		<tr>
			<td>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</td>
		</tr>
		<tr>
			<td align="left">
				<asp:label id="lblErrorHeader" runat="server" Visible="True" Font-Bold="True"></asp:label>
			</td>
		</tr>
		<tr>
			<td align="left">
				<asp:label id="lblErrorDisplayText" runat="server" Visible="True" Font-Bold="True"></asp:label>
			</td>
		</tr>
		<tr>
			<td>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</td>
		</tr>
	</table>
</div>
<div id="divLink">
	<table>
		<tr>
			<td><asp:LinkButton id="lnkReturntoPreviousPage" runat="server" Visible="True" onclick="lnkReturntoPreviousPage_Click"></asp:LinkButton></td>
		</tr>
		<tr>
			<td><asp:LinkButton id="lnkReturntoCourseList" runat="server" Visible="True" onclick="lnkReturntoCourseList_Click"></asp:LinkButton></td>
		</tr>
		<tr>
			<td>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</td>
		</tr>
	</table>
</div>
