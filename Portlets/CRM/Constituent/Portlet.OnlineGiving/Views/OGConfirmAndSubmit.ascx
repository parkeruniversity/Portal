<%@ Control Language="c#" AutoEventWireup="True" Codebehind="OGConfirmAndSubmit.ascx.cs" Inherits="Jenzabar.CRM.Constituent.Web.Portlets.OnlineGivingPortlet.OGConfirmAndSubmit" %>
<%@ import namespace="Jenzabar.CRM.Constituent.Web.Portlets.OnlineGivingPortlet" %>

<asp:table id="Table3" Runat="server" BorderStyle="None" Width="100%">
	<asp:TableRow ID="Tablerow6" Runat="server">
	<asp:TableCell Runat=server>
<asp:table id=tblHeaderLinks Runat="server" BorderStyle="None" Width="100%">
	<asp:TableRow ID="trHeaderLinks" Runat="server">
		<asp:TableCell ID="tcVerifyLink" HorizontalAlign="Left" BackColor=LightGrey Width="30%" Runat="server">
			<asp:linkbutton id="lnkVerifyPersInfo" Runat="server"></asp:linkbutton>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell1" HorizontalAlign="Left" BackColor=LightGrey Width="30%" Runat="server">
			<asp:linkbutton id="lnkGiveGiftorPledge" Runat="server"></asp:linkbutton>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell2" HorizontalAlign="Left" BackColor=White Width="30%" Runat="server">
			<asp:linkbutton id="lnkSubmitGifts" Runat="server"></asp:linkbutton>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell17" HorizontalAlign="Left" BackColor=LightGrey Width="30%" Runat="server">
		</asp:TableCell>
	</asp:TableRow>
</asp:table>
<asp:table id=tblGivingReview Runat="server" BorderStyle="None" Width="100%">
	<asp:TableRow ID="trGivingReview" Runat="server">
		<asp:TableCell ID="tcGivingReviewHead" Width="20%" HorizontalAlign="Left" VerticalAlign=Middle Runat="server">
			<asp:label id="lblGivingReview" Font-Bold=True Runat="server"></asp:label>
		</asp:TableCell>
		<asp:TableCell ID="tcGivingReviewText" Width="60%" HorizontalAlign="Left" VerticalAlign=Middle Runat="server">
			<asp:label id="lblGivingReviewText" Runat="server"></asp:label>
		</asp:TableCell>
		<asp:TableCell ID="tcConfirmButton" Width="20%" HorizontalAlign="Center" VerticalAlign=Middle Runat="server">
			<asp:Button id="btnConfirm" Runat="server"></asp:Button>
		</asp:TableCell>
	</asp:TableRow>
	<asp:TableRow>
		<asp:TableCell ColumnSpan=3><hr \></asp:TableCell>
	</asp:TableRow>
</asp:table>
<asp:table id=tblGift Runat="server" Width="100%">
	<asp:TableRow ID="trGift" Width="100%" Runat="server">
		<asp:TableCell ID="tcGift" Width="100%" Runat="server">
			<asp:Repeater ID="repGift" OnItemCommand="Button_EditRemove" OnPreRender="repGift_OnPreRender" OnItemDataBound="repGift_ItemDataBound" Runat="server">
				<HeaderTemplate>
				</HeaderTemplate>
				<ItemTemplate>
					<asp:Table ID="tblGiftItem" Runat="server">
						<asp:TableRow ID="Tablerow1" Width="100%" Runat="server">
							<asp:TableCell Width="20%" Font-Bold=True Runat="server" HorizontalAlign=Center ID="Tablecell3">
<asp:Label ID="Label1" Runat="server" Text='<%# OGMessages.TXT_GIVING_OPTION %>'></asp:Label></asp:TableCell>
							<asp:TableCell Width="35%" Font-Bold=True Runat="server" HorizontalAlign=Center ID="Tablecell4">
<asp:Label ID="Label2" Runat="server" Text='<%# OGMessages.TXT_DESIGNATION %>'></asp:Label></asp:TableCell>
							<asp:TableCell Width="15%" Font-Bold=True Runat="server" HorizontalAlign=Center ID="Tablecell5">
