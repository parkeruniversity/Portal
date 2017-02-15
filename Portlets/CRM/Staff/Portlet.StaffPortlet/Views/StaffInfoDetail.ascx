<%@ Control Language="c#" AutoEventWireup="True" Codebehind="StaffInfoDetail.ascx.cs" Inherits="Jenzabar.CRM.Staff.Web.Portlets.StaffPortletPortlet.StaffInfoDetail" %>
<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="uc" TagName="UCTimeOffAccrual" Src="~/Portlets/CRM/Staff/Portlet.StaffPortlet/Controls/UCTimeOffAccrual.ascx" %>
<jenzabar:tabgroup id="tgStaffInfoDetail" runat="server">
    <jenzabar:Tab id="tPayStatement" runat="server">
		<br/>
        <table cellspacing="10">
			<tr>
				<td colspan="2">
                    <span style="font-size:1.4em;"><jenzabar:globalizedliteral Runat="server" TextKey="TXT_STAFF_PORTLET_PORTLET_PAY_STATEMENT_HEADER"></jenzabar:globalizedliteral></span>
				</td>
			</tr>
            <tr>
				<td>
                    <span style="font-size:1.2em;"><jenzabar:globalizedliteral Runat="server" TextKey="TXT_STAFF_PORTLET_PORTLET_PAY_STATEMENT_DROPDOWN"></jenzabar:globalizedliteral></span>
                    <asp:DropDownList ID="ddlPayStatements" Runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlPayStatements_SelectedIndexChanged"></asp:DropDownList>         
				</td>
			</tr>
            <tr>
				<td colspan="2">
                    <jenzabar:globalizedliteral ID="glParagraph" Runat="server" TextKey="TXT_STAFF_PORTLET_PORTLET_PAY_STATEMENT_PARAGRAPH"></jenzabar:globalizedliteral>                    
                    <jenzabar:globalizedliteral ID="glParagraphAlt" Runat="server" TextKey="TXT_STAFF_PORTLET_PORTLET_PAY_STATEMENT_PARAGRAPH_ALT"></jenzabar:globalizedliteral>
				</td>                
			</tr>
            <tr>
				<td colspan="2">
                    <asp:GridView ID="gvPayStatements" runat="server" AutoGenerateColumns="false" ShowHeader="true" GridLines="None">                  
                        <AlternatingRowStyle CssClass="StaffPortletGridViewAlternatingStyle" />
                        <Columns>           
                            <asp:TemplateField HeaderStyle-CssClass="StaffPortletGridViewHeaderStyle" ItemStyle-CssClass="StaffPortletGridViewItemStyle">
                                <ItemTemplate>
                                    <asp:HyperLink runat="server" Text='<%# Eval("CheckDate", "{0:MM/dd/yyyy}") %>' NavigateUrl='<%# Eval("CheckNumber", "~/Portlets/CRM/Staff/Portlet.StaffPortlet/Controls/CheckStatement.aspx?CheckNumber={0}") %>'
                                        Target="_blank" Visible='<%# !(bool)Eval("IsVoided") %>' />
                                    <asp:Literal runat="server" Text='<%# Eval("CheckDate", "{0:MM/dd/yyyy}") %>' Visible='<%# Eval("IsVoided") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>                            
                            <asp:BoundField DataField="CheckNumber" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" HeaderStyle-CssClass="StaffPortletGridViewHeaderStyle" ItemStyle-CssClass="StaffPortletGridViewItemStyle" />
                            <asp:BoundField DataField="GrossPay" DataFormatString="{0:C}" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" HeaderStyle-CssClass="StaffPortletGridViewHeaderStyle" ItemStyle-CssClass="StaffPortletGridViewItemStyle" />
                            <asp:BoundField DataField="NetPay" DataFormatString="{0:C}" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" HeaderStyle-CssClass="StaffPortletGridViewHeaderStyle" ItemStyle-CssClass="StaffPortletGridViewItemStyle" />
                            <asp:TemplateField HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" HeaderStyle-CssClass="StaffPortletGridViewHeaderStyle" ItemStyle-CssClass="StaffPortletGridViewItemStyle">
                                <ItemTemplate>
                                    <jenzabar:GlobalizedLiteral runat="server" TextKey="TXT_STAFF_PORTLET_PORTLET_PAY_STATEMENT_GRIDVIEW_COMMENT_VOIDED" Visible='<%# Eval("IsVoided") %>'  />
                                </ItemTemplate>
                            </asp:TemplateField>                            
                        </Columns>
                    </asp:GridView>
				</td>                
			</tr>
		</table>
	</jenzabar:Tab>
	<jenzabar:Tab id="tDeductionInfo" runat="server">
		<table>
			<tr>
				<td>
					<br>
					<jenzabar:GroupedGrid id="ggDeductionInfo" runat="server" RenderTableHeaders="True"></jenzabar:GroupedGrid>
				</td>
			</tr>
			<tr>
				<td>
					<asp:Label ID="lblDedError" Runat="server" Visible="False"></asp:Label>
				</td>
			</tr>
		</table>
	</jenzabar:Tab>
	<jenzabar:Tab id="tPositionInfo" runat="server">
		<table>
			<tr>
				<td>
					<br>
					<jenzabar:GroupedGrid id="ggPositionInfo" runat="server" RenderTableHeaders="True">
						<Columns>
							<asp:BoundColumn DataField="PositionName" HeaderStyle-HorizontalAlign="Center" ItemStyle-Wrap="False"></asp:BoundColumn>
							<asp:BoundColumn DataField="RegularAmount" HeaderStyle-HorizontalAlign="Center" ItemStyle-Wrap="False" ItemStyle-HorizontalAlign="Right"></asp:BoundColumn>
							<asp:BoundColumn DataField="YTDAmount" HeaderStyle-HorizontalAlign="Center" ItemStyle-Wrap="False" ItemStyle-HorizontalAlign="Right"></asp:BoundColumn>
						</Columns>
					</jenzabar:GroupedGrid>
				</td>
			</tr>
			<tr>
				<td>
					<asp:Label ID="lblPosError" Runat="server" Visible="False"></asp:Label>
				</td>
			</tr>
		</table>
	</jenzabar:Tab>
	<jenzabar:Tab id="tTaxInfo" runat="server">
		<table>
			<tr>
				<td>
					<br>
					<jenzabar:GroupedGrid id="ggTaxInfo" runat="server" RenderTableHeaders="True">
						<Columns>
							<asp:BoundColumn DataField="TaxName" HeaderStyle-HorizontalAlign="Center" ItemStyle-Wrap="False"></asp:BoundColumn>
							<asp:BoundColumn DataField="FilingStatus" HeaderStyle-HorizontalAlign="Center" ItemStyle-Wrap="False"></asp:BoundColumn>
							<asp:BoundColumn DataField="Exemptions" HeaderStyle-HorizontalAlign="Center" ItemStyle-Wrap="False" ItemStyle-HorizontalAlign="Right"></asp:BoundColumn>
							<asp:BoundColumn DataField="AdditionalAmount" HeaderStyle-HorizontalAlign="Center" ItemStyle-Wrap="False" ItemStyle-HorizontalAlign="Right"></asp:BoundColumn>
							<asp:BoundColumn DataField="YTDWithheld" HeaderStyle-HorizontalAlign="Center" ItemStyle-Wrap="False" ItemStyle-HorizontalAlign="Right"></asp:BoundColumn>
							<asp:BoundColumn DataField="YTDTaxableWages" HeaderStyle-HorizontalAlign="Center" ItemStyle-Wrap="False" ItemStyle-HorizontalAlign="Right"></asp:BoundColumn>
						</Columns>
					</jenzabar:GroupedGrid>
				</td>
			</tr>
			<tr>
				<td>
					<asp:Label ID="lblTaxError" Runat="server" Visible="False"></asp:Label>
				</td>
			</tr>
		</table>
	</jenzabar:Tab>
	<jenzabar:Tab id="tDependentInfo" runat="server">
		<table>
			<tr>
				<td>
					<br>
					<asp:DataGrid id="dgDependentInfo" runat="server" ShowHeader="True" AutoGenerateColumns="False" GridLines="None">
						<Columns>
							<asp:BoundColumn DataField="Name" ItemStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center"></asp:BoundColumn>
							<asp:BoundColumn DataField="Relationship" ItemStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center"></asp:BoundColumn>
							<asp:BoundColumn DataField="PhoneNumber" ItemStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center"></asp:BoundColumn>
							<asp:BoundColumn DataField="DOB" ItemStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center"></asp:BoundColumn>
							<asp:TemplateColumn ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
								<ItemTemplate>
									<asp:CheckBox ID="cbxStudent" Runat="server" Enabled="False"></asp:CheckBox>
								</ItemTemplate>
							</asp:TemplateColumn>
							<asp:TemplateColumn ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
								<ItemTemplate>
									<asp:CheckBox ID="cbxHandicapped" Runat="server" Enabled="False"></asp:CheckBox>
								</ItemTemplate>
							</asp:TemplateColumn>							
							<asp:BoundColumn DataField="Dummy" Visible="False"></asp:BoundColumn>
							<asp:BoundColumn DataField="FirstName" Visible="False"></asp:BoundColumn>
							<asp:BoundColumn DataField="MiddleName" Visible="False"></asp:BoundColumn>
							<asp:BoundColumn DataField="LastName" Visible="False"></asp:BoundColumn>
							<asp:BoundColumn DataField="HomePhone" Visible="False"></asp:BoundColumn>
							<asp:BoundColumn DataField="WorkPhone" Visible="False"></asp:BoundColumn>
							<asp:BoundColumn DataField="Address" Visible="False"></asp:BoundColumn>
							<asp:BoundColumn DataField="City" Visible="False"></asp:BoundColumn>
							<asp:BoundColumn DataField="State" Visible="False"></asp:BoundColumn>
							<asp:BoundColumn DataField="Zip" Visible="False"></asp:BoundColumn>
							<asp:BoundColumn DataField="Country" Visible="False"></asp:BoundColumn>
							<asp:BoundColumn DataField="UniqueIdentifier" Visible="False"></asp:BoundColumn>
							<asp:BoundColumn DataField="SSN" Visible="False"></asp:BoundColumn>
						</Columns>
					</asp:DataGrid>
				</td>
			</tr>
			<tr>
				<td>
					<asp:Label ID="lblDepError" Runat="server" Visible="False"></asp:Label>
				</td>
			</tr>
		</table>
	</jenzabar:Tab>
	<jenzabar:Tab id="tTimeOffAccrual" runat="server">
		<uc:UCTimeOffAccrual id="accrual1" runat="server" /> 
	</jenzabar:Tab>
</jenzabar:tabgroup>
