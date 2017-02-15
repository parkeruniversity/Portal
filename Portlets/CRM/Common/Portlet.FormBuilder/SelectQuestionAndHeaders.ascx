<%@ Control Language="c#" AutoEventWireup="false" Codebehind="SelectQuestionAndHeaders.ascx.cs" Inherits="Jenzabar.CRM.Common.Web.Portlets.FormBuilderPortlet.SelectQuestionAndHeaders" %>
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
		<tr><td>
			<jenzabar:groupedgrid id="dgQuestionsHeaders" DataKeyField="ID" Width="100%" RenderTableHeaders="True" runat="server" visible="False">
				<Columns>
					<asp:TemplateColumn HeaderStyle-Width="5%" ItemStyle-Width="5%">
						<ItemTemplate>
							<asp:CheckBox ID="cbAssigned" Runat="server" Checked='<%# DataBinder.Eval(Container.DataItem, "Assigned")%>'>
							</asp:CheckBox>
						</ItemTemplate>
					</asp:TemplateColumn>
					<asp:BoundColumn DataField="Description" HeaderStyle-Width="75%" ItemStyle-Width="75%" />
					<asp:TemplateColumn HeaderStyle-Width="5%" ItemStyle-Width="5%" ItemStyle-Wrap="False">
						<ItemTemplate>
							<asp:ImageButton ID="btnEdit" CommandName="EditQuestionHeader" Runat="server" />
							<asp:ImageButton ID="btnDelete" CommandName="DeleteQuestionHeader" Runat="server" Visible="False" />
						</ItemTemplate>
					</asp:TemplateColumn>
				</Columns>
			</jenzabar:groupedgrid>
		</td></tr>
	</table>
</div>
<div class="pSection">
	<table width="100%">
		<tr>
			<td align="left" colSpan="2"><asp:linkbutton id="lnkAddQuestion" runat="server">Add Question</asp:linkbutton></td>
		</tr>
		<tr>
			<td align="left" colSpan="2"><asp:linkbutton id="lnkAddHeader" runat="server">Add Header</asp:linkbutton></td>
		</tr>
	</table>
	<table width="100%">
		<tr>	
			<td align="left" width="15%" nowrap="true">
				<asp:Button ID="btnSave" Runat="server" Visible="False"></asp:Button>&nbsp;
				<asp:Button ID="btnCancel" Runat="server" Visible="True"></asp:Button></td>
			</td>
			<td align="right" width="85%"><asp:Label ID="lblIndicateHeaderText" Runat="server"></asp:Label></td>
		</tr>			
	</table>
</div>