<asp:Label ID="Label3" Runat="server" Text='<%# OGMessages.TXT_PLEDGED %>'></asp:Label></asp:TableCell>
							<asp:TableCell Width="15%" Font-Bold=True Runat="server" HorizontalAlign=Center ID="Tablecell6">
<asp:Label ID="Label4" Runat="server" Text='<%# OGMessages.TXT_TODAYS_GIFT %>'></asp:Label></asp:TableCell>
							<asp:TableCell Width="15%" Font-Bold=True Runat="server" HorizontalAlign=Center ID="Tablecell7">
<asp:Label ID="Label5" Runat="server"></asp:Label></asp:TableCell>
						</asp:TableRow>	
						<asp:TableRow ID="trGiftItemGivOptR1" Width="100%" Runat="server">
							<asp:TableCell Width="20%" Runat="server" VerticalAlign=Top>
								<asp:Table Runat="server">
									<asp:TableRow Runat=server>
<asp:TableCell VerticalAlign=Top Runat=server>
<asp:Label Runat=server ID="lblGiftItemGftPlg" Text='<%# DataBinder.Eval(Container.DataItem, "gcGiftType") %>' Font-Bold=True></asp:Label></asp:TableCell></asp:TableRow>
									<asp:TableRow Runat="server">
<asp:TableCell VerticalAlign=Top Runat="server">
<asp:Label ID="lblGiftItemApplyToPlg" Text='<%# DataBinder.Eval(Container.DataItem, "gcApplyToPledge") %>' Runat="server"></asp:Label></asp:TableCell></asp:TableRow>
								</asp:Table>
							</asp:TableCell>
							<asp:TableCell Width="35%" Runat="server">
								<asp:Table Runat="server">
									<asp:TableRow Runat="server">
<asp:TableCell VerticalAlign=Top HorizontalAlign=Left Runat="server">
<asp:Label ID="lblGiftItemOptDesc" Text='<%# DataBinder.Eval(Container.DataItem, "gcOptDesc") %>' Runat="server"></asp:Label></asp:TableCell></asp:TableRow>
									<asp:TableRow Runat="server">
<asp:TableCell VerticalAlign=Top HorizontalAlign=Left Runat="server">
<asp:Label ID="lblGiftItemCatDesc" Text='<%# DataBinder.Eval(Container.DataItem, "gcCatDesc") %>' Runat="server"></asp:Label></asp:TableCell></asp:TableRow>
									<asp:TableRow Runat="server" ID="Tablerow7">
<asp:TableCell VerticalAlign=Top HorizontalAlign=Left Runat="server" ID="Tablecell19">
<asp:Label ID="Label14" Text='<%# DataBinder.Eval(Container.DataItem, "gcDesgDesc") %>' Runat="server"></asp:Label></asp:TableCell></asp:TableRow>
									<asp:TableRow Runat="server">
<asp:TableCell VerticalAlign=Top HorizontalAlign=Left Runat="server">
<asp:Label ID="lblGiftItemInHonorOfName" Text='<%# DataBinder.Eval(Container.DataItem, "gcInHonorOfName") %>' Runat="server"></asp:Label></asp:TableCell></asp:TableRow>
									<asp:TableRow Runat="server">
<asp:TableCell VerticalAlign=Top HorizontalAlign=Left Runat="server">
<asp:Label ID="lblGiftItemNotNameCat" Text='<%# DataBinder.Eval(Container.DataItem, "gcNotNameCat") %>' Runat="server"></asp:Label></asp:TableCell></asp:TableRow>
									<asp:TableRow Runat="server">
<asp:TableCell VerticalAlign=Top HorizontalAlign=Left Runat="server">
<asp:Label ID="lblGiftItemNotAddr1" Text='<%# DataBinder.Eval(Container.DataItem, "gcNotAddr1") %>' Runat="server"></asp:Label></asp:TableCell></asp:TableRow>
									<asp:TableRow Runat="server">
<asp:TableCell VerticalAlign=Top HorizontalAlign=Left Runat="server">
<asp:Label ID="lblGiftItemNotAddr2" Text='<%# DataBinder.Eval(Container.DataItem, "gcNotAddr2") %>' Runat="server"></asp:Label></asp:TableCell></asp:TableRow>
									<asp:TableRow Runat="server">
