<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Main_View.ascx.cs" Inherits="Jenzabar.Portal.Framework.Web.PortletModules.FormBuilder.Main_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="cmn" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<script language="javascript" type="text/javascript">function resizeTheDiv(){};function initIETOC(){}</script>
<div class="FormBuilder">
	<div class="MainHeader MainHeaderSecondary">
		<h4><i><%= Globalizer.GetGlobalizedString("LBL_FORM_BUILDER") %></i><span id="spnFormName" runat="server"></span></h4>
		<table id="tblSettings" cellSpacing="0" cellPadding="0" border="0" runat="server">
			<tbody>
				<tr>
					<td class="FormSettings">
						<div class="MainHeaderSubHeader" id="divMainHeadSub" runat="server">
							<%= Globalizer.GetGlobalizedString("LBL_FORM_SETTINGS") %>
						</div>
						<table class="MainHeaderPanel" cellSpacing="0" cellPadding="0" border="0" id="tableMainHeadPanel" runat="server">
							<tr id="trSettingBasic" runat="server">
								<td class="iconCell" align="center"><asp:hyperlink id="hypEdit" Runat="server" /></td>
								<td><a id="lnkEditSettings" runat="server">
										<%= Globalizer.GetGlobalizedString("TXT_EDIT_SETTINGS") %>
									</a>
								</td>
							</tr>
							<tr id="trSettingsPayInfo" runat="server">
								<td class="iconCell" align="center"><asp:hyperlink id="hypPayment" Runat="server" /></td>
								<td><a id="lnkPayOptions" runat="server">
										<%= Globalizer.GetGlobalizedString("TXT_PAY_OPTIONS") %>
									</a>
								</td>
							</tr>
							<tr id="trSettingsCompMSG" runat="server">
								<td class="iconCell" align="center"><asp:hyperlink id="hypCompleteMsg" Runat="server" /></td>
								<td><a id="lnkCompletionMessages" runat="server">
										<%= Globalizer.GetGlobalizedString("TXT_COMPLETION_MESSAGES") %>
									</a>
								</td>
							</tr>
						</table>
					</td>
					<td>
						<div class="MainHeaderSubHeader">
							<%= Globalizer.GetGlobalizedString("LBL_NOTIFICATIONS") %>
						</div>
						<div class="MainHeaderMessage" id="divNotifications" runat="server"><span id="spnMessage" runat="server"></span></div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<table class="MainHeaderStatusBar" id="tblPreviewAndValidate" cellSpacing="0" runat="server">
		<tbody>
			<tr>
				<td><cmn:globalizedbutton id="btnDone" Runat="server" TextKey="TXT_DONE"></cmn:globalizedbutton></td>
				<td width="100%">&nbsp;</td>
				<td><a id="lnkPreviewForm" runat="server">
						<%= Globalizer.GetGlobalizedString("TXT_PREVIEW_FORM") %>
					</a>
				</td>
				<td><cmn:GlobalizedLinkButton id="lnkValidateMapping" TextKey="TXT_VALIDATE_MAPPING" runat="server"></cmn:GlobalizedLinkButton>
				</td>
			</tr>
		</tbody>
	</table>
	<div class="pSection"><span id="spnJumpToOther" style="FLOAT: right" runat="server"><a class="SmallText" id="lnkJumpToOther" runat="server">
				<%= Globalizer.GetGlobalizedString("TXT_JUMP_TO_OTHER_CONTENT") %>
			</a></span><span id="spnSectionsBar" runat="server">
			<h5><b><%= Globalizer.GetGlobalizedString("TXT_SECTIONS") %></b></h5>
		</span>
		<ul id="ulSectionLinks" runat="server">
			<li>
				<asp:hyperlink id="hypImportSections" Runat="server"></asp:hyperlink><a class="SmallText" id="lnkImportSections" runat="server"><b>
						<%= Globalizer.GetGlobalizedString("TXT_IMPORT_SECTION_S") %>
					</b></a>
			<li>
				<asp:hyperlink id="hypAddASection" Runat="server"></asp:hyperlink><a class="SmallText" id="lnkAddASection" runat="server">
					<%= Globalizer.GetGlobalizedString("TXT_ADD_A_SECTION") %>
				</a>
			<li>
				<asp:hyperlink id="hypReorderSections" Runat="server"></asp:hyperlink><a class="SmallText" id="lnkReorderSections" runat="server">
					<%= Globalizer.GetGlobalizedString("TXT_REORDER_SECTIONS") %>
				</a>
			</li>
		</ul>
		<span id="spnNoSections" runat="server">
			<table class="GridStyle GridStyleFullWidth" id="tblAddImportQuestions" cellSpacing="0" cellPadding="20">
				<thead>
					<tr>
						<td><i>
								<%= Globalizer.GetGlobalizedString("TXT_ADD_IMPORT_QUESTIONS") %>
							</i>
						</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="alt RightTableCell">
							<%= Globalizer.GetGlobalizedString("TXT_NO_QUESTIONS_IN_FORM") %>
							<br>
							&nbsp;<br>
							<a id="lnkImportForm" runat="server">
								<%= Globalizer.GetGlobalizedString("TXT_IMPORT_EXISTING_QUESTIONS") %>
							</a>
							<br>
							&nbsp;<br>
							<a id="lnkCreateSection" runat="server">
								<%= Globalizer.GetGlobalizedString("TXT_CREATE_SECTION_AND_ADD_QUESTIONS") %>
							</a>
						</td>
					</tr>
				</tbody>
			</table>
		</span>
			<span class="pSection" id="spnSections" runat="server"><span id="spnNewForm" runat="server">
				<table class="GridStyle GridStyleFullWidth" id="tblCreateNewForm" cellSpacing="0" cellPadding="0">
					<thead>
						<tr>
							<td colSpan="2"><i>
									<%= Globalizer.GetGlobalizedString("TXT_BEGIN_NEW_FORM") %>
								</i>
							</td>
						</tr>
					</thead>
					<tbody>
						<tr id="trDupeFormName" runat="server">
							<td colspan="2" class="alt NameCell"><div class="FormBuilder"><span class="ErrorMsg"><asp:Literal ID="litDupeFormName" Runat="server" /></span></div></td>
						</tr>
						<tr>
							<td class="alt NameCell" noWrap align="left"><b><cmn:globalizedlabel id="GlobalizedLabel1" runat="server" TextKey="LBL_FORM_NAME" /></b></td>
							<td class="alt NameCell"><asp:textbox id="tbFormName" Runat="server" MaxLength="100" /><asp:requiredfieldvalidator id="rfvNameRequired" Runat="server" ControlToValidate="tbFormName" Text="" /></td>
						</tr>
						<tr>
							<td class="alt"></td>
							<td class="alt">
								<%= Globalizer.GetGlobalizedString("TXT_CAN_EDIT_FORM_NAME") %>
							</td>
						</tr>
						<tr>
							<td class="alt" colSpan="2"><b><cmn:globalizedlabel id="GlobalizedLabel2" runat="server" TextKey="TXT_START_ADDING_CONTENT"></cmn:globalizedlabel></b><br>
								<cmn:globalizedlabel id="GlobalizedLabel3" runat="server" TextKey="TXT_TWO_OPTIONS_FOR_ADDING_CONTENT"></cmn:globalizedlabel>
								<ul>
									<li>
										<cmn:globalizedlabel id="GlobalizedLabel4" runat="server" TextKey="TXT_IMPORT_EXISTING_QUESTIONS"></cmn:globalizedlabel>
									<li>
										<cmn:globalizedlabel id="GlobalizedLabel5" runat="server" TextKey="TXT_CREATE_NEW_FORM_CONTENT"></cmn:globalizedlabel></li></ul>
								<cmn:globalizedlabel id="GlobalizedLabel6" runat="server" TextKey="TXT_CHOOSE_BEGIN_FORM_OPTION"></cmn:globalizedlabel></td>
						</tr>
						<tr>
							<td class="alt" align="center" colSpan="2"><cmn:globalizedbutton id="btnImportContent" runat="server" TextKey="TXT_IMPORT_EXISTING_CONTENT"></cmn:globalizedbutton>&nbsp;
								<cmn:globalizedbutton id="btnAddNewContent" runat="server" TextKey="TXT_ADD_NEW_CONTENT"></cmn:globalizedbutton></td>
						</tr>
					</tbody>
				</table>
			</span></span><span id="spnOtherContent" runat="server"><a name="otherContent"></a>
			<h5><b><%= Globalizer.GetGlobalizedString("TXT_OTHER_CONTENT") %></b></h5>
			<span class="pSection">
				<table class="GridStyle GridStyleFullWidth" id="tblIntroAndInstructions" cellSpacing="0" cellPadding="0">
					<thead>
						<tr>
							<td colSpan="2"><i>
									<%= Globalizer.GetGlobalizedString("TXT_INTRO_AND_INSTRUCTIONS") %>
								</i>
							</td>
						</tr>
						<tr>
							<td class="HeaderSection OtherContent" noWrap align="left"><asp:hyperlink id="hypIntroduction" Runat="server"></asp:hyperlink><a id="lnkIntroduction" runat="server"></a><br>
								<br>
								<asp:hyperlink id="hypInstructions" Runat="server"></asp:hyperlink><a id="lnkInstructions" runat="server"></a></td>
							<td class="RightTableCell HeaderSection">
								<%= Globalizer.GetGlobalizedString("TXT_FRM_INTRO_AND_INSTRUCTIONS_INTRO") %>
							</td>
						</tr>
					</thead>
				</table>
				<table class="GridStyle GridStyleFullWidth" id="tblHiddenData" cellSpacing="0" cellPadding="0" style="margin-bottom:auto;">
					<thead>
						<tr>
							<td colSpan="2"><i><%= Globalizer.GetGlobalizedString("TXT_HIDDEN_DATA") %></i></td>
						</tr>
						<tr>
							<td class="HeaderSection OtherContent" noWrap align="left"><asp:hyperlink id="hypAddItem" Runat="server"></asp:hyperlink><a id="lnkAddItem" runat="server"><%= Globalizer.GetGlobalizedString("TXT_FRM_ADD_ITEM") %></a><br>
								<br>
								<asp:hyperlink id="hypImportItem" Runat="server"></asp:hyperlink><a id="lnkImportItem" runat="server"><%= Globalizer.GetGlobalizedString("TXT_FRM_IMPORT_ITEM") %></a></td>
							<td class="RightTableCell HeaderSection">
								<%= Globalizer.GetGlobalizedString("TXT_FRM_HIDDEN_DATA_INTRO") %>
							</td>
						</tr>
					</thead>
				</table>
				<table class="GridStyle GridStyleFullWidth" id="tblHiddenDataItems" cellSpacing="0" cellPadding="0">
				    <thead>
						<tr id="HiddenDataHeaderRow" runat="server">
							<th>
								<%= Globalizer.GetGlobalizedString("TXT_LABEL") %>
							</th>
							<th>
							    <%= Globalizer.GetGlobalizedString("TXT_TYPE")%>
							</th>
							<th>
								<%= Globalizer.GetGlobalizedString("TXT_VALUE") %>
							</th>
							<th>&nbsp;</th>
							<th class="RightTableCell">
								<%= Globalizer.GetGlobalizedString("TXT_DB_MAPPING") %>
							</th>
						</tr>
					</thead>
					<tbody>
						<asp:repeater id="rptHiddenData" Runat="server">
							<ItemTemplate>
								<tr id="trRow" runat="server">
									<td class="MainPageHiddenDataLabelValueCell">
										<asp:Literal ID="litLabel" Runat="server" />
									</td>
									<td>
									    <asp:Literal ID="litHiddenType" runat="server" />
									</td>
									<td class="MainPageHiddenDataLabelValueCell">
										<asp:Literal ID="litValue" Runat="server" />
									</td>
									<td align="center" class="MainPageEditDeleteCell">
										<asp:HyperLink ID="hypEditData" Runat="server" />
										&nbsp;
										<cmn:ConfirmationImageButton ID="cibtnDeleteData" runat="server" />
									</td>
									<td class="RightTableCell">
										<asp:Image ID="imgMapped" Runat="server" />
										&nbsp;
										<asp:HyperLink ID="hypMapped" Runat="server"/>
									</td>
									<td class="HiddenCell">
										<input type="hidden" id="inHiddenDataID" runat="server">
									</td>
								</tr>
							</ItemTemplate>
						</asp:repeater></tbody></table>
			</span></span>
	</div>
</div>