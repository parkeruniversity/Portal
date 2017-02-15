<%@ Register TagPrefix="secured" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls.Secured" Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Register TagPrefix="jenza" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="jenz" Namespace="Jenzabar.Portal.Framework.Web.TextEditor" Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="AddEditHandout_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.HandoutPortlet.AddEditHandout_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<script language="JavaScript" src="<%= this.ResolveUrl("~/UI/Common/Scripts/jenz.js") %>"></script>
<script>
    jQuery(function($) {
        jenzabar.framework.fileChooser.create($("#<%= FileUrl.ClientID %>"));
    });
</script>
<div class="pSection">
	<table>
		<tr>
			<td vAlign="top" align="right"><asp:label id="lblLabel" Runat="server" AssociatedControlID="txtLabel" /></td>
			<td><asp:textbox id="txtLabel" runat="server" Columns="40" MaxLength="250"></asp:textbox>&nbsp;</td>
		</tr>
		<asp:placeholder id="phOldFile" Runat="server" Visible="False">
			<TR>
				<TD vAlign="top" noWrap align="right">
					<asp:label id="lblCurrFile" Runat="server"></asp:label></TD>
				<TD>
					<asp:label id="lblOldFile" Runat="server"></asp:label></TD>
			</TR>
		</asp:placeholder>
        <tr runat="server" id="ClassicUpload">
            <td vAlign="top" align="right" nowrap>
			    <asp:label id="lblClassicFile" runat="server" AssociatedControlID="UFile">File:</asp:label>
			</td>
            <td>
                <INPUT id="UFile" type="file" runat="server" />&nbsp;
                <asp:requiredfieldvalidator id="RequiredFieldValidator1" runat="server" Display="Dynamic" ControlToValidate="UFile"></asp:requiredfieldvalidator>
            </td>
        </tr>
		<tr runat="server" id="MoxieUpload">
			<td vAlign="top" align="right" nowrap>
			    <asp:label id="lblNewFile" runat="server" AssociatedControlID="FileUrl">File:</asp:label>
			</td>
			<td>
			    <input type="text" id="FileUrl" runat="server" size="80" />
                <asp:requiredfieldvalidator id="RequiredFieldValidator" runat="server" Display="Dynamic" ControlToValidate="FileUrl"></asp:requiredfieldvalidator>
			</td>
		</tr>
		<tr id="trSet" runat="server">
			<td vAlign="top" align="right"><label>Set:</label></td>
			<td><asp:dropdownlist id="ddSets" runat="server"></asp:dropdownlist>
				&nbsp;<asp:ImageButton id="AddNewSet" Visible="False" Runat="server" CommandName="AddSet"></asp:ImageButton>
				&nbsp;<secured:slinkbutton id="lnkAddSet" runat="server" CausesValidation="False" IsSecured="True" AccessCheckType="Union"
					OperationNames="CanManageSets"></secured:slinkbutton></td>
		</tr>
		<tr>
			<td vAlign="top" align="right"><asp:label id="lblDescription" Runat="server" /></td>
			<td><jenz:TextEditorControl id="_textEditorDescription" runat="server" MaxLength="2000" /></td>
		</tr>
		<tr>
			<td></td>
			<td vAlign="top" align="right"><asp:label id="lblMaxChars" Runat="server" /></td>
		</tr>
		<tr>
			<td colSpan="2"><jenza:displayindicator id="ctlDisplayIndicator" runat="server" ShowTime="True"></jenza:displayindicator></td>
		</tr>
		<tr id="ttdPublicAccess" runat="server">
			<td valign="top" align="right">
				<asp:label id="lblPublicAccess" Runat="server" />
			</td>
			<td>
				<asp:CheckBox id="chkPublicAccess" runat="server" />
				<asp:label id="lblPublicAccessDesc" Runat="server" AssociatedControlID="chkPublicAccess" />
			</td>
		</tr>
		<tr>
			<td></td>
			<td><asp:button id="btnSave" runat="server" ></asp:button>&nbsp;
				<asp:button id="btnSaveAnd" runat="server" ></asp:button>&nbsp;
				<asp:button id="btnCancel" runat="server" CausesValidation="False"></asp:button></td>
		</tr>
	</table>
</div>
