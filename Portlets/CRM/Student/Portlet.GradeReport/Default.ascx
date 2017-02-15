<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Default.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.GradeReportPortlet.Default" %>
<div class="pSection" id="divDefault" runat="server" Visible="false">
	<TABLE id="Table1" height="0" cellSpacing="3" cellPadding="3" width="100%" border="0">
		<TR>
			<TD>
				<div id="divError" runat="server" visible="false"><jenzabar:errordisplay id="ctlError" RunAt="server"></jenzabar:errordisplay></div>
				<div id="divMessage" runat="server" visible="False"><asp:Label ID="lblMessage" Runat="server"></asp:Label></div>
			</TD>
		</TR>
		<TR>
			<TD><div id="divTitle" runat="server"><asp:label id="lblTitle" runat="server"></asp:label></div>
			</TD>
		</TR>
		<TR>
			<TD><div id="divDDL" runat="server">
					<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
						<TR>
							<TD width="10%"><asp:label id="lblTerm" runat="server" Font-Bold="True" AssociatedControlID="ddlTerm"></asp:label></TD>
							<TD><asp:dropdownlist id="ddlTerm" runat="server"></asp:dropdownlist></TD>
						</TR>
					</TABLE>
				</div>
			</TD>
		</TR>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<TR>
			<TD><div id="divLnkGradeReport" runat="server"><asp:linkbutton id="lnkViewGradeReport" runat="server"></asp:linkbutton></div>
			<div id="divLnkViewMidterm" runat="server"><asp:linkbutton id="lnkViewMidterm" runat="server"></asp:linkbutton></div>
			</TD>
		</TR>
		<TR>
			<TD>
			</TD>
		</TR>
	</TABLE>
</Div>
