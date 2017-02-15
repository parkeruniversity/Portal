<%@ Control Language="c#" AutoEventWireup="false" Codebehind="OGUpdatePersonalInfo.ascx.cs" Inherits="Jenzabar.CRM.Constituent.Web.Portlets.OnlineGivingPortlet.OGUpdatePersonalInfo" %>
<asp:Table ID="tblError" Visible="True" Width="100%" BorderStyle="None" Runat="server">
	<asp:TableRow ID="trError" Visible="False" Runat="server">
		<asp:TableCell>
			&nbsp;&nbsp;
<asp:label id="lblError" CssClass="PortletError" Runat="server"></asp:label>
		</asp:TableCell>
	</asp:TableRow>
</asp:Table>
<asp:Table ID="tblHeaderLinks" Width="100%" BorderStyle="None" Runat="server">
	<asp:TableRow ID="Tablerow19" Runat="server">
		<asp:TableCell ID="tcVerifyLink" HorizontalAlign="Center" BackColor="White" Width="25%" Runat="server">
			<asp:linkbutton id="lnkVerifyPersInfo" Runat="server"></asp:linkbutton>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell45" HorizontalAlign="Center" BackColor="LightGrey" Width="25%" Runat="server">
			<asp:linkbutton id="lnkGiveGiftorPledge" Runat="server"></asp:linkbutton>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell46" HorizontalAlign="Center" BackColor="LightGrey" Width="25%" Runat="server">
			<asp:linkbutton id="lnkSubmitGifts" Runat="server"></asp:linkbutton>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell47" HorizontalAlign="Center" BackColor="LightGrey" Width="25%" Runat="server"></asp:TableCell>
	</asp:TableRow>
</asp:Table>
<asp:Table ID="Table2" Width="100%" BorderStyle="None" Runat="server">
	<asp:TableRow ID="trHeaderLinks" Runat="server">
		<asp:TableCell ID="Tablecell1" HorizontalAlign="Left" Width="30%" Runat="server">
			<asp:Label ID="lblWelcome" Runat="server"></asp:Label>
		</asp:TableCell>
	</asp:TableRow>
	<asp:TableRow ID="Tablerow1" Runat="server">
		<asp:TableCell ID="Tablecell2" HorizontalAlign="Left" Width="30%" Runat="server">
			<asp:Label ID="lblEnterPersInfo" Font-Bold="True" Runat="server"></asp:Label>
		</asp:TableCell>
	</asp:TableRow>
	<asp:TableRow ID="Tablerow2" Runat="server">
		<asp:TableCell ID="Tablecell3" HorizontalAlign="Left" Width="30%" Runat="server">
			<asp:Label ID="lblReqInfo" Runat="server"></asp:Label>
		</asp:TableCell>
	</asp:TableRow>
