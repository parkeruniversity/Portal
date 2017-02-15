<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Default_View.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseSearchPortlet.Default_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="cmn" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<asp:ValidationSummary ID="vldSummary" Runat="server"/>
<div class="pSection">
<cmn:hint id="h1" runat="server" textkey="MSG_COURSE_SEARCH_HINT" />
<fieldset>
<table>
	<tr><th><cmn:FormLabel runat="server" textkey="LBL_COURSE_TITLE" forcontrol="txtTitle" /></th><td><asp:TextBox ID="txtTitle" runat="server" maxlength="50"/></td></tr>
	<tr><th><cmn:FormLabel runat="server" textkey="LBL_COURSE_CODE" forcontrol="txtCourseCode" /></th><td><asp:textbox id="txtCourseCode" runat="server" maxlength="20"/></td></tr>
	<tr><th><cmn:FormLabel runat="server" textkey="LBL_FACULTY_LAST_NAME" forcontrol="txtFaculty" /></th><td><asp:textbox id="txtFaculty" runat="server" maxlength="50"/></td></tr>
	<tr><th><cmn:FormLabel runat="server" textkey="LBL_COURSE_DESCRIPTION" forcontrol="txtDesc" /></th><td><asp:TextBox runat="server" ID="txtDesc" maxlength="50"/></td></tr>
	<tr><th><cmn:FormLabel runat="server" textkey="LBL_TERM" forcontrol="ddlTerm" /></th><td  align="right"><asp:DropDownList runat="server" ID="ddlTerm"/></td></tr>
	<tr><td  colspan="2" align="center"><cmn:GlobalizedCheckBox id="chbShowDesc" runat="server" textkey="TXT_SHOW_COURSE_DESCRIPTIONS"/></td></tr>	
	<tr><td colspan="2" align="center"><cmn:GlobalizedButton runat="server" ID="btnSubmit" TextKey="TXT_SEARCH" /></td></tr>
</table>
</fieldset>
</div>


