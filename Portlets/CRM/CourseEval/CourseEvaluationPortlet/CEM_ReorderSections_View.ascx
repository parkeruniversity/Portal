<%@ Control Language="c#" AutoEventWireup="false" Codebehind="CEM_ReorderSections_View.ascx.cs" Inherits="Jenzabar.CRM.Web.Portlets.CourseEvaluationPortlet.CEM_ReorderSections_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="cmn" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="custom" TagName="SurveyBuilerHeader" Src="SurveyBuilderHeader.ascx" %>
<div class="pSection">
	<custom:SurveyBuilerHeader ID="myText" Runat="server" />
	<table cellSpacing="0" cellPadding="0" width="100%" border="0">
		<tr>
			<td>
				<cmn:GroupedGrid id="ItemsGrid" runat="server" CellPadding="0" DataKeyField="ID" GroupKeyField="ID" ShowHeader="False">
					<Columns>
						<asp:TemplateColumn SortExpression="">
							<ItemTemplate>
								<asp:TextBox ID="NewOrder" MaxLength="3" Width="30" Text='<%# DataBinder.Eval( Container.DataItem, "Order" ) %>' Runat="server" />
								<%# DataBinder.Eval( Container.DataItem, "Name" ) %>
								<input id="OldOrder" type="hidden" value='<%# DataBinder.Eval( Container.DataItem, "Order" ) %>' runat="server" NAME="OldOrder">
							</ItemTemplate>
						</asp:TemplateColumn>
					</Columns>
				</cmn:GroupedGrid>
			</td>
		</tr>
	</table>
	<table cellSpacing="0" cellPadding="0" width="100%" border="0">
		<tr>
			<td>
				<cmn:globalizedbutton ID="gbtnSave" Runat="server" TextKey="TXT_SAVE" />&nbsp;&nbsp;
				<cmn:globalizedbutton ID="gbtnCancel" Runat="server" TextKey="TXT_CANCEL" />
			</td>
		</tr>
	</table>
</div>
