<%@ Import Namespace="Jenzabar.Common.Globalization" %>
<%@ Register TagPrefix="cmn" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="AddDropCourses.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.CourseSchedulesPortlet.AddDropCourses" %>
<script>
	var formType = "";
	function checkSearchValues()
	{
		var crsCde1 = document.getElementById('<%= this.tbCourse1.ClientID %>').value;
		var crsSection1 = document.getElementById('<%= this.tbSection1.ClientID %>').value;
		var crsCde2 = document.getElementById('<%= this.tbCourse2.ClientID %>').value;
		var crsSection2 = document.getElementById('<%= this.tbSection2.ClientID %>').value;
		var crsCde3 = document.getElementById('<%= this.tbCourse3.ClientID %>').value;
		var crsSection3 = document.getElementById('<%= this.tbSection3.ClientID %>').value;
		var crsCde4 = document.getElementById('<%= this.tbCourse4.ClientID %>').value;
		var crsSection4 = document.getElementById('<%= this.tbSection4.ClientID %>').value;
		var crsCde5 = document.getElementById('<%= this.tbCourse5.ClientID %>').value;
		var crsSection5 = document.getElementById('<%= this.tbSection5.ClientID %>').value;
		var crsCde6 = document.getElementById('<%= this.tbCourse6.ClientID %>').value;
		var crsSection6 = document.getElementById('<%= this.tbSection6.ClientID %>').value;
		var divSelected = document.getElementById('<%= this.ddlDivision.ClientID %>').selectedIndex;
		
		// code validation for reference number
		var crsRef1 = document.getElementById('<%= this.tbRefNum1.ClientID %>').value;
		var crsRef2 = document.getElementById('<%= this.tbRefNum2.ClientID %>').value;
		var crsRef3 = document.getElementById('<%= this.tbRefNum3.ClientID %>').value;
		var crsRef4 = document.getElementById('<%= this.tbRefNum4.ClientID %>').value;
		var crsRef5 = document.getElementById('<%= this.tbRefNum5.ClientID %>').value;
		var crsRef6 = document.getElementById('<%= this.tbRefNum6.ClientID %>').value;
		
		
		if( formType == "ref" ){
			if ((crsRef1 != "" && !IsNumeric(crsRef1)) || (crsRef2 != "" && !IsNumeric(crsRef2)) || (crsRef3 != "" && !IsNumeric(crsRef3)) || (crsRef4 != "" && !IsNumeric(crsRef4)) || (crsRef5 != "" && !IsNumeric(crsRef5)) || (crsRef6 != "" && !IsNumeric(crsRef6)))
			{
				alert('<%= Globalizer.GetGlobalizedString("MSG_CS_ADD_DROP_SRCH_REF_VALIDATE") %>');
				return false;
			}
			
			if( existsAndBlank(crsRef1) && existsAndBlank(crsRef2) && existsAndBlank(crsRef3) 
			&& existsAndBlank(crsRef4) && existsAndBlank(crsRef5) && existsAndBlank(crsRef6) ){
				alert('<%= Globalizer.GetGlobalizedString("MSG_CS_ADD_DROP_SRCH_REF_VALIDATE_NONBLANK") %>');
				return false;
			}
		}
		
		if( formType == "courseCode" ){
		
			if (((crsCde1 != "" && crsSection1 == "") || (crsCde1 == "" && crsSection1 != "")) || ((crsCde2 != "" && crsSection2 == "") || (crsCde2 == "" && crsSection2 != "")) || ((crsCde3 != "" && crsSection3 == "") || (crsCde3 == "" && crsSection3 != "")) || ((crsCde4 != "" && crsSection4 == "") || (crsCde4 == "" && crsSection4 != "")) || ((crsCde5 != "" && crsSection5 == "") || (crsCde5 == "" && crsSection5 != "")) || ((crsCde6 != "" && crsSection6 == "") || (crsCde6 == "" && crsSection6 != "")))
			{
				alert('<%= Globalizer.GetGlobalizedString("MSG_CS_ADD_DROP_SRCH_VALIDATE") %>');
				return false;				
			}
			
			if( existsAndBlank(crsCde1) && existsAndBlank(crsCde2) && existsAndBlank(crsCde3) 
			&& existsAndBlank(crsCde4) && existsAndBlank(crsCde5) && existsAndBlank(crsCde6) ){
				alert('<%= Globalizer.GetGlobalizedString("MSG_CS_ADD_DROP_SRCH_REF_VALIDATE_NONBLANK") %>');
				//document.forms[0].
				return false;
			}
		}
			
		return true;
	}
	
	function IsNumeric(PossibleNumber)
	{
		var PNum = new String(PossibleNumber);
		var regex = /[^0-9]/;
		return !regex.test(PNum);
	}
	
	function overrideCheck()
	{
		/*if(!checkBoxChecked('cbOverride'))
		{
			alert('<%= Globalizer.GetGlobalizedString("MSG_CS_STOP_OVERRIDE") %>');
			return false;
		}*/
		return true;
	}
	
	function advAppCheck()
	{
		if(addDropChecked(false))
		{
			alert('<%= Globalizer.GetGlobalizedString("MSG_CS_STOP_ADV_APPROVAL") %>');
			return false;
		}
		
		if(!checkBoxChecked('cbApprove'))
		{
			alert('<%= Globalizer.GetGlobalizedString("MSG_CS_STOP_ADV_APPROVAL_2") %>');
			return false;
		}
		return true;
	}
	
	function waitlistCheck()
	{
		if(!addDropChecked(false))
		{
			alert('<%= Globalizer.GetGlobalizedString("MSG_CS_STOP_WAITLIST") %>');
			return false;
		}
		
		return true;
	}
		function advisorCheck()
	{
		if(!addDropChecked(false))
		{
			alert('<%= Globalizer.GetGlobalizedString("MSG_CS_STOP_ADVISOR") %>');
			return false;
		}
		
		return true;
	}
		function mustPayCheck()
	{
		if(!addDropChecked(false))
		{
			alert('<%= Globalizer.GetGlobalizedString("MSG_CS_STOP_MUST_PAY") %>');
			return false;
		}
		
		return true;
	}
	
	function addDropCheck()
	{
		if(!addDropChecked(true))
		{			
			return false;
		}		
		else
			return true;
	}
	
	function swapCheck()
	{
		var frm = document.MAINFORM;
		var addChecked = 0;
		var dropChecked = 0;

		for (i=0; i<frm.length; i++)
		{			
			if(isChecked(i, frm, 'cbDrop') ||
				isChecked(i, frm, 'cbDropP') ||
				isChecked(i, frm, 'cbDropA') ||
				isChecked(i, frm, 'cbDropW'))
			{
				dropChecked = dropChecked + 1;
			}
			if(isChecked(i, frm, 'cbAdd') ||
				isChecked(i, frm, 'cbAddE'))
			{
				addChecked = addChecked + 1;
			}
		}
		if (addChecked != 1 || dropChecked != 1)
		{
			alert('<%= Globalizer.GetGlobalizedString("MSG_CS_STOP_SWAP") %>');
			return false;
		}
		if (frm.canDrop.value == "0" || frm.canAdd.value == "0")
		{
			return confirm("<%= Globalizer.GetGlobalizedString("MSG_CS_ADD_DROP_PERIOD_OVERRIDE_CONTINUE") %>");
		}
		return true;
	}
	
	function addDropChecked(forAddDropButton)
	{
		var frm = document.MAINFORM;
		for (i=0; i<frm.length; i++)
		{
			if(isChecked(i, frm, 'cbDrop') ||
				isChecked(i, frm, 'cbDropP') ||
				isChecked(i, frm, 'cbDropA') ||
				isChecked(i, frm, 'cbDropW'))
			{
				if (forAddDropButton)
				{
					if (frm.canDrop.value == "0")
					{
						return confirm("<%= Globalizer.GetGlobalizedString("MSG_CS_ADD_DROP_PERIOD_OVERRIDE_CONTINUE") %>");
					}
				}
				return true;
			}
			if(isChecked(i, frm, 'cbAdd') ||
				isChecked(i, frm, 'cbAddE'))
			{
				if (forAddDropButton)
				{
					if (frm.canAdd.value == "0")
					{
						return confirm("<%= Globalizer.GetGlobalizedString("MSG_CS_ADD_DROP_PERIOD_OVERRIDE_CONTINUE") %>");
					}
				}
				return true;
			}
		}
		if (forAddDropButton)
		{
			alert("<%= Globalizer.GetGlobalizedString("MSG_CS_STOP_ADD_DROP") %>");
		}
		return false;
	}
	
	function checkBoxChecked(cbWhat)
	{
		var frm = document.MAINFORM;
		for (i=0; i<frm.length; i++)
		{
			if(isChecked(i, frm, cbWhat))
				return true;
		}
		return false;
	}
	
	function isChecked(iIndex, frm, cbName)
	{
		if(frm.elements[iIndex].name.indexOf(cbName) != -1)
			return frm.elements[iIndex].checked;
		return false;
	}
	
	var whitespace = " \t\n\r";
	function isEmpty(s){   
		return ((s == null) || (s.length == 0));
	}
	function isStringWhitespace(s){   
		var i;
		if (isEmpty(s)) return true;
		for (i = 0; i < s.length; i++){
			var c = s.charAt(i);
			if (whitespace.indexOf(c) == -1) return false;
		}
		return true;
	}
	function IsNull(obj){
		return (obj == null);
	}
	function existsAndBlank(val){
		if( !IsNull(val) ){
			if( isStringWhitespace(val) ){
				return true;
			}
			else
			{
				return false;
			}
		}
		else
		{
			return false;
		}
	}

