<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EvaluationStudentList.ascx.cs" Inherits="Jenzabar.LMS.Portlets.GradebookPortlet.Views.Controls.EvaluationStudentList" %>
<%@ Register TagPrefix="common" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="common" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls.TemplateFields" %>
<%@ Register TagPrefix="lms" TagName="GradeInput" Src="../../../Common/Controls/GradeInput.ascx" %>

<common:StyledGridView ID="StudentGrid" runat="server">
<Columns>
	<common:StyledTemplateField ColumnCssClass="studentColumn">
		<HeaderTemplate><common:GlobalizedLabel TextKey="HDR_STUDENT" runat="server" /></HeaderTemplate>
		<ItemTemplate>
			<asp:HyperLink ID="StudentNameDisplay" CssClass="studentName" runat="server" />
		</ItemTemplate>
	</common:StyledTemplateField>
	<common:StyledTemplateField ColumnCssClass="attendanceColumn">
		<HeaderTemplate><common:GlobalizedLabel TextKey="HDR_ATTENDANCE" runat="server" /></HeaderTemplate>
		<ItemTemplate>
			<asp:Label ID="AttendanceDisplay" CssClass="attendanceDisplay" runat="server" />
		</ItemTemplate>
	</common:StyledTemplateField>
	<common:StyledTemplateField ColumnCssClass="gradeColumn">
		<HeaderTemplate><common:GlobalizedLabel TextKey="HDR_GRADE" runat="server" /></HeaderTemplate>
		<ItemTemplate>
			<asp:Label ID="GradeDisplay" CssClass="gradeDisplay" runat="server" />
			<lms:GradeInput ID="GradeInput" CssClass="gradeInput" runat="server" />
		</ItemTemplate>
	</common:StyledTemplateField>
</Columns>
</common:StyledGridView>
