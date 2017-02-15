<%@ Control Language="c#" AutoEventWireup="false" Codebehind="OGGiveGiftorPledgeDetail.ascx.cs" Inherits="Jenzabar.CRM.Constituent.Web.Portlets.OnlineGivingPortlet.OGGiveGiftorPledgeDetail" %>
<asp:Table ID="Table2" Width="100%" Visible="True" BorderStyle="None" Runat="server">
	<asp:TableRow ID="trHeaderLinks" Visible="True" Runat="server">
		<asp:TableCell id="tcVerifyPersInfo" HorizontalAlign="Center" BackColor="LightGrey" Width="25%" Runat="server">
			<asp:linkbutton id="lnkVerifyPersInfo" Runat="server"></asp:linkbutton>
		</asp:TableCell>
		<asp:TableCell ID="tcGiveGiftorPledge" HorizontalAlign="Center" BackColor="White" Width="25%" Runat="server">
			<asp:linkbutton id="lnkGiveGiftorPledge" Runat="server"></asp:linkbutton>
		</asp:TableCell>
		<asp:TableCell ID="tcSubmitGifts" HorizontalAlign="Center" BackColor="LightGrey" Width="25%" Runat="server">
			<asp:linkbutton id="lnkSubmitGifts" Runat="server"></asp:linkbutton>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell27" HorizontalAlign="Center" BackColor="LightGrey" Width="25%" Runat="server"></asp:TableCell>
	</asp:TableRow>
</asp:Table>
<asp:Table ID="tblError" Visible="True" Width="100%" BorderStyle="None" Runat="server">
	<asp:TableRow ID="trError" Visible="False" Runat="server">
		<asp:TableCell>
			&nbsp;&nbsp;
<asp:label id="lblError" CssClass="PortletError" Runat="server"></asp:label>
		</asp:TableCell>
	</asp:TableRow>
</asp:Table>
<asp:Table ID="Table1" Width="100%" BorderStyle="None" Runat="server">
	<asp:TableRow ID="Tablerow1" Runat="server">
		<asp:TableCell ID="Tablecell4" HorizontalAlign="Left" Width="30%" Runat="server">
			<asp:label id="lblYouHaveChosen" Font-Bold="True" Runat="server"></asp:label>
		</asp:TableCell>
	</asp:TableRow>
	<asp:TableRow ID="Tablerow4" Runat="server">
		<asp:TableCell ID="Tablecell1" HorizontalAlign="Left" Width="30%" Runat="server">
			<asp:label id="lblGivingCategory" Font-Bold="True" Runat="server"></asp:label>
		</asp:TableCell>
	</asp:TableRow>
	<asp:TableRow ID="Tablerow2" Runat="server">
		<asp:TableCell ID="Tablecell5" HorizontalAlign="Left" Width="30%" Runat="server">
			<asp:label id="lblGiftTypeDesc" Runat="server"></asp:label>
		</asp:TableCell>
	</asp:TableRow>
	<asp:TableRow ID="Tablerow3" Runat="server">
		<asp:TableCell ID="Tablecell6" HorizontalAlign="Left" Width="30%" Runat="server">
			<asp:label id="lblReqInfo" Runat="server"></asp:label>
		</asp:TableCell>
	</asp:TableRow>
