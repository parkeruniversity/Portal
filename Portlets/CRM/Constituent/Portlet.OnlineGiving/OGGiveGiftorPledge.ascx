<%@ Control Language="c#" AutoEventWireup="false" Codebehind="OGGiveGiftorPledge.ascx.cs" Inherits="Jenzabar.CRM.Constituent.Web.Portlets.OnlineGivingPortlet.OGGiveGiftorPledge" %>
<asp:Table ID="tblGivingInst" Width="100%" BorderStyle="None" Runat="server">
	<asp:TableRow ID="trGivingInst" Runat="server">
		<asp:TableCell ID="tcGivingInst" HorizontalAlign="Left" Width="100%" Runat="server">
			<asp:Literal ID="litGivingInst" Runat="server"></asp:Literal>
		</asp:TableCell>
	</asp:TableRow>
</asp:Table>
<asp:Table ID="tblHeaderLinks" Width="100%" Runat="server">
	<asp:TableRow ID="trHeaderLinks" Runat="server">
		<asp:TableCell ID="tcVerifyLink" HorizontalAlign="Center" BackColor=LightGrey Width="25%" Runat="server">
			<asp:linkbutton id="lnkVerifyPersInfo" Runat="server"></asp:linkbutton>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell1" HorizontalAlign="Center" BackColor=White Width="25%" Runat="server">
			<asp:linkbutton id="lnkGiveGiftorPledge" Runat="server"></asp:linkbutton>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell2" HorizontalAlign="Center" BackColor=LightGray Width="25%" Runat="server">
			<asp:linkbutton id="lnkSubmitGifts" Runat="server" Visible="False"></asp:linkbutton>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell23" HorizontalAlign="Center" BackColor=LightGray Width="25%" Height="2" Runat="server">
		</asp:TableCell>
	</asp:TableRow>
</asp:Table>
<asp:Table ID="Table1" Width="100%" BorderStyle="None" Runat="server">
	<asp:TableRow ID="Tablerow1" Runat="server">
		<asp:TableCell ID="Tablecell3" HorizontalAlign="Left" Width="30%" Runat="server">
			<h4><asp:label id="lblSelectGftDesg" Runat="server"></asp:label></h4>
		</asp:TableCell>
	</asp:TableRow>
