<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Register TagPrefix="cmn" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ImportInstructions_View.ascx.cs" Inherits="Jenzabar.Portal.Framework.Web.PortletModules.FormBuilder.Importing.ImportInstructions_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<script language="javascript" type="text/javascript" src="<%= this.ResolveUrl("~/Portlets/Modules/PortletModule.FormBuilder/Importing/utils.js") %>"></script>
<div class="FormBuilder">
	<div class="MainHeader MainHeaderSecondary">
		<h4><i><%= Globalizer.GetGlobalizedString("LBL_FORM_BUILDER") %></i> <span id="spnFormName" runat="server" /></h4>
	</div>
	<div class="pSection">
		<cmn:SuperBreadcrumbs ID="brdCrumbs" runat="server" />
		<h5>
			<strong>
				<cmn:GlobalizedLiteral Runat="server" TextKey="FB_IMPORT_INSTRUCTIONS" id="glBodyTitle" />
			</strong>
		</h5>
		<p class="hint" id="pHint" runat="server">
			<cmn:GlobalizedLiteral Runat="server" TextKey="FB_IMPORT_INTRUX_MAIN_HINT_TXT" id="glHint" />
		</p>
		<div class="ErrorMsg" id="divErrMain" runat="server"><b><asp:Literal id="litErrMain" Runat="server" /></b></div>
		<table class="groupedGrid " cellspacing="1" cellpadding="0" border="0" style="margin-bottom:-2px;">
			<thead>
				<tr>
					<td>
						<%= Globalizer.GetGlobalizedString("FB_IMPORT_YOURFORMS_TXT") %> &nbsp; 
						<asp:DropDownList ID="ddlFormTypes" Runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_SelectedIndexChanged" />
					</td>
				</tr>
			</thead>
		</table>
		<cmn:groupedgrid id="ggForms" runat="server" RenderGroupHeaders="true">
			<Columns>
				<asp:TemplateColumn>
					<ItemTemplate>
						<asp:Label ID="lbID" Runat="server" Visible="False" />
						<asp:RadioButton ID="rb" Runat="server" GroupName="gnForms" />
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="Form Name">
					<ItemTemplate>
						<asp:HyperLink ID="hlFormName" Runat="server" /><asp:Literal ID="litNoSettings" Runat="server" />
					</ItemTemplate>
				</asp:TemplateColumn>
			</Columns>
		</cmn:groupedgrid>
		<br/>
		<cmn:GlobalizedButton id="btnImport" runat="server" TextKey="FB_IMPORT_IMPSELECT_TXT" /> &nbsp; 
		<cmn:GlobalizedButton id="btnCancel" runat="server" TextKey="FB_IMPORT_CANCEL_TXT" />
	</div>
</div>