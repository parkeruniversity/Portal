<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ViewCandidate.ascx.cs" Inherits="Jenzabar.CRM.AdmissionsOfficer.Web.Portlets.ViewCandidatePortlet.ViewCandidate" %>
<TABLE id="Table1" cellSpacing="3" cellPadding="3" width="100%" border="0">
	<TR>
		<TD><asp:label id="lblError" ForeColor="#ff0000" runat="server"></asp:label></TD>
	</TR>
	<TR>
		<TD><asp:label id="lblPersInfoTitle" runat="server" Font-Bold="True"></asp:label>
			<asp:ImageButton id="ibPersInfoEdit" runat="server"></asp:ImageButton></TD>
	</TR>
	<TR>
		<TD><asp:datagrid id="dgPersInfo" runat="server" GridLines="None" AutoGenerateColumns="False" ShowFooter="False"
				Width="100%" ShowHeader="False">
				<Columns>
					<asp:BoundColumn DataField="PersInfoLabel">
						<ItemStyle Wrap="False" Width="25%"></ItemStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="PersInfoDetail">
						<ItemStyle Wrap="False"></ItemStyle>
					</asp:BoundColumn>
				</Columns>
			</asp:datagrid></TD>
	</TR>
	<TR>
		<TD><asp:label id="lblAddressTitle" runat="server" Font-Bold="True"></asp:label></TD>
	</TR>
	<TR>
		<TD><asp:datagrid id="dgAddresses" runat="server" GridLines="None" AutoGenerateColumns="False" ShowFooter="False"
				FooterStyle-CssClass="header" HeaderStyle-CssClass="header" AlternatingItemStyle-CssClass="alt"
				Width="100%" ShowHeader="False">
				<Columns>
					<asp:BoundColumn DataField="AddrInfoLabel">
						<ItemStyle Wrap="False" Width="25%"></ItemStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="AddrInfoDetail">
						<ItemStyle Wrap="False"></ItemStyle>
					</asp:BoundColumn>
				</Columns>
			</asp:datagrid></TD>
	</TR>
	<TR>
		<TD><asp:label id="lblEmailTitle" runat="server" Font-Bold="True"></asp:label></TD>
	</TR>
	<TR>
		<TD><asp:datagrid id="dgEmail" runat="server" GridLines="None" AutoGenerateColumns="False" FooterStyle-CssClass="header"
				HeaderStyle-CssClass="header" AlternatingItemStyle-CssClass="alt" Width="100%" ShowHeader="False">
				<FooterStyle CssClass="header"></FooterStyle>
				<AlternatingItemStyle CssClass="alt"></AlternatingItemStyle>
				<HeaderStyle CssClass="header"></HeaderStyle>
				<Columns>
					<asp:BoundColumn DataField="EmailInfoLabel">
						<ItemStyle Wrap="False" Width="25%"></ItemStyle>
					</asp:BoundColumn>
					<asp:TemplateColumn>
						<ItemStyle Wrap="False"></ItemStyle>
						<ItemTemplate>
							<asp:HyperLink ID="hlnkEmailInfoDetail" Runat="server" NavigateUrl='<%# "mailto:"+DataBinder.Eval(Container.DataItem,"EmailInfoDetail") %>'>
								<%# DataBinder.Eval(Container.DataItem,"EmailInfoDetail") %>
							</asp:HyperLink>
						</ItemTemplate>
					</asp:TemplateColumn>
				</Columns>
			</asp:datagrid></TD>
	</TR>
	<TR>
		<TD><asp:linkbutton id="lnkViewAllAddresses" runat="server"></asp:linkbutton></TD>
	</TR>
	<tr>
		<td></td>
	</tr>
	<tr>
		<td><asp:label id="lblCandidaciesTitle" runat="server" Font-Bold="True"></asp:label></td>
	</tr>
	<TR>
		<TD><asp:datagrid id="dgCandidacies" runat="server" GridLines="Vertical" AutoGenerateColumns="False"
				ShowFooter="False" FooterStyle-CssClass="header" HeaderStyle-CssClass="header" AlternatingItemStyle-CssClass="alt"
				Width="100%" ShowHeader="True">
				<Columns>
					<asp:BoundColumn DataField="Program">
						<ItemStyle Wrap="False"></ItemStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="Year">
						<ItemStyle Wrap="False"></ItemStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="Term">
						<ItemStyle Wrap="False"></ItemStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="Major">
						<ItemStyle Wrap="False"></ItemStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="Major2">
						<ItemStyle Wrap="False"></ItemStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="Division">
						<ItemStyle Wrap="False"></ItemStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="Department">
						<ItemStyle Wrap="False"></ItemStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="Classification">
						<ItemStyle Wrap="False"></ItemStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="Location">
						<ItemStyle Wrap="False"></ItemStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="Current">
						<ItemStyle Wrap="False"></ItemStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="Stage">
						<ItemStyle Wrap="False"></ItemStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="StageDate">
						<ItemStyle Wrap="False"></ItemStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="WaitlistRank">
						<ItemStyle Wrap="False"></ItemStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="Reapplication">
						<ItemStyle Wrap="False"></ItemStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="Transfer">
						<ItemStyle Wrap="False"></ItemStyle>
					</asp:BoundColumn>
				</Columns>
			</asp:datagrid></TD>
	</TR>
	<tr>
		<td><asp:linkbutton id="lnkUpdateCandidacies" runat="server"></asp:linkbutton></td>
	</tr>
	<tr>
		<td></td>
	</tr>
	<tr>
		<td colspan="3"><asp:label id="lblProgramInfoTitle" runat="server" Font-Bold="True"></asp:label></td>
	</tr>
	<tr>
		<td><asp:datagrid id="dgProgramInfo" runat="server" GridLines="None" AutoGenerateColumns="False" Width="100%"
				ShowHeader="False">
				<Columns>
					<asp:BoundColumn DataField="CandidateCounselorLabel">
						<ItemStyle Wrap="False" Width="25%"></ItemStyle>
					</asp:BoundColumn>
					<asp:TemplateColumn>
						<ItemStyle Wrap="False"></ItemStyle>
						<ItemTemplate>
							<asp:Label ID="lblCandidateCounselor" Runat="server" Visible="False">
								<%# DataBinder.Eval(Container.DataItem,"CandidateCounselor") %>
							</asp:Label>
							<asp:HyperLink ID="hlnkCandidateCounselor" Runat="server" Visible="False" NavigateUrl='<%# "mailto:"+DataBinder.Eval(Container.DataItem,"CounselorEmail") %>'>
								<%# DataBinder.Eval(Container.DataItem,"CandidateCounselor") %>
							</asp:HyperLink>
						</ItemTemplate>
					</asp:TemplateColumn>
				</Columns>
			</asp:datagrid></td>
	</tr>
	<tr>
		<td></td>
	</tr>
	<tr id="trTestScoreTitle" runat="server">
		<td><asp:label id="lblHighestTestScoreTitle" runat="server" Font-Bold="True"></asp:label></td>
	</tr>
	<TR  id="trTestScoreGrid" runat="server">
		<TD><asp:datagrid id="dgHighestTestScore" runat="server" GridLines="Vertical" AutoGenerateColumns="False"
				ShowFooter="False" FooterStyle-CssClass="header" HeaderStyle-CssClass="header" AlternatingItemStyle-CssClass="alt"
				ShowHeader="True">
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
	<tr  id="trAllTestScoreLink" runat="server">
		<td><asp:linkbutton id="lnkViewAllTestScores" runat="server"></asp:linkbutton></td>
	</tr>
	<tr>
		<td colspan="5"><asp:label id="lblPreviousOrg" runat="server" Font-Bold="True"></asp:label></td>
	</tr>
	<TR>
		<TD><asp:datagrid id="dgPreviousOrg" runat="server" GridLines="Vertical" AutoGenerateColumns="False"
				ShowFooter="False" FooterStyle-CssClass="header" HeaderStyle-CssClass="header" AlternatingItemStyle-CssClass="alt"
				ShowHeader="True">
				<Columns>
					<asp:BoundColumn DataField="OrganizationName">
						<ItemStyle Wrap="False"></ItemStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="OrganizationBeginDate">
						<ItemStyle Wrap="False"></ItemStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="OrganizationEndDate">
						<ItemStyle Wrap="False"></ItemStyle>
					</asp:BoundColumn>
				</Columns>
			</asp:datagrid></TD>
	</TR>
	<tr>
		<td></td>
	</tr>
	<tr>
		<td colspan="3"><asp:linkbutton id="lnkAttributes" runat="server"></asp:linkbutton></td>
	</tr>
	<tr>
		<td><asp:linkbutton id="lnkContacts" runat="server"></asp:linkbutton></td>
	</tr>
	<tr>
		<td><asp:linkbutton id="lnkAdmissionsStatus" runat="server"></asp:linkbutton></td>
	</tr>
	<tr>
		<td><asp:linkbutton id="lnkFolderItems" runat="server"></asp:linkbutton></td>
	</tr>
	<tr>
		<td colspan="5"></td>
	</tr>
	<tr>
		<td colspan="5"><asp:linkbutton id="lnkViewMyCandidateList" runat="server"></asp:linkbutton></td>
	</tr>
</TABLE>
