<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="True" Codebehind="Default.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.MajorExplorationandWhatIfPortlet.Default" %>
<DIV class="psection" id="divControls" runat="server">
	<TABLE id="Table1" height="0" cellSpacing="3" cellPadding="3" width="100%" border="0">
		<TR>
			<TD>
				<div id="divError" runat="server" Visible="false"><jenzabar:ErrorDisplay id="ctlError" RunAt="server" /></div>
				<div id="divMessage" runat="server" Visible="false"><asp:label id="lblMessage" Runat="server"></asp:label></div>
			</TD>
		</TR>
		<tr>
			<td><div id="divHeader" runat="server" Visible="false"><h4><jenzabar:GlobalizedLiteral id="litForAdvisee" visible="False" runat="server"></jenzabar:GlobalizedLiteral></h4>
				</div>
			</td>
		</tr>
		<TR>
			<TD><asp:linkbutton id="lnkSetup" runat="server" Visible="False" onclick="lnkSetup_Click"></asp:linkbutton></TD>
		</TR>
		<TR>
			<TD><jenzabar:Hint id="lblTitle" runat="server" Visible="True"></jenzabar:hint></TD>
		</TR>
		<TR>
			<TD>
				<div id="divDDL" runat="server">
					<TABLE id="Table2" cellSpacing="5" cellPadding="5" width="100%" border="0">
						<TR>
							<TD width="10%"><asp:label id="lblMajorMinor" runat="server"></asp:label></TD>
							<TD><asp:dropdownlist id="ddlMajorMinor" runat="server"></asp:dropdownlist></TD>
						</TR>
						<TR>
							<TD></TD>
							<TD><asp:CheckBox id="cbxApplyMyCourse" runat="server"></asp:CheckBox></TD>
						</TR>
						<TR>
							<TD></TD>
							<TD><asp:button id="btnView" runat="server" Enabled="False" onclick="btnView_Click"></asp:button></TD>
						</TR>
					</TABLE>
				</div>
			</TD>
		</TR>
	</TABLE>
</DIV>
<script language="javascript">
	function enableDisableViewButton()
	{
		
		var frm = document.MAINFORM;
		var val = frm.<%=this.ddlMajorMinor.ClientID%>.options[frm.<%=this.ddlMajorMinor.ClientID%>.selectedIndex].value;
		frm.<%=this.btnView.ClientID%>.disabled = val == "";
		return;
	}
</script>
