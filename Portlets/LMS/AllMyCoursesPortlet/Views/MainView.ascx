<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MainView.ascx.cs" Inherits="Jenzabar.LMS.Portlets.AllMyCoursesPortlet.Views.MainView" %>
<%@ Register TagPrefix="ams" TagName="CalendarSchedule" Src="Controls/CalendarSchedule.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>
<script type="text/javascript" language="javascript" src="../scripts/AllMyCoursesScript.js"></script>
<style>
.trHighlight
{
	background-color:#c4df9b;
}
</style>
<div class="pSection">    
    <p id="pNav" runat="server">
	    <asp:label id="lblShow" runat="server" />&nbsp;
		<asp:dropdownlist id="ddShowMenu" runat="server" AutoPostBack="True" /> &nbsp;
		<span id="sShowHideLinks" runat="server"><span id="sHideScheds"><a href="javascript:hideAllScheds();">Hide all schedules</a></span>
		<span id="sShowScheds" style="display:none;"><a href="javascript:showAllScheds();">Show all schedules</a></span> &nbsp;
		<span id="sHideCourseLists"><a href="javascript:hideAllCourseLists();">Hide all course lists</a></span>
		<span id="sShowCourseLists" style="display:none;"><a href="javascript:showAllCourseLists();">Show all course lists</a></span></span>
		<asp:LinkButton ID="lbViewSched" runat="server" />
    </p>    
    <asp:Repeater ID="rptrCourses" EnableViewState="false" runat="server">
        <HeaderTemplate>
	        <table border="0" id="tblCoursesSched" width="100%">
	    </HeaderTemplate>
        <ItemTemplate>
            <tr class="header" id="rptrHeader">
                <td colspan="4"><span class="left"><b><asp:Literal ID="litGroup" runat="server" /></b></span><span class="right"><span class="sepBefore"><img id="imgCollapseAll" runat="server" src="~/ui/common/images/collapse.gif" alt="Hide" class="gridTog" HideText="Hide" ShowText="Show" /></span></span></td>
            </tr>
            <tr class="subheader" id="rptrSubHeader">
                <td colspan="4"><span class="left"><asp:Literal ID="litCourseList" runat="server" /></span><span class="right"><span class="sepBefore"><img id="imgCollapseCourse" runat="server" src="~/ui/common/images/collapse.gif" alt="Hide" class="gridTog" HideText="Hide" ShowText="Show" /></span></span></td>
            </tr>
            <asp:Repeater ID="rptrItems" runat="server">
	            <HeaderTemplate>
	                <tr class="subheader" id="trCourseHeader" runat="server">
	                    <td>Code</td>
	                    <td>Course name</td>
	                    <td>Grade</td>
	                    <td>Schedule</td>
	                </tr>	                    
	            </HeaderTemplate>
	            <ItemTemplate>
	                <tr id="trItems" runat="server">
	                    <td><asp:HyperLink ID="hlCourseCode" runat="server" /></td>
	                    <td><asp:Literal id="litCourseTitle" runat="server" /></td>
	                    <td><asp:HyperLink ID="hlGrade" runat="server" /><asp:Literal ID="litNoGradeBook" runat="server" /></td>
	                    <td><asp:Literal ID="litSchedDays" Runat="server" /></td>
	                </tr>
	            </ItemTemplate>
                <FooterTemplate>
                    <tr class="subheader" id="gfootEndCourseList" runat="server">
                        <td colspan="4"><span class="left"><asp:Literal ID="litSchedTitle" runat="server" /></span><span class="right"><span class="sepBefore"><img id="imgCollapseSched" runat="server" src="~/ui/common/images/collapse.gif" alt="Hide" class="gridTog" HideText="Hide" ShowText="Show" /></span></span></td>
                    </tr>
                    <tr id="trCal" runat="server">
                        <td colspan="4">
                            <ams:CalendarSchedule id="_ctlCalendarSchedule" runat="server" />
                        </td>
                    </tr>
                </FooterTemplate>
            </asp:Repeater>
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>        
</div>