<%@ Control Language="c#" AutoEventWireup="True" Codebehind="AddDropCourses.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.CourseSchedulesPortlet.AddDropCourses" %>
<script language="JavaScript" src="<%= this.ResolveUrl("~/Portlets/CRM/Student/Portlet.CourseSchedules/Scripts/CourseSchedules.js") %>"></script>
<%@ Register TagPrefix="cmn" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Import namespace="System.ComponentModel"%>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<style type="text/css">

.divStyle {
 	display:none;
 	position:absolute;
 	z-index: 2;
 	background-color:#efefef;
 	border:1px solid #000;
 	padding:1em;
 	margin:3em;
}

</style>

<script>
var customarray=new Array(<%=GetCourseListArray() %>);
var custom2 = new Array('something','randomly','different');

</script>
<script>
	var formType = "";
	function checkSearchValues()
	{
		var crsCde1 = document.getElementById('<%= this.tbCourse1.ClientID %>').value;
		var crsCde2 = document.getElementById('<%= this.tbCourse2.ClientID %>').value;
		var crsCde3 = document.getElementById('<%= this.tbCourse3.ClientID %>').value;
		var crsCde4 = document.getElementById('<%= this.tbCourse4.ClientID %>').value;
		var crsCde5 = document.getElementById('<%= this.tbCourse5.ClientID %>').value;
		var crsCde6 = document.getElementById('<%= this.tbCourse6.ClientID %>').value;
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
		
//			if (((crsCde1 != "" && crsSection1 == "") || (crsCde1 == "" && crsSection1 != "")) || ((crsCde2 != "" && crsSection2 == "") || (crsCde2 == "" && crsSection2 != "")) || ((crsCde3 != "" && crsSection3 == "") || (crsCde3 == "" && crsSection3 != "")) || ((crsCde4 != "" && crsSection4 == "") || (crsCde4 == "" && crsSection4 != "")) || ((crsCde5 != "" && crsSection5 == "") || (crsCde5 == "" && crsSection5 != "")) || ((crsCde6 != "" && crsSection6 == "") || (crsCde6 == "" && crsSection6 != "")))
//			{
//				alert('<%= Globalizer.GetGlobalizedString("MSG_CS_ADD_DROP_SRCH_VALIDATE") %>');
//				return false;				
//			}
			
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
        var swapshown = '<%= this.strSwapButtonID %>';
	    if (swapshown != '') return confirm('<%= Globalizer.GetGlobalizedString("MSG_CS_STOP_DROP_FOR_SWAP") %>');
		if(!addDropChecked(true))
		{			
			return false;
		}		
		else
			return true;
	}
	
	function swapCheck()
	{
	window.alert("swapCheck");
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
	
		function swapNullCheck()
	{
	
		var frm = document.MAINFORM;
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

		}
		if (dropChecked < 1)
		{
			alert('You must select a course to swap.');
			return false;
		}
		else
		{
		    return true;
		}

		
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
function showHideForm(obj, anchor) {
	oDiv = document.getElementById(obj);
	hideForm();
	//window.alert(anchor);
	var divAnchor = document.getElementById(anchor);
	//window.alert(divAnchor);
	var xlocation = findPos(divAnchor)[0];
	var ylocation = findPos(divAnchor)[1];
	//window.alert(xlocation + '|' + ylocation);
	moveIt(obj, ylocation -75 , xlocation -75)
	if(oDiv.style.display=='block')
	{
		oDiv.style.display='none';
		return false;
	}
	else
	{
		oDiv.style.display='block';
		return false;
	}
}


function hideForm(){
    var inputs = document.getElementsByTagName("div");
    for (var i=0; i<inputs.length; i++)
    {
    var exclude = inputs[i].id.indexOf("divEmail")
        if (exclude != -1)
        {
				inputs[i].style.display = 'none';
        }
    }

}
function moveIt(obj, mvTop, mvLeft) {
oDiv = document.getElementById(obj);
//window.alert(mvTop + '|' + mvLeft);
	oDiv.style.position = "absolute";
	oDiv.style.top = mvTop + 'px';
	oDiv.style.left = mvLeft + 'px';
}


function findPos(obj) {
	var curleft = curtop = 0;
	if (obj.offsetParent) {
		curleft = obj.offsetLeft
		curtop = obj.offsetTop
		while (obj = obj.offsetParent) {
			curleft += obj.offsetLeft
			curtop += obj.offsetTop
		}
	}
	return [curleft,curtop];
}

</script>
<div class="pSection" id="divMain" runat="server" visible="true">
<h4><asp:literal id="litCrsSchFor" runat="server"></asp:literal></h4>
<div id="divAdminLink" runat="server" visible="false">
	<table class="GrayBordered" width="50%" align="center" cellpadding="3" border="0">
		<tr>
			<td align="center"><IMG title="" alt="*" src="UI\Common\Images\PortletImages\Icons\portlet_admin_icon.gif">&nbsp;<cmn:globalizedlinkbutton id="glnkAdmin" runat="server" TextKey="TXT_CS_ADMIN_THIS_PORTLET"></cmn:globalizedlinkbutton></td>
		</tr>
	</table>
</div>

	<div class="GrayBordered" id="divDropDowns" style="MARGIN-BOTTOM: 3px" runat="server"
		visible="False">
		<table cellSpacing="3" cellPadding="3" width="100%" border="0">
			<tr>
				<th width="10%">
					<cmn:globalizedlabel id="lblTerm" runat="server" TextKey="LBL_TERM" AssociatedControlID="ddlTerm"></cmn:globalizedlabel></th>
				<td width="10%"><asp:dropdownlist id="ddlTerm" AutoPostBack="True" Runat="server"></asp:dropdownlist></td>
				<td width="30">&nbsp;</td>
				<th width="10%">
					<cmn:globalizedlabel id="lblDivision" runat="server" visible="false" AssociatedControlID="ddlDivision" /></th>
				<td><asp:dropdownlist id="ddlDivision" AutoPostBack="True" Runat="server" Visible="false" /></td>
			</tr>
			<tr>
				<td colSpan="5"><asp:label id="lblAlert" Runat="server"></asp:label><asp:label id="hntMessage" runat="server"></asp:label></td>
			</tr>
			<tr>
				<td colSpan="5"><asp:label id="lblCreditsRegistered" Runat="server"></asp:label>&nbsp;<asp:label id="lblCreditsPending" Runat="server"></asp:label><input 
      type=hidden value="<%= base._canAdd %>" name=canAdd> <input type=hidden value="<%= base._canDrop %>" name=canDrop></td>
			</tr>
		</table>
	</div>
    <br />
    <div class="pSection" id="divHolds" runat="Server" visible="true">
        <cmn:GroupedGrid ID="dgHolds" runat="server" RenderTableHeaders="true" ShowHeader="true"
            CollapseSubItems="true">
            <TableHeaderTemplate>
                <font color="#ff0000">
                    <cmn:GlobalizedLiteral ID="glitHolds" runat="server" TextKey="TXT_HOLDS"></cmn:GlobalizedLiteral></font>
            </TableHeaderTemplate>
            <Columns>
                <cmn:PlusMinusColumn ItemStyle-VerticalAlign="Top" ItemStyle-Width="1%" ItemStyle-HorizontalAlign="Center" />
                <cmn:GlobalizedTemplateColumn HeaderTextKey="TXT_HOLD" ItemStyle-VerticalAlign="Top">
                    <ItemTemplate>
                        <%#DataBinder.Eval(Container.DataItem, "HoldCode")%>
                        -
                        <%#DataBinder.Eval(Container.DataItem, "HoldDescription")%>
                    </ItemTemplate>
                </cmn:GlobalizedTemplateColumn>
                <cmn:GlobalizedBoundColumn HeaderTextKey="TXT_TYPE" DataField="HoldTypeDesc" ItemStyle-VerticalAlign="Top">
                </cmn:GlobalizedBoundColumn>
                <cmn:GlobalizedBoundColumn HeaderTextKey="TXT_BEGIN_DATE" DataField="HoldBeginDate"
                    ItemStyle-VerticalAlign="Top">
                </cmn:GlobalizedBoundColumn>
                <cmn:GlobalizedBoundColumn HeaderTextKey="TXT_EXPIRATION" DataField="HoldExpirationDate"
                    ItemStyle-VerticalAlign="Top">
                </cmn:GlobalizedBoundColumn>
                <cmn:GlobalizedBoundColumn HeaderTextKey="TXT_OFFICE" DataField="OfficeName" ItemStyle-VerticalAlign="Top">
                </cmn:GlobalizedBoundColumn>
            </Columns>
            <SubItemTemplate>
                <table cellspacing="0" cellpadding="0" border="0" align="center">
                    <tr runat="server" visible='<%#DataBinder.Eval(Container.DataItem, "HoldRemark").ToString().Trim() != string.Empty%>'>
                        <td align="right">
                            <cmn:GlobalizedLiteral ID="litRemarks" TextKey="TXT_REMARKS" runat="server"></cmn:GlobalizedLiteral>:
                        </td>
                        <td>
                            <%#DataBinder.Eval(Container.DataItem, "HoldRemark")%>
                        </td>
                    </tr>
                </table>
            </SubItemTemplate>
        </cmn:GroupedGrid>
    </div>
		<br />
		<div id="divHiddenForRegAgreement" runat="server" visible="true">
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
				<td bgcolor="#DEDFDE" class="BorderLeftBottom" valign="top" rowspan="2">Resolution:</td>
				<td bgcolor="#EFEFEF" class="BorderLeftRight"><%# DataBinder.Eval(Container.DataItem,"Resolution")%><br>
					
				</td>
			</tr>
			<tr>
				

				<td bgcolor="#EFEFEF" class="BorderLeftRightBottom">
					<div align="center">
						<cmn:GlobalizedButton ID="gbConflictSwap" TextKey="TXT_CS_SWAP" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ERPCourseKey")+ "|" + DataBinder.Eval(Container.DataItem, "SwapERPStudentCourseKey")+ "|" + DataBinder.Eval(Container.DataItem, "SwapERPCourseKey")+ "|" + DataBinder.Eval(Container.DataItem, "SwapCreditHours")%>' OnCommand="gbtnSwapE_Click" runat="server" />
						<cmn:GlobalizedButton ID="gbConflictRemove" Runat="server" TextKey="TXT_CS_DO_NOT_ADD" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "ERPCourseKey")%>' OnCommand="gbtnRemoveE_Click" />
						<cmn:GlobalizedButton ID="gbConflictOverride" TextKey="TXT_CS_OVERRIDE_ERRORS" CommandName="Override" Runat="server" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "ERPCourseKey") + "|" + DataBinder.Eval(Container.DataItem, "Errors")%>' Visible="False" />
						</div>
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
						<cmn:GlobalizedButton id="gbtnMaxSwap" Runat="server" TextKey="TXT_CS_SWAP" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "ERPCourseKey")%>' Visible="False" CommandName="MaxSwap"  />
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
					<asp:TextBox ID="tbCreditHours" Runat="server" MaxLength="5" Visible="False" Width="40px" Text='<%#DataBinder.Eval(Container.DataItem, "CreditHours")%>' />&nbsp;<%#DataBinder.Eval(Container.DataItem, "CreditStatement")%>
					<asp:Label ID="lblAlternateLabel" runat="server"></asp:Label><asp:DropDownList ID="ddlGradingType" runat="server" Visible="False" />
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
						<td colspan="6" valign="top">
							<asp:Literal ID="litCourseCode" Runat="server"></asp:Literal></td>
					</tr>
					<asp:Panel Runat="server" ID="panel1" DefaultButton="gbtnSearch">
					<tr>
						<td width="10">&nbsp;</td>
						<td width="50">
							<cmn:globalizedliteral id="glitCourse" runat="server" TextKey="LBL_COURSE_CODE"></cmn:globalizedliteral></td>
						<td width="20">&nbsp;</td>
						<td width="10">&nbsp;</td>
						<td width="50">
							<cmn:globalizedliteral id="glitCourse2" runat="server" TextKey="LBL_COURSE_CODE"></cmn:globalizedliteral></td>
						<td width="10">&nbsp;</td>

					</tr>
					<tr>
							<td><asp:label AssociatedControlID="tbCourse1" Runat=server>1.</asp:label></td>
						<td>
							<asp:textbox id="tbCourse1" Runat="server" Width="128px" MaxLength="30"></asp:textbox></td>
							<td>&nbsp;</td>
							<td><asp:label AssociatedControlID="tbCourse4" Runat=server ID="Label1" NAME="Label1">2.</asp:Label></td>
						<td>
							<asp:textbox id="tbCourse4" Runat="server" Width="128px" MaxLength="30"></asp:textbox></td>
							<td>&nbsp;</td>
					</tr>
					<tr>
							<td><asp:label AssociatedControlID="tbCourse2" Runat=server ID="Label2" NAME="Label2">3.</asp:Label></td>
						<td>
							<asp:textbox id="tbCourse2" Runat="server" Width="128px" MaxLength="30"></asp:textbox></td>
							<td>&nbsp;</td>
							<td><asp:label AssociatedControlID="tbCourse5" Runat=server ID="Label3" NAME="Label3">4.</asp:Label></td>
						<td>
							<asp:textbox id="tbCourse5" Runat="server" Width="128px" MaxLength="30"></asp:textbox></td>
							<td>&nbsp;<td>
					</tr>
					<tr>
							<td><asp:label AssociatedControlID="tbCourse3" Runat=server ID="Label4" NAME="Label4">5.</asp:Label></td>
						<td>
							<asp:textbox id="tbCourse3" Runat="server" Width="128px" MaxLength="30"></asp:textbox></td>
							<td>&nbsp;</td>
							<td><asp:label AssociatedControlID="tbCourse6" Runat=server ID="Label5" >6.</asp:Label></td>
						<td>
							<asp:textbox id="tbCourse6" Runat="server" Width="128px" MaxLength="30"></asp:textbox></td>
							<td>&nbsp;</td>

					</tr>
					<tr>
						<td colspan="6" align="center">
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
			<!--CONFIRMED COURSES-->
            <div class="CourseSchedulesSection">
                <cmn:groupedgrid id="ggConfCourses" width="100%" runat="server" CollapseSubItems="true" RenderTableHeaders="true"
				    DataKeyField="ERPStudentCourseKey">
				    <TableHeaderTemplate>
					    <cmn:GlobalizedLiteral id="glitConCrs" runat="server" TextKey="TXT_CS_COURSES_CONFIRMED"></cmn:GlobalizedLiteral>
				    </TableHeaderTemplate>
				    <Columns>
					    <cmn:GlobalizedTemplateColumn HeaderTextKey="TXT_DROP" ItemStyle-VerticalAlign="Top" ItemStyle-HorizontalAlign="Center">
						    <ItemTemplate>
							    <asp:CheckBox ID="cbDrop" Runat="server" Visible='<%#DataBinder.Eval(Container.DataItem, "CanDropCourse","{0}") == "Y" %>' CssClass="ConfirmedCheckBox" />
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
								    <asp:Repeater ID="rptSchedule" DataSource='<%#DataBinder.Eval(Container.DataItem, "Schedules")%>' Runat="server">
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
								    <asp:Repeater ID="rptRegisteredLocation" DataSource='<%#DataBinder.Eval(Container.DataItem, "Schedules")%>' Runat="server">
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
					    <cmn:GlobalizedBoundColumn DataField="CreditTypeDesc" HeaderTextKey="TXT_CS_CREDIT_TYPE" ItemStyle-VerticalAlign="Top" />
					    <cmn:GlobalizedBoundColumn DataField="DivisionDesc" HeaderTextKey="TXT_CS_DIVISION" ItemStyle-VerticalAlign="Top" />
					    <asp:BoundColumn DataField="ERPCourseKey" Visible="False" />
				    </Columns>
				    <EmptyTableTemplate>
                        <%if (isAdvisorApprovalRequired()) {%>
					    <div class="text-warning" runat="server" ID="divNoRows">
						    <%= base._tableNoRowsText %>
					    </div>
                        <%} else {%>
					    <div class="PortletError" runat="server" ID="div1">
						    <%= base._tableNoRowsText %>
					    </div>
                        <%}%>
				    </EmptyTableTemplate>
			    </cmn:groupedgrid>
                <cmn:globalizedbutton id="gbtnAddDropCourses" runat="server" TextKey="TXT_CS_DROP_SELECTED_COURSES" visible="False" CssClass="DropButton" Enabled="false"></cmn:globalizedbutton>
            </div>
			<!--Waitlisted-->
            <div class="CourseSchedulesSection">
			    <cmn:groupedgrid id="ggWaitlisted" width="100%" runat="server" Visible="False" CollapseSubItems="true" RenderTableHeaders="true"
				    DataKeyField="ERPStudentCourseKey">
				    <TableHeaderTemplate>
					    <cmn:GlobalizedLiteral id="glitWaitCourses" runat="server" TextKey="TXT_CS_COURSES_WAITLISTED"></cmn:GlobalizedLiteral>
				    </TableHeaderTemplate>
				    <Columns>
					    <cmn:GlobalizedTemplateColumn ItemStyle-VerticalAlign="Top" ItemStyle-Wrap="False">
						    <ItemTemplate>
							    <cmn:GlobalizedLinkButton ID="glnkMoveToCurrent" Runat="server" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "ERPStudentCourseKey")+"*"+DataBinder.Eval(Container.DataItem, "ERPCourseKey")%>' OnCommand="glnkMoveToCurrent_Click" TextKey="TXT_CS_MOVE_TO_CURRENT" Visible='<%#DataBinder.Eval(Container.DataItem, "CanChangeWaitlistToCurrent","{0}") == "Y" %>' />
						    </ItemTemplate>
					    </cmn:GlobalizedTemplateColumn>
					    <cmn:GlobalizedTemplateColumn HeaderTextKey="TXT_DROP" ItemStyle-VerticalAlign="Top" ItemStyle-HorizontalAlign="Center">
						    <ItemTemplate>
							    <asp:CheckBox ID="cbDropW" Runat="server" Visible='<%#DataBinder.Eval(Container.DataItem, "CanDropCourse","{0}") == "Y" %>' CssClass="WaitlistCheckBox" />
						    </ItemTemplate>
					    </cmn:GlobalizedTemplateColumn>
					    <cmn:GlobalizedTemplateColumn HeaderTextKey="TXT_CODE" ItemStyle-VerticalAlign="Top" ItemStyle-Wrap="False">
						    <ItemTemplate>
														    <cmn:GlobalizedLinkButton ID="Globalizedlinkbutton1" CommandArgument='<%# DataBinder.Eval( Container.DataItem, "ERPCourseKey" )%>' OnCommand="Course_Click" Runat="server">
								    <%# DataBinder.Eval( Container.DataItem, "DisplayedCourseCode" ).ToString() %>
							    </cmn:GlobalizedLinkButton>
						    </ItemTemplate>
					    </cmn:GlobalizedTemplateColumn>
					    <cmn:GlobalizedBoundColumn DataField="Title" HeaderTextKey="TXT_CS_TITLE" ItemStyle-VerticalAlign="Top" ItemStyle-Wrap="False" />
					    <cmn:GlobalizedTemplateColumn HeaderTextKey="TXT_SCHEDULE" ItemStyle-VerticalAlign="Top" ItemStyle-Wrap="False">
						    <ItemTemplate>
							    <ul>
								    <asp:Repeater ID="rptScheduleW" DataSource='<%#DataBinder.Eval(Container.DataItem, "Schedules")%>' Runat="server">
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
								    <asp:Repeater ID="Repeater2" DataSource='<%#DataBinder.Eval(Container.DataItem, "Schedules")%>' Runat="server">
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
					    <cmn:GlobalizedBoundColumn DataField="CreditTypeDesc" HeaderTextKey="TXT_CS_CREDIT_TYPE" ItemStyle-VerticalAlign="Top" />
					    <cmn:GlobalizedBoundColumn DataField="DivisionDesc" HeaderTextKey="TXT_CS_DIVISION" ItemStyle-VerticalAlign="Top" />
					    <asp:BoundColumn DataField="ERPCourseKey" Visible="False" />
				    </Columns>
				    <EmptyTableTemplate></EmptyTableTemplate>
			    </cmn:groupedgrid>
                <cmn:globalizedbutton id="gbtnLeaveWaitlist" runat="server" TextKey="TXT_CS_LEAVE_WAITLIST" Visible="False" CssClass="DropButton" Enabled="false"></cmn:globalizedbutton>
            </div>
			<!-- Advisor Approval --->
            <div class="CourseSchedulesSection">
			    <cmn:groupedgrid id="ggAdvApproval" width="100%" runat="server" Visible="False" CollapseSubItems="true" RenderTableHeaders="true"
				    DataKeyField="ERPStudentCourseKey">
				    <TableHeaderTemplate>
                        <asp:Label ID="lblAdvisorApprovalTableHeader" runat="server"><%= base._advApprovalText %></asp:Label>
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
							    <asp:CheckBox ID="cbDropA" Runat="server" Visible='<%#DataBinder.Eval(Container.DataItem, "CanDropCourse","{0}") == "Y" %>' CssClass="ApprovalCheckBox" />
						    </ItemTemplate>
					    </cmn:GlobalizedTemplateColumn>
					    <cmn:GlobalizedTemplateColumn HeaderTextKey="TXT_CODE" ItemStyle-VerticalAlign="Top" ItemStyle-Wrap="False">
						    <ItemTemplate>
														    <cmn:GlobalizedLinkButton ID="Globalizedlinkbutton2" CommandArgument='<%# DataBinder.Eval( Container.DataItem, "ERPCourseKey" )%>' OnCommand="Course_Click" Runat="server">
								    <%# DataBinder.Eval( Container.DataItem, "DisplayedCourseCode" ).ToString() %>
							    </cmn:GlobalizedLinkButton>
						    </ItemTemplate>
					    </cmn:GlobalizedTemplateColumn>
					    <cmn:GlobalizedBoundColumn DataField="Title" HeaderTextKey="TXT_CS_TITLE" ItemStyle-VerticalAlign="Top" ItemStyle-Wrap="False" />
					    <cmn:GlobalizedTemplateColumn HeaderTextKey="TXT_SCHEDULE" ItemStyle-VerticalAlign="Top" ItemStyle-Wrap="False">
						    <ItemTemplate>
							    <ul>
								    <asp:Repeater ID="rptScheduleA" DataSource='<%#DataBinder.Eval(Container.DataItem, "Schedules")%>' Runat="server">
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
								    <asp:Repeater ID="Repeater1" DataSource='<%#DataBinder.Eval(Container.DataItem, "Schedules")%>' Runat="server">
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
							    <asp:TextBox ID="tbCreditHoursA" Runat="server" MaxLength="5" Visible="false" Width="40px" Text='<%#DataBinder.Eval(Container.DataItem, "CreditHours")%>' />
							    <asp:Literal ID="litCreditHoursA" Runat="server" Visible="true" Text='<%#DataBinder.Eval(Container.DataItem, "CreditHours")%>'>
							    </asp:Literal>
						    </ItemTemplate>
					    </cmn:GlobalizedTemplateColumn>
					    <cmn:GlobalizedBoundColumn DataField="CreditTypeDesc" HeaderTextKey="TXT_CS_CREDIT_TYPE" ItemStyle-VerticalAlign="Top" />
					    <cmn:GlobalizedBoundColumn DataField="DivisionDesc" HeaderTextKey="TXT_CS_DIVISION" ItemStyle-VerticalAlign="Top" />
					    <asp:BoundColumn DataField="ERPCourseKey" Visible="False" />
				    </Columns>
				    <EmptyTableTemplate></EmptyTableTemplate>
			    </cmn:groupedgrid>
                <div>
			        <div id="divAdvisorEmailDiv" class="FloatRight" runat="server">
			            <asp:HyperLink ID="hlnkEmailAdvisor" Runat="server" Visible="False">
							<asp:Image ID="imgEmail" runat="server" ImageUrl="~/UI/Common/Images/PortletImages/Icons/email.gif" />&nbsp;<%=Globalizer.GetString("TXT_CS_SEND_APPROVAL_REQUEST") %>
						</asp:HyperLink>
                        <cmn:GlobalizedLinkButtonWithIcon ID="lbwiEmailAdvisor" runat="server" TextKey="TXT_CS_SEND_APPROVAL_REQUEST"
                            IconSrc="./UI/Common/Images/PortletImages/Icons/email.gif" Visible=false></cmn:GlobalizedLinkButtonWithIcon>
                        <div runat="server" id="divEmailAdvisor">
                            <table width="250px" cellspacing="0">
                                <tr style="background-color: #e2e2e2">
                                    <td>
                                        <b>
                                            <cmn:GlobalizedLiteral ID="glitSelectAdvisor" runat="server" TextKey="TXT_CS_SELECT_ADVISORS"></cmn:GlobalizedLiteral></b>
                                    </td>
                                    <td align="right">
                                        <asp:Image ID="imgCancel" onclick="hideForm();" runat="server" class="hand" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" colspan="2">
                                        <cmn:GlobalizedLiteral ID="GlobalizedLiteral5" runat="server" TextKey="TXT_CS_ADVISOR_TEXT"></cmn:GlobalizedLiteral>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:CheckBoxList ID="cblAdvisors" runat="server">
                                        </asp:CheckBoxList>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        &nbsp;&nbsp;<asp:Button ID="btnSelectAdvisorSend" runat="server" Text="Send Email" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div>
                        <cmn:globalizedbutton id="gbtnLeaveAdvisor" runat="server" TextKey="TXT_CS_DROP_SELECTED_COURSES" Visible="False" CssClass="DropButton" Enabled="false"></cmn:globalizedbutton><cmn:globalizedbutton id="gbtnAdvApproval" TextKey="TXT_ADVISOR_APPROVAL" Runat="server" Visible="False"></cmn:globalizedbutton>
                        &#160;<cmn:globalizedbutton id="gbtnRequestApproval" runat="server" TextKey="TXT_CS_REQUEST_APPROVAL" Visible="False" CssClass="btn-primary"></cmn:globalizedbutton>
                    </div>
			    </div>
                <span class="clearfix"></span>
			</div>
			<!-- Must Pay --->
            <div class="CourseSchedulesSection">
		        <cmn:groupedgrid id="ggMustPay" width="100%" runat="server" Visible="False" CollapseSubItems="true" RenderTableHeaders="true"
			        DataKeyField="ERPStudentCourseKey">
			        <TableHeaderTemplate>
				        <cmn:GlobalizedLiteral id="glitMustPaySubHeader" runat="server" TextKey="TXT_CS_COURSES_REQUIRING_PAYMENT"></cmn:GlobalizedLiteral>
			        </TableHeaderTemplate>
			        <Columns>
				        <cmn:GlobalizedTemplateColumn HeaderTextKey="TXT_DROP" ItemStyle-VerticalAlign="Top" ItemStyle-HorizontalAlign="Center">
					        <ItemTemplate>
						        <asp:CheckBox ID="cbDropP" Runat="server" Visible='<% # DataBinder.Eval(Container.DataItem, "CanDropCourse","{0}") == "Y" %>' CssClass="MustPayCheckBox" />
					        </ItemTemplate>
				        </cmn:GlobalizedTemplateColumn>
				        <cmn:GlobalizedBoundColumn DataField="DisplayedCourseCode" HeaderTextKey="TXT_COURSE" ItemStyle-VerticalAlign="Top"
					        ItemStyle-Wrap="False" />
				        <cmn:GlobalizedBoundColumn DataField="Title" HeaderTextKey="TXT_CS_TITLE" ItemStyle-VerticalAlign="Top" ItemStyle-Wrap="False" />
				        <cmn:GlobalizedTemplateColumn HeaderTextKey="TXT_SCHEDULE" ItemStyle-VerticalAlign="Top" ItemStyle-Wrap="False">
					        <ItemTemplate>
						        <ul>
							        <asp:Repeater ID="rptScheduleP" DataSource='<%#DataBinder.Eval(Container.DataItem, "Schedules")%>' Runat="server">
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
				        <cmn:GlobalizedBoundColumn DataField="CreditTypeDesc" HeaderTextKey="TXT_CS_CREDIT_TYPE" ItemStyle-VerticalAlign="Top" />
				        <cmn:GlobalizedBoundColumn DataField="DivisionDesc" HeaderTextKey="TXT_CS_DIVISION" ItemStyle-VerticalAlign="Top" />
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
		        <cmn:globalizedbutton id="gbtnLeaveMustPay" runat="server" TextKey="TXT_CS_LEAVE_MUST_PAY" Visible="False" CssClass="DropButton" Enabled="false"></cmn:globalizedbutton><cmn:globalizedbutton id="gbtnPayMustPay" runat="server" TextKey="TXT_CS_PAY_MUST_PAY_COURSES" Visible="false"></cmn:globalizedbutton></div>
            </div>			
	    </div>
	<table cellSpacing="2" cellPadding="2" width="100%">
		<tr>
			<td colSpan="4"><cmn:globalizedlinkbutton id="glnkMyAccountInfo" runat="server" TextKey="TXT_ACCOUNT_INFO_MY_ACCOUNT_INFO"></cmn:globalizedlinkbutton></td>
		</tr>
	</table>
	<script language=javascript>
	


