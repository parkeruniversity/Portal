<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ViewContacts.ascx.cs" Inherits="Jenzabar.CRM.AdmissionsOfficer.Web.Portlets.ViewCandidatePortlet.ViewContacts" %>



<TABLE id=Table1 cellSpacing=3 cellPadding=3 width="100%" border=0>
  <TR>
    <TD><asp:label id=lblError Font-Bold="True" runat="server" ForeColor="#ff0000"></asp:label></TD></TR>
  <TR>
    <TD><asp:label id=lblContactsFor Font-Bold="True" runat="server"></asp:label></TD></TR></TABLE>
<TABLE id=Table2 cellSpacing=5 cellPadding=5 width="100%" border=0>
  <TR>
    <TD><asp:label id=lblCompletedTitle Font-Bold="True" runat="server"></asp:label></TD></TR>
  <TR>
    <TD><asp:datagrid id=dgCompletedContacts runat="server" GridLines="Vertical" AutoGenerateColumns="False" ShowFooter="False" FooterStyle-CssClass="header" HeaderStyle-CssClass="header" AlternatingItemStyle-CssClass="alt" ShowHeader="True" Width="100%">
				<Columns>
					<asp:BoundColumn DataField="ContactDate">
						<ItemStyle Wrap="False" Width="100px"></ItemStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="ContactType">
						<ItemStyle Wrap="False" Width="100px"></ItemStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="ContactDesc">
						<ItemStyle Wrap="True" Width="300px"></ItemStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="ContactInOut">
						<ItemStyle Wrap="False" Width="100px"></ItemStyle>
					</asp:BoundColumn>
					<asp:TemplateColumn>
						<ItemStyle Wrap="False"></ItemStyle>
						<ItemTemplate>
							<asp:Label ID="lblContactPersonInvolved" Runat="server" Visible="False">
								<%# DataBinder.Eval(Container.DataItem,"ContactPersonInvolved") %>
							</asp:Label>
							<asp:HyperLink ID="hlnkContactPersonInvolved" Runat="server" Visible="False" NavigateUrl='<%# "mailto:"+DataBinder.Eval(Container.DataItem,"PersonInvolvedEmailAddr") %>'>
								<%# DataBinder.Eval(Container.DataItem,"ContactPersonInvolved") %>
							</asp:HyperLink>
						</ItemTemplate>
					</asp:TemplateColumn>
					<asp:BoundColumn DataField="ContactNotes">
						<ItemStyle Wrap="True" Width="600px"></ItemStyle>
					</asp:BoundColumn>
				</Columns>
			</asp:datagrid></TD></TR>
  <TR>
    <TD><asp:label id=lblCompletedWarn Font-Bold="False" runat="server" ForeColor="Red" Visible="False"></asp:label></TD></TR></TABLE>
<TABLE id=Table3 cellSpacing=5 cellPadding=5 width="100%" border=0>
  <TR>
    <TD><asp:label id=lblExpectedTitle Font-Bold="True" runat="server"></asp:label></TD></TR>
  <TR>
    <TD><asp:datagrid id=dgExpectedContacts runat="server" GridLines="Vertical" AutoGenerateColumns="False" ShowFooter="False" FooterStyle-CssClass="header" HeaderStyle-CssClass="header" AlternatingItemStyle-CssClass="alt" ShowHeader="True" Width="100%">
				<FooterStyle CssClass="header"></FooterStyle>
				<AlternatingItemStyle CssClass="alt"></AlternatingItemStyle>
				<HeaderStyle CssClass="header"></HeaderStyle>
				<Columns>
					<asp:BoundColumn DataField="ContactDate">
						<ItemStyle Wrap="False" Width="100px"></ItemStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="ContactType">
						<ItemStyle Wrap="False" Width="100px"></ItemStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="ContactDesc">
						<ItemStyle Wrap="True" Width="300px"></ItemStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="ContactInOut">
						<ItemStyle Wrap="False" Width="100px"></ItemStyle>
					</asp:BoundColumn>
					<asp:TemplateColumn>
						<ItemStyle Wrap="False"></ItemStyle>
						<ItemTemplate>
							<asp:Label ID="lblContactPersonInvolved" Runat="server" Visible="False">
								<%# DataBinder.Eval(Container.DataItem,"ContactPersonInvolved") %>
							</asp:Label>
							<asp:HyperLink ID="hlnkContactPersonInvolved" Runat="server" Visible="False" NavigateUrl='<%# "mailto:"+DataBinder.Eval(Container.DataItem,"PersonInvolvedEmailAddr") %>'>
								<%# DataBinder.Eval(Container.DataItem,"ContactPersonInvolved") %>
							</asp:HyperLink>
						</ItemTemplate>
					</asp:TemplateColumn>
					<asp:BoundColumn DataField="ContactNotes">
						<ItemStyle Wrap="True" Width="600px"></ItemStyle>
					</asp:BoundColumn>
				</Columns>
			</asp:datagrid></TD></TR>
  <TR>
    <TD><asp:label id=lblExpectedWarn Font-Bold="False" runat="server" ForeColor="Red" Visible="False"></asp:label></TD></TR></TABLE>
<p></P>
<TABLE id=Table4 cellSpacing=3 cellPadding=3 width="100%" border=0>
  <TR>
    <TD><asp:linkbutton id=lnkViewCandidate Runat="server"></asp:linkbutton></TD></TR></TABLE>
