<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="True" Codebehind="AidAwardsList.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.FinancialAidAwardsPortlet.AidAwardsList"%>
<h4>
	<jenzabar:globalizedlabel id="lblAwardsFor" Runat="server" TextKey="TXT_FAA_AWARDS_FOR"></jenzabar:globalizedlabel>
	<jenzabar:globalizedlabel id="lblStudentName" Runat="server"></jenzabar:globalizedlabel>
</h4>
<jenzabar:errordisplay id="errDisplay" Runat="server"></jenzabar:errordisplay>
<div class="pSection" id="divNoData" runat="server"><jenzabar:Hint id="litNoData" TextKey="TXT_DT_NO_FINANCIAL_AID_INFO" runat="server"></jenzabar:Hint></div>
<div class="pSection">
	<asp:Literal ID="ltHeader" Runat="server"></asp:Literal><br>
	<table height="10%" cellSpacing="3" cellPadding="3" width="100%" border="0">
		<tr>
			<th noWrap valign="top" width="5%">
				<jenzabar:globalizedlabel id="lblAwardsYear" Runat="server" TextKey="TXT_FAA_AWARD_YEAR"></jenzabar:globalizedlabel></th>
			<td valign="top"><asp:dropdownlist id="ddlAwardYear" DataTextField="YearDesc" DataValueField="YearKey" AutoPostBack="True"
					runat="server"></asp:dropdownlist><jenzabar:globalizedlabel id="lblYear" Runat="server"></jenzabar:globalizedlabel></td>
		</tr>
    </table>
	<table height="10%" cellSpacing="3" cellPadding="3" width="100%">
		<tr>
			<td valign="top">
    		    <asp:Image ID="imKeyArrow" runat="server" imageurl="~/UI/Common/Images/PortletImages/Icons/dblarrow_right_yl.gif" />
				<asp:label ID="lblKey" Runat="server" Font-Italic="true" Text="Indicates an award that needs a decision.  Click here to "></asp:label>
	            <asp:LinkButton id="btnKeyAccept" tabIndex="0" runat="server" TextKey="TXT_ACCEPT_DECLINE"></asp:LinkButton>
			</td>
		</tr>
    </table>
	<jenzabar:groupedgrid id="dgAwards" Runat="server" ShowHeader="True" ShowFooter="True" RenderTableHeaders="true" RenderTableFooters="true">
		<TableHeaderTemplate>Awards</TableHeaderTemplate>
		<Columns>
			<asp:TemplateColumn>
				<ItemTemplate>
    		        <asp:Image ID="imArrow" runat="server" imageurl="~/UI/Common/Images/PortletImages/Icons/dblarrow_right_yl.gif" />
			    </ItemTemplate>
			</asp:TemplateColumn>
			<asp:BoundColumn DataField="Desc" ItemStyle-VerticalAlign="Top" />
			<asp:BoundColumn DataField="Amount" ItemStyle-VerticalAlign="Top" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right" />
			<asp:BoundColumn DataField="AcceptedAmount" ItemStyle-VerticalAlign="Top" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right" />
			<asp:BoundColumn DataField="Status" ItemStyle-VerticalAlign="Top" ItemStyle-Width="1%" ItemStyle-Wrap="false"/>
		</Columns>
	</jenzabar:groupedgrid><br>
	<asp:LinkButton id="btnAccept" tabIndex="0" runat="server" TextKey="TXT_ACCEPT_DECLINE"></asp:LinkButton>
	<br>
	<br>
	<asp:Literal ID="ltFooter" Runat="server"></asp:Literal>
</div>