actb(document.getElementById('<%= this.tbCourse1.ClientID %>'),customarray);
actb(document.getElementById('<%= this.tbCourse2.ClientID %>'),customarray);
actb(document.getElementById('<%= this.tbCourse3.ClientID %>'),customarray);
actb(document.getElementById('<%= this.tbCourse4.ClientID %>'),customarray);
actb(document.getElementById('<%= this.tbCourse5.ClientID %>'),customarray);
actb(document.getElementById('<%= this.tbCourse6.ClientID %>'),customarray);
	</script>
</div>

   <div id="divShowForRegAgreement" runat="server" visible="false">
       <table width="95%">
        <div id="divPersonalInfo" visible="True" runat="server">
            <tr>
                <td colspan="3">
                    <h5><cmn:GlobalizedLiteral ID="glitAddDropSettings" runat="server" /></h5>
                </td>
            </tr>
            <tr>
                <td width="4%">
                    &nbsp;
                </td>
                <td colspan="2">
                    <cmn:Hint ID="hntPersonalInfoHint" runat="server" />
                </td>
            </tr>
            <tr>
                <td width="4%">
                    &nbsp;
                </td>

                <td colspan="2">
                    <asp:LinkButton runat="server" ID="lbPersonalInfoUpdate" /><asp:Literal ID="litPersNoBut" runat="server" Visible="false" />
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    &nbsp;
                </td>
            </tr>
        </div>
        <div id="divRegistrationAgreement" visible="True" runat="server">
            <tr>
                <td colspan="3">
                    <h5><cmn:GlobalizedLiteral ID="glitRegistrationAgreement" runat="server" /></h5>
                </td>
            </tr>
            <tr>
                <td width="4%">
                    &nbsp;
                </td>
                <td colspan="2">
                    <cmn:Hint ID="hntRegistrationAgreementHint" runat="server" />
                </td>
            </tr>
            <tr>
                <td width="4%">
                    &nbsp;
                </td>
                <td colspan="2">
                    <asp:LinkButton ID="lbRegistrationAgreement" runat="server" /><asp:Literal ID="litRegNoBut" runat="server" Visible="false" />
                </td>
            </tr>
        </div>
    </table>    </div>
</div>
