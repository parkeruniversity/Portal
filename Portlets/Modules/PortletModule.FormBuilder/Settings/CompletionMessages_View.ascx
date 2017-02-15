<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Register TagPrefix="cmn" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="jics" tagname="TextEditor" src="~\UI\Controls\TextEditor.ascx" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="CompletionMessages_View.ascx.cs" Inherits="Jenzabar.Portal.Framework.Web.PortletModules.FormBuilder.Settings.CompletionMessages_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<script language="javascript" type="text/javascript" src="<%= this.ResolveUrl("~/Portlets/Modules/PortletModule.FormBuilder/Settings/utils.js") %>"></script>
<script language="javascript" type="text/javascript">
function openWinInstrux(){
	openWindow('<%= this.ResolveUrl("~/Portlets/Modules/PortletModule.FormBuilder/Settings/keywords.htm") %>','instrux',450,450,1,0);
}
function openWindow(page,name,width,height,scroll,resize){
window.open(page,name,"toolbar=0,location=0,status=1,menubar=0,scrollbars=" + scroll + ",resizable=" + resize + ",top=0,left=0,width=" + width + ",height=" + height)
}
</script>
<style>.EmMsg{width:480px;display:none;}</style>
<div class="FormBuilder">
	<div class="MainHeader MainHeaderSecondary">
		<h4><i><%= Globalizer.GetGlobalizedString("LBL_FORM_BUILDER") %></i> <span id="spnFormName" runat="server" /></h4><a name="aDivErrMain"></a>
	</div>
	<div class="pSection">
		<cmn:SuperBreadcrumbs ID="brdCrumbs" runat="server" />
		<h5><strong>
			<cmn:GlobalizedLiteral Runat="server" TextKey="FORMBUILDER_FORM_SETTINGS_CM_LBL" id="glBodyTitle" />
		</strong></h5>
		<p class="hint" style="text-align:center;">
			<a id="lnkImportSettings" runat="server"><asp:Image ID="imgImport" Runat="server" ImageUrl="~/UI/Common/Images/PortletImages/Icons/add.gif" /> <%= Globalizer.Format("FB_SETTINGS_IMPORTURT_TXT",Globalizer.GetGlobalizedString("FORMBUILDER_FORM_SETTINGS_CM_LBL")) %></a>
		</p>
		<cmn:GlobalizedLabel id="glErrMain" runat="server" visible="false" ForeColor="Red" />
		<fieldset>
			<table cellSpacing="3" cellPadding="3" class="SmallText" border="0">
				<tr>
					<td colspan="2"><b><cmn:FormLabel id="flSuccSub" runat="server" TextKey="FORMBUILDER_FORM_SETTINGS_CMSUCCSUB_LBL" /></b></td>
				</tr>
				<tr>
					<td align="right"><cmn:FormLabel id="flSuccScrMsg" runat="server" TextKey="FORMBUILDER_FORM_SETTINGS_CMSCRMSG_LBL" /></td>
					<td>
						<p class="hint"><%=Globalizer.GetGlobalizedString("FORMBUILDER_FORM_SETTINGS_CMSCRMSG_TXT")%> <%=Globalizer.GetGlobalizedString("FB_COMPLETION_MSG_LINK_TXT")%></p>
                        <jics:TextEditor id="_textEditorScrMsgSucc" MaxLength="6000" runat="server" />
					</td>
				</tr>
				<tr>
					<td align="right"><cmn:FormLabel id="flEmMsgSucc" runat="server" TextKey="FORMBUILDER_FORM_SETTINGS_CMEMMSG_LBL" /></td>
					<td>
						<a name="aValSucc"></a>
						<p class="hint"><%=Globalizer.GetGlobalizedString("FORMBUILDER_FORM_SETTINGS_CMEMMSGSUCC_TXT")%> <%=Globalizer.GetGlobalizedString("FB_COMPLETION_MSG_LINK_TXT")%></p>
						<asp:CustomValidator ID="cvEmailSendSucc" Runat="server" ControlToValidate="ddAfterSucc" ErrorMessage="" OnServerValidate="cvSucc" />
						<span id="spanAfterSucc" runat="server">
							<cmn:FormLabel id="flAftEmSucc" runat="server" TextKey="FORMBUILDER_FORM_SETTINGS_CMAFTEMSUCC_LBL" /> 
							<asp:DropDownList ID="ddAfterSucc" Runat="server" />
						</span>
						<br/><br/>
						<table cellSpacing="3" cellPadding="3" class="FBQuestionList" width="75%" border="0">
						    <tr>
						        <td align="right" width="60"><cmn:FormLabel id="FormLabel1" runat="server" TextKey="LBL_FORMAT" /></td>
						        <td colspan="2" >
						            <asp:RadioButton ID="rbTxtSucc" Runat="server" GroupName="rbgFormatSucc" /> <cmn:FormLabel id="flTxtSucc" runat="server" TextKey="TXT_TEXT" /> &nbsp; 
						            <asp:RadioButton ID="rbHtmlSucc" Runat="server" GroupName="rbgFormatSucc" /> <cmn:FormLabel id="flHtmlSucc" runat="server" TextKey="TXT_HTML" />
						        </td>
						    </tr>
							<tr>
								<td align="right" width="60"><cmn:FormLabel id="flFromSucc" runat="server" TextKey="LBL_FROM" /></td>
								<td width="175">
									<cmn:GlobalizedLabel id="glErrFromSucc" runat="server" visible="false" ForeColor="Red" />
									<asp:TextBox ID="tbFromSucc" Runat="server" Width="150px" MaxLength="100" />
								</td>
								<td width="405"></td>
							</tr>
							<tr>
								<td align="right"><cmn:FormLabel id="flCcSucc" runat="server" TextKey="LBL_CC" /></td>
								<td>
									<cmn:GlobalizedLabel id="glErrCcSucc" runat="server" visible="false" ForeColor="Red" />
									<asp:TextBox ID="tbCCSucc" Runat="server" Width="150px" MaxLength="500" />
								</td>
								<td class="Required"><%=Globalizer.GetGlobalizedString("TXT_SEPARATE_MULTIPLE_EMAIL_ADDRESSES")%></td>
							</tr>
							<tr>
								<td align="right"><cmn:FormLabel id="flBccSucc" runat="server" TextKey="LBL_BCC" /></td>
								<td>
									<cmn:GlobalizedLabel id="glErrBccSucc" runat="server" visible="false" ForeColor="Red" />
									<asp:TextBox ID="tbBccSucc" Runat="server" Width="150px" MaxLength="500" />
								</td>
								<td class="Required"><%=Globalizer.GetGlobalizedString("TXT_SEPARATE_MULTIPLE_EMAIL_ADDRESSES")%></td>
							</tr>
							<tr>
								<td align="right"><cmn:FormLabel id="flSubjectSucc" runat="server" TextKey="LBL_SUBJECT" /></td>
								<td colspan="2">
									<cmn:GlobalizedLabel id="glErrSubjectSucc" runat="server" visible="false" ForeColor="Red" />
									<asp:TextBox ID="tbSubjectSucc" Runat="server" Width="150px" MaxLength="500" />
								</td>
							</tr>
							<tr>
								<td align="right"><cmn:FormLabel id="flMsgSucc" runat="server" TextKey="LBL_MESSAGE" /></td>
								<td colspan="2" >
									<cmn:GlobalizedLabel id="glErrMsgSucc" runat="server" visible="false" ForeColor="Red" />
									<div id="divSuccFormatMsgTB" runat="server" class="EmMsg">
										<asp:TextBox ID="tbEmMsgSucc" Runat="server" TextMode="MultiLine" Width="475" Height="120" MaxLength="6000" />
									</div>
									<div id="divSuccFormatMsgTBE" runat="server">
										<jics:TextEditor id="_textEditorEmMsgSucc" MaxLength="6000" runat="server" />
									</div>
								</td>
							</tr>
						</table>
						<br/>
					</td>
				</tr>
				<tr>
					<td colspan="2"><b><cmn:FormLabel id="flUnSuccSub" runat="server" TextKey="FORMBUILDER_FORM_SETTINGS_CMUNSUCCSUB_LBL" /></b></td>
				</tr>
				<tr>
					<td align="right"><cmn:FormLabel id="flUnSuccScrMsg" runat="server" TextKey="FORMBUILDER_FORM_SETTINGS_CMSCRMSG_LBL" /></td>
					<td>
						<p class="hint"><%=Globalizer.GetGlobalizedString("FORMBUILDER_FORM_SETTINGS_CMSCRMSGUNSUCC_TXT")%> <%=Globalizer.GetGlobalizedString("FB_COMPLETION_MSG_LINK_TXT")%></p>
						<jics:TextEditor id="_textEditorScrMsgUnSucc" MaxLength="6000" runat="server" />
					</td>
				</tr>
				<tr>
					<td align="right"><cmn:FormLabel id="flEmMsgUnSucc" runat="server" TextKey="FORMBUILDER_FORM_SETTINGS_CMEMMSG_LBL" /></td>
					<td>
						<p class="hint"><%=Globalizer.GetGlobalizedString("FORMBUILDER_FORM_SETTINGS_CMEMMSGUNSUCC_TXT")%> <%=Globalizer.GetGlobalizedString("FB_COMPLETION_MSG_LINK_TXT")%></p>
						<asp:CustomValidator ID="cvEmailSendUnSucc" Runat="server" ControlToValidate="ddAfterUnSucc" ErrorMessage="" OnServerValidate="cvUnSucc" />
						<span id="spanAfterUnSucc" runat="server">
							<cmn:FormLabel id="flAftEmUnSucc" runat="server" TextKey="FORMBUILDER_FORM_SETTINGS_CMAFTEMUNSUCC_LBL" />
							<asp:DropDownList ID="ddAfterUnSucc" Runat="server"></asp:DropDownList>
						</span>
						<br/><br/>
						<table cellSpacing="3" cellPadding="3" class="FBQuestionList" width="75%" border="0">
						    <tr>
						        <td align="right" width="60"><cmn:FormLabel id="flFormatUnSucc" runat="server" TextKey="LBL_FORMAT" /></td>
						        <td colspan="2" width="480">
						            <asp:RadioButton ID="rbTxtUnSucc" Runat="server" GroupName="rbgFormatUnSucc" /> <cmn:FormLabel id="flTxtUnSucc" runat="server" TextKey="TXT_TEXT" /> &nbsp; 
						            <asp:RadioButton ID="rbHtmlUnSucc" Runat="server" GroupName="rbgFormatUnSucc" /> <cmn:FormLabel id="flHtmlUnSucc" runat="server" TextKey="TXT_HTML" />
						        </td>
						    </tr>
							<tr>
								<td align="right" width="60"><cmn:FormLabel id="flFromUnSucc" runat="server" TextKey="LBL_FROM" /></td>
								<td width="175">
									<cmn:GlobalizedLabel id="glErrFromUnSucc" runat="server" visible="false" ForeColor="Red" />
									<asp:TextBox ID="tbFromUnSucc" Runat="server" Width="150px" MaxLength="100" />
								</td>
								<td width="405"></td>
							</tr>
							<tr>
								<td align="right"><cmn:FormLabel id="flCcUnSucc" runat="server" TextKey="LBL_CC" /></td>
								<td>
									<cmn:GlobalizedLabel id="glErrCcUnSucc" runat="server" visible="false" ForeColor="Red" />
									<asp:TextBox ID="tbCCUnSucc" Runat="server" Width="150px" MaxLength="500" />
								</td>
								<td class="Required"><%=Globalizer.GetGlobalizedString("TXT_SEPARATE_MULTIPLE_EMAIL_ADDRESSES")%></td>
							</tr>
							<tr>
								<td align="right"><cmn:FormLabel id="flBccUnSucc" runat="server" TextKey="LBL_BCC" /></td>
								<td>
									<cmn:GlobalizedLabel id="glErrBccUnSucc" runat="server" visible="false" ForeColor="Red" />
									<asp:TextBox ID="tbBccUnSucc" Runat="server" Width="150px" MaxLength="500" />
								</td>
								<td class="Required"><%=Globalizer.GetGlobalizedString("TXT_SEPARATE_MULTIPLE_EMAIL_ADDRESSES")%></td>
							</tr>
							<tr>
								<td align="right"><cmn:FormLabel id="flSubjectUnSucc" runat="server" TextKey="LBL_SUBJECT" /></td>
								<td colspan="2">
									<cmn:GlobalizedLabel id="glErrSubjectUnSucc" runat="server" visible="false" ForeColor="Red" />
									<asp:TextBox ID="tbSubjectUnSucc" Runat="server" Width="150px" MaxLength="500" />
								</td>
							</tr>
							<tr>
								<td align="right"><cmn:FormLabel id="flMsgUnSucc" runat="server" TextKey="LBL_MESSAGE" /></td>
								<td colspan="2" >
									<cmn:GlobalizedLabel id="glErrMsgUnSucc" runat="server" visible="false" ForeColor="Red" />
									<div id="divUnSuccFormatMsgTB" runat="server" class="EmMsg">
										<asp:TextBox ID="tbEmMsgUnSucc" Runat="server" TextMode="MultiLine" Width="475" Height="120" MaxLength="6000" />
									</div>
									<div id="divUnSuccFormatMsgTBE" runat="server">
										<jics:TextEditor id="_textEditorEmMsgUnSucc" MaxLength="6000" runat="server" />
									</div>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td></td>
					<td>
						<cmn:GlobalizedButton ID="btnSave" Runat="server" TextKey="FORMBUILDER_FORM_SETTINGS_SAVE_BTN" /> &nbsp; 
						<cmn:GlobalizedButton ID="btnCancel" Runat="server" TextKey="FORMBUILDER_FORM_SETTINGS_CANCEL_BTN" CausesValidation="False" />
					</td>
				</tr>
			</table>
		</fieldset>
	</div>
</div>