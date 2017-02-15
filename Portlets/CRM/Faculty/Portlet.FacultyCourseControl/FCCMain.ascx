<%@ Register TagPrefix="cmn" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="FCCMain.ascx.cs" Inherits="Jenzabar.CRM.Faculty.Web.Portlets.FacultyCourseControlPortlet.FCCMain" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<h4><asp:label id="lblCrsListFor" runat="server"></asp:label></h4>
<div class="pSection">
<cmn:ContentBox ID="FilterBox" runat="server">
<DIV id=divTop runat="server" visible="False">
<TABLE cellSpacing=3 cellPadding=5 width="100%" border=0>
  <TR>
    <TH width="5%" nowrap>
<cmn:GlobalizedLabel id=lblTerm runat="server" TextKey="LBL_TERM" AssociatedControlID="ddlTerm"></cmn:GlobalizedLabel></TH>
    <TD>
<asp:dropdownlist id=ddlTerm Runat="server"></asp:dropdownlist></TD>
    <TH width="5%" nowrap>
<cmn:GlobalizedLabel id=lblDivision runat="server" AssociatedControlID="ddlDivision"></cmn:GlobalizedLabel>:</TH>
    <TD>
<asp:dropdownlist id=ddlDivision Runat="server"></asp:dropdownlist></TD></TR></TABLE></DIV>
<DIV id=divFaculty runat="server" visible="False">
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TR>
    <TD width="10%">
<cmn:GlobalizedLabel id=lblFaculty runat="server" TextKey="LBL_FACULTY" AssociatedControlID="ddlFaculty"></cmn:GlobalizedLabel></TD>
    <TD colSpan=3>
<asp:dropdownlist id=ddlFaculty Runat="server"></asp:dropdownlist></TD></TR></TABLE></DIV><BR>
<DIV id=divMain runat="server" visible="False">
<TABLE cellSpacing=3 cellPadding=5 width="100%" border=0>
  <TR>
    <TD colSpan=2>
<cmn:GlobalizedButton id=btnSearch runat="server" TextKey="TXT_SEARCH"></cmn:GlobalizedButton></TD>
    <TD align=right colSpan=2>
<cmn:GlobalizedLinkButton id=lnkFacultySchedule runat="server" TextKey="TXT_FAC_VIEW_MY_FACULTY_SCHEDULE"></cmn:GlobalizedLinkButton></TD></TR></TABLE></DIV>
</cmn:ContentBox>
<br>
<div id="divCourses" visible="False" runat="server">
	<table cellSpacing="0" cellPadding="0" width="100%" border="0">
		<tr>
			<td colSpan="4">
				<cmn:GroupedGrid id="ggCourseList" Runat="server" DataKeyField="ERPCourseKey" RenderTableHeaders="true">
					<TableHeaderTemplate>
						<%= base._tableHeaderText %>
					</TableHeaderTemplate>
					<Columns>
						<cmn:GlobalizedBoundColumn DataField="DisplayedCourseCode" HeaderTextKey="TXT_COURSE" />
						<cmn:GlobalizedBoundColumn DataField="Title" HeaderTextKey="TXT_TITLE" />
						<cmn:GlobalizedBoundColumn DataField="CatalogCode" HeaderTextKey="TXT_CATALOG" />
						<cmn:GlobalizedBoundColumn DataField="DivisionDesc" HeaderTextKey="TXT_GS_DIVISION" />
						<cmn:GlobalizedTemplateColumn HeaderTextKey="TXT_GO_DIRECTLY_TO">
							<ItemTemplate>
								<asp:Label Runat=server AssociatedControlID="ddlGoTo" CssClass="accessibility">Select Area</asp:Label>
								<asp:DropDownList ID="ddlGoTo" Runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList_SelectedIndexChanged" />
							</ItemTemplate>
						</cmn:GlobalizedTemplateColumn>
						<cmn:GlobalizedBoundColumn DataField="EditFinalGrades" Visible="False" HeaderTextKey="Final" />
						<cmn:GlobalizedBoundColumn DataField="EditMidTermGrades" Visible="False" HeaderTextKey="MidTerm" />
					</Columns>
				</cmn:GroupedGrid>
			</td>
		</tr>
	</table>
</div>
</div>
