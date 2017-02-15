<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="crm" namespace="Jenzabar.CRM.Utility" assembly="CRM" %>
<%@ Import namespace="Jenzabar.CRM.Faculty.Web.Portlets.CourseAuthorizationPortlet" %>
<%@ Control Language="c#" AutoEventWireup="True" Codebehind="AdvancedSearchResults.ascx.cs" Inherits="Jenzabar.CRM.Faculty.Web.Portlets.CourseAuthorizationPortlet.AdvancedSearchResults" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<div class="pView" xmlns:common="http://schemas.jenzabar.com/JICS/CommonControls">

<div class="pSection">
<common:Hint ID="AdvancedSearchHint" TextKey="MSG_COURSEAUTHORIZATION_AVANCEDSEARCH_HINT" Runat="server" />
</div>

<common:GroupedGrid ID="SearchResultsGrid" RenderGroupHeaders="True" runat="server">
	<TableHeaderTemplate>
<common:GlobalizedLabel ID="AdvancedSearchHeader" TextKey="TXT_STUDENT_SEARCH_RESULTS" runat="server" /></TableHeaderTemplate>
	<Columns>
		<asp:TemplateColumn visible="false">
			<ItemTemplate>
				<div id="StudentID" runat="server"><%# CourseAuthorizationPortlet.GetXmlValue((System.Xml.XmlElement)Container.DataItem, "StudentID") %></div>
				<div id="StudentName" runat="server"><%# CourseAuthorizationPortlet.GetXmlValue((System.Xml.XmlElement)Container.DataItem, "StudentName") %></div>
			</ItemTemplate>
		</asp:TemplateColumn>
		<asp:TemplateColumn>
			<ItemTemplate>
				<common:GlobalizedButton ID="SelectButton" CommandName="Select" TextKey="TXT_SELECT" Runat="server" />
			</ItemTemplate>
		</asp:TemplateColumn>
		<crm:XmlBoundColumn HeaderText="Student" DataXmlField="StudentName" />
		<crm:XmlBoundColumn HeaderText="ID" DataXmlField="StudentID" />
		<crm:XmlBoundColumn HeaderText="Major" DataXmlField="MajorDesc" />
		<crm:XmlBoundColumn HeaderText="Classification" DataXmlField="ClassificationDesc" />
		<crm:XmlBoundColumn HeaderText="Current Division" DataXmlField="CurrentDivisionDesc" />
		<crm:XmlBoundColumn HeaderText="Campus" DataXmlField="StudentCampusDesc" />
	</Columns>
</common:GroupedGrid>

<div style="PADDING-RIGHT:10px; PADDING-LEFT:10px; PADDING-BOTTOM:10px; PADDING-TOP:10px; TEXT-ALIGN:center">
	<common:GlobalizedButton ID="CancelButton" TextKey="TXT_CANCEL" Runat="server" />
</div>

</div>
