<%@ Control Language="c#" AutoEventWireup="false" Codebehind="OrderQuestionsAndHeaders.ascx.cs" Inherits="Jenzabar.CRM.Common.Web.Portlets.FormBuilderPortlet.OrderQuestionsAndHeaders" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
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
				<jenzabar:groupedgrid id="dgQuestionsHeaders" DataKeyField="ID" Width="100%" RenderTableHeaders="True"
					runat="server" visible="False">
					<Columns>
						<asp:TemplateColumn HeaderStyle-Width="10%" ItemStyle-Width="10%">
							<ItemTemplate>
								<asp:TextBox id="txtOrder" TextMode="SingleLine" runat="server" Columns="3" Text='<%# DataBinder.Eval(Container.DataItem, "Order") %>'>
								</asp:TextBox>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderStyle-Width="10%" ItemStyle-Width="10%">
							<ItemTemplate>
								<asp:Label id="lblDescription" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Description") %>'>
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
	<asp:Table Width="100%" Runat="server" id="Table1">
		<asp:TableRow Runat="server">
			<asp:TableCell align="left" width="15%" nowrap="true" Runat="server">
				<asp:Button ID="btnSave" Text="Save" Runat="server" Visible="False"></asp:Button>&nbsp;
				<asp:Button ID="btnCancel" Text="Cancel" Runat="server" Visible="True"></asp:Button></td>
			</asp:TableCell>
			<asp:TableCell align="right" width="85%" Runat="server">
				<asp:Label ID="lblIndicateHeaderText" Runat="server"></asp:Label>
			</asp:TableCell>
		</asp:TableRow>
	</asp:Table>
</div>
