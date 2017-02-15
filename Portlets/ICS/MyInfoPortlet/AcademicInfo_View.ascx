<%@ Control Language="c#" AutoEventWireup="false" Codebehind="AcademicInfo_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.MyInfoPortlet.AcademicInfo_View" %>
<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="fwk" namespace="Jenzabar.Portal.Framework.Web.UI.Controls" assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Import namespace="Jenzabar.Portal.Framework" %>
<div class="pSection"><jenzabar:errordisplay id="errDisplay" Runat="server"></jenzabar:errordisplay>
	<div id="divLitForAdvisee" runat="server"><h4><jenzabar:globalizedliteral id="litForAdvisee" runat="server"></jenzabar:globalizedliteral></h4></div>
	<jenzabar:hint id="hntSummary" runat="server">
		<TABLE cellSpacing="0" cellPadding="0"  width="100%">
		<tr>
		<td valign="top">
		<asp:Literal ID="litPersInfo" runat="server"></asp:Literal>
		</td>
		<td valign="top">
		<TABLE cellSpacing="0" cellPadding="0" width="100%">
		<asp:Repeater ID="rptDivision" runat="server">
		    <ItemTemplate>
		    <tr>
		        <td colspan="2"><h5><asp:Label ID="lblDivision" runat="server"></asp:Label>&nbsp;<%#DataBinder.Eval(Container.DataItem, "DivisionDescription")%></h5></td>
		    </tr>
			<TR>
				<TD vAlign="top">
					<asp:Table id="tblSummaryLeft" Runat="server" CellPadding="2" CellSpacing="2"></asp:Table></TD>
				<TD vAlign="top">
 					<asp:Table id="tblSummaryRight" Runat="server" CellPadding="2" CellSpacing="2">
 					<asp:TableRow><asp:TableHeaderCell HorizontalAlign="Left">
  					<asp:Repeater id="rptOtherItems" runat="server" DataSource='<%# DataBinder.Eval(Container.DataItem, "Items")%>' >
 					    <ItemTemplate>
 					        <asp:Label id="lblOtherLabel" runat="server"><%#DataBinder.Eval(Container.DataItem, "ItemLabel")%>:</asp:Label>
 					        </th>
 					        <td>
 					        <asp:Label ID="lblOtherDesc" runat="server"><%#DataBinder.Eval(Container.DataItem, "ItemDescription")%></asp:Label>
 					        </td></tr>
  					        <tr><th align="left">
					    </ItemTemplate>
 					</asp:Repeater>
 			        </asp:TableHeaderCell></asp:TableRow>
                    </asp:Table>
 				</TD>
			</TR>
			</ItemTemplate>
		</asp:Repeater>	
		</TABLE>
		</td>
		</tr>
		</TABLE>
	</jenzabar:hint>
	<jenzabar:groupedgrid id="dgHolds" runat="server" ShowHeader="true" RenderTableHeaders="true">
		<TableHeaderTemplate>
			<font color="#ff0000">
				<jenzabar:GlobalizedLiteral id="glitHolds" runat="server" TextKey="TXT_HOLDS"></jenzabar:GlobalizedLiteral></font>
		</TableHeaderTemplate>
		<Columns>
			<jenzabar:PlusMinusColumn ItemStyle-VerticalAlign="Top" ItemStyle-Width="1%" ItemStyle-HorizontalAlign="Center" />
			<jenzabar:GlobalizedBoundColumn HeaderTextKey="TXT_CODE" DataField="HoldCode" ItemStyle-VerticalAlign="Top"></jenzabar:GlobalizedBoundColumn>
			<jenzabar:GlobalizedBoundColumn HeaderTextKey="TXT_TYPE" DataField="HoldTypeDesc" ItemStyle-VerticalAlign="Top"></jenzabar:GlobalizedBoundColumn>
			<jenzabar:GlobalizedBoundColumn HeaderTextKey="TXT_BEGIN_DATE" DataField="HoldBeginDate" ItemStyle-VerticalAlign="Top"></jenzabar:GlobalizedBoundColumn>
			<jenzabar:GlobalizedBoundColumn HeaderTextKey="TXT_EXPIRATION" DataField="HoldExpirationDate" ItemStyle-VerticalAlign="Top"></jenzabar:GlobalizedBoundColumn>
			<jenzabar:GlobalizedBoundColumn HeaderTextKey="TXT_OFFICE" DataField="OfficeName" ItemStyle-VerticalAlign="Top"></jenzabar:GlobalizedBoundColumn>
		</Columns>
		<SubItemTemplate>
			<table cellSpacing="0" cellPadding="0" border="0" align="center">
				<tr runat="server" visible='<%#DataBinder.Eval(Container.DataItem, "HoldDescription").ToString().Trim() != string.Empty%>'>
					<td align="right">
						<jenzabar:GlobalizedLiteral id="litDesc" TextKey="TXT_DESCRIPTION" runat="server"></jenzabar:GlobalizedLiteral>:</td>
					<td><%#DataBinder.Eval(Container.DataItem, "HoldDescription")%></td>
				</tr>
				<tr runat="server" visible='<%#DataBinder.Eval(Container.DataItem, "HoldRemark").ToString().Trim() != string.Empty%>'>
					<td align="right">
						<jenzabar:GlobalizedLiteral id="litRemarks" TextKey="TXT_REMARKS" runat="server"></jenzabar:GlobalizedLiteral>:</td>
					<td><%#DataBinder.Eval(Container.DataItem, "HoldRemark")%></td>
				</tr>
			</table>
		</SubItemTemplate>
	</jenzabar:groupedgrid>
	<jenzabar:groupedgrid id="dgExam" runat="server" RenderTableHeaders="true" ShowHeader="true">
		<TableHeaderTemplate>
			<jenzabar:GlobalizedLiteral id="litExam" runat="server" TextKey="TXT_EXAMS"></jenzabar:GlobalizedLiteral>
		</TableHeaderTemplate>
		<Columns>
			<jenzabar:GlobalizedBoundColumn HeaderTextKey="TXT_EXAM" DataField="TestName" ItemStyle-VerticalAlign="Top"></jenzabar:GlobalizedBoundColumn>
			<jenzabar:GlobalizedBoundColumn HeaderTextKey="TXT_DATE" DataField="TestDate" ItemStyle-VerticalAlign="Top"></jenzabar:GlobalizedBoundColumn>
			<jenzabar:GlobalizedTemplateColumn HeaderTextKey="TXT_SCORES">
				<ItemTemplate>
					<asp:Label ID="lblCompScore" Runat="server" Text='<%# Globalizer.GetGlobalizedString("TXT_COMPOSITE") + ": " + DataBinder.Eval(Container.DataItem, "CompositeScore")%>' Visible='<%# DataBinder.Eval(Container.DataItem, "CompositeScore").ToString() != string.Empty%>'>
					</asp:Label>
					<asp:DataList ID="lstScores" Runat="server" DataSource='<%# GetScoreDataSource(DataBinder.Eval(Container.DataItem, "TestElement"))%>' OnItemDataBound="lstScores_ItemDataBound">
						<ItemTemplate>
								<asp:Label ID="lblExam" Runat="server" />
								<asp:Label ID="lblScore" Runat="server" />
						</ItemTemplate>
					</asp:DataList>
				</ItemTemplate>
			</jenzabar:GlobalizedTemplateColumn>
		</Columns>
	</jenzabar:groupedgrid>
</div>