</asp:Table>
<asp:Table ID="Table1" Width="100%" BorderStyle="None" Runat="server">
	<asp:TableRow ID="Tablerow3" Runat="server">
		<asp:TableCell ID="Tablecell4" HorizontalAlign="Right" Width="30%" Runat="server">
			<asp:Label ID="lblTitle" Runat="server"></asp:Label>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell5" HorizontalAlign="Left" Width="30%" Runat="server">
			<asp:DropDownList ID="ddlTitle" Runat="server"></asp:DropDownList>
		</asp:TableCell>
	</asp:TableRow>
	<asp:TableRow ID="Tablerow4" Runat="server">
		<asp:TableCell ID="Tablecell6" HorizontalAlign="Right" Width="30%" Runat="server">
			<asp:Label ID="lblFirstName" Font-Bold="True" Runat="server"></asp:Label>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell7" HorizontalAlign="Left" Width="30%" Runat="server">
			<asp:TextBox ID="txtFirstName" Runat="server"></asp:TextBox>
		</asp:TableCell>
	</asp:TableRow>
	<asp:TableRow ID="Tablerow5" Runat="server">
		<asp:TableCell ID="Tablecell8" HorizontalAlign="Right" Width="30%" Runat="server">
			<asp:Label ID="lblMiddleName" Runat="server"></asp:Label>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell9" HorizontalAlign="Left" Width="30%" Runat="server">
			<asp:TextBox ID="txtMiddleName" Runat="server"></asp:TextBox>
		</asp:TableCell>
	</asp:TableRow>
	<asp:TableRow ID="Tablerow6" Runat="server">
		<asp:TableCell ID="Tablecell10" HorizontalAlign="Right" Width="30%" Runat="server">
			<asp:Label ID="lblLastName" Font-Bold="True" Runat="server"></asp:Label>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell11" HorizontalAlign="Left" Width="30%" Runat="server">
			<asp:TextBox ID="txtLastName" Runat="server"></asp:TextBox>
		</asp:TableCell>
	</asp:TableRow>
	<asp:TableRow ID="Tablerowa" Runat="server">
		<asp:TableCell ID="Tablecell12" HorizontalAlign="Right" Width="30%" Runat="server">
			<asp:Label ID="lblAddr1" Font-Bold="True" Runat="server"></asp:Label>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell13" HorizontalAlign="Left" Width="30%" Runat="server">
			<asp:TextBox ID="txtAddr1" Runat="server"></asp:TextBox>
		</asp:TableCell>
	</asp:TableRow>
	<asp:TableRow ID="Tablerowb" Runat="server">
		<asp:TableCell ID="Tablecell14" HorizontalAlign="Right" Width="30%" Runat="server">
			<asp:Label ID="lblAddr2" Runat="server"></asp:Label>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell15" HorizontalAlign="Left" Width="30%" Runat="server">
			<asp:TextBox ID="txtAddr2" Runat="server"></asp:TextBox>
		</asp:TableCell>
	</asp:TableRow>
	<asp:TableRow ID="Tablerowc" Runat="server">
		<asp:TableCell ID="Tablecell16" HorizontalAlign="Right" Width="30%" Runat="server">
			<asp:Label ID="lblCity" Font-Bold="True" Runat="server"></asp:Label>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell17" HorizontalAlign="Left" Width="30%" Runat="server">
			<asp:TextBox ID="txtCity" Runat="server"></asp:TextBox>
		</asp:TableCell>
	</asp:TableRow>
	<asp:TableRow ID="Tablerowd" Runat="server">
		<asp:TableCell ID="Tablecell18" HorizontalAlign="Right" Width="30%" Runat="server">
			<asp:Label ID="lblState" Font-Bold="True" Runat="server"></asp:Label>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell19" HorizontalAlign="Left" Width="30%" Runat="server">
			<asp:DropDownList ID="ddlState" Runat="server"></asp:DropDownList>
		</asp:TableCell>
	</asp:TableRow>
	<asp:TableRow ID="Tablerowx" Runat="server">
		<asp:TableCell ID="Tablecell20" HorizontalAlign="Right" Width="30%" Runat="server">
			<asp:Label ID="lblZip" Font-Bold="True" Runat="server"></asp:Label>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell21" HorizontalAlign="Left" Width="30%" Runat="server">
			<asp:TextBox ID="txtZip" Runat="server"></asp:TextBox>

		</asp:TableCell>
	</asp:TableRow>
	<asp:TableRow ID="Tablerow8" Runat="server">
		<asp:TableCell ID="Tablecell22" HorizontalAlign="Right" Width="30%" Runat="server">
			<asp:Label ID="lblCountry" Font-Bold="True" Runat="server"></asp:Label>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell23" HorizontalAlign="Left" Width="30%" Runat="server">
			<asp:DropDownList ID="ddlCountry" Runat="server"></asp:DropDownList>
		</asp:TableCell>
	</asp:TableRow>
	<asp:TableRow ID="Tablerow9" Runat="server">
		<asp:TableCell ID="Tablecell24" HorizontalAlign="Right" Width="30%" Runat="server">
			<asp:Label ID="lblEmail" Font-Bold="True" Runat="server"></asp:Label>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell25" HorizontalAlign="Left" Width="30%" Runat="server">
			<asp:TextBox ID="txtEmail" Runat="server"></asp:TextBox>
		</asp:TableCell>
	</asp:TableRow>
	<asp:TableRow ID="Tablerow10" Runat="server">
		<asp:TableCell ID="Tablecell26" HorizontalAlign="Right" Width="30%" Runat="server">
			<asp:Label ID="lblTelephone" Font-Bold="True" Runat="server"></asp:Label>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell27" HorizontalAlign="Left" Width="60%" Runat="server">
			<asp:TextBox ID="txtTelephone" Runat="server"></asp:TextBox>
			<asp:label id="lblPhoneInstructions" runat="server"></asp:label>
			<asp:regularexpressionvalidator id="valPhoneFormat" runat="server" ControlToValidate="txtTelephone" ValidationExpression="(((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4})|(\+\d{1,4} [- 0-9]{1,18})"></asp:regularexpressionvalidator>
		</asp:TableCell>
	</asp:TableRow>
	<asp:TableRow ID="Tablerow11" Runat="server">
		<asp:TableCell ID="Tablecell28" HorizontalAlign="Right" Width="30%" Runat="server">
			<asp:Label ID="lblClassYear" Runat="server"></asp:Label>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell29" HorizontalAlign="Left" Width="30%" Runat="server">
			<asp:TextBox ID="txtClassYear" Runat="server"></asp:TextBox>
		</asp:TableCell>
	</asp:TableRow>
	<asp:TableRow ID="Tablerow12" Runat="server">
		<asp:TableCell ID="Tablecell30" HorizontalAlign="Right" Width="30%" Runat="server">
			<asp:Label ID="lblSpsTitle" Runat="server"></asp:Label>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell31" HorizontalAlign="Left" Width="30%" Runat="server">
			<asp:DropDownList ID="ddlSpsTitle" Runat="server"></asp:DropDownList>
		</asp:TableCell>
	</asp:TableRow>
	<asp:TableRow ID="Tablerow13" Runat="server">
		<asp:TableCell ID="Tablecell32" HorizontalAlign="Right" Width="30%" Runat="server">
			<asp:Label ID="lblSpsFName" Runat="server"></asp:Label>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell33" HorizontalAlign="Left" Width="30%" Runat="server">
			<asp:TextBox ID="txtSpsFName" Runat="server"></asp:TextBox>
		</asp:TableCell>
	</asp:TableRow>
	<asp:TableRow ID="Tablerow14" Runat="server">
		<asp:TableCell ID="Tablecell34" HorizontalAlign="Right" Width="30%" Runat="server">
			<asp:Label ID="lblSpsMName" Runat="server"></asp:Label>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell35" HorizontalAlign="Left" Width="30%" Runat="server">
			<asp:TextBox ID="txtSpsMName" Runat="server"></asp:TextBox>
		</asp:TableCell>
	</asp:TableRow>
	<asp:TableRow ID="Tablerow15" Runat="server">
		<asp:TableCell ID="Tablecell36" HorizontalAlign="Right" Width="30%" Runat="server">
			<asp:Label ID="lblSpsLName" Runat="server"></asp:Label>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell37" HorizontalAlign="Left" Width="30%" Runat="server">
			<asp:TextBox ID="txtSpsLName" Runat="server"></asp:TextBox>
		</asp:TableCell>
	</asp:TableRow>
