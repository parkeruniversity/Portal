<%@ Register TagPrefix="cc1" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="RequisitionEntry.ascx.cs" Inherits="Jenzabar.CRM.Staff.Web.Portlets.RequisitionEntryPortlet.RequisitionEntry"  %>
<input id="hdnOBInfoCtlIdNum" type="hidden" runat="server" NAME="hdnOBInfoCtlIdNum">
<input id="hdnCtlIdNum" type="hidden" runat="server" NAME="hdnCtlIdNum"> <input id="hdnOBLinkCtlID" type="hidden" runat="server" NAME="hdnOBLinkCtlID">
<input id="hdnFocus" type="hidden" runat="server" NAME="hdnFocus">
<TABLE id="tblDataEntryControls" cellPadding="3" width="100%" height="100%" cellSpacing="3">
	<TBODY>
		<TR>
			<TD noWrap colSpan="4">
				<TABLE id="tblError" height="0" cellSpacing="1" cellPadding="1" border="0" runat="server"
					visible="false">
					<TR>
						<TD><asp:label id="lblErrorValidation" Visible="true" Runat="server" CssClass="PortletError"></asp:label></TD>
					</TR>
					<TR>
						<TD><asp:label id="lblErrDisplay" Visible="true" Runat="server" Font-Bold="True"></asp:label></TD>
					</TR>
					<TR>
						<TD><asp:label id="labelwarning" Visible="true" Runat="server" Font-Bold="True"></asp:label></TD>
					</TR>
					<TR>
						<TD><asp:checkbox id="cbxOverRide" Visible="true" Runat="server" Font-Bold="True"></asp:checkbox></TD>
					</TR>
				</TABLE>
			</TD>
		</TR>
		<tr>
			<td colSpan="4">
				<h4><asp:label id="lblEnterNewReq" runat="server"></asp:label></h4>
			</td>
		</tr>
		<TR>
			<TD colSpan="4">
				<H6><asp:label id="lblBasicInfo" runat="server" Width="615px"></asp:label></H6>
			</TD>
		</TR>
		<TR>
			<TD colSpan="4">
				<TABLE id="tblMain" cellSpacing="1" cellPadding="1" width="300" border="0" runat="server">
					<TR>
						<TD>
							<TABLE id="tblDate" cellSpacing="1" cellPadding="1" width="300" border="0">
								<TR>
									<TD><asp:label id="TXT_ENTERED_DATE" Runat="server"></asp:label></TD>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<TD><asp:label id="TXT_NEED_BY_DATE" Runat="server"></asp:label></TD>
								</TR>
								<TR>
									<TD><jenzabar:datepicker id="DatePicker3" tabIndex="0" runat="server"></jenzabar:datepicker></TD>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<TD><jenzabar:datepicker id="DatePicker4" tabIndex="0" runat="server"></jenzabar:datepicker></TD>
								</TR>
							</TABLE>
						</TD>
					</TR>
				</TABLE>
			</TD>
		</TR>
		<TR>
			<TD>
				<TABLE id="tblDesc" cellSpacing="1" cellPadding="1" width="300" border="0" runat="server">
					<TR>
						<TD><asp:label id="TXT_DESCRIPTION" Runat="server"></asp:label></TD>
					</TR>
					<TR>
						<TD><asp:textbox id="colDescription" tabIndex="0" Runat="server" Width="615px"></asp:textbox></TD>
					</TR>
				</TABLE>
			</TD>
		</TR>
		<TR>
			<TD>
				<TABLE id="tblReqBy" cellSpacing="1" cellPadding="1" border="0" runat="server">
					<TR>
						<TD><asp:label id="lblReqBy" Runat="server"></asp:label></TD>
					</TR>
					<TR>
						<TD><asp:textbox id="txtReqBy" Runat="server"></asp:textbox></TD>
					</TR>
				</TABLE>
			</TD>
		</TR>
		<TR>
			<TD>
				<TABLE id="tblVendorInfo" cellSpacing="1" cellPadding="1" border="0" runat="server">
					<TR>
						<TD><asp:label id="TXT_SUGGESTED_VENDOR" Runat="server"></asp:label></TD>
						<TD></TD>
						<TD><asp:label id="lblVendorID" Runat="server">Vendor ID </asp:label></TD>
						<TD></TD>
					</TR>
					<TR>
						<TD><asp:textbox id="colSuggestedVendor" Runat="server" ></asp:textbox></TD>
						<TD></TD>
						<TD><asp:textbox id="txtVendorID" Runat="server" ></asp:textbox></TD>
						<TD><asp:button id="Button_vendor" tabIndex="100" runat="server"></asp:button></TD>
					</TR>
				</TABLE>
			</TD>
		</TR>
		<TR>
			<TD>
				<TABLE id="tblVendorComment" cellSpacing="1" cellPadding="1" width="300" border="0" runat="server">
					<TR>
						<TD><asp:label id="lblCommentVendorInfo" runat="server"></asp:label></TD>
					</TR>
					<TR>
						<TD><asp:textbox id="txtCommentVendorInfo" tabIndex="0" Runat="server" Width="615px" TextMode="MultiLine"
								Height="63px"></asp:textbox></TD>
					</TR>
				</TABLE>
			</TD>
		</TR>
		<TR>
			<TD>
				<TABLE id="tblCampBldgRoom" cellSpacing="1" cellPadding="1" width="300" border="0" runat="server">
					<TR>
						<TD colspan="3"><asp:label id="lblDeliverToDD" runat="server"></asp:label></TD>
						<TD></TD>
						<TD></TD>
					</TR>
					<TR>
						<TD><asp:dropdownlist id="ddlCampus" runat="server" Width="175px" AutoPostBack="True"></asp:dropdownlist></TD>
						<TD><asp:dropdownlist id="ddlBldg" runat="server" Width="175px" AutoPostBack="True"></asp:dropdownlist></TD>
						<TD><asp:dropdownlist id="ddlRoom" runat="server" Width="175px"></asp:dropdownlist></TD>
					</TR>
				</TABLE>
			</TD>
		</TR>
		<TR>
			<TD>
				<TABLE id="tblDeliverToID" cellSpacing="1" cellPadding="1" width="300" border="0" runat="server">
					<TR>
						<TD><asp:label id="lblDeliverToID" Runat="server"></asp:label></TD>
					</TR>
					<TR>
						<TD><asp:textbox id="txtDeliverToID" Runat="server"></asp:textbox></TD>
					</TR>
				</TABLE>
			</TD>
		</TR>
		<TR>
			<TD>
				<TABLE id="tblDeliverToAddress" cellSpacing="1" cellPadding="1" border="0" runat="server">
					<TR>
						<TD><asp:label id="lblDeliverToName" Runat="server"></asp:label></TD>
					</TR>
					<TR>
						<TD><asp:dropdownlist id="ddlDeliverTo" tabIndex="0" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DDDeliverTo_SelectedIndexChanged"></asp:dropdownlist></TD>
					</TR>
					<TR>
						<TD><asp:label id="TXT_DELIVER_TO_ADDRESS_1" Runat="server"></asp:label></TD>
					</TR>
					<TR>
						<TD><asp:textbox id="colAddress1" tabIndex="0" Runat="server" Width="300" ReadOnly="True"></asp:textbox></TD>
					</TR>
					<TR>
						<TD><asp:label id="TXT_DELIVER_TO_ADDRESS_2" Runat="server"></asp:label></TD>
					</TR>
					<TR>
						<TD><asp:textbox id="colAddress2" tabIndex="0" Runat="server" Width="300" ReadOnly="True"></asp:textbox></TD>
					</TR>
					<TR>
						<TD><asp:label id="TXT_DELIVER_TO_ADDRESS_3" Runat="server"></asp:label></TD>
					</TR>
					<TR>
						<TD><asp:textbox id="colAddress3" tabIndex="0" Runat="server" Width="300" ReadOnly="True"></asp:textbox></TD>
					</TR>
				</TABLE>
			</TD>
		</TR>
		<TR>
			<TD></TD>
		</TR>
		<TR>
			<TD>
				<TABLE id="tblShipIns" cellSpacing="1" cellPadding="1" border="0" runat="server">
					<TR>
						<TD><asp:label id="TXT_SHIPPING_INSTRUCTIONS" Runat="server"></asp:label></TD>
					</TR>
					<TR>
						<TD><asp:textbox id="colInst" tabIndex="0" Runat="server" Width="500"></asp:textbox></TD>
					</TR>
				</TABLE>
			</TD>
		</TR>
		<TR>
			<TD>
				<TABLE id="tblREFreight" runat="server">
					<TR>
						<TD noWrap height="20"><asp:label id="lblFreight" runat="server"></asp:label></TD>
						<TD>&nbsp;</TD>
						<TD noWrap height="20"><asp:label id="lblFreightUnits" runat="server"></asp:label></TD>
					</TR>
					<TR>
						<TD noWrap><asp:textbox id="txtFreight" runat="server"></asp:textbox></TD>
						<TD>&nbsp;</TD>
						<TD noWrap><asp:dropdownlist id="ddlFreightUnits" runat="server"></asp:dropdownlist></TD>
					</TR>
				</TABLE>
			</TD>
		</TR>
		<TR>
			<TD>
				<TABLE id="tblREDisc" runat="server">
					<TR>
						<TD noWrap height="20"><asp:label id="lblDisc" runat="server"></asp:label></TD>
						<TD>&nbsp;</TD>
						<TD noWrap height="20"><asp:label id="lblDiscUnits" runat="server"></asp:label></TD>
					</TR>
					<TR>
						<TD noWrap><asp:textbox id="txtDisc" runat="server"></asp:textbox></TD>
						<TD>&nbsp;</TD>
						<TD noWrap><asp:dropdownlist id="ddlDiscUnits" runat="server"></asp:dropdownlist></TD>
					</TR>
				</TABLE>
			</TD>
		</TR>
		<tr>
			<td>
				<TABLE id="tblAT" runat="server">
					<TR>
						<TD noWrap><asp:label id="lblAT" runat="server"></asp:label></TD>
					</TR>
					<TR>
						<TD noWrap colSpan="3"><asp:dropdownlist id="ddlAT" runat="server"></asp:dropdownlist></TD>
					</TR>
				</TABLE>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<TR>
			<TD colSpan="4">
				<H6><asp:label id="lblItemsReq" runat="server"></asp:label></H6>
			</TD>
		</TR>
		<TR>
			<TD noWrap colSpan="4">
				<asp:repeater id="Repeater1" runat="server">
					<itemtemplate>
						<table id="tblRepMain" cellSpacing="2" cellPadding="0" border="0">
							<tr>
								<td>
									<table id="tblCheckBox" cellpadding="1" border="0">
										<tr>
											<td>&nbsp</td>
										</tr>
										<tr>
											<td valign="top"><asp:checkbox id="cbxDelete" Runat="server" TabIndex="0"></asp:checkbox></td>
										</tr>
									</table>
								</td>
								<td colspan="4">
									<table id="tblQty" runat="server" border="0" cellpadding="1">
										<tr>
											<td align="left">
												<jenzabar:GlobalizedLabel id="lblQuantity" Runat="server" Height="15px"></jenzabar:GlobalizedLabel></td>
											<td>
												<jenzabar:GlobalizedLabel id="lblItemRequested" Runat="server" TextKey="TXT_REQENT_ITEM_REQUESTED"></jenzabar:GlobalizedLabel></td>
											<td>
												<jenzabar:GlobalizedLabel id="lblUnit" Runat="server" TextKey="TXT_REQENT_UNIT" Height="15px"></jenzabar:GlobalizedLabel></td>
											<td>
												<jenzabar:GlobalizedLabel id="lblUnitPrice" Runat="server" Height="15px"></jenzabar:GlobalizedLabel></td>
											<td>
												<jenzabar:GlobalizedLabel id="lblTotalPrice" Runat="server" TextKey="TXT_REQENT_TOTAL_PRICE" Height="15px"></jenzabar:GlobalizedLabel></td>
										</tr>
										<tr>
											<td align="left">
												<asp:textbox id="txtQuantity" Runat="server" Width="25" TabIndex="0" MaxLength='10' onFocus="this.select()"></asp:textbox></td>
											<td align="left">
												<asp:textbox id="colItemRequested" Runat="server" Width="250" TabIndex="0" onFocus="this.select()"></asp:textbox></td>
											<td align="left">
												<asp:textbox id="txtUnit" Runat="server" Width="100" TabIndex="0" onFocus="this.select()"></asp:textbox></td>
											<td align="left">
												<asp:textbox id="txtUnitPrice" Runat="server" Width="100" TabIndex="0" MaxLength='10' onFocus="this.select()"></asp:textbox></td>
											<td align="left">
												<asp:textbox id="txtTotalPrice" Runat="server" Enabled="true" Width="100" BackColor="#E0E0E0"></asp:textbox></td>
											<td align="left">
												<asp:textbox id="colItemCode" Runat="server" Height="0px" Width="0px" BorderStyle="None" ReadOnly="True"
													style="visibility: hidden;"></asp:textbox></td>
											<td align="left">
												<asp:textbox id="txtSeqNum" Runat="server" Height="0px" Width="0px" BorderStyle="None" style="visibility: hidden;"></asp:textbox></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<asp:PlaceHolder id="PH" runat="server"></asp:PlaceHolder></td>
							</tr>
							<tr>
								<td>&nbsp</td>
								<td nowrap>
									<table id="tblLblProject2" runat="server" visible="false">
										<tr>
											<td><jenzabar:GlobalizedLabel id="lblProject2" Runat="server" TextKey="TXT_REQENT_PROJECT" Height="15px"></jenzabar:GlobalizedLabel></td>
										</tr>
										<tr>
											<td><asp:dropdownlist id="ddlbProject2" Runat="server"></asp:dropdownlist></td>
										</tr>
									</table>
									<table id="tblLblProject" runat="server" border="0" visible="false">
										<tr>
											<td><jenzabar:GlobalizedLabel id="lblCN" Runat="server" TextKey="TXT_REQENT_CATALOG_NUMBER_ABBREV" Height="15px"></jenzabar:GlobalizedLabel></td>
											<td><jenzabar:GlobalizedLabel id="lblProject" Runat="server" TextKey="TXT_REQENT_PROJECT" Height="15px"></jenzabar:GlobalizedLabel></td>
										</tr>
										<tr>
											<td><asp:textbox id="txtCN" Runat="server" TabIndex="0" onFocus="this.select()"></asp:textbox></td>
											<td><asp:dropdownlist id="ddlbProject" Runat="server"></asp:dropdownlist></td>
											<td><jenzabar:GlobalizedButton id="getItems" Runat="server" TextKey="TXT_REQENT_GET_ITEMS" TabIndex="101"></jenzabar:GlobalizedButton></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>&nbsp</td>
								<td colspan="4" align="left">
									<table id="tblLIFreightDisc" runat="server" border="0">
										<tr>
											<td><asp:label id="lblLIFreight" runat="server"></asp:label></td>
											<td><asp:label id="lblLIFreightUnits" runat="server"></asp:label></td>
											<td><asp:label id="lblLIDisc" runat="server"></asp:label></td>
											<td><asp:label id="lblLIDiscUnits" runat="server"></asp:label></td>
											<td><jenzabar:GlobalizedLabel id="lblTotalPrice2" Runat="server" TextKey="TXT_REQENT_TOTAL_PRICE" Height="15px"></jenzabar:GlobalizedLabel></td>
										</tr>
										<tr>
											<td><asp:textbox id="txtLIFreight" runat="server" onFocus="this.select()"></asp:textbox></asp:label></td>
											<td><asp:dropdownlist id="ddlLIFreightUnits" runat="server"></asp:dropdownlist></asp:label></td>
											<td><asp:textbox id="txtLIDisc" runat="server" onFocus="this.select()"></asp:textbox></asp:label></td>
											<td><asp:dropdownlist id="ddlLIDiscUnits" runat="server"></asp:dropdownlist></asp:label></td>
											<td><asp:textbox id="txtTotalPrice2" Runat="server" Width="100" BackColor="#E0E0E0"></asp:textbox></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td colspan="10">&nbsp</td>
							</tr>
							<tr>
								<td>&nbsp</td>
								<td colspan="10">
									<table id="tblAcctCodeLabels" Width="100%" runat="server">
										<tr>
											<td><jenzabar:GlobalizedLabel id="lblAccountCode" Runat="server" Height="15px"></jenzabar:GlobalizedLabel>
												<asp:LinkButton id="lnkAcctSelect" runat="server">Select</asp:LinkButton>
											</td>
										</tr>
										<tr>
											<td>
												<asp:textbox id="txtAcctCode" Runat="server" Height="15px" Width="253px" Visible="true"></asp:textbox>
												&nbsp<asp:Label ID="lblAcctErrorTypeDisp" Runat="server"></asp:Label>
											</td>
											<td colspan="3" align="right" valign="top"><jenzabar:GlobalizedButton id="getItems2" Runat="server" TextKey="TXT_REQENT_GET_ITEMS" TabIndex="101"></jenzabar:GlobalizedButton></td>
											<td><asp:LinkButton id="lnkOverBudget" runat="server" visible="False" Width="0px">Over Budget</asp:LinkButton></td>
											<td><asp:textbox id="txtOBInfo" Runat="server" width="0px" visible="False"></asp:textbox></td>
										</tr>
										<tr>
											<td colspan="4">
												<jenzabar:GlobalizedLabel id="lblDescription" TextKey="TXT_DESCRIPTION" Runat="server" width='615px' Height="15px"
													visible="true"></jenzabar:GlobalizedLabel>
											</td>
										</tr>
										<tr>
											<td colspan="4">
												<asp:textbox id="txtDesc" Runat="server" width='99%' Height="63px" Visible="True" TabIndex="0"
													Wrap="True" TextMode="MultiLine"></asp:textbox>
											</td>
										</tr>
										<tr>
											<td colspan="4">
												<jenzabar:GlobalizedLabel id="lblComments" TextKey="TXT_REQENT_COMMENTS" Runat="server" Height="15px" visible="true"></jenzabar:GlobalizedLabel>
											</td>
										</tr>
										<tr>
											<td colspan="4">
												<asp:textbox id="txtComments" Runat="server" Width="99%" Height="63px" Visible="True" TabIndex="0"></asp:textbox>
											</td>
										</tr>
									</table>
								</td>
							</tr>
			</TD>
		</TR>
		<tr>
			<td colspan="10">&nbsp</td>
		</tr>
		<tr>
			<td colSpan="1">
				<asp:textbox id="ID1" Runat="server" Visible="False" style="visibility: hidden;"></asp:textbox></td>
			<td colSpan="5">
				<asp:textbox id="ID2" Runat="server" Visible="False" style="visibility: hidden;"></asp:textbox></td>
		</tr>
		<tr>
		</tr>
		<tr>
			<td colspan="10" nowrap><div id="divRepeater" style="border-bottom: 1px dashed #6272A8; ">
			</td>
		</tr>
		<tr>
			<td colspan="10">&nbsp</td>
		</tr>
