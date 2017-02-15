<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common"%>
<%@ Control Language="c#" AutoEventWireup="True" Codebehind="BudgetToActual.ascx.cs" Inherits="Jenzabar.CRM.Staff.Web.Portlets.GLAccountLookupPortlet.BudgetToActual" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<table id="Table1" cellspacing="3" cellpadding="3" width="100%" border="0">
	<tr>
		<td><asp:label id="lblError" runat="server" ForeColor="#ff0000"></asp:label></td>
	</tr>
	<tr>
		<td align="center"><asp:label id="lblPeriod" runat="server"></asp:label></td>
	</tr>
	<tr>
		<td><asp:GridView ID="dgBudgetToActual" runat="server" DataKeyNames="AccountNumber" Width="100%"
                AutoGenerateColumns="False" ShowFooter="True" GridLines="None" CssClass="GLGridView"
                AlternatingRowStyle-CssClass="alt" AllowSorting="true">
            <HeaderStyle CssClass="GLGridViewHeader" />
            <FooterStyle CssClass="GLGridViewFooter" />
				<Columns>
				    <%-- 0 --%>
                    <asp:TemplateField HeaderText="Account Number" SortExpression="AccountNumber">
                        <ItemTemplate>
                            <asp:Label runat="server"><%# DataBinder.Eval(Container.DataItem,"AccountNumber") %></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:HyperLink runat="server" ID="lnkExportImage" CssClass="GLFloatLeft GLMarginRight"
                                Text="Export To Excel" />
                            <asp:HyperLink runat="server" ID="lnkExport" CssClass="GLFloatLeft" Text="Export To Excel" />
                        </FooterTemplate>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:TemplateField>
                    <%-- 1 --%>
					<asp:TemplateField HeaderText="Description" SortExpression="AccountDesc">
                        <ItemTemplate>
                            <asp:Label runat="server"><%# DataBinder.Eval(Container.DataItem, "AccountDesc")%></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate><span>Totals:</span></FooterTemplate>
                    </asp:TemplateField>
                    <%-- 2 --%>
                    <asp:TemplateField HeaderText="Account Type" SortExpression="AccountDesc">
                        <ItemTemplate>
                            <asp:Label runat="server"><%# DataBinder.Eval(Container.DataItem, "AccountType")%></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate><span>Totals:</span></FooterTemplate>
                    </asp:TemplateField>
                    <%-- 3 --%>
                    <asp:TemplateField HeaderText="Beginning Balance" SortExpression="BeginningBal">
						<ItemTemplate>
							 <asp:Label runat="server"><%# DataBinder.Eval(Container.DataItem,"BeginningBal", "{0:c}") %></asp:Label>
						</ItemTemplate>
                        <FooterTemplate>
                            <span><%# string.Format("{0:c}", Convert.ToDecimal(BudgetLookupInfo.BeginningBalTotal))%></span>
                        </FooterTemplate>
						<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                        <FooterStyle Wrap="False" HorizontalAlign="Right" Font-Bold="true" />
					</asp:TemplateField>
                    <%-- 4 --%>
					<asp:TemplateField HeaderText="Unposted Balance" SortExpression="UnpostedBal">
						<ItemTemplate>
							<asp:LinkButton ID="lnkUnpostedBalance" CommandName="UnpostedBalance" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"AccountNumber")+"||U||"+DataBinder.Eval(Container.DataItem,"AccountDesc")+"||"+DataBinder.Eval(Container.DataItem,"BeginPostBal")+"||"+DataBinder.Eval(Container.DataItem,"EndBal")%>'
                                runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"UnpostedBal", "{0:c}") %>' />
						</ItemTemplate>
                        <FooterTemplate>
                            <span><%# string.Format("{0:c}", Convert.ToDecimal(BudgetLookupInfo.UnpostBalTotal))%></span>
                        </FooterTemplate>
						<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                        <FooterStyle Wrap="False" HorizontalAlign="Right" Font-Bold="true" />
					</asp:TemplateField>
                    <%-- 5 --%>
					<asp:TemplateField HeaderText="Posted Balance" SortExpression="PostedBal">
						<ItemTemplate>
							<asp:LinkButton ID="lnkPostedBal" CommandName="PostedBal" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"AccountNumber")+"||P||"+DataBinder.Eval(Container.DataItem,"AccountDesc")+"||"+DataBinder.Eval(Container.DataItem,"BeginPostBal")+"||"+DataBinder.Eval(Container.DataItem,"EndBal")%>'
                                runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"PostedBal", "{0:c}") %>' />
						</ItemTemplate>
                        <FooterTemplate>
                            <span>
                                <%# string.Format("{0:c}", Convert.ToDecimal(BudgetLookupInfo.PostedBalTotal))%></span>
                        </FooterTemplate>
						<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                        <FooterStyle Wrap="False" HorizontalAlign="Right" Font-Bold="true" />
                    </asp:TemplateField>
                    <%-- 6 --%>
					<asp:TemplateField HeaderText="Encumbrance" SortExpression="Encumbrance">
						<ItemTemplate>
							<asp:LinkButton ID="lnkEncumbrance" CommandName="Encumbrance" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"AccountNumber")+"||E||"+DataBinder.Eval(Container.DataItem,"AccountDesc")+"||"+DataBinder.Eval(Container.DataItem,"BeginPostBal")+"||"+DataBinder.Eval(Container.DataItem,"EndBal")%>'
                                runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"Encumbrance", "{0:c}") %>' />
						</ItemTemplate>
                        <FooterTemplate>
                            <span>
                                <%# string.Format("{0:c}", Convert.ToDecimal(BudgetLookupInfo.EncumbranceTotal))%></span>
                        </FooterTemplate>
						<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                        <FooterStyle Wrap="False" HorizontalAlign="Right" Font-Bold="true" />
                    </asp:TemplateField>
                    <%-- 7 --%>
					<asp:TemplateField HeaderText="Ending Balance" SortExpression="TotalAgainstBudget">
						<ItemTemplate>
							<asp:LinkButton ID="lnkTotBud" CommandName="TotBud" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"AccountNumber")+"||A||"+DataBinder.Eval(Container.DataItem,"AccountDesc")+"||"+DataBinder.Eval(Container.DataItem,"BeginPostBal")+"||"+DataBinder.Eval(Container.DataItem,"EndBal")%>'
                                runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"TotalAgainstBudget", "{0:c}") %>' />
						</ItemTemplate>
                        <FooterTemplate>
                            <span>
                                <%# string.Format("{0:c}", Convert.ToDecimal(BudgetLookupInfo.TotalAgainstBudgetTotal))%></span>
                        </FooterTemplate>
						<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                        <FooterStyle Wrap="False" HorizontalAlign="Right" Font-Bold="true" />
                    </asp:TemplateField>
                    <%-- 8 --%>
					<asp:TemplateField HeaderText="Other Accounts Against Budget" SortExpression="OtherAgainstBudget">
                        <ItemTemplate>
                            <span>
                                <%# DataBinder.Eval(Container.DataItem, "OtherAgainstBudget", "{0:c}")%>
                            </span>
                          <%if( BudgetLookupInfo.IncludesMergedLineitem == "*" ){%> <span>&nbsp;</span> <%}%>
                        </ItemTemplate>
                        <FooterTemplate>
                            <span>
                                <%# string.Format("{0:c}" , Convert.ToDecimal(BudgetLookupInfo.OtherAgainstBudgetTotal))%><%#BudgetLookupInfo.IncludesMergedLineitem %></span>
                        </FooterTemplate>
						<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                        <FooterStyle Wrap="False" HorizontalAlign="Right" Font-Bold="true" />
                    </asp:TemplateField>
                    <%-- 9 --%>
					<asp:TemplateField HeaderText="Total Period Budget" SortExpression="PeriodBudget">
                        <ItemTemplate>
                            <span>
                                <%# DataBinder.Eval(Container.DataItem, "PeriodBudget", "{0:c}")%>

                            </span>
                           <%if( BudgetLookupInfo.IncludesMergedLineitem == "*" ){%> <span>&nbsp;</span> <%}%>
                        </ItemTemplate>
                        <FooterTemplate>
                            <span>
                                <%# string.Format("{0:c}", Convert.ToDecimal(BudgetLookupInfo.PeriodBudgetTotal))%><%#BudgetLookupInfo.IncludesMergedLineitem %></span>
                        </FooterTemplate>
						<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                        <FooterStyle Wrap="False" HorizontalAlign="Right" Font-Bold="true" />
                    </asp:TemplateField>
                    <%-- 10 --%>
					<asp:TemplateField HeaderText="Total Annual Budget" SortExpression="AnnualBudget">
                        <ItemTemplate>
                            <span>
                                <%# DataBinder.Eval(Container.DataItem, "AnnualBudget", "{0:c}")%>

                            </span>
                            <%if( BudgetLookupInfo.IncludesMergedLineitem == "*" ){%> <span>&nbsp;</span> <%}%>
                        </ItemTemplate>
                        <FooterTemplate>
                            <span>
                                <%# string.Format("{0:c}", Convert.ToDecimal(BudgetLookupInfo.AnnualBudgetTotal))%><%#BudgetLookupInfo.IncludesMergedLineitem %></span>
                        </FooterTemplate>
						<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                        <FooterStyle Wrap="False" HorizontalAlign="Right" Font-Bold="true" />
                    </asp:TemplateField>
                    <%-- 11 --%>
					<asp:TemplateField HeaderText="Over/Under Budget" SortExpression="OverUnderBudget">
                        <ItemTemplate>
                            <span class='<%# DeriveOverUnderBudgetStyle(BudgetLookupInfo.BudRange.ToUpper(), Eval("PeriodBudget"), Eval("AnnualBudget"), Eval("TotalAgainstBudget")) %>'>
                            <%# DataBinder.Eval(Container.DataItem, "OverUnderBudget", "{0:c}")%></span>
                           <%if( BudgetLookupInfo.IncludesMergedLineitem == "*" ){%> <span>&nbsp;</span> <%}%>
                        </ItemTemplate>
                        <FooterTemplate>
                            <span>
                                <%# string.Format("{0:c}", Convert.ToDecimal(BudgetLookupInfo.OverUnderTotal) )%><%#BudgetLookupInfo.IncludesMergedLineitem %></span>
                        </FooterTemplate>
						<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                        <FooterStyle Wrap="False" HorizontalAlign="Right" Font-Bold="true" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="OverBudget" Visible="False" HeaderText="Over Budget">
                        <ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                        <FooterStyle Wrap="False" HorizontalAlign="Right" Font-Bold="true" />
                    </asp:BoundField>
					<asp:BoundField DataField="RemainingBudget" Visible="False" HeaderText="Remaining Budget">
						<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                        <FooterStyle Wrap="False" HorizontalAlign="Right" Font-Bold="true" />
                    </asp:BoundField>
				</Columns>
			</asp:GridView></td>
	</tr>
	<tr>
		<td align="center">
			<table id="tblPagination" cellspacing="1" cellpadding="1" width="300" border="0">
				<tr>
					<td align="center">
						<asp:LinkButton id="lbPrev" runat="server" Visible="False"></asp:LinkButton></td>
					<td align="center">
						<asp:LinkButton id="lbPos1" runat="server" Visible="False"></asp:LinkButton></td>
					<td align="center">
						<asp:LinkButton id="lbPos2" runat="server" Visible="False"></asp:LinkButton></td>
					<td align="center">
						<asp:LinkButton id="lbPos3" runat="server" Visible="False"></asp:LinkButton></td>
					<td align="center">
						<asp:LinkButton id="lbPos4" runat="server" Visible="False"></asp:LinkButton></td>
					<td align="center">
						<asp:LinkButton id="lbPos5" runat="server" Visible="False"></asp:LinkButton></td>
					<td align="center">
						<asp:LinkButton id="lbPos6" runat="server" Visible="False"></asp:LinkButton></td>
					<td align="center">
						<asp:LinkButton id="lbPos7" runat="server" Visible="False"></asp:LinkButton></td>
					<td align="center">
						<asp:LinkButton id="lbPos8" runat="server" Visible="False"></asp:LinkButton></td>
					<td align="center">
						<asp:LinkButton id="lbNext" runat="server" Visible="False"></asp:LinkButton></td>
				</tr>
			</table>
		</td>
	</tr>
    <tr>
		<td>
			<table>
				<tr>
				    <td>
				        <asp:Label ID="lblMergedAccountsIncludedInfoText" runat="server" Visible="False" font-Bold="True"/>
				    </td>
				    <td colspan="8">
				        <common:Hint id="hntSearchHint" runat="server"/>
				    </td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<table cellspacing="3" cellpadding="3">
				<tr>
					<td><asp:button id="btnNewSearch" runat="server" onclick="btnNewSearch_Click"></asp:button></td>
					<td><asp:button id="btnCancel" runat="server" onclick="btnCancel_Click"></asp:button></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
