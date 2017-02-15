<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="crm" namespace="Jenzabar.CRM.Utility" assembly="CRM" %>
<%@ Import namespace="Jenzabar.CRM.Faculty.Web.Portlets.CourseAuthorizationPortlet" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="AddNewAuthorization.ascx.cs" Inherits="Jenzabar.CRM.Faculty.Web.Portlets.CourseAuthorizationPortlet.AddNewAuthorization" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<div class="pView" xmlns:common="http://schemas.jenzabar.com/JICS/CommonControls">

<asp:ValidationSummary ID="Validations" runat="server" />
<asp:CustomValidator ID="SearchFieldsValidator" OnServerValidate="ValidateSearchFields" runat="server" />

<common:SubHeader ID="CourseName" Runat="server" />

<div class="pSection">

<ul class="horizontal">
	<li><asp:Label ID="TermDesc" Runat="server" />
	<li><asp:Label ID="CourseCode" runat="server" />
	<li><asp:Label ID="DivisionDesc" Runat="server" />
	<li id="CatalogDescItem" runat="server"> <asp:Label ID="CatalogDesc" Runat="server" /></li> 
	<li><asp:Label ID="CreditHours" Runat="server" /></li>
</ul>

<ul class="horizontal wide">
	<li><common:GlobalizedLabel ID="CapacityLabel" TextKey="LBL_CAPACITY" runat="server" /><asp:Label ID="Capacity" Runat="server" />
	<li><common:GlobalizedLabel ID="EnrollmentLabel" TextKey="LBL_ENROLLMENT" runat="server" /><asp:Label ID="Enrollment" Runat="server" />
	<li><common:GlobalizedLabel ID="WaitlistedLabel" TextKey="LBL_WAITLISTED" runat="server" /><asp:Label ID="Waitlisted" Runat="server" /></li>
</ul>

</div>

<div class="pSection">

<common:ContentBox TextKey="TXT_ADD_AUTHORIZATION" runat="server" id=ContentBox1>
<DIV class=pSection>
<common:GlobalizedLabel id=AddNote runat="server" TextKey="MSG_COURSEAUTHORIZATION_ADD_NOTE"></common:GlobalizedLabel>
<UL class=horizontal>
  <LI>
<common:FormLabel id=LastNameLabel runat="server" TextKey="LBL_LAST_NAME" ForControl="LastName"></common:FormLabel>
<asp:TextBox id=LastName runat="server"></asp:TextBox>
  <LI>
<common:FormLabel id=FirstNameLabel runat="server" TextKey="LBL_FIRST_NAME" ForControl="FirstName"></common:FormLabel>
<asp:TextBox id=FirstName runat="server"></asp:TextBox>
  <LI>
<common:FormLabel id=StudentIDLabel runat="server" TextKey="LBL_ID" ForControl="StudentID"></common:FormLabel>
<asp:TextBox id=StudentID runat="server" Columns="15"></asp:TextBox>
  <LI>
<common:GlobalizedButton id=SearchButton runat="server" TextKey="TXT_SEARCH"></common:GlobalizedButton>
  <LI>
<common:GlobalizedLinkButton id=AdvancedSearchButton runat="server" TextKey="TXT_ADVANCED_SEARCH"></common:GlobalizedLinkButton></LI></UL></DIV>
</common:ContentBox>

<common:Hint ID="NoUsersFound" TextKey="MSG_COURSEAUTHORIZAION_NO_USERS_FOUND" Visible="false" Runat="server" />

<common:Hint ID="Instructions" TextKey="MSG_COURSEAUTHORIZATION_ADD_NEW_INSTRUCTIONS" Visible="false" runat="server" />

<table><tr><td>
<common:GroupedGrid ID="AuthorizationGrid" RenderGroupHeaders="True" runat="server">
	<TableHeaderTemplate>
		<ul class="horizontal" style="margin-top: 0px; margin-bottom: 0px;">
			<li>
				<common:GlobalizedLabel ID="CurrentStudentNameLabel" TextKey="LBL_STUDENT" runat="server" />
				<asp:Label ID="CurrentStudentName" runat="server" />
			</li>
			<li>
				<common:GlobalizedLabel ID="CurrentStudentIDLabel" TextKey="LBL_ID" runat="server" />
				<asp:Label ID="CurrentStudentID" runat="server" />
			</li>
		</ul>
	</TableHeaderTemplate>
	<Columns>
		<common:GlobalizedTemplateColumn HeaderTextKey="TXT_REQENT_ADD">
			<ItemTemplate>
<asp:CheckBox ID="AddAuthorization" Runat="server" /></ItemTemplate>
		</common:GlobalizedTemplateColumn>
		<common:GlobalizedTemplateColumn HeaderTextKey="TXT_AUTHORIZATION_CONDITION">
			<ItemTemplate>
				<div id="ConditionKey" visible="false" runat="server"><%# (string)Container.DataItem %></div>
				<%# CourseAuthorizationPortlet.DisplayConditionText((string)Container.DataItem) %>
			</ItemTemplate>
		</common:GlobalizedTemplateColumn>
		<common:GlobalizedTemplateColumn HeaderTextKey="TXT_REASON">
			<ItemTemplate>
<asp:DropDownList ID="Reason" runat="server" /></ItemTemplate>
		</common:GlobalizedTemplateColumn>
	</Columns>
</common:GroupedGrid>
</td></tr></table>

<common:GlobalizedButton ID="AddAuthorizationsButton" TextKey="TXT_ADD_AUTHORIZATION_S" runat="server" />

</div>

</div>