</TABLE>
</itemtemplate> </asp:repeater></TD></TR>
<TR>
	<TD colSpan="4">
		<TABLE id="tblLnkAddDelete" runat="server">
			<TR>
				<TD>
					<asp:Label id="lblRequiredFields" runat="server"></asp:Label></TD>
				<TD></TD>
				<TD></TD>
				<TD></TD>
				<TD></TD>
			</TR>
			<TR>
				<TD>&nbsp;</TD>
				<TD></TD>
				<TD></TD>
				<TD></TD>
				<TD></TD>
			</TR>
			<tr>
				<td><jenzabar:ImageAndTextButton ID="btnAddAnother" CommandName="ADDANOTHER" TextKey="TXT_ADD_ANOTHER_ITEM" Runat="server" /></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td><asp:ImageButton id="imgDeleteSel2" runat="server"></asp:ImageButton>
					<asp:LinkButton id="btnDeleteSel2" runat="server"></asp:LinkButton></td>
			</tr>
		</TABLE>
	</TD>
</TR>
<TR>
	<TD colSpan="4">
		<TABLE id="tblGrandTotal" runat="server">
			<TR>
				<TD><asp:label id="lblHeaderTotal" Visible="True" Runat="server"></asp:label></TD>
			</TR>
			<TR>
				<TD><asp:textbox id="colHeaderTotal" Enabled="true" Visible="True" Runat="server" BackColor="#E0E0E0"></asp:textbox></TD>
			</TR>
		</TABLE>
	</TD>
</TR>
<TR>
	<TD colSpan="4">
		<TABLE id="tblButtons" runat="server">
			<TR>
				<TD><asp:button id="Button_submit" tabIndex="0" runat="server"></asp:button></TD>
				<TD>&nbsp;</TD>
				<TD>&nbsp;</TD>
				<TD>&nbsp;</TD>
				<TD><asp:button id="Button_cancel" tabIndex="0" runat="server"></asp:button></TD>
				<TD><asp:button id="Button_add" tabIndex="0" runat="server" Visible="False"></asp:button></TD>
				<TD><asp:button id="Button_delete" tabIndex="0" runat="server" Visible="False"></asp:button></TD>
			</TR>
		</TABLE>
	</TD>
</TR>
<tr>
	<td><asp:placeholder id="plcJavaScriptCache" Runat="server"></asp:placeholder><asp:placeholder id="plcJavaScriptTotalCache" Runat="server"></asp:placeholder></td>
</tr>
</TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
