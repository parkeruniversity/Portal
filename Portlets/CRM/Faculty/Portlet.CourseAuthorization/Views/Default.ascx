<%@ Control Language="c#" AutoEventWireup="True" Codebehind="Default.ascx.cs" Inherits="Jenzabar.CRM.Faculty.Web.Portlets.CourseAuthorizationPortlet.Default" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Import namespace="Jenzabar.CRM.Faculty.Web.Portlets.CourseAuthorizationPortlet" %>
<%@ Register TagPrefix="crm" namespace="Jenzabar.CRM.Utility" assembly="CRM" %>
<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<div class="pSection" id="divError" runat="server" visible="False"><common:errordisplay id="ctlError" RunAt="server"></common:errordisplay></div>
<div class="pSection" id="divWarning" runat="server" visible="true"><asp:label id="lblWarning" Runat="server" CssClass="PortletError"></asp:label></div>
<div class="pSection" id="divMessage" runat="server" visible="False"><asp:label id="lblMessage" Runat="server"></asp:label></div>
<div class="pView" xmlns:common="http://schemas.jenzabar.com/JICS/CommonControls">
	<div class="pSection" id="divDesc" runat="server" >
		<common:hint id="Instructions" TextKey="MSG_COURSEAUTHORIZATION_DEFAULT_INSTRUCTIONS" runat="server" />
		<fieldset>
			<table>
				<tr>
					<td width="18%"><common:FormLabel ID="TermLabel" TextKey="LBL_TERM" Runat="server" />&nbsp;&nbsp;</td>
					<td width="100%"><%= CourseAuthorizationPortlet.GetXmlValue(AuthorizationCourseList, "TermDesc") %></td>
					<td></td>
				</tr>
				<tr>
					<td width="18%"><common:FormLabel ID="DivisionLabel" Runat="server" />
						&nbsp;&nbsp;</td>
					<td valign="middle"><asp:Label ID="Division" runat="server" /></td>
				</tr>
			</table>
		</fieldset>
		<common:GroupedGrid ID="CourseGrid" RenderGroupHeaders="True" runat="server">
			<TableHeaderTemplate>
				<common:FormLabel ID="FacultyLabel" TextKey="LBL_FACULTY" Runat="server" />
				<%# Jenzabar.Portal.Framework.PortalUser.Current.NameDetails.ToString() %>
			</TableHeaderTemplate>
			<Columns>
				<asp:TemplateColumn Visible="false">
					<ItemTemplate>
						<div id="ERPCourseKey" runat="server"><%# CourseAuthorizationPortlet.GetXmlValue((System.Xml.XmlElement)Container.DataItem, "ERPCourseKey") %></div>
					</ItemTemplate>
				</asp:TemplateColumn>
				<crm:XmlButtonColumn HeaderText="Course" DataXmlField="DisplayedCourseCode" CommandName="DisplayCourse" />
				<crm:XmlBoundColumn HeaderText="Catalog" DataXmlField="CatalogCode" />
				<asp:TemplateColumn HeaderText="Total Authorizations">
					<ItemTemplate>
						<%# GetAuthorizationTotal((System.Xml.XmlElement)Container.DataItem).ToString() %>
					</ItemTemplate>
				</asp:TemplateColumn>
			</Columns>
		</common:GroupedGrid>
		<common:GlobalizedLinkButton ID="AllCoursesLink" TextKey="TXT_CA_COURSE_LIST" Visible="True" Runat="server" />
	</div>
</div>
