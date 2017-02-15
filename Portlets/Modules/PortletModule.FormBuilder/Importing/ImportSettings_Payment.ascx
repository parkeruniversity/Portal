<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Register TagPrefix="cmn" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ImportSettings_Payment.ascx.cs" Inherits="Jenzabar.Portal.Framework.Web.PortletModules.FormBuilder.Importing.ImportSettings_Payment" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<div class="FormBuilder">
	<div class="MainHeader MainHeaderSecondary">
		<h4><i><%= Globalizer.GetGlobalizedString("LBL_FORM_BUILDER") %></i> <span id="spnFormName" runat="server" /></h4>
	</div>
	<div class="pSection">
		<cmn:SuperBreadcrumbs ID="brdCrumbs" runat="server" />
		<h5><strong>
			<cmn:GlobalizedLiteral Runat="server" TextKey="FORMBUILDER_FORM_SETTINGS_PAYMENT_LBL" id="glBodyTitle" />
		</strong></h5>
		<p class="hint">
			<%=Globalizer.GetGlobalizedString("FB_IMPORT_HINTCANNOTEDIT_TXT")%>
		</p>
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
					<td align="right"><cmn:FormLabel id="flCodes" runat="server" TextKey="FORMBUILDER_FORM_SETTINGS_PAYMENTCODES_LBL" /></td>
					<td><%= Globalizer.Format( "FORMBUILDER_FORM_SETTINGS_PAYMENTNUMWC_TXT", totalWC ) %></td>
				</tr>
				<tr>
					<td align="right"><cmn:FormLabel id="flFeeAmt" runat="server" TextKey="FORMBUILDER_FORM_SETTINGS_PAYMENTFEEAMT_LBL" /></td>
					<td><asp:Literal ID="litFeeAmt" Runat="server" /></td>
				</tr>
				<tr>
					<td align="right"><cmn:FormLabel id="flTransCode" runat="server" TextKey="FORMBUILDER_FORM_SETTINGS_PAYMENTTRANSCODE_LBL" /></td>
					<td><asp:Literal ID="litTransCode" Runat="server" /></td>
				</tr>
				<tr>
					<td align="right"><cmn:FormLabel id="flPayAuth" runat="server" TextKey="FORMBUILDER_FORM_SETTINGS_PAYMENTPAYAUTH_LBL" /></td>
					<td>
						<asp:RadioButtonList ID="rblPayAuth" Runat="server" Enabled="False" />
						<dd>
							<cmn:FormLabel id="flEmail" runat="server" TextKey="FORMBUILDER_FORM_SETTINGS_PAYMENTEMAIL_LBL" /> &nbsp; 
							<asp:Literal ID="litEmail" Runat="server" />
						</dd>
						<dd>
							<asp:CheckBox ID="cbAllowPay" Runat="server" Enabled="False" /> <cmn:FormLabel id="flAllowPay" runat="server" TextKey="FORMBUILDER_FORM_SETTINGS_PAYMENTALLOWPAY_TXT" />
						</dd>
					</td>
				</tr>
				<tr>
					<td align="right"><cmn:FormLabel id="flTxtSelect" runat="server" TextKey="FORMBUILDER_FORM_SETTINGS_PAYMENTTXTSELECT_LBL" /></td>
					<td>
						<i><cmn:Hint id="hintTxtSelectBlurb" runat="server" TextKey="FORMBUILDER_FORM_SETTINGS_PAYMENTTXTSELECT_TXT" /></i>
						<asp:Literal ID="litTxtSelect" Runat="server" />
					</td>
				</tr>
				<tr>
					<td align="right"><cmn:FormLabel id="flTxtPay" runat="server" TextKey="FORMBUILDER_FORM_SETTINGS_PAYMENTTXTPAY_LBL" /></td>
					<td>
						<i><cmn:Hint id="hintTxtPayBlurb" runat="server" TextKey="FORMBUILDER_FORM_SETTINGS_PAYMENTTXTPAY_TXT" /></i>
						<asp:Literal ID="litTxtPay" Runat="server" />
					</td>
				</tr>
			</table>
		</fieldset>
		<cmn:GlobalizedButton ID="btnImport" Runat="server" TextKey="FB_IMPORT_SETTINGS_TXT" /> &nbsp;
		<cmn:GlobalizedButton ID="btnCancel" Runat="server" TextKey="FORMBUILDER_FORM_SETTINGS_CANCEL_BTN" CausesValidation="False" /> &nbsp; 
		<a id="lnkBack" runat="server"><%=Globalizer.GetGlobalizedString("TXT_BACK")%></a>
	</div>
</div>
