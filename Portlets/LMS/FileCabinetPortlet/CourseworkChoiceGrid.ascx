<%@ Control Language="c#" AutoEventWireup="false" Codebehind="CourseworkChoiceGrid.ascx.cs" Inherits="Jenzabar.LMS.Portlets.FileCabinetPortlet.CourseworkChoiceGrid" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>

<%@ Register TagPrefix="cwk" TagName="QuestionDisplay" Src="../CourseworkPortlet/Views/Controls/QuestionDisplay/QuestionDisplay.ascx" %>

<link rel="Stylesheet" type="text/css" href="Portlets/LMS/CourseworkPortlet/Style/CourseworkPortletStyle.aspx" />

<div id="QuestionLabel" runat="server" style="font-weight:bold;"></div>

<cwk:QuestionDisplay id="qd" runat="server" ></cwk:QuestionDisplay>

<div>
    <asp:GridView runat="server" id="ggMain" Visible="false" CssClass="assignmentGrid itemHover" AlternatingRowStyle-CssClass="altAssignmentGrid" HeaderStyle-CssClass="headerAssignmentGrid"  CellPadding="0" CellSpacing="0" AutoGenerateColumns="False" ></asp:GridView>
</div>