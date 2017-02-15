<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Main_View.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseSearchPortlet.Main_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Import namespace="Jenzabar.LMS.Portlets.CourseSearchPortlet" %>
<%@ Register TagPrefix="cmn" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<asp:ValidationSummary ID="vldSummary" Runat="server"/>
<div class="pSection">
	<fieldset>
	<table>
		<tr>
			<th><cmn:formlabel runat="server" textkey="LBL_COURSE_TITLE" forcontrol="txtTitle" /></th><td><asp:TextBox runat="server" ID="txtTitle" maxlength="50" /></th>
			<th><cmn:formlabel runat="server" textkey="LBL_COURSE_CODE" forcontrol="txtCourseCode" /></th><td><asp:textbox runat="server" ID="txtCourseCode" maxlength="20"/></th>
		</tr>
		<tr>
			<th><cmn:formlabel runat="server" textkey="LBL_FACULTY_LAST_NAME" forcontrol="txtFaculty" /></th><td><asp:textbox runat="server" ID="txtFaculty" maxlength="50"/></th>
			<th><cmn:formlabel runat="server" textkey="LBL_TERM" forcontrol="ddlTerm" ID="Formlabel2"/></th><td><asp:DropDownList runat="server" ID="ddlTerm"/></th>			
		</tr>
		<tr>
			<th><cmn:formlabel runat="server" textkey="LBL_COURSE_DESCRIPTION" forcontrol="txtDesc" ID="Formlabel1"/></th><td><asp:TextBox runat="server" ID="txtDesc" maxlength="50" /></th>
			<th></th><td><cmn:GlobalizedCheckBox id="chbShowDesc" runat="server" textkey="TXT_SHOW_COURSE_DESCRIPTIONS"/></td>
		</tr>
	</table>
	<div align="center"><cmn:globalizedbutton runat="server" ID="btnSubmit" textkey="TXT_SEARCH" />
	</div>
	</fieldset>
<br>
<cmn:PageNavigator id="pNav" AutoBind="False" runat="server" />
<cmn:groupedgrid id="ItemsGrid" runat="server" RenderTableHeaders="True" HideTableHeadersWhenGridIsEmpty="True" DataKeyField="ID" GroupKeyField="ID">
	<tableheadertemplate><cmn:globalizedliteral id="gl1" runat="server" textkey="TXT_SEARCH_RESULTS" /></tableheadertemplate>
		<Columns>
			<asp:TemplateColumn HeaderText="CourseCode" ItemStyle-VerticalAlign="top" >
				<ItemTemplate>
					<%# ((CourseSearchStruct)Container.DataItem).CourseSearch.CourseCode %>
					<%# ((CourseSearchStruct)Container.DataItem).CourseSearch.SectionName==null? "" : "(" + ((CourseSearchStruct)Container.DataItem).CourseSearch.SectionName +")" %>
				</ItemTemplate>
			</asp:TemplateColumn>
			<asp:TemplateColumn HeaderText="CourseName" ItemStyle-VerticalAlign="top">
				<ItemTemplate>
					<div>
					<%# ((CourseSearchStruct)Container.DataItem).CourseSearch.SectionURL==null? "" : "<a href='"+((CourseSearchStruct)Container.DataItem).CourseSearch.SectionURL + "'>"%>
					<%# ((CourseSearchStruct)Container.DataItem).CourseSearch.CourseName %>
					<%# ((CourseSearchStruct)Container.DataItem).CourseSearch.SectionURL==null? "" : "</a>"%>
					</div>
					<div><asp:Literal id="litTerm" runat="server"/></div>
					
				</ItemTemplate>
			</asp:TemplateColumn>
			<asp:TemplateColumn HeaderText="Faculty" ItemStyle-VerticalAlign="top">
				<ItemTemplate>
					<div>
					<asp:PlaceHolder ID="plhFaculty" Runat="server"/>
					</div>
				</ItemTemplate>
			</asp:TemplateColumn>
			<asp:TemplateColumn HeaderText="Schedule" ItemStyle-VerticalAlign="top">
				<ItemTemplate>
					<div>
					<asp:PlaceHolder ID="plhSchedule" Runat="server"/>
					</div>
				</ItemTemplate>
			</asp:TemplateColumn>
		</Columns>
		<SubItemTemplate>
			<asp:Literal id="litDesc" runat="server" Text="<%# ((CourseSearchStruct)Container.DataItem).CourseSearch.CourseDescription %>"/>
		</SubItemTemplate>
	<EmptyTableTemplate><%=Globalizer.GetGlobalizedString("MSG_NO_ITEMS_TO_DISPLAY")%></EmptyTableTemplate>
	</cmn:groupedgrid>
</div>