</script>
<div class="pSection" id="divMain" runat="server" visible="true">
<h4><asp:literal id="litCrsSchFor" runat="server"></asp:literal></h4>
	<div class="GrayBordered" id="divDropDowns" style="MARGIN-BOTTOM: 3px" runat="server"
		visible="False">
		<table cellSpacing="3" cellPadding="3" width="100%" border="0">
			<tr>
				<th width="10%">
					<cmn:globalizedlabel id="lblTerm" runat="server" TextKey="LBL_TERM" AssociatedControlID="ddlTerm"></cmn:globalizedlabel></th>
				<td width="10%"><asp:dropdownlist id="ddlTerm" AutoPostBack="True" Runat="server"></asp:dropdownlist></td>
				<td width="30">&nbsp;</TDWIDTH></td>
				<th width="10%">
					<cmn:globalizedlabel id="lblDivision" runat="server" AssociatedControlID=ddlDivision></cmn:globalizedlabel></th>
				<td><asp:dropdownlist id="ddlDivision" AutoPostBack="True" Runat="server"></asp:dropdownlist></td>
			</tr>
			<tr>
				<td colSpan="5"><asp:label id="lblAlert" Runat="server"></asp:label><asp:label id="hntMessage" runat="server"></asp:label></td>
			</tr>
			<tr>
				<td colSpan="5"><asp:label id="lblCreditsRegistered" Runat="server"></asp:label>&nbsp;<asp:label id="lblCreditsPending" Runat="server"></asp:label><input 
      type=hidden value="<%= base._canAdd %>" name=canAdd> <input type=hidden value="<%= base._canDrop %>" name=canDrop 
      ></td>
			</tr>
		</table>
	</div>
	<br>
	<!-- Successful Register -->
	<div id="divSuccessfulRegister" runat="server" visible="false">
		<table cellSpacing="0" cellPadding="0" width="100%" border="0">
			<tr>
				<td><IMG title="" alt="*" src="UI\Common\Images\PortletImages\Icons\blue_circle.gif">&nbsp;<b><cmn:globalizedliteral id="glitSuccessReg" runat="server" TextKey="TXT_CS_MESSAGES"></cmn:globalizedliteral></b></td>
			</tr>
			<tr>
				<td><b>
						<hr width="100%">
					</b>
				</td>
			</tr>
			<tr>
				<td><asp:label id="lblCourseMessage" runat="server"></asp:label></td>
			</tr>
		</table>
	</div>
	<!--********************* -->
	<div id="divUnsuccessfulRegister" runat="server" visible="false">
		<table cellSpacing="0" cellPadding="0" width="100%" border="0">
			<tr>
				<td><IMG title="" alt="*" src="UI\Common\Images\PortletImages\Icons\incorrect.gif">&nbsp;<b><cmn:globalizedliteral id="Globalizedliteral1" runat="server" TextKey="TXT_CS_NOT_YET_REGISTERED"></cmn:globalizedliteral></b></td>
			</tr>
			<tr>
				<td><b>
						<hr width="100%">
					</b>
				</td>
			</tr>
			<tr>
				<td><cmn:globalizedliteral id="Globalizedliteral2" runat="server" TextKey="TXT_CS_NOT_YET_REGISTERED_MESSAGE"></cmn:globalizedliteral></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
		</table>
	</div>
	<!-- conflict --><asp:repeater id="rptConflict" runat="server" Visible="False">
		<HeaderTemplate>
			<table width="100%" border="0" cellpadding="3" cellspacing="0">
		</HeaderTemplate>
		<ItemTemplate>
			<tr>
				<td colspan="2" bgcolor="#CECFCE" class="BorderTopLeftBottomRight"><b><%#DataBinder.Eval(Container.DataItem, "DisplayedCourseCode")%></b></td>
			</tr>
			<tr>
				<td bgcolor="#DEDFDE" class="BorderLeftBottom" valign="top">Course Info:</td>
				<td class="BorderLeftRightBottom">
					<asp:Repeater ID="Repeater6" DataSource='<%#DataBinder.Eval(Container.DataItem, "CourseInfo_Schedules")%>' Runat="server">
						<ItemTemplate>
							<li>
								<%#DataBinder.Eval(Container.DataItem, "Weekdays")%>
								&nbsp;<%#DataBinder.Eval(Container.DataItem, "MeetTime")%></li>
						</ItemTemplate>
					</asp:Repeater>
				</td>
			</tr>
			<tr>
				<td bgcolor="#DEDFDE" class="BorderLeftBottom" valign="top">Error:</td>
				<td bgcolor="#EFEFEF" class="BorderLeftRightBottom"><b class="RedErrorText"><%#DataBinder.Eval(Container.DataItem, "ErrorText")%></b></td>
			</tr>
			<tr>
				<td bgcolor="#DEDFDE" class="BorderLeftBottom" valign="top">Affected Course:</td>
				<td class="BorderLeftRightBottom"><%# DataBinder.Eval(Container.DataItem,"SwapTitle")%></td>
			</tr>
			<tr>
				<td bgcolor="#DEDFDE" class="BorderLeftBottom" valign="top">Resolution:</td>
				<td bgcolor="#EFEFEF" class="BorderLeftRightBottom"><%# DataBinder.Eval(Container.DataItem,"Resolution")%><br>
					<div align="center">
						<cmn:GlobalizedButton ID="gbConflictSwap" TextKey="TXT_CS_SWAP" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ERPCourseKey")+ "|" + DataBinder.Eval(Container.DataItem, "SwapERPStudentCourseKey")+ "|" + DataBinder.Eval(Container.DataItem, "SwapERPCourseKey")+ "|" + DataBinder.Eval(Container.DataItem, "SwapCreditHours")%>' OnCommand="gbtnSwapE_Click" runat="server" />
						<cmn:GlobalizedButton ID="gbConflictRemove" Runat="server" TextKey="TXT_CS_DONT_ADD" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "ERPCourseKey")%>' OnCommand="gbtnRemoveE_Click" />
						<cmn:GlobalizedButton ID="gbConflictOverride" TextKey="TXT_CS_OVERRIDE_ERRORS" CommandName="Override" Runat="server" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "ERPCourseKey") + "|" + DataBinder.Eval(Container.DataItem, "Errors")%>' Visible="False" /></div>
				</td>
			</tr>
		</ItemTemplate>
		<FooterTemplate>
			</table>
		</FooterTemplate>
	</asp:repeater>
	<!--total fail Error 9--><asp:repeater id="rptErrorNoAdd" runat="server" Visible="False">
		<HeaderTemplate>
			<table width="100%" border="0" cellpadding="3" cellspacing="0">
		</HeaderTemplate>
		<ItemTemplate>
			<tr>
				<td colspan="2" bgcolor="#CECFCE" class="BorderTopLeftBottomRight"><b><%#DataBinder.Eval(Container.DataItem, "DisplayedCourseCode")%></b></td>
			</tr>
			<tr>
				<td bgcolor="#DEDFDE" class="BorderLeftBottom" valign="top">Course Info:</td>
				<td class="BorderLeftRightBottom">
					<ul>
						<asp:Repeater ID="Repeater3" DataSource='<%#DataBinder.Eval(Container.DataItem, "CourseInfo_Schedules")%>' Runat="server">
							<ItemTemplate>
								<li>
									<%#DataBinder.Eval(Container.DataItem, "Weekdays")%>
									&nbsp;<%#DataBinder.Eval(Container.DataItem, "MeetTime")%></li>
							</ItemTemplate>
						</asp:Repeater>
					</ul>
				</td>
			</tr>
			<tr>
				<td bgcolor="#DEDFDE" class="BorderLeftBottom" valign="top">Error:</td>
				<td bgcolor="#EFEFEF" class="BorderLeftRightBottom"><b class="RedErrorText"><%#DataBinder.Eval(Container.DataItem, "ErrorText")%></b></td>
			</tr>
			<tr>
				<td bgcolor="#DEDFDE" class="BorderLeftBottom" valign="top">Resolution:</td>
				<td class="BorderLeftRightBottom">
					<asp:Label ID="lblResolution1" Runat="server" />
					<asp:LinkButton ID="ResultsLink" CommandName="Results" Runat="server" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "ERPCourseKey")%>' />
					<asp:Label ID="lblResolution3" Runat="server" />
					<asp:LinkButton ID="SearchLink" CommandName="Search" Runat="server" />
					<asp:Label ID="lblResolution2" Runat="server" />
					<div align="center">
						<cmn:GlobalizedButton id="gbtnMaxSwap" Runat="server" TextKey="TXT_CS_SWAP" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "ERPCourseKey")%>' Visible="False" CommandName="MaxSwap" />
						<cmn:GlobalizedButton id="btnAddToWaitlist" Runat="server" TextKey="TXT_COURSE_DETAILS_ADD_TO_WAITLIST" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "ERPCourseKey")%>' Visible="False" CommandName="Waitlist" />
						<cmn:GlobalizedButton ID="btnErrorOk" Runat="server" TextKey="TXT_OK" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "ERPCourseKey")%>' OnCommand="gbtnRemoveE_Click" />
						<cmn:GlobalizedButton ID="gbtnOverride" TextKey="TXT_CS_OVERRIDE_ERRORS" CommandName="Override" Runat="server" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "ERPCourseKey") + "|" + DataBinder.Eval(Container.DataItem, "Errors")%>' Visible="False" /></div>
				</td>
			</tr>
		</ItemTemplate>
		<FooterTemplate>
			</table>
		</FooterTemplate>
		<SeparatorTemplate>
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>
		</SeparatorTemplate>
	</asp:repeater>
	<!--Variable register -->
	<div id="divVariableRegister" runat="server" visible="false">
		<table cellSpacing="0" cellPadding="0" width="100%" border="0">
			<tr>
				<td><IMG title="" alt="*" src="UI\Common\Images\PortletImages\Icons\blue_circle.gif">&nbsp;<b><cmn:globalizedliteral id="glitNotRegistered" runat="server" TextKey="TXT_CS_VARIABLE_CREDIT"></cmn:globalizedliteral></b></td>
			</tr>
			<tr>
				<td><b>
						<hr width="100%">
					</b>
				</td>
			</tr>
		</table>
	</div>
	<!--variable--><asp:repeater id="rptVariable" runat="server" Visible="False">
		<HeaderTemplate>
			<table width="100%" border="0" cellpadding="3" cellspacing="0">
		</HeaderTemplate>
		<ItemTemplate>
			<tr>
				<td colspan="2" bgcolor="#CECFCE" class="BorderTopLeftBottomRight"><b><%#DataBinder.Eval(Container.DataItem, "DisplayedCourseCode")%></b></td>
			</tr>
			<tr>
				<td bgcolor="#DEDFDE" class="BorderLeftBottom" valign="top">Course Info:</td>
				<td class="BorderLeftRightBottom">
					<%#DataBinder.Eval(Container.DataItem, "CombinedSchedule")%>
				</td>
			</tr>
			<tr>
				<td bgcolor="#DEDFDE" class="BorderLeftBottom" valign="top">Error:</td>
				<td bgcolor="#EFEFEF" class="BorderLeftRightBottom"><b class="RedErrorText"><%#DataBinder.Eval(Container.DataItem, "ErrorText")%></b></td>
			</tr>
			<tr>
				<td bgcolor="#DEDFDE" class="BorderLeftBottom" valign="top">Resolution:</td>
				<td class="BorderLeftRightBottom">
					<%#DataBinder.Eval(Container.DataItem, "Resolution")%>
					<br>
					Credit Hours:
					<asp:TextBox ID="tbCreditHours" Runat="server" MaxLength="5" Visible="True" Width="40px" Text='<%#DataBinder.Eval(Container.DataItem, "CreditHours")%>' />&nbsp;<%#DataBinder.Eval(Container.DataItem, "CreditStatement")%>
					<div align="center">
						<cmn:GlobalizedButton id="Globalizedbutton3" Runat="server" TextKey="TXT_CS_ADD_COURSE" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "ERPCourseKey")%>' Visible="True" CommandName="Add" />
						<cmn:GlobalizedButton ID="Globalizedbutton4" Runat="server" TextKey="TXT_CS_DONT_ADD" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "ERPCourseKey")%>' CommandName="Remove" /></div>
				</td>
			</tr>
		</ItemTemplate>
		<FooterTemplate>
			</table>
		</FooterTemplate>
		<SeparatorTemplate>
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>
		</SeparatorTemplate>
	</asp:repeater>
	<!--fatal error--><asp:repeater id="rptFatal" runat="server" Visible="False">
		<HeaderTemplate>
			<table width="100%" border="0" cellpadding="3" cellspacing="0">
		</HeaderTemplate>
		<ItemTemplate>
			<tr>
				<td colspan="2" bgcolor="#CECFCE" class="BorderTopLeftBottomRight"><b><%#DataBinder.Eval(Container.DataItem, "DisplayedCourseCode")%></b></td>
			</tr>
			<tr>
				<td bgcolor="#DEDFDE" class="BorderLeftBottom" valign="top">Error:</td>
				<td bgcolor="#EFEFEF" class="BorderLeftRightBottom"><b class="RedErrorText"><%#DataBinder.Eval(Container.DataItem, "ErrorText")%></b><br>
					<div align="center">
						<cmn:GlobalizedButton ID="Globalizedbutton7" Runat="server" TextKey="TXT_OK" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "ERPCourseKey")%>' CommandName="Remove" /></div>
				</td>
			</tr>
		</ItemTemplate>
		<FooterTemplate>
			</table>
		</FooterTemplate>
		<SeparatorTemplate>
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>
		</SeparatorTemplate>
	</asp:repeater><asp:repeater id="rptConcurrent" runat="server" Visible="False">
		<HeaderTemplate>
			<table width="100%" border="0" cellpadding="3" cellspacing="0">
		</HeaderTemplate>
		<ItemTemplate>
			<tr>
				<td colspan="2" bgcolor="#CECFCE" class="BorderTopLeftBottomRight"><b><%#DataBinder.Eval(Container.DataItem, "DisplayedCourseCode")%></b></td>
			</tr>
			<tr>
				<td bgcolor="#DEDFDE" class="BorderLeftBottom">Course Info:</td>
				<td class="BorderLeftRightBottom">
					<asp:Repeater ID="Repeater8" DataSource='<%#DataBinder.Eval(Container.DataItem, "CourseInfo_Schedules")%>' Runat="server">
						<ItemTemplate>
							<li>
								<%#DataBinder.Eval(Container.DataItem, "Weekdays")%>
								&nbsp;<%#DataBinder.Eval(Container.DataItem, "MeetTime")%></li>
						</ItemTemplate>
					</asp:Repeater>
				</td>
			</tr>
			<tr>
				<td bgcolor="#DEDFDE" class="BorderLeftBottom">Error:</td>
				<td bgcolor="#EFEFEF" class="BorderLeftRightBottom"><b class="RedErrorText"><%#DataBinder.Eval(Container.DataItem, "ErrorText")%></b></td>
			</tr>
			<tr>
				<td bgcolor="#DEDFDE" class="BorderLeftBottom">Resolution:</td>
				<td class="BorderLeftRightBottom">
					<asp:Label ID="lblCRRes1" Runat="server" />
					<asp:LinkButton ID="lbCRButton" CommandName="Search" Runat="server" />
					<asp:Label ID="lblCRRes2" Runat="server" />
					<div align="center">
						<cmn:GlobalizedButton id="glnkAddCorequisite" Runat="server" TextKey="TXT_CS_ADD_COREQUISITE_COURSE" Visible="False" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "ERPCourseKey")%>' OnCommand="glnkAddCorequisite_Click" />
						<cmn:GlobalizedButton id="glnkAddConcurrent" Runat="server" TextKey="TXT_CS_ADD_CONCURRENT_COURSE" Visible="False" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "ERPCourseKey")%>' OnCommand="glnkAddConcurrent_Click" />
						<cmn:GlobalizedButton ID="Globalizedbutton1" Runat="server" TextKey="TXT_CS_DONT_ADD" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "ERPCourseKey")%>' OnCommand="gbtnRemoveE_Click" />
						<cmn:GlobalizedButton ID="gbOverrideConcurrent" TextKey="TXT_CS_OVERRIDE_ERRORS" OnCommand="glnkOverrideConcurrent_Click" Runat="server" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "ERPCourseKey") + "|" + DataBinder.Eval(Container.DataItem, "Errors")%>' Visible="False" /></div>
				</td>
			</tr>
		</ItemTemplate>
		<FooterTemplate>
			</table>
		</FooterTemplate>
		<SeparatorTemplate>
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>
		</SeparatorTemplate>
	</asp:repeater>
	<div id="divError" runat="server" visible="False"></div>
	<cmn:errordisplay id="ctlError" RunAt="server">
		<IMG title="" alt="*" src="UI\Common\Images\PortletImages\Icons\exclam_icon.gif"></cmn:errordisplay>
	<br>
	<table width="100%" align="center">
		<tr>
			<td align="center"><cmn:globalizedbutton id="gbtnClearAll" runat="server" TextKey="TXT_CS_CLEAR_ALL_ERRORS" visible="false"></cmn:globalizedbutton></td>
		</tr>
	</table>
	<cmn:contenttabgroup id="DefaultPageTabs" runat="server">
		<cmn:ContentTab id="tabAddCourse" runat="Server">
			<div id="divSearch" style="MARGIN-BOTTOM: 3px" runat="server" visible="False">
				<table cellSpacing="3" cellPadding="3" width="100%" border="0">
					<tr>
						<td colspan="10" valign="top">
							<asp:Literal ID="litCourseCode" Runat="server"></asp:Literal></td>
					</tr>
					<asp:Panel Runat="server" ID="panel1" DefaultButton="gbtnSearch">
						<tr>
							<td width="10">&nbsp;</td>
							<td width="50">
								<cmn:globalizedliteral id="glitCourse" runat="server" TextKey="LBL_COURSE_CODE"></cmn:globalizedliteral></td>
							<td width="10">&nbsp;</td>
							<td width="50">
								<cmn:globalizedliteral id="glitSection" runat="server" TextKey="LBL_SECTION"></cmn:globalizedliteral></td>
							<td width="20">&nbsp;</td>
							<td width="10">&nbsp;</td>
							<td width="50">
								<cmn:globalizedliteral id="glitCourse2" runat="server" TextKey="LBL_COURSE_CODE"></cmn:globalizedliteral></td>
							<td width="10">&nbsp;</td>
							<td width="50">
								<cmn:globalizedliteral id="glitSection2" runat="server" TextKey="LBL_SECTION"></cmn:globalizedliteral></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td><asp:label AssociatedControlID="tbCourse1" Runat=server>1.</asp:label></td>
							<td>
								<asp:textbox id="tbCourse1" Runat="server" Width="128px" MaxLength="30"></asp:textbox></td>
							<td>&nbsp;<asp:label AssociatedControlID="tbSection1" Runat=server ID="Label11"  CssClass="accessibility">Section 1</asp:Label></td>
							<td>
								<asp:textbox id="tbSection1" Runat="server" Width="65px" MaxLength="5"></asp:textbox></td>
							<td>&nbsp;</td>
							<td><asp:label AssociatedControlID="tbCourse4" Runat=server ID="Label1" NAME="Label1">2.</asp:Label></td>
							<td>
								<asp:textbox id="tbCourse4" Runat="server" Width="128px" MaxLength="30"></asp:textbox></td>
							<td>&nbsp;<asp:label AssociatedControlID="tbSection4" Runat=server ID="Label10"  CssClass="accessibility">Section 4</asp:Label></td>
							<td>
								<asp:textbox id="tbSection4" Runat="server" Width="65px" MaxLength="5"></asp:textbox></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td><asp:label AssociatedControlID="tbCourse2" Runat=server ID="Label2" NAME="Label2">3.</asp:Label></td>
							<td>
								<asp:textbox id="tbCourse2" Runat="server" Width="128px" MaxLength="30"></asp:textbox></td>
							<td>&nbsp;<asp:label AssociatedControlID="tbSection2" Runat=server ID="Label9"  CssClass="accessibility">Section 2</asp:Label></td>
							<td>
								<asp:textbox id="tbSection2" Runat="server" Width="65px" MaxLength="5"></asp:textbox></td>
							<td>&nbsp;</td>
							<td><asp:label AssociatedControlID="tbCourse5" Runat=server ID="Label3" NAME="Label3">4.</asp:Label></td>
							<td>
								<asp:textbox id="tbCourse5" Runat="server" Width="128px" MaxLength="30"></asp:textbox></td>
							<td>&nbsp;<asp:label AssociatedControlID="tbSection5" Runat=server ID="Label8"  CssClass="accessibility">Section 5</asp:Label></td>
							<td>
								<asp:textbox id="tbSection5" Runat="server" Width="65px" MaxLength="5"></asp:textbox></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td><asp:label AssociatedControlID="tbCourse3" Runat=server ID="Label4" NAME="Label4">5.</asp:Label></td>
							<td>
								<asp:textbox id="tbCourse3" Runat="server" Width="128px" MaxLength="30"></asp:textbox></td>
							<td>&nbsp;<asp:label AssociatedControlID="tbSection3" Runat=server ID="Label7"  CssClass="accessibility">Section 3</asp:Label></td>
							<td>
								<asp:textbox id="tbSection3" Runat="server" Width="65px" MaxLength="5"></asp:textbox></td>
							<td>&nbsp;</td>
							<td><asp:label AssociatedControlID="tbCourse6" Runat=server ID="Label5" >6.</asp:Label></td>
							<td>
								<asp:textbox id="tbCourse6" Runat="server" Width="128px" MaxLength="30"></asp:textbox></td>
							<td>&nbsp;<asp:label AssociatedControlID="tbSection6" Runat=server ID="Label6"  CssClass="accessibility">Section 6</asp:Label></td>
							<td>
								<asp:textbox id="tbSection6" Runat="server" Width="65px" MaxLength="5"></asp:textbox></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td colspan="10" align="center">
								<cmn:globalizedbutton id="gbtnSearch" runat="server" TextKey="TXT_ADD_COURSE"></cmn:globalizedbutton></td>
						</tr>
					</asp:Panel>
				</table>
			</div>
		</cmn:ContentTab>
		<cmn:ContentTab id="tabRef" runat="Server">
			<div id="Div2" style="MARGIN-BOTTOM: 3px" runat="server">
				<table cellSpacing="3" cellPadding="3" width="100%" border="0">
					<tr>
						<td colspan="10" valign="top">
							<cmn:globalizedliteral id="Globalizedliteral3" runat="server" TextKey="TXT_CS_MB_REFERENCE"></cmn:globalizedliteral></td>
					</tr>
					<asp:Panel Runat="server" ID="Panel2" DefaultButton="gbtnSearchRef">
						<tr>
							<td width="10">&nbsp;</td>
							<td width="50">
								<cmn:globalizedliteral id="Globalizedliteral4" runat="server" TextKey="LBL_REFERENCE_NUMBER"></cmn:globalizedliteral></td>
							<td width="10">&nbsp;</td>
							<td width="10">&nbsp;</td>
							<td width="50">
								<cmn:globalizedliteral id="Globalizedliteral6" runat="server" TextKey="LBL_REFERENCE_NUMBER"></cmn:globalizedliteral></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td><asp:label AssociatedControlID="tbRefNum1" Runat=server ID="Label12" >1.</asp:Label></td>
							<td>
								<asp:textbox id="tbRefNum1" Runat="server" Width="128px" MaxLength="30"></asp:textbox></td>
							<td>&nbsp;</td>
							<td><asp:label AssociatedControlID="tbRefNum2" Runat=server ID="Label13" >2.</asp:Label></td>
							<td>
								<asp:textbox id="tbRefNum2" Runat="server" Width="128px" MaxLength="30"></asp:textbox></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td><asp:label AssociatedControlID="tbRefNum3" Runat=server ID="Label14" >3.</asp:Label></td>
							<td>
								<asp:textbox id="tbRefNum3" Runat="server" Width="128px" MaxLength="30"></asp:textbox></td>
							<td>&nbsp;</td>
							<td><asp:label AssociatedControlID="tbRefNum4" Runat=server ID="Label15" >4.</asp:Label></td>
							<td>
								<asp:textbox id="tbRefNum4" Runat="server" Width="128px" MaxLength="30"></asp:textbox></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td><asp:label AssociatedControlID="tbRefNum5" Runat=server ID="Label16" >5.</asp:Label></td>
							<td>
								<asp:textbox id="tbRefNum5" Runat="server" Width="128px" MaxLength="30"></asp:textbox></td>
							<td>&nbsp;</td>
							<td><asp:label AssociatedControlID="tbRefNum6" Runat=server ID="Label17" >6.</asp:Label></td>
							<td>
								<asp:textbox id="tbRefNum6" Runat="server" Width="128px" MaxLength="30"></asp:textbox></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td colspan="10" align="center">
								<cmn:globalizedbutton id="gbtnSearchRef" runat="server" TextKey="TXT_ADD_COURSE"></cmn:globalizedbutton></td>
						</tr>
					</asp:Panel>
				</table>
			</div>
		</cmn:ContentTab>
		<cmn:ContentTab id="tabSearch" runat="server">
			<table cellSpacing="2" cellPadding="2" width="100%" border="0">
				<asp:Panel Runat="server" ID="Panel3" DefaultButton="btnSearch">
					<tr>
						<td noWrap align="right">
							<cmn:globalizedlabel id="lblTitle" Runat="server" TextKey="TXT_TITLE" AssociatedControlID="ddlTitleRestrictor"></cmn:globalizedlabel>:</td>
						<td noWrap align="left" colSpan="3">
							<asp:dropdownlist id="ddlTitleRestrictor" Runat="server"></asp:dropdownlist>
							<asp:label AssociatedControlID="txtTitleRestrictor" Runat=server ID="Label18" CssClass="accessibility" >restrict title by</asp:Label>
							<asp:textbox id="txtTitleRestrictor" Runat="server" Columns="40"></asp:textbox></td>
					</tr>
					<tr>
						<td noWrap align="right">
							<cmn:globalizedlabel id="lblCourse" Runat="server" TextKey="LBL_COURSE_CODE" AssociatedControlID="ddlCourseRestrictor"></cmn:globalizedlabel></td>
						<td noWrap align="left" colspan="3">
							<asp:dropdownlist id="ddlCourseRestrictor" Runat="server"></asp:dropdownlist>
							<asp:label AssociatedControlID="txtCourseRestrictor" Runat=server ID="Label19" CssClass="accessibility" >restrict course by</asp:Label>
							<asp:textbox id="txtCourseRestrictor" Runat="server" Columns="20"></asp:textbox></td>
					</tr>
					<tr>
						<td noWrap align="right" width="5%">
							<cmn:globalizedlabel id="lblTermSearch" Runat="server" TextKey="TXT_TERM" AssociatedControlID="ddlTermSearch"></cmn:globalizedlabel>:</td>
						<td align="left" colspan="3">
							<asp:dropdownlist id="ddlTermSearch" Runat="server" DataTextField="Description" DataValueField="Key"></asp:dropdownlist></td>
					</tr>
					<tr>
						<td noWrap align="right" width="5%">
							<cmn:globalizedlabel id="lblDept" Runat="server" TextKey="TXT_DEPARTMENT" AssociatedControlID="ddlDept"></cmn:globalizedlabel>:</td>
						<td align="left" width="45%">
							<asp:dropdownlist id="ddlDept" Runat="server" DataTextField="Description" DataValueField="Code"></asp:dropdownlist></td>
					</tr>
					<tr>
						<td noWrap align="right">
							<cmn:globalizedlabel id="lblDivisionSearch" Runat="server" AssociatedControlID="ddlDivisionSearch"></cmn:globalizedlabel></td>
						<td align="left" colspan="3">
							<asp:dropdownlist id="ddlDivisionSearch" Runat="server" DataTextField="Description" DataValueField="Code"></asp:dropdownlist></td>
					</tr>
					<tr>
						<td></td>
						<td colSpan="2">
							<cmn:GlobalizedButton id="btnSearch" TextKey="TXT_SEARCH" Runat="server"></cmn:GlobalizedButton>
							<a id="lnkAdvSearch" runat="server" />
						</td>
					</tr>
				</asp:Panel>
			</table>
		</cmn:ContentTab>
	</cmn:contenttabgroup>
	<div class="smalltext" id="divActionButtons" runat="server" visible="False">
		<div id="divDataGrids" runat="server">
			<!--CONFIRMED COURSES--><cmn:groupedgrid id="ggConfCourses" runat="server" CollapseSubItems="true" RenderTableHeaders="true"
				DataKeyField="ERPStudentCourseKey">
				<TableHeaderTemplate>
					<cmn:GlobalizedLiteral id="glitConCrs" runat="server" TextKey="TXT_CS_COURSES_CONFIRMED"></cmn:GlobalizedLiteral>
				</TableHeaderTemplate>
				<Columns>
					<cmn:GlobalizedTemplateColumn HeaderTextKey="TXT_DROP" ItemStyle-VerticalAlign="Top" ItemStyle-HorizontalAlign="Center">
						<ItemTemplate>
							<asp:CheckBox ID="cbDrop" Runat="server" Visible='<% # DataBinder.Eval(Container.DataItem, "CanDropCourse","{0}") == "Y" %>' />
						</ItemTemplate>
					</cmn:GlobalizedTemplateColumn>
					<cmn:GlobalizedTemplateColumn HeaderTextKey="TXT_CODE" ItemStyle-VerticalAlign="Top" ItemStyle-Wrap="False">
						<ItemTemplate>
							<cmn:GlobalizedLinkButton ID="Globalizedlinkbutton3" CommandArgument='<%# DataBinder.Eval( Container.DataItem, "ERPCourseKey" )%>' OnCommand="Course_Click" Runat="server">
								<%# DataBinder.Eval( Container.DataItem, "DisplayedCourseCode" ).ToString() %>
							</cmn:GlobalizedLinkButton>
						</ItemTemplate>
					</cmn:GlobalizedTemplateColumn>
					<cmn:GlobalizedBoundColumn DataField="Title" HeaderTextKey="TXT_CS_TITLE" ItemStyle-VerticalAlign="Top" ItemStyle-Wrap="False" />
					<cmn:GlobalizedTemplateColumn HeaderTextKey="TXT_SCHEDULE" ItemStyle-VerticalAlign="Top" ItemStyle-Wrap="False">
						<ItemTemplate>
							<ul>
								<asp:Repeater ID="rptSchedule" DataSource='<%#DataBinder.Eval(Container.DataItem, "CourseInfo_Schedules")%>' Runat="server">
									<ItemTemplate>
										<li>
											<%#DataBinder.Eval(Container.DataItem, "Weekdays")%>
											&nbsp;<%#DataBinder.Eval(Container.DataItem, "MeetTime")%></li>
									</ItemTemplate>
								</asp:Repeater>
							</ul>
						</ItemTemplate>
					</cmn:GlobalizedTemplateColumn>
					<cmn:GlobalizedTemplateColumn HeaderTextKey="TXT_LOCATION" ItemStyle-VerticalAlign="Top" ItemStyle-Wrap="False">
						<ItemTemplate>
							<ul>
								<asp:Repeater ID="rptRegisteredLocation" DataSource='<%#DataBinder.Eval(Container.DataItem, "CourseInfo_Schedules")%>' Runat="server">
									<ItemTemplate>
										<li>
											<%#DataBinder.Eval(Container.DataItem, "CampusDesc")%>
											&nbsp;<%#DataBinder.Eval(Container.DataItem, "BuildingDesc")%>
											&nbsp;<%#DataBinder.Eval(Container.DataItem, "RoomCode")%></li>
									</ItemTemplate>
								</asp:Repeater>
							</ul>
						</ItemTemplate>
					</cmn:GlobalizedTemplateColumn>
					<cmn:GlobalizedBoundColumn DataField="CreditHours" HeaderTextKey="TXT_CS_CREDITS" ItemStyle-VerticalAlign="Top" />
					<asp:BoundColumn DataField="ERPCourseKey" Visible="False" />
				</Columns>
				<EmptyTableTemplate>
					<div class="PortletError" runat="server" ID="Div1">
						<%= base._tableNoRowsText %>
					</div>
				</EmptyTableTemplate>
			</cmn:groupedgrid><cmn:globalizedbutton id="gbtnAddDropCourses" runat="server" TextKey="TXT_CS_DROP_SELECTED_COURSES" visible="False"></cmn:globalizedbutton>
			<!--Waitlisted--><br>
			<cmn:groupedgrid id="ggWaitlisted" runat="server" Visible="False" CollapseSubItems="true" RenderTableHeaders="true"
				DataKeyField="ERPStudentCourseKey">
				<TableHeaderTemplate>
					<cmn:GlobalizedLiteral id="glitWaitCourses" runat="server" TextKey="TXT_CS_COURSES_WAITLISTED"></cmn:GlobalizedLiteral>
				</TableHeaderTemplate>
				<Columns>
					<cmn:GlobalizedTemplateColumn ItemStyle-VerticalAlign="Top" ItemStyle-Wrap="False">
						<ItemTemplate>
							<cmn:GlobalizedLinkButton ID="glnkMoveToCurrent" Runat="server" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "ERPStudentCourseKey")+"*"+DataBinder.Eval(Container.DataItem, "ERPCourseKey")%>' OnCommand="glnkMoveToCurrent_Click" TextKey="TXT_CS_MOVE_TO_CURRENT" Visible='<% # DataBinder.Eval(Container.DataItem, "CanChangeWaitlistToCurrent","{0}") == "Y" %>' />
						</ItemTemplate>
					</cmn:GlobalizedTemplateColumn>
					<cmn:GlobalizedTemplateColumn HeaderTextKey="TXT_DROP" ItemStyle-VerticalAlign="Top" ItemStyle-HorizontalAlign="Center">
						<ItemTemplate>
							<asp:CheckBox ID="cbDropW" Runat="server" Visible='<% # DataBinder.Eval(Container.DataItem, "CanDropCourse","{0}") == "Y" %>' />
						</ItemTemplate>
					</cmn:GlobalizedTemplateColumn>
					<cmn:GlobalizedTemplateColumn HeaderTextKey="TXT_CODE" ItemStyle-VerticalAlign="Top" ItemStyle-Wrap="False">
						<ItemTemplate>
														<cmn:GlobalizedLinkButton ID="Globalizedlinkbutton3" CommandArgument='<%# DataBinder.Eval( Container.DataItem, "ERPCourseKey" )%>' OnCommand="Course_Click" Runat="server">
								<%# DataBinder.Eval( Container.DataItem, "DisplayedCourseCode" ).ToString() %>
							</cmn:GlobalizedLinkButton>
						</ItemTemplate>
					</cmn:GlobalizedTemplateColumn>
					<cmn:GlobalizedBoundColumn DataField="Title" HeaderTextKey="TXT_CS_TITLE" ItemStyle-VerticalAlign="Top" ItemStyle-Wrap="False" />
					<cmn:GlobalizedTemplateColumn HeaderTextKey="TXT_SCHEDULE" ItemStyle-VerticalAlign="Top" ItemStyle-Wrap="False">
						<ItemTemplate>
							<ul>
								<asp:Repeater ID="rptScheduleW" DataSource='<%#DataBinder.Eval(Container.DataItem, "CourseInfo_Schedules")%>' Runat="server">
									<ItemTemplate>
										<li>
											<%#DataBinder.Eval(Container.DataItem, "Weekdays")%>
											&nbsp;<%#DataBinder.Eval(Container.DataItem, "MeetTime")%></li>
									</ItemTemplate>
								</asp:Repeater>
							</ul>
						</ItemTemplate>
					</cmn:GlobalizedTemplateColumn>
					<cmn:GlobalizedTemplateColumn ItemStyle-Wrap="False" HeaderTextKey="TXT_LOCATION" ItemStyle-VerticalAlign="Top">
						<ItemTemplate>
							<ul>
								<asp:Repeater ID="Repeater2" DataSource='<%#DataBinder.Eval(Container.DataItem, "CourseInfo_Schedules")%>' Runat="server">
									<ItemTemplate>
										<li>
											<%#DataBinder.Eval(Container.DataItem, "CampusDesc")%>
											&nbsp;<%#DataBinder.Eval(Container.DataItem, "BuildingDesc")%>
											&nbsp;<%#DataBinder.Eval(Container.DataItem, "RoomCode")%></li>
									</ItemTemplate>
								</asp:Repeater>
							</ul>
						</ItemTemplate>
					</cmn:GlobalizedTemplateColumn>
					<cmn:GlobalizedBoundColumn DataField="CreditHours" HeaderTextKey="TXT_CS_CREDITS" ItemStyle-VerticalAlign="Top" />
					<asp:BoundColumn DataField="ERPCourseKey" Visible="False" />
				</Columns>
				<EmptyTableTemplate></EmptyTableTemplate>
			</cmn:groupedgrid><cmn:globalizedbutton id="gbtnLeaveWaitlist" runat="server" TextKey="TXT_CS_LEAVE_WAITLIST" Visible="False"></cmn:globalizedbutton>
			<!-- Advisor Approval --->
			<br>
			<cmn:groupedgrid id="ggAdvApproval" runat="server" Visible="False" CollapseSubItems="true" RenderTableHeaders="true"
				DataKeyField="ERPStudentCourseKey">
				<TableHeaderTemplate>
					<cmn:GlobalizedLiteral id="glitAdvApprovalSubHeader" runat="server" TextKey="TXT_CS_COURSES_REQUIRING_ADVISOR_APPROVAL" />
				</TableHeaderTemplate>
				<Columns>
					<cmn:GlobalizedTemplateColumn HeaderTextKey="TXT_APPROVE" ItemStyle-VerticalAlign="Top" ItemStyle-HorizontalAlign="Center"
						Visible="False">
						<ItemTemplate>
							<asp:CheckBox ID="cbApprove" Runat="server" />
						</ItemTemplate>
					</cmn:GlobalizedTemplateColumn>
					<cmn:GlobalizedTemplateColumn HeaderTextKey="TXT_DROP" ItemStyle-VerticalAlign="Top" ItemStyle-HorizontalAlign="Center">
						<ItemTemplate>
							<asp:CheckBox ID="cbDropA" Runat="server" Visible='<% # DataBinder.Eval(Container.DataItem, "CanDropCourse","{0}") == "Y" %>' />
						</ItemTemplate>
					</cmn:GlobalizedTemplateColumn>
					<cmn:GlobalizedTemplateColumn HeaderTextKey="TXT_CODE" ItemStyle-VerticalAlign="Top" ItemStyle-Wrap="False">
						<ItemTemplate>
														<cmn:GlobalizedLinkButton ID="Globalizedlinkbutton3" CommandArgument='<%# DataBinder.Eval( Container.DataItem, "ERPCourseKey" )%>' OnCommand="Course_Click" Runat="server">
								<%# DataBinder.Eval( Container.DataItem, "DisplayedCourseCode" ).ToString() %>
							</cmn:GlobalizedLinkButton>
						</ItemTemplate>
					</cmn:GlobalizedTemplateColumn>
					<cmn:GlobalizedBoundColumn DataField="Title" HeaderTextKey="TXT_CS_TITLE" ItemStyle-VerticalAlign="Top" ItemStyle-Wrap="False" />
					<cmn:GlobalizedTemplateColumn HeaderTextKey="TXT_SCHEDULE" ItemStyle-VerticalAlign="Top" ItemStyle-Wrap="False">
						<ItemTemplate>
							<ul>
								<asp:Repeater ID="rptScheduleA" DataSource='<%#DataBinder.Eval(Container.DataItem, "CourseInfo_Schedules")%>' Runat="server">
									<ItemTemplate>
										<li>
											<%#DataBinder.Eval(Container.DataItem, "Weekdays")%>
											&nbsp;<%#DataBinder.Eval(Container.DataItem, "MeetTime")%></li>
									</ItemTemplate>
								</asp:Repeater>
							</ul>
						</ItemTemplate>
					</cmn:GlobalizedTemplateColumn>
					<cmn:GlobalizedTemplateColumn ItemStyle-Wrap="False" HeaderTextKey="TXT_LOCATION" ItemStyle-VerticalAlign="Top">
						<ItemTemplate>
							<ul>
								<asp:Repeater ID="Repeater1" DataSource='<%#DataBinder.Eval(Container.DataItem, "CourseInfo_Schedules")%>' Runat="server">
									<ItemTemplate>
										<li>
											<%#DataBinder.Eval(Container.DataItem, "CampusDesc")%>
											&nbsp;<%#DataBinder.Eval(Container.DataItem, "BuildingDesc")%>
											&nbsp;<%#DataBinder.Eval(Container.DataItem, "RoomCode")%></li>
									</ItemTemplate>
								</asp:Repeater>
							</ul>
						</ItemTemplate>
					</cmn:GlobalizedTemplateColumn>
					<cmn:GlobalizedTemplateColumn HeaderTextKey="TXT_CS_CREDITS" ItemStyle-VerticalAlign="Top">
						<ItemTemplate>
							<asp:TextBox ID="tbCreditHoursA" Runat="server" MaxLength="5" Visible='<% # base._editCredits && DataBinder.Eval(Container.DataItem, "CreditFixedVariable","{0}") == "Variable" %>' Width="40px" Text='<%#DataBinder.Eval(Container.DataItem, "CreditHours")%>' />
							<asp:Literal ID="litCreditHoursA" Runat="server" Visible='<% # !base._editCredits || (base._editCredits && DataBinder.Eval(Container.DataItem, "CreditFixedVariable","{0}") != "Variable") %>' Text='<%#DataBinder.Eval(Container.DataItem, "CreditHours")%>'>
							</asp:Literal>
						</ItemTemplate>
					</cmn:GlobalizedTemplateColumn>
					<asp:BoundColumn DataField="ERPCourseKey" Visible="False" />
				</Columns>
				<EmptyTableTemplate></EmptyTableTemplate>
			</cmn:groupedgrid>
			<div id="divAdvAppReqValText" runat="server" visible="False">
				<table>
					<tr>
						<td class="PortletError" vAlign="top"><IMG title="" alt="*" src="UI\Common\Images\PortletImages\Icons\exclam_icon.gif">
						</td>
						<td><cmn:globalizedlabel id="glblAdvAppReqValText" TextKey="TXT_CS_ADV_APP_REQ_VAL_TEXT" Runat="server" CssClass="PortletError"></cmn:globalizedlabel></td>
					</tr>
				</table>
			</div>
			<cmn:globalizedbutton id="gbtnLeaveAdvisor" runat="server" TextKey="TXT_CS_LEAVE_ADVISOR" Visible="False"></cmn:globalizedbutton><cmn:globalizedbutton id="gbtnAdvApproval" TextKey="TXT_ADVISOR_APPROVAL" Runat="server" Visible="False"></cmn:globalizedbutton>
			<!-- pending add
	<cmn:groupedgrid id="ggSelectedCourses" runat="server" Visible="False" DataKeyField="ERPCourseKey" 
		RenderTableHeaders="true" CollapseSubItems="true">
			<TableHeaderTemplate>
				<cmn:GlobalizedLiteral id="glitSelCrsSubHeader" runat="server" TextKey="TXT_CS_COURSES_SELECTED_FOR_ADDITION"></cmn:GlobalizedLiteral>
			</TableHeaderTemplate>
			<Columns>
				
				<cmn:GlobalizedTemplateColumn ItemStyle-VerticalAlign="Top" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="1%">
					<ItemTemplate>
						<cmn:GlobalizedButton ID="gbtnRemove" Runat="server" TextKey="TXT_REMOVE" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "ERPCourseKey")%>' OnCommand="gbtnRemove_Click" />
					</ItemTemplate>
				</cmn:GlobalizedTemplateColumn>
				<cmn:GlobalizedTemplateColumn HeaderTextKey="TXT_ADD" ItemStyle-VerticalAlign="Top" ItemStyle-HorizontalAlign="Center">
					<ItemTemplate>
						<asp:CheckBox ID="cbAdd" Runat="server" Checked='<% # DataBinder.Eval(Container.DataItem, "CanRegister","{0}") == "Y" %>' Visible='<% # DataBinder.Eval(Container.DataItem, "CanRegister","{0}") == "Y" %>' />
					</ItemTemplate>
				</cmn:GlobalizedTemplateColumn>
				<cmn:GlobalizedBoundColumn DataField="DisplayedCourseCode" HeaderTextKey="TXT_COURSE" ItemStyle-VerticalAlign="Top"
					ItemStyle-Wrap="False" />
				
				<cmn:GlobalizedBoundColumn DataField="Title" HeaderTextKey="TXT_CS_TITLE" ItemStyle-VerticalAlign="Top" ItemStyle-Wrap="False" />
								<cmn:GlobalizedTemplateColumn HeaderTextKey="TXT_SCHEDULE" ItemStyle-VerticalAlign="Top" ItemStyle-Wrap="False">
					<ItemTemplate>
						<ul>
							<asp:Repeater ID="rptScheduleS" DataSource='<%#DataBinder.Eval(Container.DataItem, "CourseInfo_Schedules")%>' Runat="server">
								<ItemTemplate>
									<li>
										<%#DataBinder.Eval(Container.DataItem, "Weekdays")%>
										&nbsp;<%#DataBinder.Eval(Container.DataItem, "MeetTime")%></li>
								</ItemTemplate>
							</asp:Repeater>
						</ul>
					</ItemTemplate>
				</cmn:GlobalizedTemplateColumn>
				<cmn:GlobalizedTemplateColumn HeaderTextKey="TXT_CS_CREDITS" ItemStyle-VerticalAlign="Top">
					<ItemTemplate>
						<asp:TextBox ID="tbCreditHours" Runat="server" MaxLength="5" Visible='<% # base._editCredits && DataBinder.Eval(Container.DataItem, "CreditFixedVariable","{0}") == "Variable" %>' Width="40px" Text='<%#DataBinder.Eval(Container.DataItem, "CreditHours")%>' />
						<asp:Literal ID="litCreditHours" Runat="server" Visible='<% # !base._editCredits || (base._editCredits && DataBinder.Eval(Container.DataItem, "CreditFixedVariable","{0}") != "Variable") %>' Text='<%#DataBinder.Eval(Container.DataItem, "CreditHours")%>'>
						</asp:Literal>
					</ItemTemplate>
				</cmn:GlobalizedTemplateColumn>

				<asp:BoundColumn DataField="CreditFixedVariable" Visible="False" />
			</Columns>			
		</cmn:groupedgrid>
		-->
			<!--errors--><br>
			<cmn:groupedgrid id="ggResults" runat="server" Visible="False" RenderTableHeaders="true" DataKeyField="ERPCourseKey"
				CssClass="smalltext" Border="1">
				<TableHeaderTemplate>
					<cmn:GlobalizedLiteral id="glitResultsSubHeader" runat="server" TextKey="TXT_CS_COURSES_NOT_CONFIRMED_FOR_ERRORS"></cmn:GlobalizedLiteral>
				</TableHeaderTemplate>
				<Columns>
					<cmn:GlobalizedTemplateColumn ItemStyle-VerticalAlign="Top" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="1%">
						<ItemTemplate>
							<cmn:GlobalizedButton ID="gbtnRemoveE" Runat="server" TextKey="TXT_REMOVE" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "ERPCourseKey")%>' OnCommand="gbtnRemoveE_Click" />
						</ItemTemplate>
					</cmn:GlobalizedTemplateColumn>
					<cmn:GlobalizedTemplateColumn HeaderTextKey="TXT_OVERRIDE" ItemStyle-VerticalAlign="Top" ItemStyle-HorizontalAlign="Center"
						Visible="False">
						<ItemTemplate>
							<asp:CheckBox ID="cbOverride" Runat="server" Visible="True" />
						</ItemTemplate>
					</cmn:GlobalizedTemplateColumn>
					<cmn:GlobalizedTemplateColumn HeaderTextKey="TXT_ADD" ItemStyle-VerticalAlign="Top" ItemStyle-HorizontalAlign="Center">
						<ItemTemplate>
							<asp:CheckBox ID="cbAddE" Runat="server" Checked="True" />
						</ItemTemplate>
					</cmn:GlobalizedTemplateColumn>
					<cmn:GlobalizedBoundColumn DataField="DisplayedCourseCode" HeaderTextKey="TXT_COURSE" ItemStyle-VerticalAlign="Top"
						ItemStyle-Wrap="False" />
					<cmn:GlobalizedBoundColumn DataField="Title" HeaderTextKey="TXT_CS_TITLE" ItemStyle-VerticalAlign="Top" ItemStyle-Wrap="False" />
					<cmn:GlobalizedTemplateColumn HeaderTextKey="TXT_CS_CREDITS" ItemStyle-VerticalAlign="Top">
						<ItemTemplate>
							<asp:TextBox ID="tbCreditHoursE" Runat="server" MaxLength="5" Visible='<% # base._editCredits && DataBinder.Eval(Container.DataItem, "CreditFixedVariable","{0}") == "Variable" %>' Width="40px" Text='<%#DataBinder.Eval(Container.DataItem, "CreditHours")%>' />
							<asp:Literal ID="litCreditHoursE" Runat="server" Visible='<% # !base._editCredits || (base._editCredits && DataBinder.Eval(Container.DataItem, "CreditFixedVariable","{0}") != "Variable") %>' Text='<%#DataBinder.Eval(Container.DataItem, "CreditHours")%>'>
							</asp:Literal>
						</ItemTemplate>
					</cmn:GlobalizedTemplateColumn>
					<cmn:GlobalizedTemplateColumn HeaderTextKey="TXT_SCHEDULE" ItemStyle-VerticalAlign="Top" ItemStyle-Wrap="False">
						<ItemTemplate>
							<ul>
								<asp:Repeater ID="rptScheduleE" DataSource='<%#DataBinder.Eval(Container.DataItem, "CourseInfo_Schedules")%>' Runat="server">
									<ItemTemplate>
										<li>
											<%#DataBinder.Eval(Container.DataItem, "Weekdays")%>
											&nbsp;<%#DataBinder.Eval(Container.DataItem, "MeetTime")%></li>
									</ItemTemplate>
								</asp:Repeater>
							</ul>
						</ItemTemplate>
					</cmn:GlobalizedTemplateColumn>
					<asp:BoundColumn DataField="Errors" Visible="False" />
					<asp:BoundColumn DataField="CanDoScheduleConflicts" Visible="False" />
					<asp:BoundColumn DataField="CanDoRequisites" Visible="False" />
					<asp:BoundColumn DataField="CanDoCapacity" Visible="False" />
					<asp:BoundColumn DataField="CanDoRequirements" Visible="False" />
					<asp:BoundColumn DataField="CanWaitlist" Visible="False" />
				</Columns>
				<SubItemTemplate>
					<table cellpadding="0" cellspacing="0" border="0">
						<tr>
						</tr>
						<tr>
							<td class="PortletError"><%#DataBinder.Eval(Container.DataItem, "ErrorText")%></td>
						</tr>
					</table>
				</SubItemTemplate>
			</cmn:groupedgrid>
		</div>
		<br>
		<cmn:groupedgrid id="ggMustPay" runat="server" Visible="False" CollapseSubItems="true" RenderTableHeaders="true"
			DataKeyField="ERPStudentCourseKey">
			<TableHeaderTemplate>
				<cmn:GlobalizedLiteral id="glitMustPaySubHeader" runat="server" TextKey="TXT_CS_COURSES_REQUIRING_PAYMENT"></cmn:GlobalizedLiteral>
			</TableHeaderTemplate>
			<Columns>
				<cmn:GlobalizedTemplateColumn HeaderTextKey="TXT_DROP" ItemStyle-VerticalAlign="Top" ItemStyle-HorizontalAlign="Center">
					<ItemTemplate>
						<asp:CheckBox ID="cbDropP" Runat="server" Visible='<% # DataBinder.Eval(Container.DataItem, "CanDropCourse","{0}") == "Y" %>' />
					</ItemTemplate>
				</cmn:GlobalizedTemplateColumn>
				<cmn:GlobalizedBoundColumn DataField="DisplayedCourseCode" HeaderTextKey="TXT_COURSE" ItemStyle-VerticalAlign="Top"
					ItemStyle-Wrap="False" />
				<cmn:GlobalizedBoundColumn DataField="Title" HeaderTextKey="TXT_CS_TITLE" ItemStyle-VerticalAlign="Top" ItemStyle-Wrap="False" />
				<cmn:GlobalizedTemplateColumn HeaderTextKey="TXT_SCHEDULE" ItemStyle-VerticalAlign="Top" ItemStyle-Wrap="False">
					<ItemTemplate>
						<ul>
							<asp:Repeater ID="rptScheduleP" DataSource='<%#DataBinder.Eval(Container.DataItem, "CourseInfo_Schedules")%>' Runat="server">
								<ItemTemplate>
									<li>
										<%#DataBinder.Eval(Container.DataItem, "Weekdays")%>
										&nbsp;<%#DataBinder.Eval(Container.DataItem, "MeetTime")%></li>
								</ItemTemplate>
							</asp:Repeater>
						</ul>
					</ItemTemplate>
				</cmn:GlobalizedTemplateColumn>
				<cmn:GlobalizedBoundColumn DataField="CreditHours" HeaderTextKey="TXT_CS_CREDITS" ItemStyle-VerticalAlign="Top" />
				<cmn:GlobalizedBoundColumn DataField="CourseRegistrationStatus" HeaderTextKey="TXT_STATUS" ItemStyle-VerticalAlign="Top" />
				<asp:BoundColumn DataField="ERPCourseKey" Visible="False" />
			</Columns>
		</cmn:groupedgrid>
		<div id="divMustPayReqValText" runat="server" visible="False">
			<table>
				<tr>
					<td class="PortletError" vAlign="top"><IMG title="" alt="*" src="UI\Common\Images\PortletImages\Icons\exclam_icon.gif">
					</td>
					<td><cmn:globalizedlabel id="glblMustPayReqValText" TextKey="TXT_CS_PAYMENT_REQ_VAL_TEXT" Runat="server"
							CssClass="PortletError"></cmn:globalizedlabel></td>
				</tr>
			</table>
		</div>
		<cmn:globalizedbutton id="gbtnLeaveMustPay" runat="server" TextKey="TXT_CS_LEAVE_MUST_PAY" Visible="False"></cmn:globalizedbutton><cmn:globalizedbutton id="gbtnPayMustPay" runat="server" TextKey="TXT_CS_PAY_MUST_PAY_COURSES"></cmn:globalizedbutton></div>
	<table cellSpacing="2" cellPadding="2" width="100%">
		<tr>
			<td colSpan="4"><cmn:globalizedlinkbutton id="glnkMyAccountInfo" runat="server" TextKey="TXT_ACCOUNT_INFO_MY_ACCOUNT_INFO"></cmn:globalizedlinkbutton></td>
		</tr>
	</table>
</div>
