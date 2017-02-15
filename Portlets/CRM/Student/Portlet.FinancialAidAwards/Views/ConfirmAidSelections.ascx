<%@ Control Language="c#" AutoEventWireup="True" Codebehind="ConfirmAidSelections.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.FinancialAidAwardsPortlet.ConfirmAidSelection"%>
<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<h4>
	<jenzabar:globalizedlabel id="lblAwardsFor" Runat="server" TextKey="TXT_FAA_AWARDS_FOR"></jenzabar:globalizedlabel>
	<jenzabar:globalizedlabel id="lblStudentName" Runat="server"></jenzabar:globalizedlabel>
</h4>
<div class="pSection"><jenzabar:errordisplay id="errDisplay" Runat="server"></jenzabar:errordisplay>
	<div class="hint" id="divMessage" runat="server" visible="True"><jenzabar:globalizedlabel id="lblMessage" runat="server" TextKey="MSG_FA_REVIEW_SUBMIT"></jenzabar:globalizedlabel><br></div><br>
	<asp:Literal ID="ltHeader" Runat="server"></asp:Literal><br>
	<table height="10%" cellSpacing="3" cellPadding="3" width="100%">
		<tr>
			<th noWrap valign="top" width="5%">
				<jenzabar:globalizedlabel id="lblAwardsYear" Runat="server" TextKey="TXT_FAA_AWARD_YEAR"></jenzabar:globalizedlabel></th>
			<td valign="top"><jenzabar:globalizedlabel id="lblYear" Runat="server"></jenzabar:globalizedlabel></td>
		</tr>
	</table>
	<jenzabar:groupedgrid id="dgAwards" Runat="server" DataKeyField="AwardKey" RenderTableHeaders="true" RenderTableFooters="true">
		<TableHeaderTemplate>Award Decisions</TableHeaderTemplate>
		<Columns>
			<asp:BoundColumn DataField="Desc" ItemStyle-VerticalAlign="Top" />
			<asp:BoundColumn DataField="Amount" ItemStyle-VerticalAlign="Top" ItemStyle-HorizontalAlign="Right"  FooterStyle-HorizontalAlign="Right" />
			<asp:BoundColumn DataField="AcceptDecline" ItemStyle-VerticalAlign="Top" />
			<asp:BoundColumn DataField="AcceptedAmount" ItemStyle-VerticalAlign="Top" ItemStyle-HorizontalAlign="Right"  FooterStyle-HorizontalAlign="Right" />
			<asp:BoundColumn DataField="Status" ItemStyle-VerticalAlign="Top" ItemStyle-Width="1%" ItemStyle-Wrap="false" />
		</Columns>
	</jenzabar:groupedgrid>
	<jenzabar:globalizedbutton id="btnSubmit" tabIndex="0" runat="server" TextKey="TXT_SUBMIT"></jenzabar:globalizedbutton>&nbsp;
	<jenzabar:globalizedbutton id="btnBack" tabIndex="0" runat="server" TextKey="TXT_EDIT"></jenzabar:globalizedbutton>&nbsp;
	<jenzabar:globalizedbutton id="btnCancel" tabIndex="0" runat="server" TextKey="TXT_CANCEL"></jenzabar:globalizedbutton>
	<br/>
	<asp:Literal ID="ltFooter" Runat="server"></asp:Literal>
</div>
