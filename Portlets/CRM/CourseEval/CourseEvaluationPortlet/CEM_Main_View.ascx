<%@ Control Language="c#" AutoEventWireup="false" Codebehind="CEM_Main_View.ascx.cs" Inherits="Jenzabar.CRM.Web.Portlets.CourseEvaluationPortlet.CEM_Main_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="common" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="framework" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" Assembly="Jenzabar.Portal.Framework.Web" %>

<div id="AdminButtonDisplay" class="PortletAdminButtonPanel" visible="false" runat="server">
	<framework:PortalImageAndTextButton ID="AdminButton" TextKey="TXT_ADMIN_OPTIONS" 
			ImageCategory="PortletIcon" ImageUrl="portlet_admin_icon.gif" runat="server" />
</div>

<div class="pSection">
	<common:GlobalizedLabel TextKey="LBL_ORGANIZE_BY" Runat="server" ID="glOrganizeBy" />&nbsp;
	<asp:DropDownList ID="ddlOrganizeBy" Runat="server" autopostback="True" />
</div>
<asp:Label ID="lblTest" Runat="server" />
<div class="pSection">
	<common:GroupedGrid ID="grdSurveys" Runat="server" GroupKeyField="ID" DataKeyField="ID" RenderGroupHeaders="true">
		<GroupHeaderTemplate>
			<%# DataBinder.Eval(Container.DataItem,"Name") %>
		</GroupHeaderTemplate>
		<Columns>
			<asp:TemplateColumn HeaderText="Survey">
				<ItemTemplate>
					<asp:LinkButton ID="lnkSurveyBuilder" Runat="server" CommandName="SurveyBuilder">
						<%# DataBinder.Eval(Container.DataItem, "Name") %>
					</asp:LinkButton>
					<asp:Label ID="NonLinkedSurvey" Visible="False" Runat="server">
						<%# DataBinder.Eval(Container.DataItem, "Name") %>
					</asp:Label>
				</ItemTemplate>
			</asp:TemplateColumn>
			<common:EditButtonColumn />
			<common:DeleteButtonColumn />
			<asp:TemplateColumn HeaderText="Dates Available">
				<ItemTemplate>
					<%# ShortDateFormat(DataBinder.Eval(Container.DataItem, "StartDate")) %>
					-
					<%# ShortDateFormat(DataBinder.Eval(Container.DataItem, "EndDate")) %>
				</ItemTemplate>
			</asp:TemplateColumn>
			<asp:TemplateColumn>
				<ItemTemplate>
					<common:GlobalizedLinkButton ID="lnkSendEmail" Runat="server" CommandName="SendEmail" TextKey="CUS_EMAIL_REMINDER" />
				</ItemTemplate>
			</asp:TemplateColumn>
			<asp:TemplateColumn>
				<ItemTemplate>
					<common:GlobalizedLinkButton ID="lnkPublishReports" Runat="server" CommandName="PublishReports" TextKey="TXT_PUBLISH_REPORTS" />
				</ItemTemplate>
			</asp:TemplateColumn>
			<asp:TemplateColumn>
				<ItemTemplate>
					<common:GlobalizedLinkButton ID="lnkViewReports" Runat="server" CommandName="ViewReportLinks" TextKey="CUS_TXT_VIEW_REPORTS" />
				</ItemTemplate>
			</asp:TemplateColumn>
		</Columns>
	</common:GroupedGrid>
</div>
<div class="pSection">
	<asp:LinkButton ID="lnkAddSurveyMainLink" Runat="server" />
</div>
<div class="pSection">
	<asp:LinkButton ID="lnkAddQuestion" Runat="server" />
</div>