</asp:Table>
<asp:Table ID="Table3" Width="100%" BorderStyle="None" Runat="server">
	<asp:TableRow ID="Tablerow16" Runat="server">
		<asp:TableCell ID="Tablecell38" HorizontalAlign="Left" Width="30%" Runat="server">
			<asp:CheckBox ID="chkSpsSoftCrd" Runat="server"></asp:CheckBox>&nbsp;
<asp:Label ID="lblSpsSoftCrd" Runat="server"></asp:Label>
		</asp:TableCell>
	</asp:TableRow>
</asp:Table>
<asp:Table ID="Table4" Width="100%" BorderStyle="None" Runat="server">
	<asp:TableRow ID="Tablerow17" Runat="server">
		<asp:TableCell ID="Tablecell39" HorizontalAlign="Left" Width="30%" Runat="server">
			<asp:CheckBox ID="chkMchComp" Runat="server"></asp:CheckBox>&nbsp;
<asp:Label ID="lblMchComp" Runat="server"></asp:Label>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell40" HorizontalAlign="Left" Width="30%" Runat="server">
			<asp:CheckBox ID="chkSpsMchComp" Runat="server"></asp:CheckBox>&nbsp;
<asp:Label ID="lblSpsMchComp" Runat="server"></asp:Label>
		</asp:TableCell>
	</asp:TableRow>
</asp:Table>
<asp:Table ID="Table5" Width="100%" BorderStyle="None" Runat="server">
	<asp:TableRow ID="Tablerow18" Runat="server">
		<asp:TableCell ID="Tablecell41" HorizontalAlign="Left" Width="30%" Runat="server">
			<asp:Label ID="lblMyCompName" Runat="server"></asp:Label>&nbsp;
<asp:TextBox ID="txtMyCompName" Runat="server"></asp:TextBox>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell42" HorizontalAlign="Left" Width="30%" Runat="server">
			<asp:Label ID="lblSpsCompName" Runat="server"></asp:Label>&nbsp;
<asp:TextBox ID="txtSpsCompName" Runat="server"></asp:TextBox>
		</asp:TableCell>
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
