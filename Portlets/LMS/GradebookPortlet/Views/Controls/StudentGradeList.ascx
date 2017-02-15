<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="StudentGradeList.ascx.cs" Inherits="Jenzabar.LMS.Portlets.GradebookPortlet.Views.Controls.StudentGradeList" %>
<%@ Register TagPrefix="common" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="common" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls.TemplateFields" %>

<common:Subheader ID="Header" runat="server" />

<common:StyledGridView ID="GradeGrid" runat="server">
	<Columns>
		<common:StyledTemplateField ColumnCssClass="studentNameColumn">
			<HeaderTemplate><common:GlobalizedLabel TextKey="HDR_STUDENT" runat="server" /></HeaderTemplate>
			<ItemTemplate>
				<asp:HyperLink ID="StudentName" runat="server" />
                <asp:Image ID="_imgFeedBack" runat="server" Visible="false" />
			</ItemTemplate>
		</common:StyledTemplateField>
		<common:StyledTemplateField ColumnCssClass="gradeColumn">
			<HeaderTemplate><common:GlobalizedLabel TextKey="HDR_FINAL_GRADE" runat="server" /></HeaderTemplate>
			<ItemTemplate>
				<common:ToggleTextBox ID="FinalGrade" Columns="4" runat="server" />
			</ItemTemplate>
		</common:StyledTemplateField>
	</Columns>
</common:StyledGridView>

<div id="ButtonBar" class="buttonBar" visible="false" runat="server">
    <common:GlobalizedButton id="SaveGradesButton" runat="server" TextKey="TXT_SAVE_GRADES" />
    <common:GlobalizedButton id="CancelButton" runat="server" TextKey="TXT_CANCEL" />
</div>
