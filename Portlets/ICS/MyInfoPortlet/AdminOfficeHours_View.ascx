<%@ Control Language="c#" AutoEventWireup="false" Codebehind="AdminOfficeHours_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.MyInfoPortlet.AdminOfficeHours_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="framework" namespace="Jenzabar.Portal.Framework.Web.UI.Controls" assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Import namespace="Jenzabar.ICS" %>
<style>
	.labeledInput INPUT { FLOAT: left; MARGIN-RIGHT: 10px }
	.labeledInput LABEL { FLOAT: left; }
	.officeHoursNote { font-size: 80%; }
</style>

<common:GroupedGrid id="OfficeHoursGrid" runat="server" GroupKeyField="ID" DataKeyField="ID">
	<GroupHeaderTemplate><asp:Label ID="lblCurrOfficeHours" Runat="server"></asp:Label></GroupHeaderTemplate>
	<Columns>
		<asp:TemplateColumn>
			<ItemTemplate>
				<%# ((OfficeHours)Container.DataItem).MainText %>
			</ItemTemplate>
		</asp:TemplateColumn>
		<common:EditButtonColumn />
		<common:DeleteButtonColumn />
	</Columns>
	<SubItemTemplate><div class="officeHoursNote"><%# ((OfficeHours)Container.DataItem).SecondaryText %></div></SubItemTemplate>
</common:GroupedGrid>

<h4 id="AdminLabel" runat="server"></h4>

<div class="pSection">
<fieldset>
<table width="1">
	<tr>
		<th><common:FormLabel ID="StartTimeLabel" ForControl="StartTime" Runat="server"></common:FormLabel></th>
		<td valign="top"><common:DatePicker ID="StartTime" runat="server" TimeDisplayFormat="Short" DateDisplayFormat="None" /></td>
	</tr>
	<tr>
		<th><common:FormLabel ID="EndTimeLabel" ForControl="EndTime" Runat="server"></common:FormLabel></th>
		<td><common:DatePicker ID="EndTime" runat="server" TimeDisplayFormat="Short" DateDisplayFormat="None" /></td>
	</tr>
	<tr>
		<th>Valid:</th>
		<td>
			<table width="1">
				<tr>
					<td><asp:RadioButton ID="WeeklyButton" GroupName="DisplayType" Runat="server" /></td>
					<td><common:FormLabel ID="WeeklyLabel" ForControl="WeeklyButton" runat="server" /></td>
				</tr>
				<tr>
					<td></td>
					<td><common:DayOfWeekSelector ID="Weekly" RepeatColumns="2" runat="server" /></td>
				</tr>
				<tr>
					<td><asp:RadioButton ID="SingleDateButton" GroupName="DisplayType" Runat="server" /></td>
					<td><common:FormLabel ID="SingleDateLabel" ForControl="SingleDateButton" runat="server" /></td>
				</tr>
				<tr>
					<td></td>
					<td><common:DatePicker ID="SingleDate" runat="server" /></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<th><common:FormLabel ID="NoteLabel" ForControl="Note" Runat="server"></common:FormLabel></th>
		<td><asp:TextBox ID="Note" Columns="50" MaxLength="500" Runat="server" /></td>
	</tr>
	<tr>
		<td></td>
		<td><div class="labeledInput"><asp:CheckBox ID="ShowOnlyNote" Runat="server" /><label for="ShowOnlyNote"></label></div>
		</td>
	</tr>
	<tr>
		<td></td>
		<td>
			<asp:Button ID="SaveButton" Runat="server" />&nbsp;
			<asp:Button ID="CancelButton" Runat="server" />
		</td>
	</tr>
</table>
</fieldset>
</div>
<input type="hidden" id="CurrentOfficeHours" runat="server"> 
