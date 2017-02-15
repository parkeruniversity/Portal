<%@ Control Language="c#" AutoEventWireup="false" Codebehind="MapData_View.ascx.cs" Inherits="Jenzabar.CRM.Common.Web.PortletModule.EX.FormBuilder.Mapping.MapData_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Register TagPrefix="cmn" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<div class="FormBuilder">
	<div class="MainHeader MainHeaderSecondary">
		<h4><%= Globalizer.GetGlobalizedString("LBL_FORM_BUILDER") %>&nbsp;<asp:Literal ID="litFormName" Runat="server"></asp:Literal></h4>
	</div>
	<div class="pSection">
		<cmn:superbreadcrumbs id="brdCrumbs" runat="server"/>
		<h5><b><%= Globalizer.GetGlobalizedString("TXT_MAPPING_STEP_TWO_DETAIL") %></b></h5>
		<cmn:ErrorDisplay id="errorDisplay" runat="server" visible="False" />
		<div class="pSection">
			<div>
				<asp:Literal ID="litQuestion" Runat="server" />
				<cmn:GlobalizedLinkButton ID="lnkRemoveMapping" Style="color:red" Runat="server" TextKey="TXT_REMOVE_MAPPING" visible="false" />
			</div>
			<br>
			<div>
				<asp:Literal ID="litTable" Runat="server" />
			</div>
			<br>
			<asp:PlaceHolder ID="phRow" Runat="server">
			<div>
				<asp:Literal ID="litRow" Runat="server" />
			</div>
			<br>
			</asp:PlaceHolder>
			<table id="tblOtherQuestions" runat="server">
				<tr>
					<td valign="top">
						<%= Globalizer.GetGlobalizedString("LBL_OTHER_QUESTIONS") %>
					</td>
					<td>
						<asp:Repeater ID="rptOtherQuestions" Runat="server">
							<ItemTemplate>
								<div>
									<asp:Literal ID="litOtherQuestion" Runat="server" />
								</div>
							</ItemTemplate>
						</asp:Repeater>
					</td>
				</tr>
			</table>
			<br>
			<table id="tblOtherHiddenData" runat="server">
				<tr>
					<td valign="top">
						<%= Globalizer.GetGlobalizedString("LBL_OTHER_HIDDEN_DATA") %>
					</td>
					<td>
						<asp:Repeater ID="rptOtherHiddenData" Runat="server">
							<ItemTemplate>
								<div>
									<asp:Literal ID="litOtherHiddenData" Runat="server" />
								</div>
							</ItemTemplate>
						</asp:Repeater>
					</td>
				</tr>
			</table>
			<cmn:hint id=hntFields runat=server TextKey="MSG_FB_DEFINE_FIELDS" />
			<asp:Repeater id="rptFields" runat="server">
				<HeaderTemplate>
					<table class="GridStyle" cellSpacing="0" cellPadding="0" width="100%">
						<thead>
							<tr>
								<td colspan="4">
									<i><%= Globalizer.GetGlobalizedString("LBL_FIELDS_IN") %></i> <asp:Literal ID="litTableName" Runat="server" />
								</td>
							</tr>
							<tr>
								<th>
									<%= Globalizer.GetGlobalizedString("TXT_FIELD_NAME") %>
								</th>
								<th>
									<%= Globalizer.GetGlobalizedString("TXT_FIELD_TYPE") %>
								</th>
								<th class="RightTableCell" colspan="2">
									<%= Globalizer.GetGlobalizedString("TXT_MAPPED_VALUE") %>
								</th>
							</tr>
						</thead>
						<tbody>
				</HeaderTemplate>
				<ItemTemplate>
					<tr <%= RowClass %>>
						<td>
							<input runat="server" id="hidName" type="hidden" />
							<%# DataBinder.Eval(Container.DataItem, "Name") %>
						</td>
						<td>
							<%# DataBinder.Eval(Container.DataItem, "FType") %>
						</td>
						<td>
								<asp:DropDownList ID="ddlMValue" Runat="server"/>
						</td>
						<td class="RightSplitTableCell" width="150px">
								<asp:TextBox ID="txtValue" Runat="server" CssClass="hiddenText" />
						</td>
					</tr>
				</ItemTemplate>
				<FooterTemplate>
						</tbody>
					</table> 
				</FooterTemplate>
			</asp:Repeater>
			<cmn:GlobalizedButton ID="btnSave" Runat="server" TextKey="TXT_SAVE" /> &nbsp; 
			<cmn:GlobalizedButton ID="btnCancel" Runat="server" TextKey="TXT_CANCEL" CausesValidation="False" /> &nbsp;
			<cmn:GlobalizedLinkButton ID="lnkRemoveAll" Style="color:red" Runat="server" TextKey="TXT_REMOVE_ALL_MAPPINGS" />
		</div>
	</div>
</div>