<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ViewTestScores.ascx.cs" Inherits="Jenzabar.CRM.AdmissionsOfficer.Web.Portlets.ViewCandidatePortlet.ViewTestScores" %>
<TABLE id="Table1" cellSpacing="3" cellPadding="3" width="100%" border="0">
	<TR>
		<TD><asp:label id="lblError" ForeColor="#ff0000" runat="server"></asp:label></TD>
	</TR>
	<TR>
		<TD><asp:label id="lblTestScoreTitle" runat="server" Font-Bold="True"></asp:label></TD>
	<TR>
		<TD><asp:datagrid id="dgHighestTestScore" runat="server" GridLines="Vertical" AutoGenerateColumns="False"
				ShowFooter="False" FooterStyle-CssClass="header" HeaderStyle-CssClass="header" AlternatingItemStyle-CssClass="alt"
				Width="100%" ShowHeader="True">
				<Columns>
					<asp:BoundColumn DataField="TestName">
						<ItemStyle Wrap="False"></ItemStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="TestDate">
						<ItemStyle Wrap="False"></ItemStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="CompositeScore">
						<ItemStyle Wrap="False"></ItemStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="TestElementName">
						<ItemStyle Wrap="False"></ItemStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="TestElementScore">
						<ItemStyle Wrap="False"></ItemStyle>
					</asp:BoundColumn>
				</Columns>
			</asp:datagrid></TD>
	</TR>
</TABLE>
<p></p>
<TABLE id="Table2" cellSpacing="3" cellPadding="3" width="100%" border="0">
	<tr>
		<td><asp:linkbutton id="lnkViewCandidateDetails" runat="server"></asp:linkbutton></td>
	</tr>
</TABLE>
