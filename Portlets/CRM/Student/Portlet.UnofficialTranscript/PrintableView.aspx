<%@ Page Language="c#" AutoEventWireup="false" Codebehind="PrintableView.aspx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.UnofficialTranscriptPortlet.PrintableView" %>
<Title>Printable Unofficial Transcript</Title>
<body onselectstart="return false;">
	<DIV class="psection" id="divMain" Visible="false" Runat="server">
		<asp:table id="tblMain" style="BACKGROUND-POSITION: center center; BACKGROUND-REPEAT: repeat"
			Visible="true" runat="server">
			<asp:TableRow>
				<asp:TableCell Text="&amp;nbsp"></asp:TableCell>
			</asp:TableRow>
			<asp:TableRow>
				<asp:TableCell>
					<asp:Label runat="server" ID="lblStudentName" Visible="False"></asp:Label>
				</asp:TableCell>
			</asp:TableRow>
			<asp:TableRow>
				<asp:TableCell Text="&amp;nbsp"></asp:TableCell>
			</asp:TableRow>
			<asp:TableRow>
				<asp:TableCell>
					<asp:Label runat="server" ID="lblDivName" Visible="False"></asp:Label>
				</asp:TableCell>
			</asp:TableRow>
			<asp:TableRow>
				<asp:TableCell Text="&amp;nbsp"></asp:TableCell>
			</asp:TableRow>
			<asp:TableRow>
				<asp:TableCell>
					<asp:Label runat="server" ID="lblNotes"></asp:Label>
				</asp:TableCell>
			</asp:TableRow>
			<asp:TableRow Width="95%">
				<asp:TableCell ColumnSpan="10" Width="55%">
					<DIV runat="server" Visible="False" ID="divDivisionData" style="BORDER-RIGHT: 0px; BORDER-TOP: 1px; DISPLAY: block; MARGIN: 1px; BORDER-LEFT: 0px; WIDTH: 55%; BORDER-BOTTOM: 0px; HEIGHT: 130px; align: left"
						align="left">
						<asp:Table runat="server" Visible="False" BackColor="White" Width="55%" align="left" ID="tblDivisonData"></asp:Table>
					</DIV>
				</asp:TableCell>
			</asp:TableRow>
			<asp:TableRow Width="95%">
				<asp:TableCell Width="95%">
					<DIV runat="server" Visible="False" ID="divTermData" style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; DISPLAY: block; MARGIN: 1px; BORDER-LEFT: 0px; WIDTH: 95%; BORDER-BOTTOM: 0px; HEIGHT: 250px; align: left"
						align="left">
						<asp:Table runat="server" Visible="False" BackColor="White" ID="tblTermData" align="left"></asp:Table>
					</DIV>
				</asp:TableCell>
			</asp:TableRow>
			<asp:TableRow>
				<asp:TableCell Text="&amp;nbsp"></asp:TableCell>
			</asp:TableRow>
			<asp:TableRow>
				<asp:TableCell><asp:Literal ID="litFootNote"></asp:Literal></asp:TableCell>
			</asp:TableRow>
		</asp:table>
	</DIV>
</body>
