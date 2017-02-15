<%@ Control Language="c#" AutoEventWireup="false" Codebehind="MainView.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CopyCoursePortlet.MainView" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Import Namespace="Jenzabar.Common.Globalization" %>
<%@ Register TagPrefix="copycourse" assembly="Jenzabar.LMS.Portlets" namespace="Jenzabar.LMS.Portlets.CopyCoursePortlet" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<!-- IE doesn't support table styling, so we need this code. --> <!--[if lt IE 8]>
<STYLE>.CopyCoursePortlet .ccCheckboxListCheck {
	FLOAT: left
}
.CopyCoursePortlet .ccCheckboxListText {
	FLOAT: left
}
.CopyCoursePortlet .ccWarningText {
	width: 500px;
}
</STYLE>
<![endif]-->
<div id="MainScreen" class="pSection" runat="server">
	<jenzabar:Hint ID="CopyCourseDescription" TextKey="MSG_COPYCOURSEPORTLET_MAIN_DESCRIPTION" runat="Server" />
	<h6><%=Globalizer.GetGlobalizedString("MSG_COPYCOURSEPORTLET_HEADER_STEP_1")%></h6>
	<ul class="ccSubContent">
		<li>
		
			<asp:DropDownList ID="FromInterval" AutoPostBack="True" Runat="server" />
			<jenzabar:GlobalizedLabel id=lblForFromInterval runat=server AssociatedControlID="FromInterval" class="accessibility" TextKey="TXT_SELECT_A_TERM" />
		<li>
		
			<asp:DropDownList ID="SourceCourse" AutoPostBack="True" Runat="server" /></li>
			<jenzabar:GlobalizedLabel id=lblForSourceCourse runat=server AssociatedControlID="SourceCourse" class="accessibility" TextKey="TXT_SELECT_A_COURSE" />
	</ul>
	<h6><%=Globalizer.GetGlobalizedString("MSG_COPYCOURSEPORTLET_HEADER_STEP_2")%></h6>
	<ul class="ccSubContent">
		<li>
			<jenzabar:GlobalizedLabel ID="DestinationCourseLabel" TextKey="MSG_COPYCOURSEPORTLET_FORMAT_DESTINATIONCOURSELABEL"
				CssClass="ccListBoxLabel" runat="server" />
		<li>
			<asp:ListBox ID="DestinationCourse" Rows="10" SelectionMode="Multiple" Runat="server" />
		<li>
			<jenzabar:GlobalizedLabel ID="TipText" TextKey="LBL_TIP" CssClass="ccTipLabel" Runat="Server" />
			<jenzabar:GlobalizedLabel ID="DestinationCourseTip" TextKey="MSG_COPYCOURSEPORTLET_DESTINATION_COURSE_TIP"
				CssClass="ccTipText" Runat="server" AssociatedControlID="DestinationCourse"  />
		</li>
	</ul>
	<h6><%=Globalizer.GetGlobalizedString("MSG_COPYCOURSEPORTLET_HEADER_STEP_3")%></h6>
	<div id="ConflictSidebar" class="ccSidebar" visible="false" runat="server">
		<jenzabar:ContentBox ID="ActionBox" TextKey="TXT_CONFLICTING_PAGE_NAMES" runat="server">
			<DIV class="pSection">
				<jenzabar:GlobalizedLiteral id="ConflictingNote" runat="server" TextKey="MSG_COPYCOURSEPORTLET_CONFLICTING_NOTE"></jenzabar:GlobalizedLiteral>
				<TABLE class="ccRadioButtonTable" cellSpacing="0" cellPadding="0" border="0">
					<TR>
						<TD vAlign="top">
							<asp:RadioButton id="MergeContents" Runat="server" Checked="True" GroupName="ContentsAction"></asp:RadioButton></TD>
						<TD class="labelColumn" vAlign="top">
							<jenzabar:FormLabel id="MergeText" runat="server" TextKey="MSG_COPYCOURSEPORTLET_MERGE_TEXT" ForControl="MergeContents"></jenzabar:FormLabel></TD>
					</TR>
					<TR>
						<TD vAlign="top">
							<asp:RadioButton id="OverwriteContents" Runat="server" GroupName="ContentsAction"></asp:RadioButton></TD>
						<TD class="labelColumn" vAlign="top">
							<jenzabar:FormLabel id="OverwriteText" runat="server" TextKey="MSG_COPYCOURSEPORTLET_OVERWRITE_TEXT"
								ForControl="OverwriteContents"></jenzabar:FormLabel></TD>
					</TR>
				</TABLE>
			</DIV>
		</jenzabar:ContentBox>
	</div>
	<div id="ForumThreadSidebar" class="ccSidebar" runat="server">
		<jenzabar:ContentBox ID="ForumThreadBox" TextKey="TXT_FORUMS" runat="server">
			<DIV class="pSection">
				<jenzabar:GlobalizedLiteral id="ForumThreadNote" runat="server" TextKey="MSG_COPYCOURSEPORTLET_FORUMTHREAD_NOTE"></jenzabar:GlobalizedLiteral>
				<TABLE class="ccRadioButtonTable" cellSpacing="0" cellPadding="0" border="0">
					<TR>
						<TD vAlign="top">
							<asp:RadioButton id="ForumThreadNone" Runat="server" GroupName="ForumThreadAction"></asp:RadioButton></TD>
						<TD class="labelColumn" vAlign="top">
							<jenzabar:FormLabel id="ForumThreadNoneText" runat="server" TextKey="MSG_COPYCOURSEPORTLET_FORUMTHREAD_NONE"
								ForControl="ForumThreadNone"></jenzabar:FormLabel></TD>
					</TR>
					<TR>
						<TD vAlign="top">
							<asp:RadioButton id="ForumThreadFaculty" Runat="server" GroupName="ForumThreadAction"></asp:RadioButton></TD>
						<TD class="labelColumn" vAlign="top">
							<jenzabar:FormLabel id="ForumThreadFacultyText" runat="server" TextKey="MSG_COPYCOURSEPORTLET_FORUMTHREAD_FACULTY"
								ForControl="ForumThreadFaculty"></jenzabar:FormLabel></TD>
					</TR>
					<TR>
						<TD vAlign="top">
							<asp:RadioButton id="ForumThreadAll" Runat="server" GroupName="ForumThreadAction"></asp:RadioButton></TD>
						<TD class="labelColumn" vAlign="top">
							<jenzabar:FormLabel id="ForumThreadAllText" runat="server" TextKey="MSG_COPYCOURSEPORTLET_FORUMTHREAD_ALL"
								ForControl="ForumThreadAll"></jenzabar:FormLabel></TD>
					</TR>
					<tr>
					    <td colspan="2" style="border-bottom:1px dashed #000;"></td>
					</tr>
					<tr>
					    <td valign="top">
					        <asp:CheckBox ID="_cbxForumPerms" runat="server" />
					    </td>
					    <td valign="top" class="labelColumn">
					        <jenzabar:FormLabel id="_lblForumPerms" runat="server" TextKey="MSG_COPYCOURSEPORTLET_FORUM_PERMISSIONS" ForControl="_cbxForumPerms" />
					    </td>
					</tr>
				</TABLE>
			</DIV>
		</jenzabar:ContentBox>
	</div>
	<ul class="ccSubContent ccAlternateLayout">
		<li>
			<jenzabar:GlobalizedRadioButton ID="CopyEverything" GroupName="CopyContent" TextKey="TXT_EVERYTHING" Checked="True"
				AutoPostBack="True" Runat="server" />
		<li>
			<jenzabar:GlobalizedRadioButton ID="CopySelectedContent" GroupName="CopyContent" TextKey="TXT_SELECTED_COURSE_CONTENT"
				AutoPostBack="True" Runat="server" /></li>
	</ul>
	<copycourse:SectionTreeRepeater ID="SectionContents" runat="server">
		<HeaderTemplate>
			<div class="ccSubContent">
		</HeaderTemplate>
		<FooterTemplate></div>