</asp:Table>
<asp:Table ID="Table3" Width="100%" Visible="True" BorderStyle="None" Runat="server">
	<asp:TableRow id="trDesignation" Visible="False" Runat="server">
		<asp:TableCell ID="tcDesignationTxt" HorizontalAlign="Right" Width="30%" Runat="server">
			<asp:label Font-Bold="True" id="lblDesignation" Runat="server"></asp:label>
		</asp:TableCell>
		<asp:TableCell ID="tcDesignationData" HorizontalAlign="Left" Width="30%" Runat="server">
			<div id="divDesignationList" Visible="false" runat="server">
				<asp:dropdownlist id="ddlDesignations" Runat="server"></asp:dropdownlist>
			</div>
			<div id="divDesignationText" Visible="false" runat="server">
				<asp:Label id="lblDesignationText" Runat="server"/>
			</div>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell2" HorizontalAlign="Left" Width="30%" Runat="server">
			<asp:Label ID="lblDesgInst" Runat="server"></asp:Label>
		</asp:TableCell>
	</asp:TableRow>
	<asp:TableRow ID="trGiftAmount" Visible="False" Runat="server">
		<asp:TableCell ID="tcGiftAmountTxt" HorizontalAlign="Right" Width="30%" Runat="server">
			<asp:label id="lblGiftAmount" Font-Bold="True" Runat="server"></asp:label>
		</asp:TableCell>
		<asp:TableCell ID="tcGiftAmountData" HorizontalAlign="Left" Width="30%" Runat="server">
			<asp:textbox id="txtGiftAmount" Runat="server"></asp:textbox>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell3" HorizontalAlign="Left" Width="30%" Runat="server"></asp:TableCell>
	</asp:TableRow>
	<asp:TableRow ID="trTotalPledge" Visible="False" Runat="server">
		<asp:TableCell ID="tcTotalPledgeTxt" HorizontalAlign="Right" Width="30%" Runat="server">
			<asp:label id="lblTotalPledge" Font-Bold="True" Runat="server"></asp:label>
		</asp:TableCell>
		<asp:TableCell ID="tcTotalPledgeData" HorizontalAlign="Left" Width="30%" Runat="server">
			<asp:textbox id="txtTotalPledge" Runat="server"></asp:textbox>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell7" HorizontalAlign="Left" Width="30%" Runat="server"></asp:TableCell>
	</asp:TableRow>
	<asp:TableRow ID="trInitialPymt" Visible="False" Runat="server">
		<asp:TableCell ID="tcInitialPymtTxt" HorizontalAlign="Right" Width="30%" Runat="server">
			<asp:label id="lblInitialPymt" Runat="server"></asp:label>
		</asp:TableCell>
		<asp:TableCell ID="tcInitialPymtData" HorizontalAlign="Left" Width="30%" Runat="server">
			<asp:textbox id="txtInitialPymt" Runat="server"></asp:textbox>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell8" HorizontalAlign="Left" Width="30%" Runat="server"></asp:TableCell>
	</asp:TableRow>
	<asp:TableRow ID="trPymtSched" Visible="False" Runat="server">
		<asp:TableCell ID="tcPymtSchedTxt" HorizontalAlign="Right" Width="30%" Runat="server">
			<asp:label id="lblPymtSched" Font-Bold="True" Runat="server"></asp:label>
		</asp:TableCell>
		<asp:TableCell ID="tcPymtSchedData" HorizontalAlign="Left" Width="30%" Runat="server">
			<asp:radiobutton GroupName="PymtSched" id="radPymtMonthly" Runat="server"></asp:radiobutton>
			<br>
			<asp:radiobutton GroupName="PymtSched" id="radPymtQuarterly" Runat="server"></asp:radiobutton>
			<br>
			<asp:radiobutton GroupName="PymtSched" id="radPymtAnnually" Runat="server"></asp:radiobutton>
			<br>
			<asp:radiobutton GroupName="PymtSched" id="radPymtOnce" Runat="server"></asp:radiobutton>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell9" HorizontalAlign="Left" Width="30%" Runat="server"></asp:TableCell>
	</asp:TableRow>
	<asp:TableRow ID="trPledgePymt" Visible="False" Runat="server">
		<asp:TableCell ID="tcPledgePymtTxt" HorizontalAlign="Right" Width="30%" Runat="server">
			<asp:label id="lblPledgePymt" Font-Bold="True" Runat="server"></asp:label>
		</asp:TableCell>
		<asp:TableCell ID="tcPledgePymtData" HorizontalAlign="Left" Width="30%" Runat="server">
			<asp:textbox id="txtPledgePymt" Runat="server"></asp:textbox>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell10" HorizontalAlign="Left" Width="30%" Runat="server"></asp:TableCell>
	</asp:TableRow>
	<asp:TableRow ID="trPymtMonth1" Visible="False" Runat="server">
		<asp:TableCell ID="tcPymtMonth1Txt" HorizontalAlign="Right" Width="30%" Runat="server">
			<asp:label id="lblPymtMonth1" Font-Bold="True" Runat="server"></asp:label>
		</asp:TableCell>
		<asp:TableCell ID="tcPymtMonth1Data" HorizontalAlign="Left" Width="30%" Runat="server">
			<asp:dropdownlist id="ddlPymtMonth1" Runat="server"></asp:dropdownlist>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell11" HorizontalAlign="Left" Width="30%" Runat="server"></asp:TableCell>
	</asp:TableRow>
	<asp:TableRow ID="trPymtYear1" Visible="False" Runat="server">
		<asp:TableCell ID="tcPymtYear1Txt" HorizontalAlign="Right" Width="30%" Runat="server">
			<asp:label id="lblPymtYear1" Font-Bold="True" Runat="server"></asp:label>
		</asp:TableCell>
		<asp:TableCell ID="tcPymtYear1Data" HorizontalAlign="Left" Width="30%" Runat="server">
			<asp:dropdownlist id="ddlPymtYear1" Runat="server"></asp:dropdownlist>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell12" HorizontalAlign="Left" Width="30%" Runat="server"></asp:TableCell>
	</asp:TableRow>
	<asp:TableRow ID="trMemorial" Visible="False" Runat="server">
		<asp:TableCell ID="tcMemorialTxt" HorizontalAlign="Right" Width="30%" Runat="server">
			<asp:label id="lblMemorial" Runat="server"></asp:label>
			<br />
		</asp:TableCell>
		<asp:TableCell ID="tcMemorialData" HorizontalAlign="Left" Width="30%" Runat="server">
			<asp:dropdownlist id="ddlMemorial" Runat="server"></asp:dropdownlist>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell13" HorizontalAlign="Left" Width="30%" Runat="server">
			<asp:Label ID="lblMemInst" Runat="server"></asp:Label>
		</asp:TableCell>
	</asp:TableRow>
	<asp:TableRow ID="trApplyToPledge" Visible="False" Runat="server">
		<asp:TableCell ID="tcApplyToPledgeTxt" HorizontalAlign="Right" Width="30%" Runat="server">
			<asp:label id="lblApplyToPledge" Runat="server"></asp:label>
		</asp:TableCell>
		<asp:TableCell ID="tcApplyToPledgeData" HorizontalAlign="Left" Width="30%" Runat="server">
			<asp:checkbox id="chkApplyToPledge" Runat="server"></asp:checkbox>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell14" HorizontalAlign="Left" Width="30%" Runat="server"></asp:TableCell>
	</asp:TableRow>
	<asp:TableRow ID="trSpecInst" Visible="False" Runat="server">
		<asp:TableCell ID="tcSpecInstTxt" HorizontalAlign="Right" Width="30%" Runat="server">
			<asp:label id="lblSpecInst" Runat="server"></asp:label>
		</asp:TableCell>
		<asp:TableCell ID="tcSpecInstData" HorizontalAlign="Left" Width="30%" Runat="server">
			<asp:textbox id="txtSpecInst" Runat="server" Rows="6" TextMode="MultiLine"></asp:textbox>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell15" HorizontalAlign="Left" Width="30%" Runat="server"></asp:TableCell>
	</asp:TableRow>
	<asp:TableRow ID="trDedication" Visible="False" Runat="server">
		<asp:TableCell ID="tcDedicationTxt" HorizontalAlign="Right" Width="30%" Runat="server">
			<asp:label id="lblDedication" Runat="server"></asp:label>
		</asp:TableCell>
		<asp:TableCell ID="tcDedicationData" HorizontalAlign="Left" Width="30%" Runat="server">
			<asp:radiobutton GroupName="Dedication" id="radDedicationMemory" Runat="server"></asp:radiobutton>
			<br />
			<asp:radiobutton GroupName="Dedication" id="RadDedicationHonor" Runat="server"></asp:radiobutton>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell16" HorizontalAlign="Left" Width="30%" Runat="server"></asp:TableCell>
	</asp:TableRow>
	<asp:TableRow ID="trHonoreeName" Visible="False" Runat="server">
		<asp:TableCell ID="tcHonoreeNameTxt" HorizontalAlign="Right" Width="30%" Runat="server">
			<asp:label id="lblHonoreeName" Runat="server"></asp:label>
		</asp:TableCell>
		<asp:TableCell ID="tcHonoreeNameData" HorizontalAlign="Left" Width="30%" Runat="server">
			<asp:textbox id="txtHonoreeName" Runat="server"></asp:textbox>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell17" HorizontalAlign="Left" Width="30%" Runat="server"></asp:TableCell>
	</asp:TableRow>
	<asp:TableRow ID="trNotifyYN" Visible="False" Runat="server">
		<asp:TableCell ID="tcNotifyYNTxt" HorizontalAlign="Right" Width="30%" Runat="server">
			<asp:label id="lblNotifyYN" Runat="server"></asp:label>
		</asp:TableCell>
		<asp:TableCell ID="tcNotifyYNData" HorizontalAlign="Left" Width="30%" Runat="server">
			<asp:CheckBox id="chkNotifyYN" Runat="server"></asp:CheckBox>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell18" HorizontalAlign="Left" Width="30%" Runat="server"></asp:TableCell>
	</asp:TableRow>
	<asp:TableRow ID="trNotifyFName" Visible="False" Runat="server">
		<asp:TableCell ID="tcNotifyFNameTxt" HorizontalAlign="Right" Width="30%" Runat="server">
			<asp:label id="lblNotifyFName" Runat="server"></asp:label>
		</asp:TableCell>
		<asp:TableCell ID="tcNotifyFNameData" HorizontalAlign="Left" Width="30%" Runat="server">
			<asp:textbox id="txtNotifyFName" Runat="server"></asp:textbox>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell19" HorizontalAlign="Left" Width="30%" Runat="server"></asp:TableCell>
	</asp:TableRow>
	<asp:TableRow ID="trNotifyLName" Visible="False" Runat="server">
		<asp:TableCell ID="trNotifyLNameTxt" HorizontalAlign="Right" Width="30%" Runat="server">
			<asp:label id="lblNotifyLName" Runat="server"></asp:label>
		</asp:TableCell>
		<asp:TableCell ID="trNotifyLNameData" HorizontalAlign="Left" Width="30%" Runat="server">
			<asp:textbox id="txtNotifyLName" Runat="server"></asp:textbox>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell20" HorizontalAlign="Left" Width="30%" Runat="server"></asp:TableCell>
	</asp:TableRow>
	<asp:TableRow ID="trNotifyAddr1" Visible="False" Runat="server">
		<asp:TableCell ID="tcNotifyAddr1Txt" HorizontalAlign="Right" Width="30%" Runat="server">
			<asp:label id="lblNotifyAddr1" Runat="server"></asp:label>
		</asp:TableCell>
		<asp:TableCell ID="tcNotifyAddr1Data" HorizontalAlign="Left" Width="30%" Runat="server">
			<asp:textbox id="txtNotifyAddr1" Runat="server"></asp:textbox>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell21" HorizontalAlign="Left" Width="30%" Runat="server"></asp:TableCell>
	</asp:TableRow>
	<asp:TableRow ID="trNotifyAddr2" Visible="False" Runat="server">
		<asp:TableCell ID="tcNotifyAddr2Txt" HorizontalAlign="Right" Width="30%" Runat="server">
			<asp:label id="lblNotifyAddr2" Runat="server"></asp:label>
		</asp:TableCell>
		<asp:TableCell ID="tcNotifyAddr2Data" HorizontalAlign="Left" Width="30%" Runat="server">
			<asp:textbox id="txtNotifyAddr2" Runat="server"></asp:textbox>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell22" HorizontalAlign="Left" Width="30%" Runat="server"></asp:TableCell>
	</asp:TableRow>
	<asp:TableRow ID="trNotifyCity" Visible="False" Runat="server">
		<asp:TableCell ID="tcNotifyCityTxt" HorizontalAlign="Right" Width="30%" Runat="server">
			<asp:label id="lblNotifyCity" Runat="server"></asp:label>
		</asp:TableCell>
		<asp:TableCell ID="tcNotifyCityData" HorizontalAlign="Left" Width="30%" Runat="server">
			<asp:textbox id="txtNotifyCity" Runat="server"></asp:textbox>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell23" HorizontalAlign="Left" Width="30%" Runat="server"></asp:TableCell>
	</asp:TableRow>
	<asp:TableRow ID="trNotifyState" Visible="False" Runat="server">
		<asp:TableCell ID="tcNotifyStateTxt" HorizontalAlign="Right" Width="30%" Runat="server">
			<asp:label id="lblNotifyState" Runat="server"></asp:label>
		</asp:TableCell>
		<asp:TableCell ID="tcNotifyStateData" HorizontalAlign="Left" Width="30%" Runat="server">
			<asp:dropdownlist id="ddlNotifyState" Runat="server"></asp:dropdownlist>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell24" HorizontalAlign="Left" Width="30%" Runat="server"></asp:TableCell>
	</asp:TableRow>
	<asp:TableRow ID="trNotifyZip" Visible="False" Runat="server">
		<asp:TableCell ID="tcNotifyZipTxt" HorizontalAlign="Right" Width="30%" Runat="server">
			<asp:label id="lblNotifyZip" Runat="server"></asp:label>
		</asp:TableCell>
		<asp:TableCell ID="tcNotifyZipData" HorizontalAlign="Left" Width="30%" Runat="server">
			<asp:textbox id="txtNotifyZip" Runat="server"></asp:textbox>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell25" HorizontalAlign="Left" Width="30%" Runat="server"></asp:TableCell>
	</asp:TableRow>
	<asp:TableRow ID="trNotifyCountry" Visible="False" Runat="server">
		<asp:TableCell ID="tcNotifyCountryTxt" HorizontalAlign="Right" Width="30%" Runat="server">
			<asp:label id="lblNotifyCountry" Runat="server"></asp:label>
		</asp:TableCell>
		<asp:TableCell ID="tcNotifyCountryData" HorizontalAlign="Left" Width="30%" Runat="server">
			<asp:dropdownlist id="ddlNotifyCountry" Runat="server"></asp:dropdownlist>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell26" HorizontalAlign="Left" Width="30%" Runat="server"></asp:TableCell>
	</asp:TableRow>
</asp:Table>
<asp:Table ID="tblNavButtons" Width="50%" BorderStyle="None" Runat="server">
	<asp:TableRow ID="Tablerow7" Runat="server">
		<asp:TableCell ID="Tablecell43" HorizontalAlign="Center" Width="30%" Runat="server">
			<asp:Button ID="btnContinue" Runat="server"></asp:Button>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell44" HorizontalAlign="Center" Width="30%" Runat="server">
			<asp:Button ID="btnCancel" Runat="server"></asp:Button>
		</asp:TableCell>
	</asp:TableRow>
</asp:Table>
