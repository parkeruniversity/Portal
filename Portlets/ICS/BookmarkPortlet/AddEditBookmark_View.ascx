<%@ Control Language="c#" AutoEventWireup="false" Codebehind="AddEditBookmark_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.BookmarkPortlet.AddEditBookmark_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="jenza" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="secured" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls.Secured" Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Register TagPrefix="jenza" Namespace="Jenzabar.Portal.Framework.Web.TextEditor" Assembly="Jenzabar.Portal.Framework.Web" %>
<script language="JavaScript" src='<%= this.ResolveUrl("~/UI/Common/Scripts/jenz.js") %>'></script>
<div class="pSection">
	<fieldset>
		<table>
			<tr>
				<th>
					<asp:label id="lblLabel" runat="server"></asp:label></th>
				<td><asp:textbox id="txtLabel" runat="server" MaxLength="250" Columns="40" /></td>
			</tr>
			<tr>
				<th>
					<asp:label id="lblURL" runat="server"></asp:label></th>
				<td><asp:textbox id="txtURL" runat="server" MaxLength="300" Columns="40" /><asp:requiredfieldvalidator id="RequiredFieldValidator2" runat="server" ControlToValidate="txtURL" Display="Dynamic"></asp:requiredfieldvalidator>
					<asp:regularexpressionvalidator id="RegularExpressionValidator1" runat="server" ControlToValidate="txtURL" Display="Dynamic" /></td>
			</tr>
			<tr id="trSets" runat="server">
				<th>
					<asp:label runat="server" id="ddSetsLabel" /></th>
				<td><asp:dropdownlist id="ddSets" runat="server" />
					&nbsp;<asp:ImageButton id="AddNewSet" Visible="False" Runat="server" CommandName="AddSet"></asp:ImageButton>
					<secured:slinkbutton id="lnkAddSet" runat="server" OperationNames="CanManageSets" AccessCheckType="Union"
						IsSecured="True" CausesValidation="False"></secured:slinkbutton></td>
			</tr>
			<tr>
				<th>
					<asp:label id="lblDescription" runat="server"></asp:label></th>
				<td><jenza:TextEditorControl id="txtDescription" MaxLength="2000" runat="server" /></td>
			</tr>
			
			<tr>
				<td></td>
				<td vAlign="top" align="right"><asp:label id="txtDescMaxChar" Runat="server" /></td>
			</tr>
			<tr>
				<td colSpan="2"><jenza:displayindicator id="ctlDisplayIndicator" runat="server" ShowTime="True"></jenza:displayindicator></td>
			</tr>
			<tr>
				<td>
				</td>
				<td><asp:button id="btnSave" runat="server" />&nbsp;
					<asp:button id="btnSaveAnd" runat="server" />&nbsp;
					<asp:button id="btnCancel" runat="server" CausesValidation="False" /></td>
			</tr>
		</table>
	</fieldset>
</div>
