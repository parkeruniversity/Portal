<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Biography_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.MyInfoPortlet.Biography_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="framework" namespace="Jenzabar.Portal.Framework.Web.UI.Controls" assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Import namespace="Jenzabar.ICS" %>
<common:subheader id="shNameAddress" runat="server" canEdit="true" Visible="false"></common:subheader><asp:literal id="litNoErp" runat="server" Visible="false"></asp:literal>
<div class="pSection" id="divNameAddress" runat="server" Visible="false">
		<table width="100%">
			<tr><td width="50%" valign="top">
					<table width="100%" cellSpacing="0" cellPadding="0" >
						<tr>
							<td><strong><asp:label id="lblUserName" runat="server"></asp:label></strong></td>
						</tr>
						<tr>
							<td><asp:literal id="litAddress" runat="server"></asp:literal></td>
						</tr>
					</table>
				</td><td width="50%" valign="top">
					<table cellSpacing="0" cellPadding="0" width="100%">
						<tr>
							<td noWrap align="left"><strong><asp:label id="lblNickname" runat="server" Visible="False"></asp:label></strong></td>
							<td align="left" width="100%"><asp:label id="txtNickname" runat="server" Visible="False"></asp:label></td>
						</tr>
						<tr>
							<td noWrap align="left"><strong><asp:label id="lblBirthdate" runat="server" Visible="False"></asp:label></strong></td>
							<td align="left" width="100%"><asp:label id="txtBirthdate" runat="server" Visible="False"></asp:label></td>
						</tr>
						<tr>
							<td noWrap align="left"><strong><asp:label id="lblMaritalStatus" runat="server" Visible="False"></asp:label></strong></td>
							<td align="left" width="100%"><asp:label id="txtMaritalStatus" runat="server" Visible="False"></asp:label></td>
						</tr>
						<tr>
							<td noWrap align="left"><strong><asp:label id="lblSpouse" runat="server" Visible="False"></asp:label></strong></td>
							<td align="left" width="100%"><asp:label id="txtSpouse" runat="server" Visible="False"></asp:label></td>
						</tr>
						<tr>
							<td noWrap align="left"><strong><asp:label id="lblGender" runat="server" Visible="False"></asp:label></strong></td>
							<td align="left" width="100%"><asp:label id="txtGender" runat="server" Visible="False"></asp:label></td>
						</tr>
						<tr>
							<td noWrap align="left"><strong><asp:label id="lblEthnicity" runat="server" Visible="False"></asp:label></strong></td>
							<td align="left" width="100%"><asp:label id="txtEthnicity" runat="server" Visible="False"></asp:label></td>
						</tr>
						<tr>
							<td noWrap align="left"><strong><asp:label id="lblIDNumber" runat="server"></asp:label></strong></td>
							<td align="left" width="100%"><asp:label id="txtIDNumber" runat="server"></asp:label></td>
						</tr>
					</table>
			</td></tr>
		</table>
</div>
<common:subheader id="shOtherAddresses" canEdit="true" runat="server" ></common:subheader>
	<div class="pSection" id="divOtherAddresses" runat="server">
		<table width="100%" cellSpacing="0" cellPadding="0" >
			<asp:repeater id="rptOtherAddresses" Runat="server">
				<ItemTemplate>
    			<tr>
					<div style="MARGIN-TOP:5px;MARGIN-BOTTOM:10px;MARGIN-LEFT:0px;MARGIN-RIGHT:0px;">
					<td valign="top" width="20%" >
    					<strong><asp:Label ID="lblAddressType" Runat="server"></asp:Label></strong>
    				</td><td >
	    				<asp:Literal id="litOtherAddress" runat="server"></asp:Literal>
		    			<asp:Label id="lblOtherPhone" runat="server"></asp:Label>
		    			<asp:Label id="lblActiveDates" runat="server"></asp:Label>
		    		</td>
					</div>
    			</tr>
				</ItemTemplate>
				<SeparatorTemplate> <tr><td>&nbsp;</td></tr></SeparatorTemplate>
			</asp:repeater>
			<tr><td><asp:Label ID="lblNoAddress" runat="server" /></td></tr>
		</table>
	</div>
