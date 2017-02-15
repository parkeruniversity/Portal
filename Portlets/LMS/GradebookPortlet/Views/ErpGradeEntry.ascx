<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ErpGradeEntry.ascx.cs" Inherits="Jenzabar.LMS.Portlets.GradebookPortlet.Views.ErpGradeEntry" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="framework" namespace="Jenzabar.Portal.Framework.Web.UI.Controls" assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="gbk" tagname="gradeEntryGrid" src="Controls/ErpGradeEntryGrid.ascx" %>
<link href="<%= this.ResolveUrl("../Style/LegacyGradebookStyle.css") %>" rel="stylesheet" type="text/css" />

<h4><common:GlobalizedLabel TextKey="HDR_SUBMIT_GRADES" runat="server" /></h4>
<div class="pSection">
	<table cellpadding="0" cellspacing="0">
		<tr>
			<td>
				<table cellspacing="0" cellpadding="0">
					<tr>
						<td><common:GlobalizedLiteral id="litNoStudents" runat="server" visible="false" TextKey="MSG_NO_COURSE_STUDENT_TO_DISPLAY" />
							<gbk:GradeEntryGrid id="ErpGradeEntryGrid" runat="server"></gbk:GradeEntryGrid>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</div>