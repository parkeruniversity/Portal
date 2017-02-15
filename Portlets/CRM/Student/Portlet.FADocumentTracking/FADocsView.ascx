<%@ Control Language="c#" AutoEventWireup="false" Codebehind="FADocsView.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.FADocumentTrackingPortlet.FADocsView" %>
<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<jenzabar:ErrorDisplay id="errDisplay" Runat="server" />
<h4><asp:Label ID="lblStudName" Runat="server"></asp:Label></h4>
<div class="pSection" id="divFinYears" runat="server">
	<jenzabar:Globalizedlabel id="lblAwardYearFor" TextKey="TXT_DT_AWARD_YEAR" Runat="server"></jenzabar:Globalizedlabel>:
	<asp:dropdownlist id="ddlAwardYear" DataTextField="YearDesc" DataValueField="YearKey" Runat="server" AutoPostBack="True"></asp:dropdownlist>
	<asp:Label ID="lblAwardYear" Runat="server" Visible="False"></asp:Label>
</div>
<div class="pSection" id="divNoData" runat="server"><jenzabar:Hint id="litNoData" TextKey="TXT_DT_NO_FINANCIAL_AID_INFO" runat="server"></jenzabar:Hint></div>
<div class="pSection" id="divHasData" runat="server">
	<jenzabar:hint id="hntRecDocs" TextKey="TXT_DT_RECEIVED_DOC_HINT" runat="server"></jenzabar:hint>
	<jenzabar:GroupedGrid id="dgRecDocs" RenderTableHeaders="true" ShowHeader="True" Runat="server">
		<EmptyTableTemplate>
			<jenzabar:GlobalizedLiteral id="glitNoRecDocs" runat="server" TextKey="TXT_DT_NO_RECEIVED_DOCS"></jenzabar:GlobalizedLiteral>
		</EmptyTableTemplate>
		<TableHeaderTemplate>
			<jenzabar:GlobalizedLiteral id="glitRecDocs" runat="server" TextKey="TXT_DT_RECEIVED_DOCS"></jenzabar:GlobalizedLiteral>
		</TableHeaderTemplate>
	</jenzabar:GroupedGrid>
	<jenzabar:hint id="hntMisDocs" runat="server" TextKey="TXT_DT_MISSING_DOC_HINT"></jenzabar:hint>
	<jenzabar:GroupedGrid id="dgMisDocs" RenderTableHeaders="true" ShowHeader="True" Runat="server">
		<EmptyTableTemplate>
			<jenzabar:GlobalizedLiteral id="glitNoMisDocs" runat="server" TextKey="TXT_DT_NO_MISSING_DOCS"></jenzabar:GlobalizedLiteral>
		</EmptyTableTemplate>
		<TableHeaderTemplate>
			<jenzabar:GlobalizedLiteral id="glitMisDocs" runat="server" TextKey="TXT_DT_MISSING_DOCS"></jenzabar:GlobalizedLiteral>
		</TableHeaderTemplate>
		<Columns>
			<jenzabar:GlobalizedTemplateColumn ItemStyle-Width="3%" ItemStyle-VerticalAlign="Top">
				<ItemTemplate>
					<asp:CheckBox ID="chkSelect" Runat="server"></asp:CheckBox>
				</ItemTemplate>
			</jenzabar:GlobalizedTemplateColumn>
			<jenzabar:GlobalizedBoundColumn DataField="col0" Visible="false" ItemStyle-HorizontalAlign="Left"></jenzabar:GlobalizedBoundColumn>
		</Columns>
	</jenzabar:GroupedGrid>
	<jenzabar:GlobalizedButton ID="btnSendAlert" TextKey="TXT_DT_SEND_ALERT" Visible="false" Runat="server"></jenzabar:GlobalizedButton><br>
</div>
<div class="pSection">
	<br>
	<asp:Label ID="lblFooter" Runat="server"></asp:Label>
</div>