<asp:TableCell VerticalAlign=Top HorizontalAlign=Left Runat="server">
<asp:Label ID="lblGiftItemNotCitStZip" Text='<%# DataBinder.Eval(Container.DataItem, "gcNotCitStZip") %>' Runat="server"></asp:Label></asp:TableCell></asp:TableRow>
									<asp:TableRow Runat="server">
<asp:TableCell VerticalAlign=Top HorizontalAlign=Left Runat="server">
<asp:Label ID="lblGiftItemNotCountry" Text='<%# DataBinder.Eval(Container.DataItem, "gcNotCountry") %>' Runat="server"></asp:Label></asp:TableCell></asp:TableRow>
									<asp:TableRow Runat="server">
<asp:TableCell VerticalAlign=Top HorizontalAlign=Left Runat="server">
<asp:Label ID="lblGiftItemNotSpecInstTxt" Text="Special Instructions or Requests:" Runat="server"></asp:Label></asp:TableCell></asp:TableRow>
									<asp:TableRow Runat="server">
<asp:TableCell VerticalAlign=Top HorizontalAlign=Left Runat="server">
<asp:Label ID="lblGiftItemNotSpecInst" Text='<%# DataBinder.Eval(Container.DataItem, "gcNotSpecInst") %>' Runat="server"></asp:Label></asp:TableCell></asp:TableRow>
								</asp:Table>
							</asp:TableCell>
							<asp:TableCell HorizontalAlign=Right VerticalAlign=Top Width="15%" Runat="server"></asp:TableCell>
							<asp:TableCell Width="15%" HorizontalAlign=Right VerticalAlign=Top Runat="server">
								<asp:Table Runat="server">
									<asp:TableRow Runat="server">
<asp:TableCell HorizontalAlign=Right VerticalAlign=Top Runat="server">
<asp:Label ID="lblGiftItemAmtToday" Text='<%# DataBinder.Eval(Container.DataItem, "gcGftAmt") %>' Runat="server"></asp:Label></asp:TableCell></asp:TableRow>
								</asp:Table>
							</asp:TableCell>
							<asp:TableCell Width="15%" HorizontalAlign=Right VerticalAlign=Top Runat="server">
								<asp:Table Runat="server">
									<asp:TableRow Runat="server">
<asp:TableCell HorizontalAlign=Right VerticalAlign=Top Runat="server">
<asp:Button visible=true ID="Edit" Text='<%# OGMessages.TXT_EDIT %>' Runat=server CommandName='<%# DataBinder.Eval(Container.DataItem, "gcEditCmd") %>'></asp:Button></asp:TableCell></asp:TableRow>
									<asp:TableRow Runat="server">
<asp:TableCell HorizontalAlign=Right VerticalAlign=Top Runat="server">
<asp:Button ID="Remove" Text='<%# OGMessages.TXT_REMOVE %>' Runat="server" CommandName='<%# DataBinder.Eval(Container.DataItem, "gcRemoveCmd") %>'></asp:Button></asp:TableCell></asp:TableRow>
								</asp:Table>
							</asp:TableCell>
						</asp:TableRow>
					</asp:Table>
				</ItemTemplate>
				<SeparatorTemplate>
					<asp:Table Width=100% Runat=server>
						<asp:TableRow HorizontalAlign=Right VerticalAlign=Top Runat="server">
<asp:TableCell HorizontalAlign=Right Width="100%" VerticalAlign=Top Runat="server"><hr \></asp:TableCell></asp:TableRow>
					</asp:Table>
				</SeparatorTemplate>
				<FooterTemplate>
				</FooterTemplate>
			</asp:Repeater>
		</asp:TableCell>
	</asp:TableRow>
</asp:Table>
<asp:Table Runat=server>
	<asp:TableRow HorizontalAlign=Right VerticalAlign=Top Runat="server" ID="Tablerow4">