<common:subheader id="shFaculty" runat="server" Visible="false"></common:subheader>
	<div class="pSection" id="divFaculty" runat="server" Visible="false">
		<table width="100%">
			<tr><td width="50%" valign="top">
					<table width="100%" cellSpacing="0" cellPadding="0" >
						<tr>
							<td noWrap align="left"><strong><asp:label id="lblDepartment" runat="server"></asp:label></strong></td>
							<td align="left" ><asp:label id="txtDepartment" runat="server"></asp:label></td>
						</tr>
						<tr>
							<td noWrap align="left"><strong><asp:label id="lblDivision" runat="server"></asp:label></strong></td>
							<td align="left" ><asp:label id="txtDivision" runat="server"></asp:label></td>
						</tr>
						<tr>
							<td noWrap align="left"><strong><asp:label id="lblFacultyTitle" runat="server"></asp:label></strong></td>
							<td align="left" ><asp:label id="txtFacultyTitle" runat="server"></asp:label></td>
						</tr>
						<tr>
							<td noWrap align="left"><strong><asp:label id="lblRank" runat="server"></asp:label></strong></td>
							<td align="left" ><asp:label id="txtRank" runat="server"></asp:label></td>
						</tr>
						<tr>
							<td noWrap align="left"><strong><asp:label id="lblAbbreviation" runat="server"></asp:label></strong></td>
							<td align="left" ><asp:label id="txtAbbreviation" runat="server"></asp:label></td>
						</tr>
						<tr>
							<td noWrap align="left"><strong><asp:label id="lblOffice" runat="server"></asp:label></strong></td>
							<td align="left" ><asp:label id="txtOffice" runat="server"></asp:label></td>
						</tr>
						<tr>
							<td noWrap align="left"><strong><asp:label id="lblOfficeRoomNo" runat="server"></asp:label></strong></td>
							<td align="left" ><asp:label id="txtOfficeRoomNo" runat="server"></asp:label></td>
						</tr>
						<tr>
							<td noWrap align="left"><strong><asp:label id="lblOfficePhone" runat="server"></asp:label></strong></td>
							<td align="left" ><asp:label id="txtOfficePhone" runat="server"></asp:label></td>
						</tr>
					</table>
				</td><td width="50%" valign="top">
					<table cellSpacing="0" cellPadding="0" width="100%">
						<tr>
							<td noWrap align="left"><strong><asp:label id="lblTenuredDate" runat="server"></asp:label></strong></td>
            				<td align="left" ><asp:label id="txtTenuredDate" runat="server"></asp:label></td>
						</tr>
						<tr>
							<td noWrap align="left"><strong><asp:label id="lblMonths" runat="server"></asp:label></strong></td>
            				<td align="left" ><asp:label id="txtMonths" runat="server"></asp:label></td>
						</tr>
						<tr>
							<td noWrap align="left"><strong><asp:label id="lblContractYesNo" runat="server"></asp:label></strong></td>
							<td align="left" ><asp:label id="txtContractYesNo" runat="server"></asp:label></td>
						</tr>
						<tr>
							<td noWrap align="left"><strong><asp:label id="lblContractBeginDate" runat="server"></asp:label></strong></td>
							<td align="left" ><asp:label id="txtContractBeginDate" runat="server"></asp:label></td>
						</tr>
						<tr>
							<td noWrap align="left"><strong><asp:label id="lblContractEndDate" runat="server"></asp:label></strong></td>
							<td align="left" ><asp:label id="txtContractEndDate" runat="server"></asp:label></td>
						</tr>
						<tr>
							<td noWrap align="left"><strong><asp:label id="lblPartTime" runat="server"></asp:label></strong></td>
							<td align="left" ><asp:label id="txtPartTime" runat="server"></asp:label></td>
						</tr>
						<tr>
							<td noWrap align="left"><strong><asp:label id="lblStatus" runat="server"></asp:label></strong></td>
							<td align="left" ><asp:label id="txtStatus" runat="server"></asp:label></td>
						</tr>
					</table>
			</td></tr>
		</table>
	</div>
