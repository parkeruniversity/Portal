<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="True" Codebehind="AcceptDeclineAid.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.FinancialAidAwardsPortlet.AcceptDeclineAid"%>
<h4>
	<jenzabar:globalizedlabel id="lblAwardsFor" Runat="server" TextKey="TXT_FAA_AWARDS_FOR"></jenzabar:globalizedlabel>
	<jenzabar:globalizedlabel id="lblStudentName" Runat="server"></jenzabar:globalizedlabel>
</h4>
<div class="pSection"><jenzabar:errordisplay id="errDisplay" Runat="server"></jenzabar:errordisplay></div>
<div class="pSection" id="divMessage" visible="False" runat="server"><asp:label id="lblMessage" Runat="server"></asp:label></div>
<div class="pSection" id="divAid" runat="server">
	<asp:Literal ID="ltHeader" Runat="server"></asp:Literal><br>
	<table height="10%" cellSpacing="3" cellPadding="3" width="100%">
		<tr>
			<th noWrap width="5%" valign="top">
				<jenzabar:globalizedlabel id="lblAwardsYear" Runat="server" TextKey="TXT_FAA_AWARD_YEAR"></jenzabar:globalizedlabel></th>
			<td valign="top"><jenzabar:globalizedlabel id="lblYear" Runat="server"></jenzabar:globalizedlabel></td>
		</tr>
	</table>
	<table height="10%" cellSpacing="3" cellPadding="3" width="100%">
	    <tr>
			<td valign="top">
    		    <asp:Image ID="imKeyArrow" runat="server" imageurl="~/UI/Common/Images/PortletImages/Icons/dblarrow_right_yl.gif" />
				<asp:label ID="lblKey" Runat="server" Font-Italic="true" Text="Indicates an award that needs a decision"></asp:label>
			</td>
		</tr>
	</table>
	<jenzabar:groupedgrid id="dgAwards" Runat="server" DataKeyField="AwardKey" RenderTableHeaders="true">
		<TableHeaderTemplate>Award Decisions</TableHeaderTemplate>
		<Columns>
			<asp:TemplateColumn>
				<ItemTemplate>
    		        <asp:Image ID="imArrow" runat="server" imageurl="~/UI/Common/Images/PortletImages/Icons/dblarrow_right_yl.gif" />
			    </ItemTemplate>
			</asp:TemplateColumn>
			<asp:BoundColumn DataField="Desc" ItemStyle-VerticalAlign="Top" />
			<asp:BoundColumn DataField="Amount" ItemStyle-VerticalAlign="Top" ItemStyle-HorizontalAlign="Right" />
			<asp:TemplateColumn>
				<ItemTemplate>
					<jenzabar:GlobalizedRadioButton ID="rdAccept" Runat="server" TextKey="TXT_ACCEPT" GroupName="acceptDecline" ></jenzabar:GlobalizedRadioButton>
					<br/>
					<jenzabar:GlobalizedRadioButton ID="rdLower" Runat="server" TextKey="TXT_ACCEPT_LOWER" GroupName="acceptDecline" ></jenzabar:GlobalizedRadioButton>
					<div id="divAmt" runat="server">$<asp:TextBox id="tbAmount" Width="85" runat="server" /></div>
					<jenzabar:GlobalizedRadioButton ID="rdDecline" Runat="server" TextKey="TXT_DECLINE" GroupName="acceptDecline" ></jenzabar:GlobalizedRadioButton>
				</ItemTemplate>
			</asp:TemplateColumn>
			<asp:BoundColumn DataField="Status" ItemStyle-VerticalAlign="Top" ItemStyle-Width="1%" ItemStyle-Wrap="false" />
		</Columns>
	</jenzabar:groupedgrid>
	<jenzabar:globalizedbutton id="btnNext" tabIndex="0" runat="server" TextKey="TXT_NEXT"></jenzabar:globalizedbutton>&nbsp;
	<jenzabar:globalizedbutton id="btnBack" tabIndex="0" runat="server" TextKey="TXT_CANCEL"></jenzabar:globalizedbutton>
	<br/>
	<asp:Literal ID="ltFooter" Runat="server"></asp:Literal>
</div>

