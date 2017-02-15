<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Register TagPrefix="cmn" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ImportQuestions_View.ascx.cs" Inherits="Jenzabar.Portal.Framework.Web.PortletModules.FormBuilder.Importing.ImportQuestions_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<script language="javascript" type="text/javascript" src="<%= this.ResolveUrl("~/Portlets/Modules/PortletModule.FormBuilder/Importing/utils.js") %>"></script>
<div class="FormBuilder">
	<div class="MainHeader MainHeaderSecondary">
		<h4><i><%= Globalizer.GetGlobalizedString("LBL_FORM_BUILDER") %></i> <span id="spnFormName" runat="server" /></h4>
	</div>
	<div class="pSection">
		<cmn:SuperBreadcrumbs ID="brdCrumbs" runat="server" />
		<h5>
			<strong>
				<cmn:GlobalizedLiteral Runat="server" TextKey="FB_IMPORTQ_TXT" id="glBodyTitle" />
			</strong>
		</h5>
		<p class="hint" id="pHint" runat="server">
			<cmn:GlobalizedLiteral Runat="server" TextKey="FB_IMPORTQUES_MAIN_HINT_TXT" id="glHint" />
		</p>
		<cmn:contentbox id="cntbxQSearch" textKey="FB_QSEARCH_TXT" runat="server">
			<table cellSpacing="3" cellPadding="3" class="SmallText">
				<tr>
					<td><cmn:FormLabel id="flQLabel" runat="server" TextKey="FB_QLABEL_TXT" /></td>
					<td><asp:TextBox ID="tbQLabel" Runat="server" MaxLength="100" /></td>
					<td><cmn:FormLabel id="flQType" runat="server" TextKey="FB_QTYPE_TXT" /></td>
					<td><asp:DropDownList ID="ddlQType" Runat="server" /></td>
				</tr>
				<tr>
					<td><cmn:FormLabel id="flQTxt" runat="server" TextKey="FB_QTXT_TXT" /></td>
					<td><asp:TextBox ID="tbQTxt" Runat="server" MaxLength="100" /></td>
					<td align="right" id="tdFtTxt" runat="server"><cmn:FormLabel id="flFormType" runat="server" TextKey="FB_FORMTYPE_TXT" /></td>
					<td><asp:DropDownList ID="ddlFormTypeQSearch" Runat="server" /></td>
					<td><cmn:GlobalizedButton ID="btnSearch" Runat="server" TextKey="FB_QSEARCHBUT_TXT" /></td>
				</tr>
			</table>
		</cmn:contentbox>
		<div class="ErrorMsg" id="divErrMain" runat="server"><b><asp:Literal id="litErrMain" Runat="server" /></b></div>
		<cmn:groupedgrid id="ggSearchResults" runat="server" RenderGroupHeaders="true" visibility="false">
			<TableHeaderTemplate>
				<%= Globalizer.GetGlobalizedString("FB_RESULTSQ_TXT") %>
			</TableHeaderTemplate>
			<Columns>
				<asp:TemplateColumn >
					<HeaderTemplate>
						<input onclick="doCheck(this.checked, 'cb', 'ggSearchResults');" type="checkbox">
					</HeaderTemplate>
					<ItemTemplate>
						<asp:CheckBox ID="cb" Runat="server" />
						<asp:Literal ID="litQID" Runat="server" Visible="False" />
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="Question Label">
					<ItemTemplate>
						<asp:Literal ID="litLabel" Runat="server" />
						<asp:HyperLink ID="hlLabel" Runat="server" />
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="Type">
					<ItemTemplate>
						<asp:Literal ID="litType" Runat="server" />
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="Form">
					<ItemTemplate>
						<asp:HyperLink ID="hlFormName" Runat="server" />
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="Section">
					<ItemTemplate>
						<asp:HyperLink ID="hlSectionName" Runat="server" />
					</ItemTemplate>
				</asp:TemplateColumn>
			</Columns>
		</cmn:groupedgrid>
		<cmn:globalizedlabel id="glNoSearchResults" runat="server" TextKey="FB_QNOSEARCHRESULTS_TXT" visible="false" /><p/>
		<div id="divResultsButs" runat="server">
			<cmn:GlobalizedButton id="btnImport" runat="server" TextKey="FB_IMPORT_IMPSELECT_TXT" /> &nbsp; 
			<cmn:GlobalizedButton id="btnCancelSearch" runat="server" TextKey="FB_IMPORT_CANCEL_TXT" /> &nbsp; 
			<a id="aBrowseQ" runat="server"><%= Globalizer.GetGlobalizedString("FB_BROWSEFORMS_NOCOLON_TXT") %></a>
		</div>
		<div id="divQFormTypeHeader" runat="server">
			<table class="groupedGrid " cellspacing="1" cellpadding="0" border="0" style="margin-bottom:-12px;">
				<thead>
					<tr>
						<td>
							<%= Globalizer.GetGlobalizedString("FB_BROWSEFORMS_TXT") %> &nbsp; 
							<asp:DropDownList ID="ddlFormTypes" Runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_SelectedIndexChanged" />
						</td>
					</tr>
				</thead>
			</table>
		</div>
		<cmn:groupedgrid id="ggForms" runat="server" RenderGroupHeaders="true">
			<Columns>
				<asp:TemplateColumn HeaderText="Form">
					<ItemTemplate>
						<asp:HyperLink ID="hlFormName" Runat="server" />
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="# of Sections">
					<ItemTemplate>
						<asp:Label ID="lbNumSections" Runat="server" />
					</ItemTemplate>
				</asp:TemplateColumn>
			</Columns>
		</cmn:groupedgrid>
		<br/>
		<a id="aBack" runat="server"><%=Globalizer.GetGlobalizedString("FB_BACKMAINSCREEN_TXT")%></a>
	</div>
</div>
