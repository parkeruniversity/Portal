<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="AwardChangeResults.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.FinancialAidAwardsPortlet.AwardChangeResults"%>
<jenzabar:errordisplay id="errDisplay" Runat="server"></jenzabar:errordisplay>
<h4>
	<jenzabar:globalizedlabel id="lblAwardsFor" Runat="server" TextKey="TXT_FAA_AWARDS_FOR"></jenzabar:globalizedlabel>
	<jenzabar:globalizedlabel id="lblStudentName" Runat="server"></jenzabar:globalizedlabel>
</h4>
<div class="pSection">
	<asp:Literal ID="ltHeader" Runat="server"></asp:Literal><br>
	<table height="10%" cellSpacing="3" cellPadding="3" width="100%">
		<tr>
			<th noWrap valign="top" width="5%" >
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
			<asp:BoundColumn DataField="Response" ItemStyle-VerticalAlign="Top" />
		</Columns>
	</jenzabar:groupedgrid>
	<jenzabar:GlobalizedButton id="btnContinue" Textkey="TXT_CONTINUE" runat="server"></jenzabar:GlobalizedButton>
	<br><br>
	<asp:Literal ID="ltFooter" Runat="server"></asp:Literal>
</div>
