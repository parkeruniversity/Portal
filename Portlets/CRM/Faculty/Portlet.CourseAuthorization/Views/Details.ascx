<%@ Control Language="c#" AutoEventWireup="True" Codebehind="Details.ascx.cs" Inherits="Jenzabar.CRM.Faculty.Web.Portlets.CourseAuthorizationPortlet.Details" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Import namespace="Jenzabar.CRM.Faculty.Web.Portlets.CourseAuthorizationPortlet" %>
<%@ Register TagPrefix="crm" namespace="Jenzabar.CRM.Utility" assembly="CRM" %>
<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<div class="pView" xmlns:common="http://schemas.jenzabar.com/JICS/CommonControls">

<div class="pSection"><common:Hint ID="Validations" visible="false" runat="server" /></div>

<common:SubHeader ID="CourseName" Runat="server" />

<div class="pSection">

<ul class="horizontal">
	<li><asp:Label ID="TermDesc" Runat="server" /></li>
	<li><asp:Label ID="CourseCode" runat="server" /></li>
	<li><asp:Label ID="DivisionDesc" Runat="server" /></li>
	<li id="CatalogDescItem" runat="server"><asp:Label ID="CatalogDesc" Runat="server" /></li>
	<li><asp:Label ID="CreditHours" Runat="server" /></li>
</ul>

<ul class="horizontal wide">
	<li><common:GlobalizedLabel ID="CapacityLabel" TextKey="LBL_CAPACITY" runat="server" /><asp:Label ID="Capacity" Runat="server" /></li>
	<li><common:GlobalizedLabel ID="EnrollmentLabel" TextKey="LBL_ENROLLMENT" runat="server" /><asp:Label ID="Enrollment" Runat="server" /></li>
	<li><common:GlobalizedLabel ID="WaitlistedLabel" TextKey="LBL_WAITLISTED" runat="server" /><asp:Label ID="Waitlisted" Runat="server" /></li>
</ul>

</div>

<ul class="horizontal highlighted">
	<li><common:GlobalizedLabel ID="TotalsLabel" TextKey="LBL_COURSE_AUTHORIZATION_TOTALS" runat="server" /></li>
	<li id="AllReqTotalItem" runat="server">
		<common:GlobalizedLabel ID="AllReqTotalLabel" TextKey="LBL_All_REQUIREMENTS" runat="server" />
		<asp:Label ID="AllReqTotal" Runat="server" />
	</li>
	<li id="SectionReqTotalItem" runat="server">
		<common:GlobalizedLabel ID="SectionReqTotalLabel" TextKey="LBL_SECTION_REQUIREMENTS" runat="server" />
		<asp:Label ID="SectionReqTotal" Runat="server" />
	</li>
	<li id="RequisitesTotalItem" runat="server">
		<common:GlobalizedLabel ID="RequisitesTotalLabel" TextKey="LBL_REQUISITES" runat="server" />
		<asp:Label ID="RequisitesTotal" Runat="server" />
	</li>
	<li id="CapacityTotalItem" runat="server">
		<common:GlobalizedLabel ID="CapacityTotalLabel" TextKey="LBL_CAPACITY" runat="server" />
		<asp:Label ID="CapacityTotal" Runat="server" />
	</li>
	<li id="ScheduleConflictTotalItem" runat="server">
		<common:GlobalizedLabel ID="ScheduleConflictLabel" TextKey="LBL_SCHEDULE_CONFLICT" runat="server" />
		<asp:Label ID="ScheduleConflictTotal" Runat="server" />
	</li>
</ul>

<div class="pSection">

<table>
<tr>
<td valign="top">
	<common:ContentBox ID="FilterBox" TextKey="TXT_SHOW" runat="server">
		<ul class="horizontal">
			<li><common:GlobalizedRadioButton ID="FilterAll" TextKey="TXT_ALL_CONDITIONS" GroupName="FilterCriteria" AutoPostBack="true" Runat="server" /></li>
			<li><common:GlobalizedRadioButton ID="FilterAllRequirements" TextKey="TXT_ALL_REQUIREMENTS" GroupName="FilterCriteria" AutoPostBack="true" Runat="server" /></li>
			<li><common:GlobalizedRadioButton ID="FilterRequirements" TextKey="TXT_REQUIREMENTS" GroupName="FilterCriteria" AutoPostBack="true" Runat="server" /></li>
			<li><common:GlobalizedRadioButton ID="FilterRequisites" TextKey="TXT_REQUISITES" GroupName="FilterCriteria" AutoPostBack="true" Runat="server" /></li>
			<li><common:GlobalizedRadioButton ID="FilterCapacity" TextKey="TXT_CAPACITY" GroupName="FilterCriteria" AutoPostBack="true" Runat="server" /></li>
			<li><common:GlobalizedRadioButton ID="FilterScheduleConflict" TextKey="TXT_SCHEDULE_CONFLICT" GroupName="FilterCriteria" AutoPostBack="true" Runat="server" /></li>
		</ul>
	</common:ContentBox>
</td>
<td valign="bottom" align="right" style="padding-left:10px;">
	<common:GlobalizedLinkButton ID="AddAuthorizationsLink" TextKey="TXT_ADD_NEW_AUTHORIZATIONS" Runat="server" />
</td>
</tr>
</table>

<common:GroupedGrid ID="AuthorizationGrid" RenderGroupHeaders="True" AllowSorting="True" runat="server">
	<TableHeaderTemplate>
		<common:GlobalizedLabel ID="AuthorizationGridHeader" TextKey="TXT_AUTHORIZATIONS_GRANTED" runat="server" />
	</TableHeaderTemplate>
	<Columns>
		<common:GlobalizedTemplateColumn HeaderTextKey = "TXT_REMOVE" ItemStyle-HorizontalAlign="Center" >
			<ItemTemplate>
				<asp:CheckBox ID="RemoveBox" runat="server"  />
				<div id="ERPAuthorizationKey" visible="false" 
					runat="server"><%# CourseAuthorizationPortlet.GetXmlValue((System.Xml.XmlElement)Container.DataItem, "ERPAuthorizationKey") %></div>
			</ItemTemplate>
		</common:GlobalizedTemplateColumn>
		<crm:XmlBoundColumn HeaderText ="Student" DataXmlField="StudentName" SortExpression="StudentName" />
		<crm:XmlBoundColumn HeaderText="ID" DataXmlField="StudentID" SortExpression="StudentID" />
		<asp:TemplateColumn HeaderText="Condition" SortExpression="Condition">
			<ItemTemplate><%# DisplayCondition((System.Xml.XmlElement)Container.DataItem) %></ItemTemplate>
		</asp:TemplateColumn>
		<crm:XmlBoundColumn HeaderText="Reason" DataXmlField="Reason" SortExpression="Reason" />
		<crm:XmlBoundColumn HeaderText="Date Added" DataXmlField="DateAdded" SortExpression="DateAdded" />
		<crm:XmlBoundColumn HeaderText="Added By" DataXmlField="AddedByName" SortExpression="AddedByName" />
	</Columns>
	<EmptyTableTemplate>
		<common:GlobalizedLabel ID="NoAuthorizationsNote" TextKey="MSG_COURSEAUTHORIZATION_NO_AUTHORIZATIONS" runat="server" />
	</EmptyTableTemplate>
</common:GroupedGrid>

<asp:Literal ID="SortGridBy"  Visible="False" Runat="server" />

<common:GlobalizedButton ID="RemoveAuthorizationsButton" TextKey="TXT_REMOVE_AUTHORIZATIONS" Runat="server" />

</div>

</div>
