<%@ Import Namespace="System.Threading" %>
<%@ Register TagPrefix="cmn" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="TuitionStatementBox.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.My1098TInfoPortlet.TuitionStatementBox"%>
<div class="pSection" id="divError" visible="False" runat="server"><cmn:errordisplay id="ctlError" RunAt="server"></cmn:errordisplay>&nbsp;</div>
<div class="pSection" id="divWarning" visible="False" runat="server"><asp:label id="lblWarning" Runat="server" CssClass="PortletError"></asp:label></div>
<div class="pSection" id="divMessage" visible="False" runat="server"><asp:label id="lblMessage" Runat="server"></asp:label></div>
<cmn:groupedgrid id="dg1098T" Runat="server" RenderTableHeaders="True" Width="100%" GridLines="None"
	HeaderRightColumns="(Collection)">
	<Columns>
		<cmn:GlobalizedBoundColumn Visible="False" DataField="column_hidden"></cmn:GlobalizedBoundColumn>
		<cmn:GlobalizedTemplateColumn Visible="False" HeaderText="TXT_1098_T_UNDER_REVIEW" HeaderTextKey="TXT_1098_T_UNDER_REVIEW">
			<ItemTemplate>
				<asp:CheckBox ID="column0" Runat="server" Enabled="False" Visible="False"></asp:CheckBox>
			</ItemTemplate>
		</cmn:GlobalizedTemplateColumn>
		<cmn:GlobalizedBoundColumn DataField="column1" HeaderTextKey="TXT_1098_T_DESCRIPTION"></cmn:GlobalizedBoundColumn>
		<cmn:GlobalizedBoundColumn DataField="column2" HeaderTextKey="TXT_1098_T_DATE"></cmn:GlobalizedBoundColumn>
		<cmn:GlobalizedTemplateColumn HeaderText="TXT_1098_T_VALUE" HeaderTextKey="TXT_1098_T_VALUE">
			<ItemStyle HorizontalAlign="Right" VerticalAlign="Top"></ItemStyle>
			<ItemTemplate>
				<asp:Literal ID="litAmount" Runat="server" Text='<%#Convert.ToDecimal (DataBinder.Eval(Container.DataItem,"column3")).ToString("C",Thread.CurrentThread.CurrentCulture)%>'>
				</asp:Literal>
			</ItemTemplate>
		</cmn:GlobalizedTemplateColumn>
		<cmn:GlobalizedBoundColumn DataField="column4" HeaderTextKey="TXT_1098_T_TERM"></cmn:GlobalizedBoundColumn>
	</Columns>
</cmn:groupedgrid>
