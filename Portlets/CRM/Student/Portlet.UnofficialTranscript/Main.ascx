<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Main.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.UnofficialTranscriptPortlet.Main" %>
<body runat="server" onselectstart="return false;">
	<div id="divHeader" visible="False" runat="server"></div>
	<div id="divBreadCrumb" runat="server" visible="true"><cmn:breadcrumbtrail id="brdHistory" visible="true" Runat="server"></cmn:breadcrumbtrail></div>
	<div class="pSection" id="divError" runat="server" visible="False"><cmn:errordisplay id="ctlError" RunAt="server"></cmn:errordisplay></div>
	<div class="pSection" id="divWarning" runat="server" visible="False"><asp:label id="lblWarning" Runat="server" CssClass="PortletError"></asp:label></div>
	<cmn:subheader id="shTranscriptFor" Runat="server" visible="false"></cmn:subheader>
	<div class="pSection" id="divHolds" runat="Server" visibile="true">
		<cmn:Hint id="hntHolds" runat="server"></cmn:Hint>
		<cmn:groupedgrid id="dgHolds" runat="server" RenderTableHeaders="true" ShowHeader="true" CollapseSubItems="true" UseAccessibleHeader="true">
			<TableHeaderTemplate>
				<font color="#ff0000">
					<cmn:GlobalizedLiteral id="glitHolds" runat="server" TextKey="TXT_HOLDS"></cmn:GlobalizedLiteral></font>
			</TableHeaderTemplate>
			<Columns>
				<cmn:PlusMinusColumn ItemStyle-VerticalAlign="Top" ItemStyle-Width="1%" ItemStyle-HorizontalAlign="Center" />
				<cmn:GlobalizedTemplateColumn HeaderTextKey="TXT_HOLD" ItemStyle-VerticalAlign="Top">
					<ItemTemplate>
						<%#DataBinder.Eval(Container.DataItem, "HoldCode")%> - <%#DataBinder.Eval(Container.DataItem, "HoldDescription")%>
					</ItemTemplate>
				</cmn:GlobalizedTemplateColumn>
				<cmn:GlobalizedBoundColumn HeaderTextKey="TXT_TYPE" DataField="HoldTypeDesc" ItemStyle-VerticalAlign="Top"></cmn:GlobalizedBoundColumn>
				<cmn:GlobalizedBoundColumn HeaderTextKey="TXT_BEGIN_DATE" DataField="HoldBeginDate" ItemStyle-VerticalAlign="Top"></cmn:GlobalizedBoundColumn>
				<cmn:GlobalizedBoundColumn HeaderTextKey="TXT_EXPIRATION" DataField="HoldExpirationDate" ItemStyle-VerticalAlign="Top"></cmn:GlobalizedBoundColumn>
				<cmn:GlobalizedBoundColumn HeaderTextKey="TXT_OFFICE" DataField="OfficeName" ItemStyle-VerticalAlign="Top"></cmn:GlobalizedBoundColumn>
			</Columns>
			<SubItemTemplate>
				<table cellSpacing="0" cellPadding="0" border="0" align="center">
					<tr runat="server" visible='<%#DataBinder.Eval(Container.DataItem, "HoldRemark").ToString().Trim() != string.Empty%>'>
						<td align="right">
							<cmn:GlobalizedLiteral id="litRemarks" TextKey="TXT_REMARKS" runat="server"></cmn:GlobalizedLiteral>:</td>
						<td><%#DataBinder.Eval(Container.DataItem, "HoldRemark")%></td>
					</tr>
				</table>
			</SubItemTemplate>
		</cmn:groupedgrid>
	</div>
	<div class="pSection" id="divMain" runat="server" visible="true">
		<asp:table id="tblMain" style="BACKGROUND-POSITION: center center; BACKGROUND-REPEAT: repeat"
			runat="server" Visible="true" Width="99%">
			<asp:TableRow>
				<asp:TableCell>
					<asp:Label runat="server" ID="lblDivName" Visible="true"></asp:Label>
					<asp:DropDownList runat="server" Visible="False" AutoPostBack="True" ID="ddlDiv"></asp:DropDownList>
					<asp:Label ID="lblDivLabel" Visible="False" Runat="server"></asp:Label>
				</asp:TableCell>
			</asp:TableRow>
			<asp:TableRow>
				<asp:TableCell Text="&nbsp"></asp:TableCell>
			</asp:TableRow>
			<asp:TableRow>
				<asp:TableCell>
					<asp:Label runat="server" ID="lblNoData" Visible="false" CssClass="PortletError"></asp:Label>
				</asp:TableCell>
			</asp:TableRow>
			<asp:TableRow>
				<asp:TableCell>
					<asp:Label runat="server" ID="lblNotes" Visible="false"></asp:Label>
				</asp:TableCell>
			</asp:TableRow>
			<asp:TableRow Width="95%">
				<asp:TableCell ColumnSpan="10" Width="55%">
					<DIV runat="server" Visible="False" ID="divDivisionData" style="BORDER-RIGHT: 0px; BORDER-TOP: 1px; DISPLAY: block; MARGIN: 1px; POSITION:relative; BORDER-LEFT: 0px; WIDTH: 55%; BORDER-BOTTOM: 0px; align: left"
						align="left">
						<asp:table cssclass="GroupedGrid" runat="server" Visible="False" Width="55%" align="left" ID="tblDivisonData"></asp:table>
					</DIV>
				</asp:TableCell>
			</asp:TableRow>
			<asp:TableRow Width="100%">
				<asp:TableCell Width="100%">
					<DIV runat="server" Visible="False" ID="divTermData" style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; DISPLAY: block; MARGIN: 0px; POSITION:Relative; BORDER-LEFT: 0px; WIDTH: 99%; BORDER-BOTTOM: 0px; align: left"
						align="left" width="100%">
						<asp:Table cssclass="GroupedGrid" runat="server" Visible="False" ID="tblTermData" align="left"
							Width="100%"></asp:Table>
					</DIV>
				</asp:TableCell>
			</asp:TableRow>
			<asp:TableRow>
				<asp:TableCell Text="&amp;nbsp"></asp:TableCell>
			</asp:TableRow>
			<asp:TableRow>
				<asp:TableCell>
					<asp:Literal ID="litFootNote"></asp:Literal>
				</asp:TableCell>
			</asp:TableRow>
			<asp:TableRow>
				<asp:TableCell>
					<DIV runat="server" Visible="False" ID="divPrintLinks" class="psection">
						<TABLE id="tblPrintReportLinks" width="50%" visible="true">
							<TR>
								<TD colSpan="2">
									<asp:HyperLink runat="server" ID="lnkCustomReport"></asp:HyperLink>
								</TD>
							</TR>
							<TR>
								<TD colSpan="2" height="12">&nbsp;</TD>
							</TR>
							<TR>
								<TD>
									<asp:HyperLink runat="server" ID="lnkStandardReport" Visible="False"></asp:HyperLink>
								</TD>
							</TR>
						</TABLE>
					</DIV>
				</asp:TableCell>
			</asp:TableRow>
		</asp:table>
	</div>
</body>
