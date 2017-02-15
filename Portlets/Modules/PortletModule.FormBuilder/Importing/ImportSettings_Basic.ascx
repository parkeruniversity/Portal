<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Register TagPrefix="cmn" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ImportSettings_Basic.ascx.cs" Inherits="Jenzabar.Portal.Framework.Web.PortletModules.FormBuilder.Importing.ImportSettings_Basic" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<div class="FormBuilder">
	<div class="MainHeader MainHeaderSecondary">
		<h4><i><%= Globalizer.GetGlobalizedString("LBL_FORM_BUILDER") %></i> <span id="spnFormName" runat="server" /></h4>
	</div>
	<div class="pSection">
		<cmn:SuperBreadcrumbs ID="brdCrumbs" runat="server" />
		<h5><strong>
			<cmn:GlobalizedLiteral Runat="server" TextKey="FORMBUILDER_FORM_SETTINGS_BASIC_LBL" id="glBodyTitle" />
		</strong></h5>
		<p class="hint">
			<%=Globalizer.GetGlobalizedString("FB_IMPORT_HINTCANNOTEDIT_TXT")%>
		</p>
		<fieldset>
			<table cellSpacing="3" cellPadding="3" class="SmallText">
				<tr>
					<td align="right"><cmn:FormLabel id="flFormName" runat="server" TextKey="FORMBUILDER_FORM_SETTINGS_FORMNAME_LBL" /></td>
					<td><asp:Literal ID="litFormName" Runat="server" /></td>
				</tr>
				<tr>
					<td align="right"><cmn:FormLabel id="flShrtDesc" runat="server" TextKey="FORMBUILDER_FORM_SETTINGS_SHRTDESC_LBL" /></td>
					<td><asp:Literal ID="litShrtDesc" Runat="server" /></td>
				</tr>
				<tr>
					<td align="right"><%= Globalizer.GetGlobalizedString("FB_CONTACTEMAIL_TXT") %></td>
					<td><%=submissionErrorNotifyUser%></td>
				</tr>
				<tr>
					<td align="right"><cmn:FormLabel id="flSupFiles" runat="server" TextKey="FORMBUILDER_FORM_SETTINGS_SUPFILES_LBL" /></td>
					<td>
						<asp:Literal ID="litNoSupFiles" Runat="server" />
						<asp:Repeater ID="SavedFiles" Runat="server">
							<ItemTemplate>
								<div style="padding: 4px 0px 4px 10px;">
									<asp:HyperLink ID="FileLink" 
											NavigateUrl='<%# DataBinder.Eval(Container.DataItem, "Path") %>' 
											Target="_blank" Runat="server">
										<%# DataBinder.Eval(Container.DataItem, "Name") %>
									</asp:HyperLink> 
									(<%# DataBinder.Eval(Container.DataItem, "Size") %>)
								</div>
							</ItemTemplate>
						</asp:Repeater>
					</td>
				</tr>
			</table>
		</fieldset>
		<cmn:GlobalizedButton ID="btnImport" Runat="server" TextKey="FB_IMPORT_SETTINGS_TXT" /> &nbsp;
		<cmn:GlobalizedButton ID="btnCancel" Runat="server" TextKey="FORMBUILDER_FORM_SETTINGS_CANCEL_BTN" CausesValidation="False" /> &nbsp; 
		<a id="lnkBack" runat="server"><%=Globalizer.GetGlobalizedString("TXT_BACK")%></a>
	</div>
</div>
