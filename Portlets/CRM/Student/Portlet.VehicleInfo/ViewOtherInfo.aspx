<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Page language="c#" Codebehind="ViewOtherInfo.aspx.cs" validateRequest="false" AutoEventWireup="True" Inherits="Jenzabar.CRM.Student.Web.Portlets.VehicleInfoPortlet.ViewOtherInfo" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>Violations</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table1" cellSpacing="3" cellPadding="3" width="100%" border="0">
				<TR>
					<TD>&nbsp;<asp:label id="lblHeader" runat="server" Width="100%"></asp:label></TD>
				</TR>
				<TR>
					<TD><asp:datagrid class="groupedGrid" id="dgViolations" runat="server" AutoGenerateColumns="False"
							Width="100%" GridLines="None" AlternatingItemStyle-CssClass="alt" ShowHeader="True" BorderColor="#999999"
							BorderStyle="None" BorderWidth="1px" BackColor="White" CellPadding="3">
							<HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#000084"></HeaderStyle>
							<Columns>
								<asp:BoundColumn DataField="ViolationDescription"></asp:BoundColumn>
								<asp:BoundColumn DataField="ViolationDate"></asp:BoundColumn>
								<asp:BoundColumn DataField="ViolationFeeYN"></asp:BoundColumn>
							</Columns>
							<PagerStyle HorizontalAlign="Center" ForeColor="Black" BackColor="#999999" Mode="NumericPages"></PagerStyle>
						</asp:datagrid></TD>
				</TR>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td><asp:Button id="btnClose" runat="server" Text="Close"></asp:Button></td>
				</tr>
				<TR>
					<TD><asp:label id="lblError" runat="server" Width="100%"></asp:label></TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>
