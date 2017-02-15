<%@ Control Language="c#" AutoEventWireup="false" Codebehind="AddEditSet_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.ReadingPortlet.AddEditSet_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Import namespace="Jenzabar.ICS" %>
<%@ Register TagPrefix="framework" namespace="Jenzabar.Portal.Framework.Web.UI.Controls" assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Register TagPrefix="jenzabar" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="jenzabar" Namespace="Jenzabar.Portal.Framework.Web.TextEditor" Assembly="Jenzabar.Portal.Framework.Web" %>
<script language="JavaScript" src="<%= this.ResolveUrl("~/UI/Common/Scripts/jenz.js") %>"></script>
<div class="pSection">
<jenzabar:ErrorDisplay id="ctlError" runat="server" />
<div><asp:ValidationSummary id="valSummary" runat="server"></asp:ValidationSummary></div>
	<fieldset>
		<table>
			<tr>
				<th>
					<jenzabar:formlabel id="lblLabel" runat="server" forcontrol="txtLabel"></jenzabar:formlabel>
				</th>
				<td><asp:textbox id="txtLabel" runat="server" Columns="40" MaxLength="50"></asp:textbox>&nbsp;
					<asp:requiredfieldvalidator id="valLabel" runat="server" Text="*" ControlToValidate="txtLabel"></asp:requiredfieldvalidator></td>
			</tr>
			<asp:placeholder id="plhDescription" Visible="True" Runat="server">
				<TR>
					<TH>
						<jenzabar:formlabel id="lblDescription" runat="server" forcontrol="txtDescription"></jenzabar:formlabel></TH>
					<TD>
						<jenzabar:TextEditorControl id="txtDescription" MaxLength="2000" runat="server" />
					</TD>
				</TR>
				<TR>
					<TH>
					</TH>
					<TD>
						<jenzabar:formlabel id="lblMaxChars" runat="server" forcontrol="txtDescription"></jenzabar:formlabel></TD>
				</TR>
			</asp:placeholder><asp:placeholder id="plhPositions" Visible="False" Runat="server">
				<TR>
					<TH>
						<jenzabar:formlabel id="lblPositions" runat="server" forcontrol="ddPositions"></jenzabar:formlabel></TH>
					<TD>
						<asp:dropdownlist id="ddPositions" runat="server" ></asp:dropdownlist></TD>
				</TR>
			</asp:placeholder>
			<asp:placeholder id="plhReorder" Visible="False" Runat="server">
				<TR>
					<TH>
						&nbsp;</TH>
					<TD>
						<jenzabar:GroupedGrid id="ItemsGrid" runat="server" GroupKeyField="ID" EnableAutoConfirmation="False" DataKeyField="ID">
							<GroupHeaderColumns>
								<jenzabar:ExpandCollapseGroupedGridColumn SeparatorAfter="False" SeparatorBefore="True"></jenzabar:ExpandCollapseGroupedGridColumn>
							</GroupHeaderColumns>
							<GroupHeaderTemplate>
								<b>"<asp:Label ID="lblReorder" Runat=server></asp:Label>&nbsp; <%# ((Header)Container.DataItem).Name %>"</b>
							</GroupHeaderTemplate>
							<Columns>
								<asp:TemplateColumn>
									<ItemTemplate>
										<asp:CheckBox id="IsSelected" Runat="server"></asp:CheckBox>
										<INPUT id="OldOrder" type="hidden" value='<%# ((Reading)Container.DataItem).Order %>' name="OldOrder" runat="server">
										<asp:TextBox id="NewOrder" Runat="server" MaxLength="3" Text='<%# ((Reading)Container.DataItem).Order %>' Width="25px" />
										<%# ((Reading)Container.DataItem).Title %>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn>
									<ItemTemplate>
										<div nowrap>
											<asp:ImageButton ID="EditLink" CommandName="EditItem" Runat="server" />
											<asp:ImageButton ID="DeleteLink" CommandName="DeleteItem" Runat="server" />
										</div>
									</ItemTemplate>
								</asp:TemplateColumn>
							</Columns>
						</jenzabar:GroupedGrid>
						<div>
							<asp:PlaceHolder id="plhSelect" Runat="server">
							<asp:DropDownList id="MultipleSelect" Runat="server" AutoPostBack=True rows="1"></asp:DropDownList>&nbsp;
							<asp:label id="lblSelItemsTo" Runat="server">selected items to</asp:label>&nbsp;
							<asp:DropDownList id="MultipleSelectHeader" Runat="server" Rows="1"></asp:DropDownList>
							</asp:PlaceHolder>
						</div>
					</TD>
				</TR>
			</asp:placeholder>
			<asp:PlaceHolder ID="phlPermittedRoles" Runat="server" Visible="False">
			<tr>
				<th>
					<asp:label ID="lblPermittedUsers" Runat=Server />
				</th>
				<td>
					<div><asp:label ID="lblSetInstrTitle" Runat=Server /></div>
					<jenzabar:collapsiblepanel id="cpPermitPanel" runat="server" text="Selected Users">
						<div><asp:label ID="lblSetInstrDefault" Runat=Server /></div>
						<div><asp:label ID="lblViewInstrSelected" Runat=Server /></div>
						<div><framework:PrincipalSelector id="psPermitRoles" runat="server"></framework:PrincipalSelector></div>
					</jenzabar:collapsiblepanel>
					<br>
					<br>
				</td>
			</tr>
			</asp:PlaceHolder>
			<tr>
				<th>
				</th>
				<td><asp:button id="btnSave" CommandName="SaveSet" runat="server" />
					&nbsp;
					<asp:button id="btnSaveAndAdd" CommandName="SaveAndAddSet" runat="server" />
					&nbsp;
					<asp:button id="btnCancel" CommandName="Cancel" runat="server" CausesValidation="False"/>
				</td>
			</tr>
		</table>
	</fieldset>
</div>
