<%@ Control Language="c#" AutoEventWireup="True" Codebehind="AdviseeDetails.ascx.cs" Inherits="Jenzabar.CRM.Faculty.Web.Portlets.AdviseeRosterPortlet.AdviseeDetails" %>
<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="fwk" namespace="Jenzabar.Portal.Framework.Web.UI.Controls" assembly="Jenzabar.Portal.Framework.Web" %>
<jenzabar:errordisplay id="errDisplay" Runat="server"></jenzabar:errordisplay>
<div class="pSection">
<h4>
    <asp:Label id="hdrName" runat="server" Visible="false" />
    <fwk:MyInfoPopup id="ppMyInfo" runat="server"></fwk:MyInfoPopup>
	<asp:ImageButton id="imgEmail" runat="server" OnCommand="Email_Click" imageurl="~/UI/Common/Images/PortletImages/Icons/email.gif" /></asp:Label>
</h4>                
	<jenzabar:Hint id="hntSummary" runat="server">
		<TABLE cellSpacing="0" cellPadding="0" width="100%">
			<TR>
				<TD vAlign="top">
					<asp:Table id="tblSummaryLeft" Runat="server" CellSpacing="2" CellPadding="2"></asp:Table></TD>
				<TD vAlign="top">
					<asp:Table id="tblSummaryRight" Runat="server" CellSpacing="2" CellPadding="2"></asp:Table></TD>
			</TR>
		</TABLE>
		<jenzabar:GlobalizedLiteral id="litNoData" TextKey="TXT_AR_NO_REG_DETAILS" runat="server"></jenzabar:GlobalizedLiteral>
	</jenzabar:Hint>
	
	<jenzabar:groupedgrid id="dgHolds" runat="server" RenderTableHeaders="true" ShowHeader="true" CollapseSubItems="true">
		<TableHeaderTemplate>
			<font color="#ff0000"><jenzabar:GlobalizedLiteral id="glitHolds" runat="server" TextKey="TXT_HOLDS"></jenzabar:GlobalizedLiteral></font>
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
	<h5><jenzabar:GlobalizedLiteral id="litTools" TextKey="TXT_AR_TOOLS_AND_INFO" runat="server"></jenzabar:GlobalizedLiteral></h5>
	<table cellSpacing="3" cellPadding="0" border="0" width="100%">
		<tr>
			<td width="50%" valign="top">
				<table cellSpacing="0" class="groupedGrid" cellPadding="0" border="0" width="100%">
					<tr>
						<th><jenzabar:GlobalizedLiteral id="litRecords" TextKey="TXT_ACADEMIC_RECORDS" runat="server"></jenzabar:GlobalizedLiteral></th>
					</tr>
					<tr>
						<td>
							<ul>
								<li><jenzabar:GlobalizedLinkButton id="lnkAcademicHistory" runat="server" TextKey="TXT_ACADEMIC_HISTORY"></jenzabar:GlobalizedLinkButton> </li>
								<li id="itmCrsHist" runat="server"><jenzabar:GlobalizedLinkButton id="lnkCourseHistory" runat="server" TextKey="TXT_COURSE_HISTORY"></jenzabar:GlobalizedLinkButton> </li>
								<li id="itmGPAProj" runat="server"><jenzabar:GlobalizedLinkButton id="lnkGPAProjection" runat="server" TextKey="TXT_GPA_PROJECTION"></jenzabar:GlobalizedLinkButton> </li>
								<li id="itmGrdRpt" runat="server"><jenzabar:GlobalizedLinkButton id="lnkGradeReport" runat="server" TextKey="TXT_GRADE_REPORT"></jenzabar:GlobalizedLinkButton> </li>
								<li id="itmUnoffTrans" runat="server"><jenzabar:GlobalizedLinkButton id="lnkUnofficialTrans" runat="server" TextKey="TXT_UT_LBL"></jenzabar:GlobalizedLinkButton> </li>
							</ul>
						</td>
					</tr>
					<tr  id="hdrAdv" runat="server">
						<th><jenzabar:GlobalizedLiteral id="litAdvising" TextKey="TXT_ADVISING" runat="server"></jenzabar:GlobalizedLiteral></th>
					</tr>
					<tr id="advItems" runat="server">
						<td>
							<ul>
								<li id="itmAdvMeet" runat="server"><jenzabar:GlobalizedLinkButton id="lnkAdvMeetings" runat="server" TextKey="TXT_AR_ADVISEE_MEETINGS"></jenzabar:GlobalizedLinkButton> </li>
								<li id="itmCrsNeeds" runat="server"><jenzabar:GlobalizedLinkButton id="lnkCourseNeeds" runat="server" TextKey="TXT_CN_COURSE_NEEDS"></jenzabar:GlobalizedLinkButton> </li>
								<li id="itmDegAudit" runat="server"><jenzabar:GlobalizedLinkButton id="lnkDegreeAudit" runat="server" TextKey="TXT_DEGREE_AUDIT"></jenzabar:GlobalizedLinkButton> </li>
								<li id="itmMjrExp" runat="server"><jenzabar:GlobalizedLinkButton id="lnkMajorExp" runat="server" TextKey="TXT_AR_MAJOR_EXPLORATION"></jenzabar:GlobalizedLinkButton> </li>
							</ul>
						</td>
					</tr>
					
				</table>
			</td>
			<td width="50%" valign="top">
				<table cellSpacing="0" class="groupedGrid" cellPadding="0" border="0" width="100%">
					
					<tr id="hdrFinAid" runat="server">
						<th><jenzabar:GlobalizedLiteral id="litFinAid" TextKey="TXT_FINANCIAL_AID" runat="server"></jenzabar:GlobalizedLiteral></th>
					</tr>
					<tr id="FinAidItems" runat="server">
						<td>
							<ul>
								<li id="itmFinAwards" runat="server"><jenzabar:GlobalizedLinkButton id="lnkFinAwards" runat="server" TextKey="TXT_FINANCIAL_AID_AWARDS"></jenzabar:GlobalizedLinkButton> </li>
								<li id="itmMisDocs" runat="server"><jenzabar:GlobalizedLinkButton id="lnkMisRecDocs" runat="server" TextKey="TXT_MIS_REC_DOCS"></jenzabar:GlobalizedLinkButton> </li>
							</ul>
						</td>
					</tr>
					<tr id="hdrHousing" runat="server">
						<th><jenzabar:GlobalizedLiteral id="litHousing" TextKey="TXT_HOUSING" runat="server"></jenzabar:GlobalizedLiteral></th>
					</tr>
					<tr id="houItems" runat="server">
						<td>
							<ul>
								<li id="itmResInfo" runat="server"><jenzabar:GlobalizedLinkButton id="lnkResidenceInfo" runat="server" TextKey="TXT_RESIDENCE_INFO"></jenzabar:GlobalizedLinkButton> </li>
							</ul>
						</td>
					</tr>
					<tr id="hdrRegistration" runat="server">
						<th><jenzabar:GlobalizedLiteral id="litRegistration" TextKey="TXT_REGISTRATION" runat="server"></jenzabar:GlobalizedLiteral></th>
					</tr>
					<tr id="regItems" runat="server">
						<td>
							<ul>
								<li id="itmAddDrop" runat="server"><jenzabar:GlobalizedLinkButton id="lnkAddDrop" runat="server" TextKey="TXT_CS_ADD_DROP_COURSES"></jenzabar:GlobalizedLinkButton> </li>
								<li id="itmStdSch" runat="server"><jenzabar:GlobalizedLinkButton id="lnkStudentSchedule" runat="server" TextKey="TXT_STUDENT_SCHEDULE"></jenzabar:GlobalizedLinkButton> </li>
								<li id="itmCrsSch" runat="server"><jenzabar:GlobalizedLinkButton id="lnkCourseSchedule" runat="server" TextKey="TXT_CS_ADVANCED_COURSE_SEARCH"></jenzabar:GlobalizedLinkButton> </li>
							</ul>
						</td>
					</tr>
					<tr id="hdrAddress" runat="server">
						<th><jenzabar:GlobalizedLiteral id="litAddress" TextKey="TXT_ADDRESS" runat="server"></jenzabar:GlobalizedLiteral></th>
					</tr>
					    <TR>
							<TD>
							    <asp:datagrid id="dgAddresses" runat="server" GridLines="None" AutoGenerateColumns="False" ShowFooter="False"
									FooterStyle-CssClass="header" HeaderStyle-CssClass="header" AlternatingItemStyle-CssClass="alt"
									Width="100%" ShowHeader="False">
									<Columns>
										<asp:BoundColumn DataField="AddrInfoDetail">
											<ItemStyle Wrap="False"></ItemStyle>
										</asp:BoundColumn>
									</Columns>
								</asp:datagrid>
							</TD>
						</TR>
				</table>
			</td>
		</tr>
	</table>
	
	
</div>