<asp:TableCell HorizontalAlign=Right Width="100%" VerticalAlign=Top Runat="server" ID="Tablecell16"><hr \></asp:TableCell></asp:TableRow>
</asp:Table>
<asp:table id="Table2" Runat="server" Width="100%">
	<asp:TableRow ID="Tablerow5" Width="100%" Runat="server">
		<asp:TableCell ID="Tablecell18" Width="100%" Runat="server">
			<asp:Repeater ID="repPledge" OnItemCommand="Button_EditRemove" OnLoad="repPledge_OnLoad" OnItemDataBound="repPledge_ItemDataBound" Runat="server">
				<HeaderTemplate>
				</HeaderTemplate>
				<ItemTemplate>
					<asp:Table ID="tblPledgeItem" Runat="server">
						<asp:TableRow ID="Tablerow2" Width="100%" Runat="server">
							<asp:TableCell Width="20%" Font-Bold=True Runat="server" HorizontalAlign=Center ID="Tablecell8">
<asp:Label ID="Label6" Runat="server" Text='<%# OGMessages.TXT_GIVING_OPTION %>'></asp:Label></asp:TableCell>
							<asp:TableCell Width="35%" Font-Bold=True Runat="server" HorizontalAlign=Center ID="Tablecell9">
<asp:Label ID="Label7" Runat="server" Text='<%# OGMessages.TXT_DESIGNATION %>'></asp:Label></asp:TableCell>
							<asp:TableCell Width="15%" Font-Bold=True Runat="server" HorizontalAlign=Center ID="Tablecell10">
<asp:Label ID="Label8" Runat="server" Text='<%# OGMessages.TXT_PLEDGED %>'></asp:Label></asp:TableCell>
							<asp:TableCell Width="15%" Font-Bold=True Runat="server" HorizontalAlign=Center ID="Tablecell11" Visible=false>
<asp:Label ID="Label9" Runat="server" Text='<%# OGMessages.TXT_TODAYS_GIFT %>'></asp:Label></asp:TableCell>
							<asp:TableCell Width="15%" Font-Bold=True Runat="server" HorizontalAlign=Center ID="Tablecell12">
<asp:Label ID="Label10" Runat="server"></asp:Label></asp:TableCell>
						</asp:TableRow>	
						<asp:TableRow ID="trPledgeItem" Width="100%" Runat="server">
							<asp:TableCell Width="15%" VerticalAlign=Top HorizontalAlign=Left Runat="server">
								<asp:Table Runat="server">
									<asp:TableRow Runat="server">
<asp:TableCell>
<asp:Label ID="lblPledgeItemGftTyp" Text='<%# DataBinder.Eval(Container.DataItem, "gcGiftType") %>' Font-Bold=True Runat="server"></asp:Label></asp:TableCell></asp:TableRow>
								</asp:Table>
							</asp:TableCell>
							<asp:TableCell HorizontalAlign=Left VerticalAlign=Top Width="20%" Runat="server" ID="Tablecell14">
								<asp:Table Runat="server">
									<asp:TableRow Runat="server">
<asp:TableCell VerticalAlign=Top HorizontalAlign=Left Runat="server">
<asp:Label ID="lblPledgeItemOptDesc" Text='<%# DataBinder.Eval(Container.DataItem, "gcOptDesc") %>' Runat="server"></asp:Label><br /></asp:TableCell></asp:TableRow>
									<asp:TableRow Runat="server">
<asp:TableCell VerticalAlign=Top HorizontalAlign=Left Runat="server">
<asp:Label ID="lblPledgeItemCatDesc" Text='<%# DataBinder.Eval(Container.DataItem, "gcCatDesc") %>' Runat="server"></asp:Label><br /></asp:TableCell></asp:TableRow>
									<asp:TableRow Runat="server" ID="Tablerow8">
<asp:TableCell VerticalAlign=Top HorizontalAlign=Left Runat="server" ID="Tablecell20">
<asp:Label ID="Label15" Text='<%# DataBinder.Eval(Container.DataItem, "gcDesgDesc") %>' Runat="server"></asp:Label></asp:TableCell></asp:TableRow>
									<asp:TableRow Runat="server">
<asp:TableCell VerticalAlign=Top HorizontalAlign=Left Runat="server">
<asp:Label ID="lblPledgeItemInHonorOfName" Text='<%# DataBinder.Eval(Container.DataItem, "gcInHonorOfName") %>' Runat="server"></asp:Label><br /></asp:TableCell></asp:TableRow>
									<asp:TableRow Runat="server">
