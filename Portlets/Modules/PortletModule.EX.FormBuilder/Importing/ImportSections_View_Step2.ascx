<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Register TagPrefix="cmn" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ImportSections_View_Step2.ascx.cs" Inherits="Jenzabar.CRM.Common.Web.PortletModule.EX.FormBuilder.Importing.ImportSections_View_Step2" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<script language="javascript" type="text/javascript" src="<%= this.ResolveUrl("~/Portlets/Modules/PortletModule.EX.FormBuilder/Importing/utils.js") %>"></script>
<div class="FormBuilder">
	<div class="MainHeader MainHeaderSecondary">
		<h4><i><%= Globalizer.GetGlobalizedString("LBL_FORM_BUILDER") %></i> <span id="spnFormName" runat="server" /></h4>
	</div>
	<div class="pSection">
		<cmn:SuperBreadcrumbs ID="brdCrumbs" runat="server" />
		<h5>
			<strong>
				<cmn:GlobalizedLiteral Runat="server" TextKey="FB_IMPORT_TXT" id="glBodyTitle" />
			</strong>
		</h5>
		<p class="hint">
			<cmn:GlobalizedLiteral Runat="server" TextKey="FB_IMPORT_STEP2_MAIN_HINT_TXT" id="glHint" />
		</p>
		<div class="ErrorMsg" id="divErrMain" runat="server"><b><asp:Literal id="litErrMain" Runat="server" /></b></div>
		<cmn:groupedgrid id="ggSections" runat="server" RenderGroupHeaders="true">
			<TableHeaderTemplate>
				<%=Globalizer.Format("FB_IMPORT_SECTIONSIN_TXT",_formThisName)%>
			</TableHeaderTemplate>
				<Columns>
				<asp:TemplateColumn>
					<HeaderTemplate>
						<input onclick="doCheck(this.checked, 'cb', 'ggSections');" type="checkbox">
					</HeaderTemplate>
					<ItemTemplate>
						<asp:Label ID="lbID" Runat="server" Visible="False" />
						<asp:Label ID="lbSectionType" Runat="server" Visible="False" />
						<asp:Label ID="lbSettingType" Runat="server" Visible="False" />
						<asp:CheckBox ID="cb" Runat="server" />
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="Sections">
					<ItemTemplate>
						<asp:Literal ID="litPrefix" Runat="server" />
						<asp:HyperLink ID="hlSectionName" Runat="server" />
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="# of Questions">
					<ItemTemplate>
						<asp:Label ID="lbNumQuestions" Runat="server" />
					</ItemTemplate>
				</asp:TemplateColumn>
				</Columns>
		</cmn:groupedgrid>
		<br/>
		<cmn:GlobalizedButton id="btnImport" runat="server" TextKey="FB_IMPORT_IMPSELECT_TXT" /> &nbsp; 
		<cmn:GlobalizedButton id="btnCancel" runat="server" TextKey="FB_IMPORT_CANCEL_TXT" /> &nbsp; 
		<a id="lnkBack" runat="server"><%= Globalizer.GetGlobalizedString("FB_IMPORT_BACKFLIST_TXT") %></a>
	</div>
</div>