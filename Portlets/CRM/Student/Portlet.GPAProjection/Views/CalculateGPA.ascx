<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="True" CodeBehind="CalculateGPA.ascx.cs"
    Inherits="Jenzabar.CRM.Student.Web.Portlets.GPAProjectionPortlet.CalculateGPA" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<h4><asp:label id="lblStudentName" runat="server"></asp:label></h4>
<jenzabar:ErrorDisplay id="errDisplay" Runat="server" />
<div class="pSection" id="divMain" runat="server" visible="true">
<jenzabar:hint id="hntDivDirections" runat="server"></jenzabar:hint>
	<table cellSpacing="2" cellPadding="2" width="100%" border="0">
		<tr>
			<th noWrap width="5%">
				<asp:label id="lblDivision" runat="server"></asp:label></th>
			<td width="95%">
				<asp:dropdownlist id="ddlDivision" AutoPostBack="True" Runat="server"></asp:dropdownlist>
			</td>
		</tr>
	</table>
	<br>
	<jenzabar:ContentTabGroup id="GPATabs" runat="server">
		<jenzabar:ContentTab id="tbTerm" runat="server">
			<br><br>
			<asp:Label ID="lblNoCourses" Runat="server" Visible="False"></asp:Label>
			<table cellSpacing="2" cellPadding="2" width="100%" border="0">
				<tr>
					<th noWrap width="10%">
						<asp:label id="lblCareerGPA" Runat="server"></asp:label></th>
					<td noWrap width="10%">
						<asp:label id="lblGPAValue" Runat="server"></asp:label></td>
					<td rowspan="2" width="80%" valign="top"><jenzabar:Hint id="hntCurrent" runat="server" TextKey="TXT_GPA_CURRENT_HINT"/></td>
				</tr>
				<tr>
					<th noWrap>
						<asp:label id="lblCareerCredits" Runat="server"></asp:label></th>
					<td noWrap>
						<asp:label id="lblCreditsValue" Runat="server"></asp:label></td>
				</tr>
				<tr><td>&nbsp;</td></tr>
				<tr>
					<td colSpan="3">
						<jenzabar:hint id="hntCourseDirections" runat="server"></jenzabar:hint></td>
				</tr>

				<tr>
					<td colspan="3">
						<jenzabar:groupedgrid id="courseGrid" runat="server" CellPadding="0" RenderTableHeaders="true" DataKeyField="ERPStudentCourseKey">
							<TableHeaderTemplate>
								<jenzabar:GlobalizedLiteral id="litList" runat="server" TextKey="TXT_GPA_COURSE_LIST"></jenzabar:GlobalizedLiteral>
							</TableHeaderTemplate>
							<GroupHeaderTemplate>
								<%#Globalizer.GetGlobalizedString("TXT_TERM")%>: <%#DataBinder.Eval(Container.DataItem, "TermDesc")%>
							</GroupHeaderTemplate>
							<Columns>
								<jenzabar:GlobalizedTemplateColumn ItemStyle-HorizontalAlign="Center" HeaderTextKey="TXT_GPA_INCLUDE">
									<ItemTemplate>
										<asp:CheckBox ID="chkAdd" Checked="True" Visible='<%#DataBinder.Eval(Container.DataItem, "AvailableGrades") != null%>' Runat="server" />
									</ItemTemplate>
								</jenzabar:GlobalizedTemplateColumn>
								<jenzabar:GlobalizedBoundColumn HeaderTextKey="TXT_COURSE" DataField="DisplayedCourseCode"></jenzabar:GlobalizedBoundColumn>
								<jenzabar:GlobalizedBoundColumn HeaderTextKey="TXT_TITLE" DataField="CourseTitle"></jenzabar:GlobalizedBoundColumn>
								
								<jenzabar:GlobalizedTemplateColumn HeaderTextKey="TXT_GPA_CREDITS*">
									<ItemTemplate>
										<jenzabar:GlobalizedLiteral id="glitAttCredits" Text='<%#DataBinder.Eval(Container.DataItem, "AttemptedCredits")%>' runat="server" Visible='<%#DataBinder.Eval(Container.DataItem, "AvailableGrades") != null%>'></jenzabar:GlobalizedLiteral>
										<jenzabar:GlobalizedLiteral id="glitEarnedCredits" Text='<%#DataBinder.Eval(Container.DataItem, "EarnedCredits")%>' runat="server" Visible='<%#DataBinder.Eval(Container.DataItem, "AvailableGrades") == null%>'></jenzabar:GlobalizedLiteral>
									</ItemTemplate>
								</jenzabar:GlobalizedTemplateColumn>
								<jenzabar:GlobalizedTemplateColumn HeaderTextKey="TXT_GPA_PROJECTED_GRADE">
									<ItemTemplate>
										<asp:DropDownList ID="ddlGrade" DataSource='<%#DataBinder.Eval(Container.DataItem, "AvailableGrades")%>' DataTextField="GradeDesc" DataValueField="GradeCode" Runat="server" Visible='<%#DataBinder.Eval(Container.DataItem, "AvailableGrades") != null%>'></asp:DropDownList>
										<jenzabar:GlobalizedLiteral id="litGraded" TextKey="TXT_GPA_GRADED" runat="server" Visible='<%#DataBinder.Eval(Container.DataItem, "AvailableGrades") == null%>'></jenzabar:GlobalizedLiteral>
									</ItemTemplate>
								</jenzabar:GlobalizedTemplateColumn>
							</Columns>
							
					</jenzabar:groupedgrid>
					</td>
				</tr>
				<tr><td colspan="3"><jenzabar:Hint id="hntCreditFooter" runat="server" TextKey="TXT_GPA_CREDITS_FOOTER"></jenzabar:Hint></td></tr>
			
				<tr>
					<td colspan="3">
						<table cellSpacing="0" cellPadding="2" width="100%" class="groupedGrid">
							<TBODY>
								<tr>
									<td colspan="3">
										<asp:Button ID="btnCreateProjection" Enabled="False" Runat="server"></asp:Button>
										&nbsp;
										<asp:Button ID="btnReset" Enabled="False" Runat="server"></asp:Button>
									</td>
								</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<asp:Table ID="tblProjResults" Width="100%" CellPadding="2" CellSpacing="0" Runat="server"
							Visible="False">
							<asp:TableRow>
								<asp:TableCell Width="100%">
									<table cellSpacing="0" cellPadding="2" width="100%" class="groupedGrid">
										<tbody class='ghead'>
											<tr>
												<td colspan='3'>
													<asp:Label ID="lblProjectedResults" Runat="server" /></td>
											</tr>
										</tbody>
										<tr class="alt">
											<td colspan='3'>
												<asp:Label ID="lblResultsDesc" Runat="server" /></td>
										</tr>
										<tr class="alt">
											<td width="2%" nowrap></td>
											<td width="18%" nowrap>
												<asp:Label ID="lblEarnedCredits" Runat="server" /></td>
											<td width="80%" nowrap>
												<asp:Label ID="lblEarnedCreditScore" Runat="server" /></td>
										</tr>
										<tr class="alt">
											<td nowrap>&nbsp;</td>
											<td nowrap>
												<asp:Label ID="lblGPACredits" Runat="server" /></td>
											<td nowrap>
												<asp:Label ID="lblGPACreditScore" Runat="server" /></td>
										</tr>
										<tr class="alt">
											<td nowrap>&nbsp;</td>
											<td nowrap>
												<asp:Label ID="lblSelectedCourseGPA" Runat="server" /></td>
											<td nowrap>
												<asp:Label ID="lblSelectedCourseGPAScore" Runat="server" /></td>
										</tr>
										<tr class="alt">
											<td nowrap>&nbsp;</td>
											<td nowrap>
												<asp:Label ID="lblProjCareerGPA" Runat="server" /></td>
											<td nowrap>
												<asp:Label ID="lblCareerGPAScore" Runat="server" /></td>
										</tr>
									</table>
								</asp:TableCell>
							</asp:TableRow>
						</asp:Table>
					</td>
				</tr>
			</table>
		</jenzabar:ContentTab>
		<jenzabar:ContentTab id="tbCalculator" runat="server">
			<table cellSpacing="3" cellPadding="3" width="100%">
				<tr>
					<td colSpan="2">
						<jenzabar:hint id="hntSelectGPAType" runat="server"></jenzabar:hint></td>
				</tr>
				<tr>
					<td colSpan="2">
						<asp:RadioButtonList ID="rdoGPAType" Runat="server">
							<asp:ListItem Value="Actual" Selected="True"></asp:ListItem>
							<asp:ListItem Value="Projected" enabled="false"></asp:ListItem>
						</asp:RadioButtonList>
					</td>
				</tr>
			</table>
			<table cellSpacing="3" cellPadding="3" width="100%">
				<tr>
					<th noWrap align="right" width="30%">
						<asp:label id="lblAdditionCredits" runat="server"></asp:label></th>
					<td width="70%">
						<asp:TextBox ID="txtAdditionalCredits" Columns="8" MaxLength="8" Runat="server" /></td>
				</tr>
				<tr>
					<th noWrap align="right">
						<asp:label id="lblAverageGPA" runat="server"></asp:label></th>
					<td>
						<asp:TextBox ID="txtAverageGPA" Columns="8" MaxLength="8" Runat="server" /></td>
				</tr>
				<tr>
					<th noWrap align="right">
						<asp:label id="lblResultantGPA" runat="server"></asp:label></th>
					<td>
						<asp:TextBox ID="txtResultantGPA" Columns="8" MaxLength="8" Runat="server" /></td>
				</tr>
				<tr>
					<td colspan="2">
						<asp:Button ID="btnCalculate" Runat="server"></asp:Button>&nbsp;
						<asp:Button ID="btnResetCalc" Runat="server"></asp:Button>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<asp:Table CellPadding="0" CellSpacing="0" Width="100%" ID="tblCalcResults" Runat="server"
							Visible="false">
							<asp:TableRow>
								<asp:TableCell Width="100%">
									<table cellpadding="2" cellspacing="0" class="groupedGrid" width="100%">
										<tbody class='ghead'>
											<tr>
												<td colspan="3">
													<asp:Label ID="lblCalcResults" Runat="server" /></td>
											</tr>
										</tbody>
										<tr class="alt">
											<td colspan="3">
												<asp:Label ID="lblCalcResultsDesc" Runat="server" /></td>
										</tr>
										<tr class="alt">
											<td colspan="3">&nbsp;</td>
										</tr>
										<tr class="alt">
											<td width="2%">&nbsp;</td>
											<td width="28%" nowrap>
												<asp:Label ID="lblCalcResultText" Runat="server" /></td>
											<td width="70%" nowrap>
												<asp:Label ID="lblCalcResultValue" Runat="server" /></td>
										</tr>
										<tr class="alt">
											<td colspan="3"><jenzabar:Hint id="litDisclaimer" runat="server" TextKey="TXT_GPA_DISCLAIMER"></jenzabar:Hint></td>
										</tr>
									</table>
								</asp:TableCell>
							</asp:TableRow>
						</asp:Table>
					</td>
				</tr>
			</table>
		</jenzabar:ContentTab>
	</jenzabar:ContentTabGroup>
	
