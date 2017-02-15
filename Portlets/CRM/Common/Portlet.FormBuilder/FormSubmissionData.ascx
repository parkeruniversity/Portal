<%@ Control Language="c#" AutoEventWireup="false" Codebehind="FormSubmissionData.ascx.cs" Inherits="Jenzabar.CRM.Common.Web.Portlets.FormBuilderPortlet.FormSubmissionData" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<div class="pSection" id="divError" runat="server" visible="False">
	<TABLE width="100%">
		<tr>
			<td>
				<jenzabar:errordisplay id="ctlErrorDisplay" RunAt="server"></jenzabar:errordisplay>
			</td>
		</tr>
	</TABLE>
</div>
<div class="pSection" id="divInstructions" runat="server" visible="False">
	<TABLE width="100%">
		<tr>
			<td>
				<asp:Label id="lblInstructions" runat="server"></asp:Label>
			</td>
		</tr>
	</TABLE>
</div>
<div id="divDatagrid" style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; DISPLAY: block; MARGIN: 10px; OVERFLOW: scroll; BORDER-LEFT: 0px; WIDTH: auto; BORDER-BOTTOM: 0px; POSITION: relative; HEIGHT: 200px; align: left"
	runat="server" visible="False">
	<table width="95%" align="left">
		<tr>
			<td>
				<jenzabar:groupedgrid id="dgSubmissionData" DataKeyField="SubDataID" Width="100%" RenderTableHeaders="False"
					runat="server">
					<Columns>
						<asp:TemplateColumn ItemStyle-VerticalAlign="Top">
							<ItemTemplate>
								<asp:Label id="lblSubDataDesc" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "SubDataDesc") %>'>
								</asp:Label>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn ItemStyle-VerticalAlign="Top">
							<ItemTemplate>
								<asp:TextBox id="txtSubDataValue" TextMode="SingleLine" runat="server" Columns="15" MaxLength="255" Text='<%# DataBinder.Eval(Container.DataItem, "SubDataValue") %>'>
								</asp:TextBox>
							</ItemTemplate>
						</asp:TemplateColumn>
					</Columns>
				</jenzabar:groupedgrid>
			</td>
		</tr>
	</table>
</div>
<div class="pSection">
	<TABLE width="100%">
		<tr>
			<td align="left">
				<asp:Label id="lblSetupComplete" runat="server"></asp:Label>&nbsp;&nbsp;
				<asp:RadioButton id="rbSetupCompleteYes" runat="server" GroupName="SetupComplete"></asp:RadioButton>&nbsp;&nbsp;
				<asp:RadioButton id="rbSetupCompleteNo" runat="server" GroupName="SetupComplete"></asp:RadioButton>
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<TR>
			<TD vAlign="top" noWrap align="left">
				<asp:button id="btnSave" runat="server" Visible="False"></asp:button>&nbsp;
				<asp:button id="btnCancel" runat="server"></asp:button>
			</TD>
		</TR>
	</TABLE>
</div>
