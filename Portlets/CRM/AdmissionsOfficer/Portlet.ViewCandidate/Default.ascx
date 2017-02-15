<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Default.ascx.cs" Inherits="Jenzabar.CRM.AdmissionsOfficer.Web.Portlets.ViewCandidatePortlet.Default" %>
<table id="Table1" cellSpacing="3" cellPadding="3" width="100%" border="0">
	<tr>
		<td>
			<asp:Label id="lblError" runat="server" ForeColor="#ff0000" Font-Bold="True" />
		</td>
	</tr>
	<tr>
		<td>
			<asp:Label id="lblTitle" runat="server" Font-Bold="True" />
		</td>
	</tr>
</table>
<table id="Table2" cellSpacing="3" cellPadding="3" width="100%" border="0">
	<tr>
		<td>
			<asp:Label id="lblID" runat="server" />
		</td>
		<td>
			<asp:TextBox id="txtID" runat="server" />
		</td>
	</tr>
	<tr>
		<td>
			<asp:Label id="lblLastName" runat="server" />
		</td>
		<td>
			<asp:TextBox id="txtLastName" runat="server" />
		</td>
	</tr>
	<tr>
		<td>
			<asp:Label id="lblFirstName" runat="server" />
		</td>
		<td>
			<asp:TextBox id="txtFirstName" runat="server" />
		</td>
	</tr>
	<tr>
		<td>
			<asp:Label id="lblSSN" runat="server" />
		</td>
		<td>
			<asp:TextBox id="txtSSN" runat="server" />
			<asp:RegularExpressionValidator id="revSSN" runat="server" ControlToValidate="txtSSN" ValidationExpression="\d{3}-\d{2}-\d{4}" />
		</td>
	</tr>
	<tr>
		<td></td>
		<td>
			<asp:RadioButton id="rbAny" runat="server" Checked="True" GroupName="Criteria" />
			<asp:RadioButton id="rbAll" runat="server" GroupName="Criteria" />
		</td>
	</tr>
	<tr>
		<td>
			<asp:Button id="btnSearch" runat="server" />
		</td>
		<td></td>
	</tr>
</table>
<table id="Table3" cellSpacing="3" cellPadding="3" width="100%" border="0">
	<tr>
		<td></td>
	</tr>
	<tr>
		<td>
			<asp:LinkButton id="lnkViewAllMyCandidates" runat="server" />
		</td>
	</tr>
	<tr>
		<td></td>
	</tr>
	<tr>
		<td>
			<asp:Label id="lblCandidatesFound" runat="server" Font-Bold="True" />
		</td>
	</tr>
	<tr>
		<td>
			<asp:DataGrid id="dgCandidateList" runat="server" ShowHeader="True" Width="100%" AlternatingItemStyle-CssClass="alt"
				HeaderStyle-CssClass="header" AutoGenerateColumns="False" GridLines="None" CellPadding="3">
				<AlternatingItemStyle CssClass="alt"></AlternatingItemStyle>
				<HeaderStyle CssClass="header"></HeaderStyle>
				<Columns>
					<asp:TemplateColumn>
						<HeaderStyle HorizontalAlign="Left"></HeaderStyle>
						<ItemStyle Wrap="False" HorizontalAlign="Left"></ItemStyle>
						<ItemTemplate>
							<asp:Label ID="lblName" Runat="server" Visible="False">
								<%# DataBinder.Eval(Container.DataItem,"CandidateLastName")+", "+DataBinder.Eval(Container.DataItem,"CandidateFirstName")+" "+DataBinder.Eval(Container.DataItem,"CandidateMiddleName") %>
							</asp:Label>
							<asp:LinkButton ID="lnkName" CommandName="Name" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"CandidateID")%>' Runat="server" Visible="False">
								<%# DataBinder.Eval(Container.DataItem,"CandidateLastName")+", "+DataBinder.Eval(Container.DataItem,"CandidateFirstName")+" "+DataBinder.Eval(Container.DataItem,"CandidateMiddleName") %>
							</asp:LinkButton>
						</ItemTemplate>
					</asp:TemplateColumn>
					<asp:BoundColumn DataField="CandidateID">
						<ItemStyle Wrap="False"></ItemStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="CandidateDOB">
						<ItemStyle Wrap="False"></ItemStyle>
					</asp:BoundColumn>
					<asp:TemplateColumn>
						<ItemStyle Wrap="False"></ItemStyle>
						<ItemTemplate>
							<asp:Label ID="lblAddress" Runat="server"></asp:Label>
						</ItemTemplate>
					</asp:TemplateColumn>
					<asp:BoundColumn DataField="CandidateStage">
						<ItemStyle Wrap="False"></ItemStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="CandidateProgram">
						<ItemStyle Wrap="False"></ItemStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="CandidateYear">
						<ItemStyle Wrap="False"></ItemStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="CandidateTerm">
						<ItemStyle Wrap="False"></ItemStyle>
					</asp:BoundColumn>
					<asp:TemplateColumn>
						<HeaderStyle HorizontalAlign="Right"></HeaderStyle>
						<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
						<ItemTemplate>
							<asp:Label ID="lblCandidateCounselor" Runat="server" Visible="False">
								<%# DataBinder.Eval(Container.DataItem,"CandidateCounselor") %>
							</asp:Label>
							<asp:HyperLink ID="hlnkCandidateCounselor" Runat="server" NavigateUrl='<%# "mailto:"+DataBinder.Eval(Container.DataItem,"CounselorEmail") %>' Visible="False">
								<%# DataBinder.Eval(Container.DataItem,"CandidateCounselor") %>
							</asp:HyperLink>
						</ItemTemplate>
					</asp:TemplateColumn>
				</Columns>
			</asp:DataGrid>
		</td>
	</tr>
	<tr>
		<td>
			<asp:LinkButton id="lnkReturnToActivity" runat="server" />
		</td>
	</tr>
</table>
