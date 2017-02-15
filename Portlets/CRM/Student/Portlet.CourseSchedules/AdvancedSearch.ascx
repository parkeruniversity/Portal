<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="AdvancedSearch.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.CourseSchedulesPortlet.AdvancedSearch" %>

<div class="pSection"><jenzabar:errordisplay id="errDisplay" Runat="server"></jenzabar:errordisplay>
	<h4><jenzabar:globalizedliteral id="glitSearch" runat="server" TextKey="TXT_EX_LNKS_CRS_SRCH"></jenzabar:globalizedliteral></h4>
	<table cellSpacing="2" cellPadding="2" width="100%" border="0">
		<tr>
			<td noWrap align="right" width="5%"><jenzabar:globalizedlabel id="lblTerm" Runat="server" TextKey="TXT_TERM" AssociatedControlID="ddlTerm"></jenzabar:globalizedlabel>:</td>
			<td align="left" colspan="3"><asp:dropdownlist id="ddlTerm" Runat="server" AutoPostBack=true DataTextField="Description" DataValueField="Key"></asp:dropdownlist></td>
		</tr>
		<tr>
			<td noWrap align="right" width="5%"><jenzabar:globalizedlabel id="lblDept" Runat="server" TextKey="TXT_DEPARTMENT" AssociatedControlID="ddlDept"></jenzabar:globalizedlabel>:</td>
			<td align="left" width="45%"><asp:dropdownlist id="ddlDept" Runat="server" DataTextField="Description" DataValueField="Code"></asp:dropdownlist></td>
		</tr>
		<tr>
			<td><jenzabar:globalizedlabel id="lblCourseRange" Runat="server" TextKey="TXT_CS_COURSE_NUMBER_RANGE" AssociatedControlID="ddlCourseFrom"></jenzabar:globalizedlabel>:</td>
			<td noWrap><asp:dropdownlist id="ddlCourseFrom" Runat="server"></asp:dropdownlist>&nbsp;<asp:Label AssociatedControlID="ddlCourseTo" Runat=server>to</asp:Label>&nbsp;<asp:dropdownlist id="ddlCourseTo" Runat="server"></asp:dropdownlist></td>
		</tr>
		<tr>
			<td noWrap align="right"><jenzabar:globalizedlabel id="lblTitle" Runat="server" TextKey="TXT_TITLE" AssociatedControlID="ddlTitleRestrictor"></jenzabar:globalizedlabel>:</td>
			<td noWrap align="left" colSpan="3"><asp:dropdownlist id="ddlTitleRestrictor" Runat="server"></asp:dropdownlist><asp:Label  AssociatedControlID="txtTitleRestrictor" Runat=server CssClass="accessibility">Restrict title to</asp:Label><asp:textbox id="txtTitleRestrictor" Runat="server" Columns="40"></asp:textbox></td>
		</tr>
		<tr>
			<td noWrap align="right"><jenzabar:globalizedlabel id="lblCourse" Runat="server" TextKey="LBL_COURSE_CODE" AssociatedControlID="ddlCourseRestrictor"></jenzabar:globalizedlabel></td>
			<td noWrap align="left" colspan="3"><asp:dropdownlist id="ddlCourseRestrictor" Runat="server"></asp:dropdownlist><asp:Label  AssociatedControlID="txtCourseRestrictor" Runat=server CssClass="accessibility" ID="Label1" NAME="Label1">Restrict course to</asp:Label><asp:textbox id="txtCourseRestrictor" Runat="server" Columns="20"></asp:textbox></td>
		</tr>
		<tr>
			<td noWrap align="right"><jenzabar:globalizedlabel id="lblDivision" Runat="server" AssociatedControlID="ddlDivision"></jenzabar:globalizedlabel></td>
			<td align="left" colspan="3"><asp:dropdownlist id="ddlDivision" Runat="server" DataTextField="Description" DataValueField="Code"></asp:dropdownlist></td>
		</tr>
		<tr>
			<td noWrap align="right"><jenzabar:globalizedlabel id="lblMethod" TextKey="LBL_METHOD" Runat="server" AssociatedControlID="ddlMethod"></jenzabar:globalizedlabel></td>
			<td noWrap colspan="3"><asp:dropdownlist id="ddlMethod" Runat="server"></asp:dropdownlist></td>
		</tr>
		<tr>
			<td noWrap align="right"><jenzabar:globalizedlabel id="lblReference" Runat="server" TextKey="LBL_CS_REFERENCE#"  AssociatedControlID="txtRefRestrictor"></jenzabar:globalizedlabel></td>
			<td noWrap align="left"><!--<asp:dropdownlist id="ddlRefRestrictor" Runat="server"></asp:dropdownlist>--><asp:textbox id="txtRefRestrictor" Runat="server" Columns="15"></asp:textbox></td>

		</tr>
		<tr>
			<td>&nbsp;</td>
			<td colspan="3"><jenzabar:globalizedlinkbuttonwithicon id="lnkMoreOptions" TextKey="TXT_ADVANCED_SEARCH" runat="server" visible=false></jenzabar:globalizedlinkbuttonwithicon></td>
		</tr>
		<div id="dAdvSearch" runat="server">
		<tr>
			<td noWrap align="right"><jenzabar:globalizedlabel id="lblTimeFrom" Runat="server" TextKey="TXT_TIME"  AssociatedControlID="ddlTimeFrom"></jenzabar:globalizedlabel>:</td>
			<td noWrap align="left" colspan="3"><asp:dropdownlist id="ddlTimeFrom" Runat="server"></asp:dropdownlist><jenzabar:globalizedlabel id="lblTimeTo" Runat="server" TextKey="TXT_TO"  AssociatedControlID="ddlTimeTo"></jenzabar:globalizedlabel>:<asp:dropdownlist id="ddlTimeTo" Runat="server"></asp:dropdownlist></td>
		</tr>
		<tr>
			<td noWrap align="right">&nbsp;</td>
			<td vAlign="top">
				<table cellSpacing="1" cellPadding="1" width="100%" border="0">
					<tr>
						<td colspan="2"><jenzabar:GlobalizedRadioButton ID="rdAnyDay" Checked="true" TextKey="TXT_CS_MEETS_ANY_DAY" Runat="server" GroupName="days"></jenzabar:GlobalizedRadioButton></td>
					</tr>
					<tr>
						<td colspan="2"><jenzabar:GlobalizedRadioButton ID="rdSelectedDays" TextKey="TXT_CS_MEETS_ON_SELECTED_DAYS" Runat="server" GroupName="days"></jenzabar:GlobalizedRadioButton></td>
					</tr>
					<tr>
						<td width="35%">&nbsp;&nbsp;&nbsp;<jenzabar:globalizedcheckbox id="chkMon" Runat="server" TextKey="TXT_MONDAY" Checked="true" onClick="setSelectedDayOption();"></jenzabar:globalizedcheckbox></td>
						<td width="65%"><jenzabar:globalizedcheckbox id="chkFri" Runat="server" TextKey="TXT_FRIDAY" Checked="true" onClick="setSelectedDayOption();"></jenzabar:globalizedcheckbox></td>
					</tr>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;<jenzabar:globalizedcheckbox id="chkTue" Runat="server" TextKey="TXT_TUESDAY" Checked="true" onClick="setSelectedDayOption();"></jenzabar:globalizedcheckbox></td>
						<td><jenzabar:globalizedcheckbox id="chkSat" Runat="server" TextKey="TXT_SATURDAY" Checked="true" onClick="setSelectedDayOption();"></jenzabar:globalizedcheckbox></td>
					</tr>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;<jenzabar:globalizedcheckbox id="chkWed" Runat="server" TextKey="TXT_WEDNESDAY" Checked="true" onClick="setSelectedDayOption();"></jenzabar:globalizedcheckbox></td>
						<td><jenzabar:globalizedcheckbox id="chkSun" Runat="server" TextKey="TXT_SUNDAY" Checked="true" onClick="setSelectedDayOption();"></jenzabar:globalizedcheckbox></td>
					</tr>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;<jenzabar:globalizedcheckbox id="chkThu" Runat="server" TextKey="TXT_THURSDAY" Checked="true" onClick="setSelectedDayOption();"></jenzabar:globalizedcheckbox></td>
						<td></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td noWrap align="right"><jenzabar:globalizedlabel id="lblFaculty" Runat="server" TextKey="TXT_FACULTY" AssociatedControlID="ddlFaculty"></jenzabar:globalizedlabel>:</td>
			<td align="left" colspan="3"><asp:dropdownlist id="ddlFaculty" Runat="server" DataTextField="Description" DataValueField="Code"></asp:dropdownlist></td>
		</tr>
		<tr>
			<td noWrap align="right" width="5%"><jenzabar:globalizedlabel id="lblCampus" Runat="server" TextKey="TXT_CAMPUS" AssociatedControlID="ddlCampus"></jenzabar:globalizedlabel>:</td>
			<td align="left" width="45%"><asp:dropdownlist id="ddlCampus" Runat="server" DataTextField="Description" DataValueField="ERPCampusKey"></asp:dropdownlist></td>
		</tr>
		<tr>
			<td noWrap align="right" width="5%"><jenzabar:globalizedlabel id="lblBuilding" Runat="server" TextKey="TXT_BUILDING" AssociatedControlID="ddlBuilding"></jenzabar:globalizedlabel>:</td>
			<td align="left"><asp:dropdownlist id="ddlBuilding" Runat="server" DataTextField="Description" DataValueField="ERPCampusKey"></asp:dropdownlist></td>
		</tr>
		<tr>
			<td noWrap align="right"><jenzabar:globalizedlabel id="lblSecStatus" Runat="server" TextKey="TXT_CS_SECTION_STATUS" AssociatedControlID="ddlSecStatus"></jenzabar:globalizedlabel>:</td>
			<td align="left" colspan="3"><asp:dropdownlist id="ddlSecStatus" Runat="server" DataTextField="Description" DataValueField="Code"></asp:dropdownlist></td>
		</tr>

		<tr>
			<td noWrap align="right"><jenzabar:globalizedlabel id="lblMinMax" Runat="server" TextKey="TXT_CS_MIN_MAX_HOURS" AssociatedControlID="txtMin"></jenzabar:globalizedlabel>:</td>
			<td noWrap><asp:textbox id="txtMin" Runat="server" Columns="5" MaxLength="6"></asp:textbox>&nbsp;<asp:Label runat=server AssociatedControlID="txtMax" >to</asp:Label>&nbsp;<asp:textbox id="txtMax" Runat="server" Columns="5" MaxLength="6"></asp:textbox></td>
		</tr>
		</div>
		<tr>
			<td></td>
			<td colSpan="2">
				<input type=hidden Runat="server" id="hiddenCache" value="false" NAME="hiddenCache"/>
				<jenzabar:GlobalizedButton id="btnSearch" TextKey="TXT_SEARCH" Runat="server"></jenzabar:GlobalizedButton>
				<jenzabar:GlobalizedButton id="btnReset" CommandArgument="some" TextKey="TXT_RESET" Runat="server"></jenzabar:GlobalizedButton>
			</td>
		</tr>
	</table>
</div>
<script language="javascript">
	function resetOnclick(){
		if (event.ctrlKey && event.shiftKey){
			document.MAINFORM.<%=this.hiddenCache.ClientID%>.value = "true"
		}
	}
	function setAnyDayOption()
	{
		document.MAINFORM.<%=this.chkFri.ClientID%>.checked = false;
		document.MAINFORM.<%=this.chkSat.ClientID%>.checked = false;
		document.MAINFORM.<%=this.chkSun.ClientID%>.checked = false;
		document.MAINFORM.<%=this.chkMon.ClientID%>.checked = false;
		document.MAINFORM.<%=this.chkTue.ClientID%>.checked = false;
		document.MAINFORM.<%=this.chkWed.ClientID%>.checked = false;
		document.MAINFORM.<%=this.chkThu.ClientID%>.checked = false;
	}
	
	function setSelectedDayOption()
	{
		document.MAINFORM.<%=this.rdSelectedDays.ClientID%>.checked = true;
	}
	
</script>