</asp:Table>
<asp:Table ID="Table2" Width="100%" BorderStyle="None" Runat="server">
	<asp:TableRow ID="Tablerow2" Runat="server">
		<asp:TableCell ID="Tablecell4" HorizontalAlign="Left" Width="30%" Runat="server">
			<asp:label id="lblOpt1Code" Font-Bold=True Runat="server"></asp:label>
			<br />
			<asp:label id="lblOpt1Text" Runat="server"></asp:label>
			<asp:label id="lblGivOpt1Cat" Visible=False Runat="server"></asp:label>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell5" HorizontalAlign="Left" Width="30%" Runat="server" >
			<asp:DropDownList id="ddlOpt1" Runat="server"></asp:DropDownList>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell6" HorizontalAlign="Right" Width="30%" Runat="server">
			<asp:Button id="btnMakeOpt1Gift" Runat="server"></asp:Button>
			<br />
			<asp:Button id="btnMakeOpt1Pledge" Runat="server"></asp:Button>
			<br />
		</asp:TableCell>
	</asp:TableRow>
	<asp:TableRow ID="Tablerow3" Runat="server">
		<asp:TableCell ID="Tablecell7" ColumnSpan="3" HorizontalAlign="Left" Width="100%" Runat="server">
			<hr />
		</asp:TableCell>
	</asp:TableRow>
	<asp:TableRow ID="Tablerow4" Runat="server">
		<asp:TableCell ID="Tablecell8" HorizontalAlign="Left" Width="30%" Runat="server">
			<asp:label id="lblOpt2Code" Font-Bold=True Runat="server"></asp:label>
			<br />
			<asp:label id="lblOpt2Text" Runat="server"></asp:label>
			<asp:label id="lblOpt2Cat" Visible=False Runat="server"></asp:label>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell9" HorizontalAlign="Left" Width="30%" Runat="server">
			<asp:DropDownList id="ddlOpt2" Runat="server"></asp:DropDownList>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell10" HorizontalAlign="Right" Width="30%" Runat="server">
			<asp:Button id="btnMakeOpt2Gift" Runat="server"></asp:Button>
			<br />
			<asp:Button id="btnMakeOpt2Pledge" Runat="server"></asp:Button>
			<br />
		</asp:TableCell>
	</asp:TableRow>
	<asp:TableRow ID="Tablerow5" Runat="server">
		<asp:TableCell ID="Tablecell11" ColumnSpan="3" HorizontalAlign="Left" Width="100%" Runat="server">
			<hr />
		</asp:TableCell>
	</asp:TableRow>
	<asp:TableRow ID="Tablerow6" Runat="server">
		<asp:TableCell ID="Tablecell12" HorizontalAlign="Left" Width="30%" Runat="server">
			<asp:label id="lblOpt3Code" Font-Bold=True Runat="server"></asp:label>
			<br />
			<asp:label id="lblOpt3Text" Runat="server"></asp:label>
			<asp:label id="lblOpt3Cat" Visible=False Runat="server"></asp:label>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell13" HorizontalAlign="Left" Width="30%" Runat="server">
			<asp:DropDownList id="ddlOpt3" Runat="server"></asp:DropDownList>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell14" HorizontalAlign="Right" Width="30%" Runat="server">
			<asp:Button id="btnMakeOpt3Gift" Runat="server"></asp:Button>
			<br />
			<asp:Button id="btnMakeOpt3Pledge" Runat="server"></asp:Button>
			<br />
		</asp:TableCell>
	</asp:TableRow>
	<asp:TableRow ID="Tablerow7" Runat="server">
		<asp:TableCell ID="Tablecell15" ColumnSpan="3" HorizontalAlign="Left" Width="100%" Runat="server">
			<hr />
		</asp:TableCell>
	</asp:TableRow>
	<asp:TableRow ID="Tablerow8" Runat="server">
		<asp:TableCell ID="Tablecell16" HorizontalAlign="Left" Width="30%" Runat="server">
			<asp:label id="lblOpt4Code" Font-Bold=True Runat="server"></asp:label>
			<br />
			<asp:label id="lblOpt4Text" Runat="server"></asp:label>
			<asp:label id="lblOpt4Cat" Visible=False Runat="server"></asp:label>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell17" HorizontalAlign="Left" Width="30%" Runat="server">
			<asp:DropDownList id="ddlOpt4" Runat="server"></asp:DropDownList>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell18" HorizontalAlign="Right" Width="30%" Runat="server">
			<asp:Button id="btnMakeOpt4Gift" Runat="server"></asp:Button>
			<br />
			<asp:Button id="btnMakeOpt4Pledge" Runat="server"></asp:Button>
			<br />
		</asp:TableCell>
	</asp:TableRow>
	<asp:TableRow ID="Tablerow9" Runat="server">
		<asp:TableCell ID="Tablecell19" ColumnSpan="3" HorizontalAlign="Left" Width="100%" Runat="server">
			<hr />
		</asp:TableCell>
	</asp:TableRow>
	<asp:TableRow ID="trOpt5" Runat="server">
		<asp:TableCell ID="Tablecell20" HorizontalAlign="Left" Width="30%" Runat="server">
			<asp:label id="lblOpt5Code" Font-Bold=True Runat="server"></asp:label>
			<br />
			<asp:label id="lblOpt5Text" Runat="server"></asp:label>
			<asp:label id="lblOpt5Cat" Visible=False Runat="server"></asp:label>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell21" HorizontalAlign="Left" Width="30%" Runat="server">
			<asp:DropDownList id="ddlOpt5" Runat="server"></asp:DropDownList>
		</asp:TableCell>
		<asp:TableCell ID="Tablecell22" HorizontalAlign="Right" Width="30%" Runat="server">
			<asp:Button id="btnMakeOpt5Gift" Runat="server"></asp:Button>
			<br />
			<asp:Button id="btnMakeOpt5Pledge" Runat="server"></asp:Button>
			<br />
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
