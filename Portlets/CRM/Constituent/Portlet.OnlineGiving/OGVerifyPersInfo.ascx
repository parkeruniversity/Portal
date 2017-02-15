<%@ Control Language="c#" AutoEventWireup="false" Codebehind="OGVerifyPersInfo.ascx.cs" Inherits="Jenzabar.CRM.Constituent.Web.Portlets.OnlineGivingPortlet.OGVerifyPersInfo" %>
<asp:Table ID="tblGivingInst" Width="100%" BorderStyle="None" Runat="server">
	<asp:TableRow ID="trGivingInst" Runat="server">
		<asp:TableCell ID="tcGivingInst" HorizontalAlign="Left" Width="100%" Runat="server">
			<asp:Literal ID="litGivingInst" Runat="server"></asp:Literal>
		</asp:TableCell>
	</asp:TableRow>
</asp:Table>
<asp:Table ID="tblHeaderLinks" Width="100%" BackColor=White BorderStyle="None" Runat="server">
	<asp:TableRow ID="trHeaderLinks" Runat="server">
		<asp:TableCell ID="tcVerifyLink" HorizontalAlign="Center" BackColor=White Width="25%" Runat="server">
			<asp:linkbutton id="lnkVerifyPersInfo" Runat="server"></asp:linkbutton>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell1" HorizontalAlign="Center" BackColor=LightGrey Width="25%" Runat="server">
			<asp:linkbutton id="lnkGiveGiftorPledge" Runat="server"></asp:linkbutton>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell2" HorizontalAlign="Center" BackColor=LightGrey Width="25%" Runat="server">
			<asp:linkbutton id="lnkSubmitGifts" Runat="server"></asp:linkbutton>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell47" HorizontalAlign="Center" BackColor=LightGrey Width="25%" Runat="server">
		</asp:TableCell>
	</asp:TableRow>
</asp:Table>
<asp:Table ID="Table1" Width="100%" BorderStyle="None" Runat="server">
	<asp:TableRow ID="Tablerow1" Runat="server">
		<asp:TableCell ID="Tablecell3" HorizontalAlign="Left" Width="30%" Runat="server">
			<asp:label id="lblPlsVerInfo" Font-Bold=True Runat="server"></asp:label>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell4" HorizontalAlign="Center" Width="30%" Runat="server">
			<asp:linkbutton id="lnkUpdPersInfo" Runat="server"></asp:linkbutton>
			<asp:Label ID="lblUpdPersInfo" Runat=server></asp:Label>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell8" HorizontalAlign="Center" Width="30%" Runat="server"></asp:TableCell>
	</asp:TableRow>
</asp:Table>
<asp:Table ID="Table2" Width="100%" BorderStyle="None" Runat="server">
	<asp:TableRow ID="Tablerow2" Runat="server">
		<asp:TableCell ID="Tablecell5" HorizontalAlign="Left" Width="33%" Runat="server">
			<asp:label id="lblNameCat" Runat="server"></asp:label>
			<br>
			<asp:label id="lblAddrLine1" Runat="server"></asp:label>
			<br>
			<asp:label id="lbladdrLine2" Runat="server"></asp:label>
			<br>
			<asp:label id="lblCityStZipCat" Runat="server"></asp:label>
			<br>
			<asp:label id="lblCountry" Runat="server"></asp:label>
			<br>
			<asp:label id="lblPhoneCatExt" Runat="server"></asp:label>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell6" HorizontalAlign="Left" Width="33%" Runat="server">
			<asp:label id="lblClassOfTxt" Runat="server"></asp:label>&nbsp;
			<asp:label id="lblClassData" Runat="server"></asp:label><br>
			<asp:label id="lblMajorTxt" Runat="server"></asp:label>&nbsp;
			<asp:label id="lblMajorData" Runat="server"></asp:label><br>
			<asp:label id="lblDegreeTxt" Runat="server"></asp:label>&nbsp;
			<asp:label id="lblDegreeDate" Runat="server"></asp:label><br>
			<br>
			<asp:label id="lblEmailTxt" Runat="server"></asp:label><br>
			<asp:label id="lblEmailAddr1" Runat="server"></asp:label>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell7" HorizontalAlign="Left" Width="33%" Runat="server">
			<asp:label id="lblIDTxt" Runat="server"></asp:label>&nbsp;
			<asp:label id="lblIDData" Runat="server"></asp:label><br>
			<asp:label id="lblBDateTxt" Runat="server"></asp:label>&nbsp;
			<asp:label id="lblBDateData" Runat="server"></asp:label><br>
			<asp:label id="lblMStatTxt" Runat="server"></asp:label>&nbsp;
			<asp:label id="lblMStatData" Runat="server"></asp:label><br>
			<br>
			<asp:label id="lblSpsTxt" Runat="server"></asp:label>&nbsp;
			<asp:label id="lblSpsNameCat" Runat="server"></asp:label><br>
			<asp:label id="lblSpsClsTxt" Runat="server"></asp:label>&nbsp;
			<asp:label id="lblSpsClsData" Runat="server"></asp:label><br>
		</asp:TableCell>
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
