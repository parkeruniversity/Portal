<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Register TagPrefix="cmn" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ImportHiddenData_View_Step2.ascx.cs" Inherits="Jenzabar.Portal.Framework.Web.PortletModules.FormBuilder.Importing.ImportHiddenData_View_Step2" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<script language="javascript" type="text/javascript" src="<%= this.ResolveUrl("~/Portlets/Modules/PortletModule.FormBuilder/Importing/utils.js") %>"></script>
<div class="FormBuilder">
	<div class="MainHeader MainHeaderSecondary">
		<h4><i><%= Globalizer.GetGlobalizedString("LBL_FORM_BUILDER") %></i> <span id="spnFormName" runat="server" /></h4>
	</div>
	<div class="pSection">
		<cmn:SuperBreadcrumbs ID="brdCrumbs" runat="server" />
		<h5>
			<strong>
				<cmn:GlobalizedLiteral Runat="server" TextKey="FB_IMPORT_HIDDENDATA_TXT" id="glBodyTitle" />
			</strong>
		</h5>
		<div class="ErrorMsg" id="divErrMain" runat="server"><b><asp:Literal id="litErrMain" Runat="server" /></b></div>
		<cmn:groupedgrid id="ggItems" runat="server" RenderGroupHeaders="true">
			<TableHeaderTemplate>
				<%= Globalizer.Format("FB_ITEMS_IN",thisFormName) %><%= Globalizer.GetGlobalizedString("TXT_HIDDEN_DATA") %>
			</TableHeaderTemplate>
			<Columns>
				<asp:TemplateColumn >
					<HeaderTemplate>
						<input onclick="doCheck(this.checked, 'cb', 'ggItems');" type="checkbox">
					</HeaderTemplate>
					<ItemTemplate>
						<asp:CheckBox ID="cb" Runat="server" />
						<asp:Literal ID="litHDID" Runat="server" Visible="False" />
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="Item Label">
					<ItemTemplate>
						<asp:Literal ID="litHDLabel" Runat="server" />
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="Item Data">
					<ItemTemplate>
						<asp:Literal ID="litHDData" Runat="server" />
					</ItemTemplate>
				</asp:TemplateColumn>
			</Columns>
		</cmn:groupedgrid>
		<div id="divNoData" runat="server"> &nbsp; &nbsp; <%= Globalizer.GetGlobalizedString("FB_IMPORT_NOHDDATA_TXT") %></div>
		<br/>
		<cmn:GlobalizedButton id="btnImport" runat="server" TextKey="FB_IMPORT_IMPSELECT_TXT" /> &nbsp; 
		<cmn:GlobalizedButton id="btnCancel" runat="server" TextKey="FB_IMPORT_CANCEL_TXT" /> &nbsp; 
		<a id="aBack" runat="server"><%= Globalizer.GetGlobalizedString("FB_IMPORT_BACKFLIST_TXT") %></a>
	</div>
</div>
