<%@ Register TagPrefix="jenzabar" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="AddEditTopic_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.BulletinBoardPortlet.AddEditTopic_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="framework" namespace="Jenzabar.Portal.Framework.Web.UI.Controls" assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Register TagPrefix="jenzabar" Namespace="Jenzabar.Portal.Framework.Web.TextEditor" Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Import namespace="Jenzabar.ICS.Web.Portlets.Common" %>
<%@ Import namespace="Jenzabar.ICS.Web.Portlets.BulletinBoardPortlet" %>
<script language="JavaScript" src="<%= this.ResolveUrl("~/UI/Common/Scripts/jenz.js") %>"></script>
<div class="pSection">
<p>
<table>
  <tr>
    <th><asp:label ID="lblName" Runat=Server /></th>
    <td><asp:textbox id=txtName runat="server" MaxLength="250" Columns="40"></asp:textbox>&nbsp; 
      <asp:requiredfieldvalidator id=RequiredFieldValidator1 
       runat="server" ControlToValidate="txtName" Display="Dynamic" CssClass="validationMsgError" /></td></tr>
  <tr>
    <th valign="top"><asp:label ID="lblDescriprion" Runat=Server /></th>
      <td><jenzabar:TextEditorControl id=txtDescription MaxLength="2000" runat="server" /></td></tr>
  <tr>
    <td></td>
    <td vAlign=top align=right><asp:label ID="lblMaxChars" Runat=Server /></td></tr>
      
<asp:placeholder id="ShowCategories" Runat="server">
	<TR>
		<th><asp:label ID="lblCatagory" Runat=Server /></th>
		<TD>
			<asp:dropdownlist id="ddCategories" runat="server"></asp:dropdownlist>
		</TD>
	</TR>
</asp:placeholder>
      
	<asp:placeholder id="ShowPositions" Runat="server">
  <TR>
    <th><asp:label ID="lblListTopic" Runat=Server /></th>
    <TD>
<asp:dropdownlist id="ddPositions" runat="server"></asp:dropdownlist></TD></TR>
    </asp:placeholder>
    <tr height="10px">
				<td>
				</td>
			</tr>
  <tr>
    <td colSpan=2><jenzabar:displayindicator id=ctlDisplayIndicator runat="server" ShowTime="True"></jenzabar:displayindicator></td></tr>
    
	<asp:placeholder id="phDeleteAfter" Runat="server">
		<tr>
			<th>
				<asp:label ID="lblDeleteThreadsAfter" Runat=Server /></th>
			<td>
				<asp:dropdownlist id="ddDeleteAfter" runat="server">
				</asp:dropdownlist>
			</td>
		</tr>
	</asp:placeholder>
	<tr height="10px">
				<td>
				</td>
			</tr>
		<tr>
			<th class="psTitleCell">
				<asp:label ID="lblPermittedUsers" Runat=Server /></th>
			<td class="psCell">
				<div><asp:label ID="lblTopicInstrTitle" Runat=Server /></div>
				<jenzabar:collapsiblepanel id="cpPermitPanel" runat="server" text="Selected Users">
					<div><asp:label ID="lblTopicInstr" Runat=Server /></div>
					<div><asp:label ID="lblViewInstrHowever" Runat=Server /></div>
					<br><div class="psCell">
						<framework:PrincipalSelector id="psPermitRoles" runat="server" />
						</div>
				</jenzabar:collapsiblepanel>
			</td>
		</tr>
		<tr height="10px">
				<td>
				</td>
			</tr>
  <tr>
		<td></td>
    <td><asp:button id=btnSave runat="server" />&nbsp;
<asp:button id=btnCancel runat="server" CausesValidation="False"></asp:button></td></tr></table>
</p>
</div>