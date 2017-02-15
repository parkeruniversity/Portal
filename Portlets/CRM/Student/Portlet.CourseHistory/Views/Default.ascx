<%@ Control Language="c#" AutoEventWireup="True" Codebehind="Default.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.CourseHistoryPortlet.Default" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<Div class="psection">
	<TABLE id="Table1" height="0" cellSpacing="3" cellPadding="3" width="100%" border="0">
		<TR>
			<TD>
				<div id="divMessage" runat="server" visible="true"><jenzabar:hint id="lblInstructionText" Visible="True" runat="server"></jenzabar:hint></div>
			</TD>
		</TR>
		<TR>
			<TD>
				<asp:LinkButton id="lnkViewCourseHistory" runat="server" onclick="lnkViewCourseHistory_Click"></asp:LinkButton>
			</TD>
		</TR>
	</TABLE>
</Div>