</div>
<script language="javascript">
function ResetCalculator(){
	document.MAINFORM.<%=this.txtAdditionalCredits.ClientID%>.value = '';
	document.MAINFORM.<%=this.txtAverageGPA.ClientID%>.value = ''; 
	document.MAINFORM.<%=this.txtResultantGPA.ClientID%>.value = '';
	return false;
}

function IsNumeric(sText){
	var ValidChars = '0123456789.'; 
	var IsNumber=true; 
	var Char;
	for (i = 0; i < sText.length && IsNumber == true; i++) { 
		Char = sText.charAt(i); 
		if (ValidChars.indexOf(Char) == -1) {
			IsNumber = false; 
		}
	} 
	return IsNumber;
}

function IsWholeNumber(sText){
	var ValidChars = '0123456789'; 
	var IsNumber=true; 
	var Char;
	for (i = 0; i < sText.length && IsNumber == true; i++) { 
		Char = sText.charAt(i); 
		if (ValidChars.indexOf(Char) == -1) {
			IsNumber = false; 
		}
	} 
	return IsNumber;
}

function validateCalcFields(){
	var intFields = 0;
	if(document.MAINFORM.<%=this.txtAdditionalCredits.ClientID%>.value.length > 0) intFields++;
	if(document.MAINFORM.<%=this.txtAverageGPA.ClientID%>.value.length > 0) intFields++;
	if(document.MAINFORM.<%=this.txtResultantGPA.ClientID%>.value.length > 0) intFields++;
	if(intFields >= 3){
		alert('<%=Globalizer.GetGlobalizedString("TXT_GPA_VALIDATE_TWO_FIELDS_ONLY")%>');
		return false;
	}
	
	if(intFields <= 1){
		alert('<%=Globalizer.GetGlobalizedString("TXT_GPA_VALIDATE_TWO_FIELDS")%>');
		return false;
	}	
	
	if(document.MAINFORM.<%=this.txtAdditionalCredits.ClientID%>.value.length > 0)
	{
		if (!IsWholeNumber(document.MAINFORM.<%=this.txtAdditionalCredits.ClientID%>.value) || document.MAINFORM.<%=this.txtAdditionalCredits.ClientID%>.value == '.' || document.MAINFORM.<%=this.txtAdditionalCredits.ClientID%>.value <= 0){
			alert('<%=Globalizer.GetGlobalizedString("TXT_GPA_VALIDATE_WHOLE_NUMBER")%>'); 
			document.MAINFORM.<%=this.txtAdditionalCredits.ClientID%>.focus();
			return false;
		}
		
	}
	
	if(document.MAINFORM.<%=this.txtAverageGPA.ClientID%>.value.length > 0)
	{
		if (!IsNumeric(document.MAINFORM.<%=this.txtAverageGPA.ClientID%>.value) || document.MAINFORM.<%=this.txtAverageGPA.ClientID%>.value == '.' || document.MAINFORM.<%=this.txtAverageGPA.ClientID%>.value <= 0){
			alert('<%=Globalizer.GetGlobalizedString("TXT_GPA_VALIDATE_NUMERIC")%>'); 
			document.MAINFORM.<%=this.txtAverageGPA.ClientID%>.focus();
			return false;
		}
		
	}
	
	if(document.MAINFORM.<%=this.txtResultantGPA.ClientID%>.value.length > 0)
	{
		if (!IsNumeric(document.MAINFORM.<%=this.txtResultantGPA.ClientID%>.value) || document.MAINFORM.<%=this.txtResultantGPA.ClientID%>value == '.' || document.MAINFORM.<%=this.txtResultantGPA.ClientID%>.value <= 0){
			alert('<%=Globalizer.GetGlobalizedString("TXT_GPA_VALIDATE_NUMERIC")%>');
			document.MAINFORM.<%=this.txtResultantGPA.ClientID%>.focus();
			return false;
		
		}
		
	}
	
	return true;
	
	
}
</script>
