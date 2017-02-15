<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ConfigureQuestionHeaderLayout.ascx.cs" Inherits="Jenzabar.CRM.Common.Web.Portlets.FormBuilderPortlet.ConfigureQuestionHeaderLayout" %>
<meta content="True" name="vs_showGrid">
<div class="pSection" id="divError" runat="server" visible="False">
	<TABLE width="100%">
		<tr>
			<td><jenzabar:errordisplay id="ctlErrorDisplay" RunAt="server"></jenzabar:errordisplay></td>
		</tr>
	</TABLE>
</div>
<div id="divDatagrid" style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; DISPLAY: block; MARGIN: 10px; OVERFLOW: auto; BORDER-LEFT: 0px; WIDTH: auto; BORDER-BOTTOM: 0px; POSITION: relative; HEIGHT: 200px; align: left"
	runat="server" visible="False">
	<table width="95%" align="left">
		<tr>
			<td>
				<jenzabar:groupedgrid id="gdgAssigned" AutoGenerateColumns="False" RenderTableHeaders="True" runat="server" visible="False">
					<HeaderStyle CssClass="header"></HeaderStyle>
					<Columns>
						<asp:TemplateColumn>
							<ItemTemplate>
								<asp:Label ID="lblAssignedDesc" Runat="server" Text='<%# DataBinder.Eval( Container.DataItem, "AssignedDesc" ) %>'>
								</asp:Label>
							</ItemTemplate>
						</asp:TemplateColumn>
					</Columns>
				</jenzabar:groupedgrid>
			</td>
		</tr>
	</table>
</div>
<div class="pSection">
	<table>
		<tr>
			<td colSpan="3">&nbsp;</td>
		</tr>
		<tr>
			<td colSpan="3"><asp:linkbutton id="lnkSelect" runat="server"></asp:linkbutton></td>
		</tr>
		<tr>
			<td colSpan="3"><asp:linkbutton id="lnkOrder" runat="server"></asp:linkbutton></td>
		</tr>
		<tr>
			<td colSpan="3">&nbsp;</td>
		</tr>
		<tr>
			<td vAlign="middle"><asp:label id="lblSetupComplete" runat="server"></asp:label></td>
			<td><asp:radiobuttonlist id="RadioButtonListSetupComplete" Width="40px" runat="server" RepeatColumns="2"
					Height="16px">
					<asp:ListItem></asp:ListItem>
					<asp:ListItem></asp:ListItem>
				</asp:radiobuttonlist></td>
		</tr>
		<tr>
		</tr>
	</table>
	<table cellSpacing="5">
		<TR>
			<td align="right"><asp:button id="btnSave" runat="server" Visible="False"></asp:button></td>
			<td align="left"><asp:button id="btnCancel" runat="server"></asp:button></td>
		</TR>
	</table>
</div>