</FooterTemplate> </copycourse:SectionTreeRepeater>
<div class="ccSubContent ccWarning">
	<span class="ccWarningLabel">
		<%=Globalizer.GetGlobalizedString("LBL_NOTE").ToUpper()%>
	</span>
	<jenzabar:GlobalizedLabel ID="WarningText" TextKey="MSG_COPYCOURSEPORTLET_WARNING_NOTE" CssClass="ccWarningText"
		Runat="Server" />
</div>
<div class="ccSubContent ccButtons">
		<jenzabar:GlobalizedButton ID="GoButton" TextKey="TXT_COPY" runat="server" />
		<jenzabar:GlobalizedButton ID="CancelButton" TextKey="TXT_CANCEL" runat="server" />
</div>
<div style="CLEAR:both" />
<script>
	var _selectFromCtl;
	var _sourceCtl;
	var _destinationCtl;
	var _goButtonCtl;
	
	var childControls = new Array ();
	var childBoxes = new Array ();
	var parentBox = new Array ();
	
	var allCheckboxes = new Array (<%=SectionContents.CheckboxClientIDsForJS%>);
	
	function initializeCopyCoursePage ()
	{
<%=SectionContents.InitializationJSMethod%>
		
<%
    if ((MergeContents.Checked) && (SectionContents.InitializationJSMethod != ""))
    {%>
		toggleCourseworkGradebook(false);
<%
    }%>

		_selectFromCtl = document.getElementById('<%=FromInterval.ClientID%>');
		_sourceCtl = document.getElementById('<%=SourceCourse.ClientID%>');
		_destinationCtl = document.getElementById('<%=DestinationCourse.ClientID%>');
		_goButtonCtl = document.getElementById('<%=GoButton.ClientID%>');
		
<%
    if (!SourceCourse.AutoPostBack)
    {%>
		_sourceCtl.onchange = checkButtonValid;
<%
    }%>
		_destinationCtl.onchange = checkButtonValid;
		
		checkButtonValid();
	}
	
	function selectCheckbox (ctl)
	{
		//Handle parent.
		var parent = parentBox[ctl.id];
		if (parent)
		{
			if (ctl.checked)
			{
				var parentCtl = document.getElementById(parent);
				parentCtl.checked = true;
			}
		}
		
		//Handle children.
		var children = childBoxes[ctl.id];
		if (children)
		{
			for (i=0; i < children.length; i++)
			{
				var childCtl = document.getElementById(children[i]);
				childCtl.checked = ctl.checked;
			}
		}
	}
	
	function expandChildren (ctl)
	{
		var children = childControls[ctl.id];
		if (children)
		{
			for (i=0; i < children.length; i++)
			{
			    $('#' + children[i]).toggle();
			}
		}
	}
	
	function checkButtonValid ()
	{
		var isButtonDisabled = true;
		var destCount = 0;
		var sourceValue = _sourceCtl.options[_sourceCtl.selectedIndex].value;
		
		//Check all the potential destinations.
		for (i=0; i < _destinationCtl.options.length; i++)
		{
			if ( (_destinationCtl.options[i].selected) && (_destinationCtl.options[i].value != sourceValue) )
			{
				//At least one destination has been selected that is not the same as the source.
				isButtonDisabled = false;
				
				destCount++;
				if (destCount > <%=MaximumAllowedDestinations.ToString()%>)
				{
					_destinationCtl.options[i].selected = false;
				}
			}
		}
		
		if (destCount > <%=MaximumAllowedDestinations.ToString()%>)
		{
			alert ('<%=Globalizer.Format("MSG_COPYCOURSEPORTLET_FORMAT_MAXIMUMDESTALERT",
                                                MaximumAllowedDestinations.ToString())%>');
		}
		
		//Disable the submit button if no source is selected.
		if (sourceValue == "")
		{
			isButtonDisabled = true;
		}
		
		_goButtonCtl.disabled = isButtonDisabled;
	}
	
	function confirmSubmit ()
	{
		var isCopyEverything = document.getElementById('<%=CopyEverything.ClientID%>').checked;
		
		if (!isCopyEverything)
		{
			//First check to make sure at least one of the checkboxes has been selected.
			var isSomethingSelected = false;
			for (i=0; i < allCheckboxes.length; i++)
			{
				var checkbox = document.getElementById(allCheckboxes[i]);
				if ( (checkbox != null) && (checkbox.checked) )
				{
					isSomethingSelected = true;
					break;
				}
			}
			
			if (!isSomethingSelected)
			{
				alert('<%=Globalizer.GetJavascriptSafeString("MSG_COPYCOURSEPORTLET_NO_CONTENT_SELECTED")%>');
				return false;
			}
		}
		
		var confirmMsg;
		if (isCopyEverything)
		{
			confirmMsg = '<%=Globalizer.GetJavascriptSafeString("MSG_COPYCOURSEPORTLET_CONFIRM_COPY_EVERYTHING")%>';
		}
		else if (document.getElementById('<%=MergeContents.ClientID%>').checked)
		{
			confirmMsg = '<%=Globalizer.GetJavascriptSafeString("MSG_COPYCOURSEPORTLET_CONFIRM_COPY_SELECTED_MERGE")%>';
		}
		else
		{
			confirmMsg = '<%=Globalizer.GetJavascriptSafeString("MSG_COPYCOURSEPORTLET_CONFIRM_COPY_SELECTED_OVERWRITE")%>';
		}
		return confirm (confirmMsg);
	}
	
	<%=SectionContents.CwkGbkToggleJSMethod%>
	
</script> </DIV><!-- end of server-side pSection div -->
<div id="ErrorScreen" visible="false" runat="server">
	<div class="pSection ccButtons">
		<jenzabar:GlobalizedLinkButton ID="ExitButton" TextKey="MSG_COPYCOURSEPORTLET_EXIT_TOOL_BUTTON" runat="server" />
	</div>
</div>
