<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Default.ascx.cs" Inherits="Jenzabar.CRM.AdmissionsOfficer.Web.Portlets.ViewActivityPortlet.Default" %>
<P>
	<TABLE id="Table1" height="0" cellSpacing="3" cellPadding="3" width="100%" border="0">
		<TR>
			<TD><asp:datagrid id="dgViewActivity" runat="server" AutoGenerateColumns="False" ShowHeader="False"
					GridLines="None" CellSpacing="3">
					<Columns>
						<asp:BoundColumn DataField="Column1"></asp:BoundColumn>
						<asp:BoundColumn DataField="Column2">
							<HeaderStyle Width="100px"></HeaderStyle>
							<ItemStyle HorizontalAlign="Right"></ItemStyle>
						</asp:BoundColumn>
					</Columns>
				</asp:datagrid></TD>
		</TR>
		<TR>
			<TD><asp:label id="lblError" runat="server"></asp:label></TD>
		</TR>
		<TR>
			<TD>
				<P>&nbsp;<asp:linkbutton id="lnkViewDetail" runat="server"></asp:linkbutton></P>
			</TD>
		</TR>
	</TABLE>
</P>