<common:subheader id="shRelations" runat="server" Visible="false"></common:subheader>
	<div class="pSection" id="divRelations" runat="server" Visible="false">
		<table width="100%" cellSpacing="0" cellPadding="0" >
			<tr>
				<td width="100%"><asp:repeater id="rptRelations" Runat="server">
					<ItemTemplate>
						<div style="MARGIN-TOP:5px;MARGIN-BOTTOM:5px;MARGIN-LEFT:0px;MARGIN-RIGHT:0px;">
							<strong><asp:Label ID="lblRelationName" Runat="server"></asp:Label></strong>
							<asp:Label id="lblRelationDesc" runat="server"></asp:Label>
						</div>
					</ItemTemplate>
				</asp:repeater></td>
			</tr>
		</table>
	</div>
<common:subheader id="shOtherNames" runat="server" Visible="false"></common:subheader>
	<div class="pSection" id="divOtherNames" runat="server" Visible="false">
		<table width="100%" cellSpacing="0" cellPadding="0" >
   			<asp:repeater id="rptOtherNames" Runat="server">
				<ItemTemplate>
        			<tr>
		        		<td width="20%">
							<strong><asp:Label ID="lblOtherName" Runat="server"></asp:Label></strong>
							</td><td>
							<asp:Label id="lblOtherNameDesc" runat="server"></asp:Label>
				        </td>
        			</tr>
				</ItemTemplate>
			</asp:repeater>
    		<asp:repeater id="rptFacOtherNames" Runat="server">
				<ItemTemplate>
		        	<tr>
	    		        <td width="20%">
							<strong><asp:Label ID="lblFacOtherName" Runat="server"></asp:Label></strong>
							</td><td>
							<asp:Label id="txtFacOtherName" runat="server"></asp:Label>
        				</td>
		        	</tr>
				</ItemTemplate>
			</asp:repeater>
		</table>
	</div>
<common:subheader id="shEducation" runat="server" Visible="false"></common:subheader>
	<div class="pSection" id="divEducation" runat="server" Visible="false">
		<table width="100%" cellSpacing="0" cellPadding="0" >
			<tr>
				<td width="100%"><asp:Label ID="lblNoEducationInfo" Runat="server" Visible="False"></asp:Label>
					<asp:repeater id="rptEducation" Runat="server">
						<ItemTemplate>
							<div style="MARGIN-TOP:5px;MARGIN-BOTTOM:5px;MARGIN-LEFT:0px;MARGIN-RIGHT:0px;">
								<table width="100%" cellpadding="0" cellspacing="0">
									<tr>
										<td nowrap align="left">
											<strong>
												<asp:Label ID="lblSchool" Runat="server"></asp:Label></strong>
										</td>
										<td width="100%" align="left">
											<strong>
												<asp:Label ID="lblInstitution" Runat="server"></asp:Label></strong>
										</td>
									</tr>
									<tr>
										<td nowrap align="left">
											<strong>
												<asp:Label ID="lblDegree" Runat="server"></asp:Label></strong>
										</td>
										<td width="100%" align="left">
											<asp:Label ID="lblDegreeDesc" Runat="server"></asp:Label>
										</td>
									</tr>
									<tr>
										<td nowrap align="left">
											<strong>
												<asp:Label ID="lblMajor" Runat="server"></asp:Label></strong>
										</td>
										<td width="100%" align="left">
											<asp:Label ID="lblMajorDesc" Runat="server"></asp:Label>
										</td>
									</tr>
									<tr>
										<td nowrap align="left">
											<strong>
												<asp:Label ID="lblSecondMajor" Runat="server"></asp:Label></strong>
										</td>
										<td width="100%" align="left">
											<asp:Label ID="lblSecondMajorDesc" Runat="server"></asp:Label>
										</td>
									</tr>
									<tr>
										<td nowrap align="left">
											<strong>
												<asp:Label ID="lblGPA" Runat="server"></asp:Label></strong>
										</td>
										<td width="100%" align="left">
											<asp:Label ID="lblGPADesc" Runat="server"></asp:Label>
										</td>
									</tr>
									<tr>
										<td nowrap align="left">
											<strong>
												<asp:Label ID="lblGradDate" Runat="server"></asp:Label></strong>
										</td>
										<td width="100%" align="left">
											<asp:Label ID="lblGradDateDesc" Runat="server"></asp:Label>
										</td>
									</tr>
									<tr>
										<td nowrap align="left">
											<strong>
												<asp:Label ID="lblTranscriptYesNo" Runat="server"></asp:Label></strong>
										</td>
										<td width="100%" align="left">
											<asp:Label ID="lblTranscriptYesNoDesc" Runat="server"></asp:Label>
									</td>
									</tr>
								</table>
							</div>
						</ItemTemplate>
					</asp:repeater></td>
			</tr>
		</table>
	</div>
