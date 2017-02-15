<%@ Control Language="c#" AutoEventWireup="false" Codebehind="QuestionDatabaseMapping.ascx.cs" Inherits="Jenzabar.CRM.Common.Web.Portlets.FormBuilderPortlet.QuestionDatabaseMapping" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<div class="pSection" id="divError" runat="server" visible="False">
	<TABLE width="100%">
		<tr>
			<td><jenzabar:errordisplay id="ctlErrorDisplay" RunAt="server"></jenzabar:errordisplay></td>
		</tr>
	</TABLE>
</div>
<div id="divDatagrid" style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; DISPLAY: block; MARGIN: 10px; OVERFLOW: scroll; BORDER-LEFT: 0px; WIDTH: auto; BORDER-BOTTOM: 0px; POSITION: relative; HEIGHT: 200px; align: left"
	runat="server" visible="False">
	<asp:table id="tblContent" Width="95%" HorizontalAlign="Left" Runat="server">
		<asp:TableRow>
			<asp:TableCell>
				<jenzabar:groupedgrid id="dgQuestionDatabaseMapping" runat="server" Width="100%" RenderTableHeaders="True"
					DataKeyField="ID" visible="false">
					<Columns>
						<asp:TemplateColumn ItemStyle-VerticalAlign="Top">
							<ItemTemplate>
								<asp:label id="lblAssignedQuestionText" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "AssignedDesc") %>'>
								</asp:label>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn ItemStyle-VerticalAlign="Top">
							<ItemTemplate>
								<asp:DropDownList id="ddlMappingTemplateID" runat="server"></asp:DropDownList>
							</ItemTemplate>
						</asp:TemplateColumn>
					</Columns>
				</jenzabar:groupedgrid>
			</asp:TableCell>
		</asp:TableRow>
	</asp:table>
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
		<tr>
			<td>&nbsp;</td>
		</tr>
		<TR>
			<TD vAlign="top" noWrap align="left" colSpan="5">
				<asp:button id="btnSave" runat="server" Visible="False"></asp:button>&nbsp;
				<asp:button id="btnCancel" runat="server"></asp:button>
			</TD>
		</TR>
	</TABLE>
</div>