<asp:TableCell VerticalAlign=Top HorizontalAlign=Left Runat="server">
<asp:Label ID="lblPledgeItemNotNameCat" Text='<%# DataBinder.Eval(Container.DataItem, "gcNotNameCat") %>' Runat="server"></asp:Label><br /></asp:TableCell></asp:TableRow>
									<asp:TableRow Runat="server">
<asp:TableCell VerticalAlign=Top HorizontalAlign=Left Runat="server">
<asp:Label ID="lblPledgeItemNotAddr1" Text='<%# DataBinder.Eval(Container.DataItem, "gcNotAddr1") %>' Runat="server"></asp:Label><br /></asp:TableCell></asp:TableRow>
									<asp:TableRow Runat="server">
<asp:TableCell VerticalAlign=Top HorizontalAlign=Left Runat="server">
<asp:Label ID="lblPledgeItemNotAddr2" Text='<%# DataBinder.Eval(Container.DataItem, "gcNotAddr2") %>' Runat="server"></asp:Label><br /></asp:TableCell></asp:TableRow>
									<asp:TableRow Runat="server">
<asp:TableCell VerticalAlign=Top HorizontalAlign=Left Runat="server">
<asp:Label ID="lblPledgeItemNotNotCitStZip" Text='<%# DataBinder.Eval(Container.DataItem, "gcNotCitStZip") %>' Runat="server"></asp:Label><br /></asp:TableCell></asp:TableRow>
									<asp:TableRow Runat="server">
<asp:TableCell VerticalAlign=Top HorizontalAlign=Left Runat="server">
<asp:Label ID="lblPledgeItemNotCountry" Text='<%# DataBinder.Eval(Container.DataItem, "gcNotCountry") %>' Runat="server"></asp:Label><br /></asp:TableCell></asp:TableRow>
									<asp:TableRow Runat="server">
<asp:TableCell VerticalAlign=Top HorizontalAlign=Left Runat="server">
<asp:Label ID="lblPledgeItemNotSpecInstTxt" Text="Special Instructions or Requests:" Runat="server"></asp:Label></asp:TableCell></asp:TableRow>
									<asp:TableRow Runat="server">
<asp:TableCell VerticalAlign=Top HorizontalAlign=Left Runat="server">
<asp:Label ID="lblPledgeItemNotSpecInst" Text='<%# DataBinder.Eval(Container.DataItem, "gcNotSpecInst") %>' Runat="server"></asp:Label><br /></asp:TableCell></asp:TableRow>
								</asp:Table>
							</asp:TableCell>
							<asp:TableCell HorizontalAlign=Right VerticalAlign=Top Width="15%" Runat="server">
								<asp:Table Runat="server">
									<asp:TableRow Runat="server">
										<asp:TableCell HorizontalAlign=Right VerticalAlign=Top Runat="server">
<asp:Label ID="lblPledgeItemTotalText" Text="Total Pledged:" Font-Bold=True Runat="server"></asp:Label></asp:TableCell>
										<asp:TableCell HorizontalAlign=Right VerticalAlign=Top Runat="server">
<asp:Label ID="lblPledgeItemTotalAmt" Text='<%# DataBinder.Eval(Container.DataItem, "gcTotPlgAmt") %>' Runat="server"></asp:Label></asp:TableCell>
									</asp:TableRow>
									<asp:TableRow ID="trInitialPymt" Runat="server" Visible="false" >
										<asp:TableCell HorizontalAlign=Right VerticalAlign=Top Runat="server">
<asp:Label ID="lblPledgeItem1stPymtText" Text="Initial Payment:" Font-Bold=True Runat="server"></asp:Label></asp:TableCell>
										<asp:TableCell HorizontalAlign=Right VerticalAlign=Top Runat="server">
<asp:Label ID="lblPledgeItem1stPymtAmt" Text='<%# DataBinder.Eval(Container.DataItem, "gc1stPymtAmt") %>' Runat="server"></asp:Label></asp:TableCell>
									</asp:TableRow>
									<asp:TableRow Runat="server">
										<asp:TableCell HorizontalAlign=Right VerticalAlign=Top Runat="server">
<asp:Label ID="lblPledgeItemBalPdText" Text="Balance Paid:" Font-Bold=True Runat="server"></asp:Label></asp:TableCell>
										<asp:TableCell HorizontalAlign=Right VerticalAlign=Top Runat="server">