<common:subheader id="shCurrEmployment" runat="server" Visible="false"></common:subheader>
	<div class="pSection" id="divCurrEmployment" runat="server" Visible="false">
		<table width="100%" cellSpacing="0" cellPadding="0" >
		<tr><td>
            <asp:repeater id="rptEmployement" Runat="server">
				<ItemTemplate>
					<div>
						<table width="100%" cellpadding="0" cellspacing="0" >
			    			<tr>
								<td nowrap align="left">
									<strong>
										<asp:Label ID="lblCompany" Runat="server" Visible="False"></asp:Label></strong>
								</td>
								<td align="left" width="100%">
									<asp:Label ID="lblCompanyName" Runat="server" Visible="False"></asp:Label>
								</td>
							</tr>
							<tr>
								<td nowrap align="left" valign="top">
									<strong>
										<asp:Label ID="lblEmpAddress" Runat="server" Visible="False"></asp:Label></strong>
								</td>
								<td align="left" width="100%">
									<asp:Label ID="lblEmpAddressDesc" Runat="server" Visible="False"></asp:Label>
								</td>
							</tr>
							<tr>
								<td nowrap align="left">
									<strong>
										<asp:Label ID="lblPhone" Runat="server" Visible="False"></asp:Label></strong>
								</td>
								<td align="left" width="100%">
									<asp:Label ID="lblPhoneDesc" Runat="server" Visible="False"></asp:Label>
								</td>
							</tr>
							<tr>
								<td nowrap align="left">
									<strong>
										<asp:Label ID="lblOccupation" Runat="server" Visible="False"></asp:Label></strong>
								</td>
								<td align="left" width="100%">
									<asp:Label ID="lblOccupationDesc" Runat="server" Visible="False"></asp:Label>
								</td>
							</tr>
							<tr>
								<td nowrap align="left">
									<strong>
										<asp:Label ID="lblDepartmentEmpl" Runat="server" Visible="False"></asp:Label></strong>
								</td>
								<td align="left" width="100%">
									<asp:Label ID="lblDepartmentDesc" Runat="server" Visible="False"></asp:Label>
								</td>
							</tr>
							<tr>
								<td nowrap align="left">
									<strong>
										<asp:Label ID="lblPosition" Runat="server" Visible="False"></asp:Label></strong>
								</td>
								<td align="left" width="100%">
									<asp:Label ID="lblPositionDesc" Runat="server" Visible="False"></asp:Label>
								</td>
							</tr>
							<tr>
								<td nowrap align="left">
									<strong>
									<asp:Label ID="lblDatesHeld" Runat="server" Visible="False"></asp:Label></strong>
								</td>
								<td align="left" width="100%">
									<asp:Label ID="lblDatesHeldDesc" Runat="server" Visible="False"></asp:Label>
								</td>
							</tr>
							<tr>
								<td width="5">&nbsp;</td>
							</tr>
						</table>
					</div>
				</ItemTemplate>
			</asp:repeater>
			</td></tr>
    	</table>
	</div>
