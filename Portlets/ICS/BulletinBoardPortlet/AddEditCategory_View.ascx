<%@ Register TagPrefix="jenzabar" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="AddEditCategory_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.BulletinBoardPortlet.AddEditCategory_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="framework" namespace="Jenzabar.Portal.Framework.Web.UI.Controls" assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Register TagPrefix="jenzabar" Namespace="Jenzabar.Portal.Framework.Web.TextEditor" Assembly="Jenzabar.Portal.Framework.Web" %>
<script type="text/javascript" src="<%= ResolveUrl("~/UI/Common/Scripts/jenz.js") %>"></script>
<div class="pSection">
<p />
	<table>
		<tr>
			<th><asp:label id="lblLabel" runat=server></asp:label></th>
			<td><asp:textbox id=txtLabel runat="server" MaxLength="250" Columns="40"></asp:textbox>&nbsp; 
			<asp:requiredfieldvalidator id=RequiredFieldValidator1 EnableClientScript="False" runat="server" ControlToValidate="txtLabel" Display="Dynamic"/></td></tr>
		<tr>
			<th valign="top"><asp:label id="lblDescription" Runat="server"></asp:label></th>
		    <td><jenzabar:TextEditorControl id=txtDescription MaxLength="1000" runat="server" /></td></tr>
		<tr>
			<th></th>
			<td vAlign="top" align=right><asp:label id="txtDescMaxChar" Runat="server" /></td></tr>
		<asp:placeholder id="ShowPositions" Runat="server">
			<tr>
				<th><asp:label id="lblPosition" Runat=server /></Th>
				<td>
					<asp:dropdownlist id="ddPositions" runat="server"></asp:dropdownlist></td></tr>
		</asp:placeholder>
		<asp:placeholder id="phDeleteAfter" Runat="server">
			<tr>
				<th>
					<asp:label id="lblDeleteMessagesAfter" Runat=server />
				</th>
				<td>
					<asp:dropdownlist id="ddDeleteAfter" runat="server">
					</asp:dropdownlist>
				</td>
			</tr>
		</asp:placeholder>
		<tr style="height:10px;">
			<td>
				&nbsp;
			</td>
		</tr>
		<tr>
			<th class="psTitleCell">
				<asp:label id="lblPermittedUsers" Runat="server" />
			</th>
			<td class="psCell">
				<div><asp:label id="lblCatInstructionsTitle" Runat=server /></div>
				<jenzabar:collapsiblepanel id="cpPermitPanel" runat="server" text="Selected Users">
					<div><asp:label id="lblCatInstructions" Runat=server /></div>
					<div><asp:label id="lblCatInstructionsHowever" Runat=server /></div>
					<div class="psCell">
					<framework:PrincipalSelector id="psPermitRoles" runat="server" />
					</div>
				</jenzabar:collapsiblepanel>
			</td>
		</tr>
		<asp:placeholder id="ReorderPlaceHolder" Runat="server" Visible="False">
		<tr style="height:10px">
			<td>
				&nbsp;
			</td>
		</tr>
		<tr>
			<th>&nbsp;</th>
			<td>
		<jenzabar:GroupedGrid id="TopicGrid" runat="server" GroupKeyField="ID" DataKeyField="ID">
					<GroupHeaderColumns>
						<jenzabar:ExpandCollapseGroupedGridColumn SeparatorAfter="False" SeparatorBefore="True"></jenzabar:ExpandCollapseGroupedGridColumn>
					</GroupHeaderColumns>
					<GroupHeaderTemplate>
						<b><asp:Label ID="lblReorder" Runat="server"></asp:Label> "<%# DataBinder.Eval(Container.DataItem, "Label") %>"</b>
					</GroupHeaderTemplate>
					<Columns>
						<asp:TemplateColumn>
							<ItemTemplate>
								<asp:CheckBox id="IsSelected" Runat="server"></asp:CheckBox>
								<INPUT id="OldOrder" type="hidden" value='<%# DataBinder.Eval(Container.DataItem, "Order") %>' name="OldOrder" runat="server">
								<asp:TextBox id="NewOrder" Runat="server" MaxLength="3" Text='<%# DataBinder.Eval(Container.DataItem, "Order") %>' Width="25px" />
								<%# DataBinder.Eval(Container.DataItem, "Name") %>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn>
							<ItemTemplate>
								<asp:ImageButton ID="EditLink" CommandName="EditTopic" Runat="server" />
								<asp:ImageButton ID="DeleteLink" CommandName="DeleteTopic" Runat="server" />
							</ItemTemplate>
						</asp:TemplateColumn>
					</Columns>
				</jenzabar:GroupedGrid>
				<br />
			<asp:DropDownList id="MultipleSelect" Runat="server" AutoPostBack="True"></asp:DropDownList><asp:label id="lblSelectedItemsTo" Runat="server" /> 
			<asp:ListBox id="MultipleSelectCategory" Runat="server" Rows="1"></asp:ListBox>
		</td>
		</tr>
			</asp:placeholder>	
			<tr style="height:10px;">
				<td>
				&nbsp;
				</td>
			</tr>
		<tr>
			<th></th>
		<td><asp:button id=btnSave runat="server" Font-Size="x-small"></asp:button>&nbsp;
		<asp:button id=btnCancel runat="server" Font-Size="x-small"  CausesValidation="False"></asp:button></td></tr>
	</table>
</div>