<asp:Label ID="lblPledgeItemBalPdData" Text='<%# DataBinder.Eval(Container.DataItem, "gcPymtSched") %>' Runat="server"></asp:Label></asp:TableCell>
									</asp:TableRow>
									<asp:TableRow Runat="server">
										<asp:TableCell HorizontalAlign=Right VerticalAlign=Top Runat="server">
<asp:Label ID="lblPledgeItemPayAmtText" Text="First Payment:" Font-Bold=True Runat="server"></asp:Label></asp:TableCell>
										<asp:TableCell HorizontalAlign=Right VerticalAlign=Top Runat="server">
<asp:Label ID="lblPledgeItemPayAmt" Text='<%# DataBinder.Eval(Container.DataItem, "gcPlgPymtAmt") %>' Runat="server"></asp:Label><br \>
											<asp:Label ID="Label12" Text='<%# DataBinder.Eval(Container.DataItem, "gc1stPymtMon") %>' Runat="server"></asp:Label>
											<asp:Label Text="/" Runat=server></asp:Label>
											<asp:Label ID="Label11" Text='<%# DataBinder.Eval(Container.DataItem, "gc1stPymtYr") %>' Runat="server"></asp:Label>
										</asp:TableCell>
									</asp:TableRow>
								</asp:Table>
							</asp:TableCell>
							<asp:TableCell HorizontalAlign=Right VerticalAlign=Top Width="15%" Runat="server" ID="Tablecell13">
								<asp:Table Runat="server" ID="Table1">
									<asp:TableRow Runat="server" ID="Tablerow3">
<asp:TableCell HorizontalAlign=Right VerticalAlign=Top Runat="server" ID="Tablecell15" Visible=false>
<asp:Label ID="Label13" Text='<%# DataBinder.Eval(Container.DataItem, "gc1stPymtAmt") %>' Runat="server"></asp:Label></asp:TableCell></asp:TableRow>
								</asp:Table>
							</asp:TableCell>
							<asp:TableCell Width="15%" HorizontalAlign=Right VerticalAlign=Top Runat="server">
								<asp:Table Runat="server">
									<asp:TableRow Runat="server">
<asp:TableCell HorizontalAlign=Right VerticalAlign=Top Runat="server">
<asp:Button visible=true ID="EditPledge" Runat=server Text='<%# OGMessages.TXT_EDIT %>' CommandName='<%# DataBinder.Eval(Container.DataItem, "gcEditCmd") %>'></asp:Button></asp:TableCell></asp:TableRow>
									<asp:TableRow Runat="server">
<asp:TableCell HorizontalAlign=Right VerticalAlign=Top Runat="server">
<asp:Button ID="RemovePledge" Runat="server" Text='<%# OGMessages.TXT_REMOVE %>' CommandName='<%# DataBinder.Eval(Container.DataItem, "gcRemoveCmd") %>'></asp:Button></asp:TableCell></asp:TableRow>
								</asp:Table>
							</asp:TableCell>
						</asp:TableRow>
					</asp:Table>
				</ItemTemplate>
				<SeparatorTemplate>
					<asp:Table Width=100% Runat=server ID="Table4" NAME="Table4">
						<asp:TableRow HorizontalAlign=Right VerticalAlign=Top Runat="server" ID="Tablerow9" NAME="Tablerow9">
<asp:TableCell HorizontalAlign=Right Width="100%" VerticalAlign=Top Runat="server" ID="Tablecell21" NAME="Tablecell21"><hr \></asp:TableCell></asp:TableRow>
					</asp:Table>
				</SeparatorTemplate>
				<FooterTemplate>
				</FooterTemplate>
			</asp:Repeater>
		</asp:TableCell>
	</asp:TableRow>
</asp:table>
<asp:table id=tblError Runat="server" BorderStyle="None" Width="100%" Visible="True">
	<asp:TableRow ID="trError" Visible="False" Runat="server">
		<asp:TableCell>&nbsp;&nbsp;
<asp:label id="lblError" CssClass="PortletError" Runat="server"></asp:label></asp:TableCell>
	</asp:TableRow>
</asp:table>
</asp:TableCell></asp:TableRow></asp:table>
