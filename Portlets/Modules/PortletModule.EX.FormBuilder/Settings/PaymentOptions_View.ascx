<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Register TagPrefix="cmn" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="PaymentOptions_View.ascx.cs" Inherits="Jenzabar.CRM.Common.Web.PortletModule.EX.FormBuilder.Settings.PaymentOptions_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<script language="javascript" type="text/javascript" src="<%= this.ResolveUrl("~/Portlets/Modules/PortletModule.EX.FormBuilder/Settings/utils.js") %>"></script>
<div class="FormBuilder">
	<div class="MainHeader MainHeaderSecondary">
		<h4><i><%= Globalizer.GetGlobalizedString("LBL_FORM_BUILDER") %></i> <span id="spnFormName" runat="server" /></h4>
	</div>
	<div class="pSection">
		<cmn:SuperBreadcrumbs ID="brdCrumbs" runat="server" />
		<h5><strong>
			<cmn:GlobalizedLiteral Runat="server" TextKey="FORMBUILDER_FORM_SETTINGS_PAYMENT_LBL" id="glBodyTitle" />
		</strong></h5>
		<p class="hint" style="text-align:center;">
			<a id="lnkImportSettings" runat="server"><asp:Image ID="imgImport" Runat="server" ImageUrl="~/UI/Common/Images/PortletImages/Icons/add.gif" /> <%= Globalizer.Format("FB_SETTINGS_IMPORTURT_TXT",Globalizer.GetGlobalizedString("FORMBUILDER_FORM_SETTINGS_PAYMENT_LBL")) %></a>
		</p>
		<asp:Label ID="lblError" Runat="server" Visible="False" ForeColor="Red" />
		<fieldset>
			<table cellSpacing="3" cellPadding="3" class="SmallText">
				<tr>
					<td align="right"><cmn:FormLabel id="flChargeFee" runat="server" TextKey="FORMBUILDER_FORM_SETTINGS_CHARGEFEE_LBL" /></td>
					<td>
						<asp:RadioButtonList ID="rblChargeFee" Runat="server">
							<asp:ListItem />
							<asp:ListItem />
							<asp:ListItem />
						</asp:RadioButtonList>
					</td>
				</tr>
				<tr>
					<td align="right"><cmn:FormLabel id="flPaymentCodes" runat="server" TextKey="FORMBUILDER_FORM_SETTINGS_PAYMENTCODES_LBL" /></td>
					<td>
						<%= Globalizer.Format( "FORMBUILDER_FORM_SETTINGS_PAYMENTNUMWC_TXT", totalWC ) %> <a id="lnkCodes" runat="server"><%= Globalizer.GetGlobalizedString("FORMBUILDER_FORM_SETTINGS_PAYMENTCODESLNK_TXT") %></a>
					</td>
				</tr>
				<tr>
					<td align="right"><cmn:FormLabel id="flFeeAmt" runat="server" TextKey="FORMBUILDER_FORM_SETTINGS_PAYMENTFEEAMT_LBL" /></td>
					<td>
						<asp:TextBox ID="tbFeeAmt" Runat="server" MaxLength="50" /> &nbsp; 
						<asp:CustomValidator ID="cvFeeAmount" Runat="server" ControlToValidate="rblChargeFee" ClientValidationFunction="checkFeeAmt" />
					</td>
				</tr>
				<tr>
					<td align="right"><cmn:FormLabel id="flTransCode" runat="server" TextKey="FORMBUILDER_FORM_SETTINGS_PAYMENTTRANSCODE_LBL" /></td>
					<td><asp:TextBox ID="tbTransCode" Runat="server" MaxLength="50" /></td>
				</tr>
				<tr>
					<td align="right"><cmn:FormLabel id="flPayAuth" runat="server" TextKey="FORMBUILDER_FORM_SETTINGS_PAYMENTPAYAUTH_LBL" /></td>
					<td>
						<asp:RadioButtonList ID="rblPayAuth" Runat="server">
							<asp:ListItem></asp:ListItem>
							<asp:ListItem></asp:ListItem>
						</asp:RadioButtonList>
						<dd>
							<cmn:FormLabel id="flEmail" runat="server" TextKey="FORMBUILDER_FORM_SETTINGS_PAYMENTEMAIL_LBL" /> <asp:TextBox ID="tbEmail" Runat="server" MaxLength="100" />
							<asp:CustomValidator ID="cvEmail" Runat="server" ControlToValidate="rblPayAuth" ClientValidationFunction="checkEmail" />
						</dd>
						<dd>
							<asp:CheckBox ID="cbAllowPay" Runat="server" /> <cmn:FormLabel id="flAllowPay" runat="server" TextKey="FORMBUILDER_FORM_SETTINGS_PAYMENTALLOWPAY_TXT" />
						</dd>
					</td>
				</tr>
				<tr>
					<td align="right"><cmn:FormLabel id="flTxtSelect" runat="server" TextKey="FORMBUILDER_FORM_SETTINGS_PAYMENTTXTSELECT_LBL" /></td>
					<td>
						<i><cmn:Hint id="hintTxtSelectBlurb" runat="server" TextKey="FORMBUILDER_FORM_SETTINGS_PAYMENTTXTSELECT_TXT" /></i>
						<asp:TextBox ID="tbTxtSelect" Runat="server" TextMode="MultiLine" Width="350" Height="70" MaxLength="6000" />
					</td>
				</tr>
				<tr>
					<td align="right"><cmn:FormLabel id="flTxtPay" runat="server" TextKey="FORMBUILDER_FORM_SETTINGS_PAYMENTTXTPAY_LBL" /></td>
					<td>
						<i><cmn:Hint id="hintTxtPayBlurb" runat="server" TextKey="FORMBUILDER_FORM_SETTINGS_PAYMENTTXTPAY_TXT" /></i>
						<asp:TextBox ID="tbTxtPay" Runat="server" TextMode="MultiLine" Width="350" Height="70" MaxLength="6000" />
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