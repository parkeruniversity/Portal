<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Register TagPrefix="cmn" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ImportSettings_CompletionMsg.ascx.cs" Inherits="Jenzabar.Portal.Framework.Web.PortletModules.FormBuilder.Importing.ImportSettings_CompletionMsg" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<div class="FormBuilder">
	<div class="MainHeader MainHeaderSecondary">
		<h4><i><%= Globalizer.GetGlobalizedString("LBL_FORM_BUILDER") %></i> <span id="spnFormName" runat="server" /></h4>
	</div>
	<div class="pSection">
		<cmn:SuperBreadcrumbs ID="brdCrumbs" runat="server" />
		<h5><strong>
			<cmn:GlobalizedLiteral Runat="server" TextKey="FORMBUILDER_FORM_SETTINGS_CM_LBL" id="glBodyTitle" />
		</strong></h5>
		<p class="hint">
			<%=Globalizer.GetGlobalizedString("FB_IMPORT_HINTCANNOTEDIT_TXT")%>
		</p>
		<fieldset>
			<table cellSpacing="3" cellPadding="3" class="SmallText">
				<tr>
					<td><b><cmn:FormLabel id="flSuccSub" runat="server" TextKey="FORMBUILDER_FORM_SETTINGS_CMSUCCSUB_LBL" /></b></td>
				</tr>
				<tr>
					<td align="right"><cmn:FormLabel id="flSuccScrMsg" runat="server" TextKey="FORMBUILDER_FORM_SETTINGS_CMSCRMSG_LBL" /></td>
					<td>
						<cmn:Hint id="hintSuccScrMsg" runat="server" TextKey="FORMBUILDER_FORM_SETTINGS_CMSCRMSG_TXT" />
						<asp:Literal ID="litScrMsgSucc" Runat="server" />
					</td>
				</tr>
				<tr>
					<td align="right"><cmn:FormLabel id="flEmMsgSucc" runat="server" TextKey="FORMBUILDER_FORM_SETTINGS_CMEMMSG_LBL" /></td>
					<td>
						<cmn:Hint id="hintEmMsgSucc" runat="server" TextKey="FORMBUILDER_FORM_SETTINGS_CMEMMSGSUCC_TXT" />
						<cmn:FormLabel id="flAftEmSucc" runat="server" TextKey="FORMBUILDER_FORM_SETTINGS_CMAFTEMSUCC_LBL" /> 
						<asp:Literal ID="litAfterSucc" Runat="server" />
						<br/>
						<table cellSpacing="3" cellPadding="3" class="SmallText" width="540">
							<tr>
								<td align="right" width="60"><cmn:FormLabel id="flFromSucc" runat="server" TextKey="LBL_FROM" /></td>
								<td width="275"><asp:Literal ID="litFromSucc" Runat="server" /></td>
								<td align="right" width="100"><cmn:FormLabel id="flFormatSucc" runat="server" TextKey="LBL_FORMAT" /></td>
								<td width="105" rowspan="3">
									<asp:RadioButtonList ID="rblFormatSucc" Runat="server" Enabled="False" />
								</td>
							</tr>
							<tr>
								<td align="right"><cmn:FormLabel id="flCcSucc" runat="server" TextKey="LBL_CC" /></td>
								<td colspan="2"><asp:Literal ID="litCCSucc" Runat="server" /></td>
							</tr>
							<tr>
								<td align="right"><cmn:FormLabel id="flBccSucc" runat="server" TextKey="LBL_BCC" /></td>
								<td colspan="2"><asp:Literal ID="litBccSucc" Runat="server" /></td>
							</tr>
							<tr>
								<td align="right"><cmn:FormLabel id="flSubjectSucc" runat="server" TextKey="LBL_SUBJECT" /></td>
								<td colspan="3"><asp:Literal ID="litSubjectSucc" Runat="server" /></td>
							</tr>
							<tr>
								<td align="right"><cmn:FormLabel id="flMsgSucc" runat="server" TextKey="LBL_MESSAGE" /></td>
								<td colspan="3" width="480"><asp:Literal ID="litMsgSucc" Runat="server" /></td>
							</tr>
						</table>
						<br/>
					</td>
				</tr>
				<tr>
					<td><b><cmn:FormLabel id="flUnSuccSub" runat="server" TextKey="FORMBUILDER_FORM_SETTINGS_CMUNSUCCSUB_LBL" /></b></td>
				</tr>
				<tr>
					<td align="right"><cmn:FormLabel id="flUnSuccScrMsg" runat="server" TextKey="FORMBUILDER_FORM_SETTINGS_CMSCRMSG_LBL" /></td>
					<td>
						<cmn:Hint id="hintUnSuccScrMsg" runat="server" TextKey="FORMBUILDER_FORM_SETTINGS_CMSCRMSGUNSUCC_TXT" />
						<asp:Literal ID="litScrMsgUnSucc" Runat="server" />
					</td>
				</tr>
				<tr>
					<td align="right"><cmn:FormLabel id="flEmMsgUnSucc" runat="server" TextKey="FORMBUILDER_FORM_SETTINGS_CMEMMSG_LBL" /></td>
					<td>
						<cmn:Hint id="hintEmMsgUnSucc" runat="server" TextKey="FORMBUILDER_FORM_SETTINGS_CMEMMSGUNSUCC_TXT" />
						<cmn:FormLabel id="flAftEmUnSucc" runat="server" TextKey="FORMBUILDER_FORM_SETTINGS_CMAFTEMUNSUCC_LBL" />
						<asp:Literal ID="litAfterUnSucc" Runat="server" />
						<br/>
						<table cellSpacing="3" cellPadding="3" class="SmallText" width="540">
							<tr>
								<td align="right" width="60"><cmn:FormLabel id="flFromUnSucc" runat="server" TextKey="LBL_FROM" /></td>
								<td width="275">
									<asp:Literal ID="litFromUnSucc" Runat="server" />
								</td>
								<td align="right" width="100"><cmn:FormLabel id="flFormatUnSucc" runat="server" TextKey="LBL_FORMAT" /></td>
								<td width="105" rowspan="3"><asp:RadioButtonList ID="rblFormatUnSucc" Runat="server" Enabled="False" /></td>
							</tr>
							<tr>
								<td align="right"><cmn:FormLabel id="flCcUnSucc" runat="server" TextKey="LBL_CC" /></td>
								<td colspan="2"><asp:Literal ID="litCCUnSucc" Runat="server" /></td>
							</tr>
							<tr>
								<td align="right"><cmn:FormLabel id="flBccUnSucc" runat="server" TextKey="LBL_BCC" /></td>
								<td colspan="2"><asp:Literal id="litBccUnSucc" Runat="server" /></td>
							</tr>
							<tr>
								<td align="right"><cmn:FormLabel id="flSubjectUnSucc" runat="server" TextKey="LBL_SUBJECT" /></td>
								<td colspan="3"><asp:Literal ID="litSubjectUnSucc" Runat="server" /></td>
							</tr>
							<tr>
								<td align="right"><cmn:FormLabel id="flMsgUnSucc" runat="server" TextKey="LBL_MESSAGE" /></td>
								<td colspan="3" width="480"><asp:Literal ID="litMsgUnSucc" Runat="server" /></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</fieldset>
		<cmn:GlobalizedButton ID="btnImport" Runat="server" TextKey="FB_IMPORT_SETTINGS_TXT" /> &nbsp;
		<cmn:GlobalizedButton ID="btnCancel" Runat="server" TextKey="FORMBUILDER_FORM_SETTINGS_CANCEL_BTN" CausesValidation="False" /> &nbsp; 
		<a id="lnkBack" runat="server"><%=Globalizer.GetGlobalizedString("TXT_BACK")%></a>
	</div>
</div>