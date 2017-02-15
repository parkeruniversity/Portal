<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ContextImportCourseTemplate.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.Controls.ContextImportCourseTemplate" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Import namespace="Jenzabar.ICS" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<!-- to be replaced be eventual control -->
<h4>
	<asp:PlaceHolder ID="phBreadcrumb" Runat="server" />
	<asp:Literal ID="litTitle" Runat="server" />
</h4>
<asp:label ID="lblWarn" Runat="server" Visible="False" >
	<span style="color:red">
		<% = Globalizer.GetGlobalizedString("MSG_FC_TEMPLATE_SUCCESS") %>
	</span>
</asp:label>
<div class="pSection">
	<% = Globalizer.GetGlobalizedString("MSG_IMPORT_FROM_FC") %>
</div>
<div class="pSection">
	<common:GroupedGrid ID="gridTemplates" RenderGroupHeaders="True" AllowSorting="False" DataKeyField="ID" runat="server">
		<Columns>
			<asp:TemplateColumn HeaderText="Saved Course Templates" SortExpression="DisplayName">
				<ItemTemplate>
					<common:ImageAndTextButton id="lnkFolder" EnableViewState="true" runat="server" visible="false" />
					<common:GroupRadioButton GroupName="templates" id="radTemplate" runat="server" /><asp:Label ID="lblName" Runat="server" />
				</ItemTemplate>
			</asp:TemplateColumn>
		</Columns>
		<EmptyTableTemplate>
			<%=Globalizer.GetGlobalizedString("MSG_NO_COURSE_TEMPLATES") %>
		</EmptyTableTemplate>
	</common:GroupedGrid>
</div>
<div class="pSection">
	<span style="color:red">
		<% = Globalizer.GetGlobalizedString("LBL_WARNING") %>
	</span>
	<% = Globalizer.GetGlobalizedString("MSG_WARNING_IMPORT_COURSE_TEMPLATE") %>
</div>
<div class="pSection" align="center">
	<common:GlobalizedButton ID="lnkSave" TextKey="TXT_IMPORT_SELECTED" Runat="server" />
	&nbsp;
	<common:GlobalizedButton ID="lnkCancel" TextKey="TXT_CANCEL" Runat="server" />
</div>