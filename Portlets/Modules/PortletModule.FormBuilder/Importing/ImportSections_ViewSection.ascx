<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Register TagPrefix="cmn" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ImportSections_ViewSection.ascx.cs" Inherits="Jenzabar.Portal.Framework.Web.PortletModules.FormBuilder.Importing.ImportSections_ViewSection" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<script language="javascript" type="text/javascript" src="<%= this.ResolveUrl("~/Portlets/Modules/PortletModule.FormBuilder/Importing/utils.js") %>"></script>
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
			<cmn:GlobalizedLiteral Runat="server" TextKey="FB_IMPORT_VIEWSECTION_MAIN_HINT_TXT" id="glHint" />
		</p>
		<div class="ErrorMsg" id="divErrMain" runat="server"><b><asp:Literal id="litErrMain" Runat="server" /></b></div>
		<cmn:groupedgrid id="ggSection" runat="server" RenderGroupHeaders="true">
			<TableHeaderTemplate>
				<%=Globalizer.Format("FB_IMPORT_QUESTIONSSIN_TXT",_formThisName,_sectionName)%>
			</TableHeaderTemplate>
			<Columns>
				<asp:TemplateColumn >
					<HeaderTemplate>
						<input onclick="doCheck(this.checked, 'cb', 'ggSection');" type="checkbox">
					</HeaderTemplate>
					<ItemTemplate>
						<asp:Literal ID="litQID" Runat="server" Visible="False" />
						<asp:CheckBox ID="cb" Runat="server" />
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="Question Label">
					<ItemTemplate>
						<asp:Literal ID="litQLabel" Runat="server" />
						<asp:HyperLink ID="hlQLabel" Runat="server" />
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="Question Type">
					<ItemTemplate>
						<asp:Literal ID="litQType" Runat="server" />
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="Question Text">
					<ItemTemplate>
						<asp:Literal ID="litQTxt" Runat="server" />
					</ItemTemplate>
				</asp:TemplateColumn>
			</Columns>
		</cmn:groupedgrid>
		<div id="divNoData" runat="server"> &nbsp; &nbsp; <%= Globalizer.GetGlobalizedString("FB_IMPORT_NOQDATA_TXT") %></div>
		<br/>
		<cmn:GlobalizedButton id="btnImport" runat="server" TextKey="FB_IMPORT_IMPSELECT_TXT" /> &nbsp; 
		<cmn:GlobalizedButton id="btnCancel" runat="server" TextKey="FB_IMPORT_CANCEL_TXT" /> &nbsp; 
		<a id="lnkBack" runat="server"><%= Globalizer.GetGlobalizedString("FB_IMPORT_BACKSLIST_TXT") %></a>
	</div>
</div>
