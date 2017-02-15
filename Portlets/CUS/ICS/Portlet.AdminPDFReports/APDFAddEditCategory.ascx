<%@ Control Language="c#" AutoEventWireup="false" Codebehind="APDFAddEditCategory.ascx.cs" Inherits="Jenzabar.CUS.ICS.Web.Portlets.AdminPDFReportsPortlet.APDFAddEditCategory" %>
<%@ Register TagPrefix="common" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<div class="pSection">
	<div>
		<h4>Category Definition</h4>
		<table>
			<tr>
				<td width="175">Category Name:</td>
				<td><asp:textbox id="tbCategory" Runat="server" MaxLength="20"></asp:textbox></td>
			</tr>
		</table>
		<div id="divEXSpecific" runat="server" visible="False">
			<table>
				<tr>
					<td width="175">Path and name of pibble:</td>
					<td><asp:TextBox ID="tbPibble" Runat="server" Columns="75" MaxLength="150"></asp:TextBox></td>
				</tr>
				<tr><td></td><td>Example: C:\Users\Public\Documents\EX Web Application Services\customreports.pbl</td></tr>
			</table>
		</div>
        <table>
			<tr>
				<td width="175">Can Administer:</td>
				<td>
                    <asp:GridView ID="grdBaseRoles1" runat="server" AutoGenerateColumns="False" CssClass="groupedGrid">
                       <Columns>
                        <asp:BoundField DataField="ID" />
                        <asp:TemplateField HeaderText="Role">
                            <ItemTemplate>
                                <asp:Label ID="lbl_role" runat="server" Text='<%# Bind("DisplayName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Can Admin">
                            <ItemTemplate>
                                <asp:CheckBox ID="cbx_can_admin" runat="server" Checked='<%# Bind("Checked") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    </asp:GridView>
                </td>
			</tr>
		</table>
		<table>
			<tr>
				<td width="175">&nbsp;</td>
				<td colspan="3"><asp:button id="btnSaveCategory" Text="Save" Runat="server"></asp:button></td>
			</tr>
		</table>
	</div>
</div>
