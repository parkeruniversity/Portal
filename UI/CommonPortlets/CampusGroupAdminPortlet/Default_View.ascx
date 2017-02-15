<%@ Control Language="c#" AutoEventWireup="true" Codebehind="Default_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.CampusGroupAdminPortlet.Default_View" %>
<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Import namespace="Jenzabar.ICS" %>

<script type="text/javascript">
    function SelectAll(blnChecked, txtIdPart) {
        var x = document.getElementsByTagName('input');
        //for safety
        if (txtIdPart == null) {
            txtIdPart = "";
        }
        for (i = 0; i < x.length; i++) {
            if (x[i].type == 'checkbox' && x[i].id != null && x[i].id.indexOf("RequestedGroups") >= 0) {
                x[i].checked = blnChecked;
            }
        }
    }
</script>

<common:TabGroup ID="DefaultPageTabs" runat="server">
	<common:Tab id="CurrentGroupsTab" runat="server">
	<div class="pSection">	
		<div id="TopBar" runat="server">
			<span class="createButtons">
				<common:ImageAndTextButton ID="CreateNewGroupTop" runat="server" />
				<common:ImageAndTextButton ID="CreateNewCategoryTop" runat="server" />
			</span>
			<span class="submitButtons">
				<asp:Button ID="SaveButtonTop" Runat="server" />
			</span>
		</div>
		
		<common:GroupedGrid id="CurrentGroups" GroupKeyField="ID" DataKeyField="ID" runat="server">
			<GroupHeaderTemplate>
				<%# ((Header)Container.DataItem).Name %>
				<asp:ImageButton id="EditCategoryButton" ImageUrl="edit.gif" CommandName="EditCategory" Runat="server"></asp:ImageButton>
				<asp:ImageButton id="DeleteCategoryButton" ImageUrl="delete.gif" CommandName="DeleteCategory" Visible="False" Runat="server"></asp:ImageButton>
			</GroupHeaderTemplate>
			<GroupHeaderColumns>
				<common:ExpandCollapseGroupedGridColumn />
			</GroupHeaderColumns>
			<Columns>
				<asp:ButtonColumn DataTextField="Name" ButtonType="LinkButton" CommandName="ViewGroup" />
				<asp:TemplateColumn>
					<ItemTemplate><asp:DropDownList ID="Status" Runat="server" /></ItemTemplate>
				</asp:TemplateColumn>
				<common:EditButtonColumn />
				<common:DeleteButtonColumn />
			</Columns>
			<EmptyGroupTemplate>
				There are no Campus Groups in this category.
			</EmptyGroupTemplate>
		</common:GroupedGrid>
		
		<div class="hr">&nbsp;</div>
		
		<div id="BottomBar" runat="server">
			<span class="createButtons">
				<common:ImageAndTextButton id="CreateNewGroupBottom" runat="server" />
				<common:ImageAndTextButton cssClass="createButton" id="CreateNewCategoryBottom" runat="server" />
			</span>
			<span class="submitButtons">
				<asp:Button ID="SaveButtonBottom" cssClass="saveButton" Runat="server" />
				<asp:Button ID="ExitButton"  runat="server" />
			</span>
		</div>
	</div>	
	</common:Tab>
	<common:Tab id="RequestedGroupsTab" runat="server">
	<div class="pSection">
		<common:GroupedGrid id="RequestedGroups" RenderGroupHeaders="True" AllowSorting="True" DataKeyField="ID"
			runat="server"  >
			<COLUMNS>
				<asp:TemplateColumn HeaderStyle-Width="15%" ItemStyle-Width="15%" >
					<HeaderTemplate>
                        <asp:CheckBox ID="ChkSelectAllActive1" runat="server" OnClick="javascript: return SelectAll(this.checked, this.id);" AutoPostBack="True" Text='<%#Jenzabar.Common.Globalization.Globalizer.GetGlobalizedString("TXT_ACC_NOT_SELECT_ALL")%>'/>
					</HeaderTemplate>
					<ItemTemplate>
                        <asp:CheckBox ID="ChkActive" runat="server" />
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:BoundColumn DataField="Name" HeaderText="Name" SortExpression="Name" />
				<asp:BoundColumn DataField="RequestDate" HeaderText="Date of Request" SortExpression="RequestDate" />
				<asp:ButtonColumn ButtonType="LinkButton" CommandName="ReviewApplication" text="Review Application"
					HeaderText="Application"></asp:ButtonColumn>
				<asp:TemplateColumn HeaderText="Decision">
					<ItemTemplate>
						<asp:LinkButton ID="CreateGroupButton"  CommandName="CreateGroup" Runat="server" />
						<asp:LinkButton ID="DeclineGroupButton" CommandName="DeclineGroup" Runat="server" />
					</ItemTemplate>
				</asp:TemplateColumn>
			</COLUMNS>
			<TableFooterTemplate>
				<asp:Button ID="CreateSelectedButton" CommandName="CreateSelected" Runat="server" />
				<asp:Button ID="DeclineSelectedButton" CommandName="DeclineSelected" Runat="server" />
			</TableFooterTemplate>
		</common:GroupedGrid>
		</div>
	</common:Tab>
</common:TabGroup>