<common:subheader id="shConstituentInfo" runat="server" canEdit="true" Visible="false"></common:subheader>
	<div class="pSection" id="divConsituentInfo" runat="server" Visible="false">
		<table cellSpacing="0" cellPadding="0" width="100%">
			<tr>
				<td width="100%">
					<table cellSpacing="0" cellPadding="0" width="100%">
						<tr>
							<td align="left" colSpan="3"><strong><asp:label id="lblContituentName" Runat="server"></asp:label></strong></td>
						</tr>
						<tr id="trConstituentClassYear" runat="server">
							<td align="left" width="100%" colSpan="3"><asp:label id="lblConstituentClassYear" Runat="server"></asp:label>
							</td>
						</tr>
						<tr>
							<td noWrap align="left"><strong><asp:label id="lblConstituentDegree" Runat="server"></asp:label></strong>
							</td>
							<td align="left" width="100%"><asp:label id="lblConstituentDegreeDesc" Runat="server"></asp:label>
							</td>
						</tr>
						<tr>
							<td align="left" nowrap>
								<strong>
									<asp:Label ID="lblConstituentMajor" Runat="server"></asp:Label></strong>
							</td>
							<td align="left" width="100%">
								<asp:Label ID="lblConstituentMajorDesc" Runat="server"></asp:Label>
							</td>
						</tr>
						<tr>
							<td align="left" nowrap>
								<strong>
									<asp:Label ID="lblConstituentCompany" Runat="server"></asp:Label></strong>
							</td>
							<td align="left" width="100%">
								<asp:Label ID="lblConstituentCompanyDesc" Runat="server"></asp:Label>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr id="trSpouseInfo" runat="server" Visible="false">
				<td width="100%">
					<div style="MARGIN-TOP:10px">
						<table width="100%" cellpadding="0" cellspacing="0">
							<tr>
								<td colspan="3" align="left">
									<strong>
										<asp:Label ID="lblSpouseName" Runat="server"></asp:Label></strong>
								</td>
							</tr>
							<tr id="trSpouseClassYear" runat="server">
								<td colspan="3" align="left" width="100%">
									<asp:Label ID="lblSpouseClassYear" Runat="server"></asp:Label>
								</td>
							</tr>
							<tr>
								<td align="left" nowrap>
									<strong>
										<asp:Label ID="lblSpouseDegree" Runat="server"></asp:Label></strong>
								</td>
								<td width="5" rowspan="3">&nbsp;</td>
								<td align="left" width="100%">
									<asp:Label ID="lblSpouseDegreeDesc" Runat="server"></asp:Label>
								</td>
							</tr>
							<tr>
								<td align="left" nowrap>
									<strong>
										<asp:Label ID="lblSpouseMajor" Runat="server"></asp:Label></strong>
								</td>
								<td align="left" width="100%">
									<asp:Label ID="lblSpouseMajorDesc" Runat="server"></asp:Label>
								</td>
							</tr>
							<tr>
								<td align="left" nowrap>
									<strong>
										<asp:Label ID="lblSpouseCompany" Runat="server"></asp:Label></strong>
								</td>
								<td align="left" width="100%">
									<asp:Label ID="lblSpouseCompanyDesc" Runat="server"></asp:Label>
								</td>
							</tr>
						</table>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div style="MARGIN-TOP:10px">
						<asp:LinkButton Visible="False" id="lnkPrivacy" runat="server"></asp:LinkButton>
					</div>
				</td>
			</tr>
		</table>
	</div>
<common:subheader id="shComments" Visible="false" runat="server"></common:subheader>
	<div class="pSection" runat="server" Visible="false" id="divComments">
		<table width="100%">
			<tr>
				<td>
					<asp:TextBox id="txtComments" Columns="500" runat="server" TextMode="MultiLine" Width="500px"
						Height="90px" Rows="7"></asp:TextBox>
		    	</td>
			</tr>
			<tr>
				<td colspan="2"><asp:Button id="btnSubmit" runat="server" Text="Button"></asp:Button>&nbsp;&nbsp;<asp:Button id="btnCancel" runat="server" Text="Button"></asp:Button></td>
			</tr>
		</table>
	</div>
