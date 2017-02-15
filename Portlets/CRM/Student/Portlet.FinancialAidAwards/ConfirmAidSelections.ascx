<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ConfirmAidSelections.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.FinancialAidAwardsPortlet.ConfirmAidSelection"%>
<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<h4>
	<jenzabar:globalizedlabel id="lblAwardsFor" Runat="server" TextKey="TXT_FAA_AWARDS_FOR"></jenzabar:globalizedlabel>
	<jenzabar:globalizedlabel id="lblStudentName" Runat="server"></jenzabar:globalizedlabel>
</h4>
<div class="pSection"><jenzabar:errordisplay id="errDisplay" Runat="server"></jenzabar:errordisplay>
	<asp:Literal ID="ltHeader" Runat="server"></asp:Literal><br>
	<table height="10%" cellSpacing="3" cellPadding="3" width="100%">
		<tr>
			<th noWrap valign="top" width="5%">
				<jenzabar:globalizedlabel id="lblAwardsYear" Runat="server" TextKey="TXT_FAA_AWARD_YEAR"></jenzabar:globalizedlabel></th>
			<td valign="top"><jenzabar:globalizedlabel id="lblYear" Runat="server"></jenzabar:globalizedlabel></td>
		</tr>
	</table>
	<jenzabar:groupedgrid id="dgAwards" Runat="server" DataKeyField="AwardKey" RenderTableHeaders="true">
		<Columns>
			<asp:BoundColumn DataField="Desc" ItemStyle-VerticalAlign="Top" />
			<asp:BoundColumn DataField="Amount" ItemStyle-VerticalAlign="Top" ItemStyle-HorizontalAlign="Right" />
			<asp:BoundColumn DataField="Status" ItemStyle-VerticalAlign="Top" ItemStyle-Width="1%" ItemStyle-Wrap="false" />
			<asp:BoundColumn DataField="AcceptDecline" ItemStyle-VerticalAlign="Top" />
		</Columns>
	</jenzabar:groupedgrid><br>
	<jenzabar:globalizedbutton id="btnBack" tabIndex="0" runat="server" TextKey="TXT_BACK"></jenzabar:globalizedbutton>&nbsp;
	<jenzabar:globalizedbutton id="btnSubmit" tabIndex="0" runat="server" TextKey="TXT_SUBMIT"></jenzabar:globalizedbutton>
	<br>
	<br>
	<asp:Literal ID="ltFooter" Runat="server"></asp:Literal>
</div>
