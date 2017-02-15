<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddCategory.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.StudentRequest.AddCategory" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="jics" tagname="TextEditor" src="~\UI\Controls\TextEditor.ascx" %>
<%@ Register TagPrefix="framework" namespace="Jenzabar.Portal.Framework.Web.UI.Controls" assembly="Jenzabar.Portal.Framework.Web" %>
<script language="JavaScript" src="<%= this.ResolveUrl("~/UI/Common/Scripts/jenz.js") %>"></script>
<div class="pSection">
	<fieldset>
		<div class="FormBuilder"><div class="ErrorMsg"><asp:literal id=litErrorMsg Runat="server" Visible="False" /></div></div>
		<table>
		    <tr>
		        <th><asp:Literal ID="litTxtCatName" runat="server" /></th>
		        <td>
		            <asp:textbox id="txtLabel" runat="server" MaxLength="200" Columns="40" />&nbsp;
					<asp:requiredfieldvalidator id="RequiredFieldValidator1" runat="server" ControlToValidate="txtLabel" Display="Dynamic" />
					<input type="text" style="visibility:hidden;">
		        </td>
		    </tr>
		    <tr>
		        <th><asp:Literal ID="litTxtDesc" runat="server" /></th>
		        <td><jics:TextEditor id="_textEditorDescription" MaxLength="2000" runat="server" /></td>
		    </tr>
		    <tr>
		        <th><asp:Literal ID="litTxtAvail" runat="server" /></th>
		        <td><div class="psCell">
					<framework:PrincipalSelector id="psPermitRoles" runat="server" />
					</div></td>
		    </tr>
		    <tr>
		        <td></td>
		        <td>
		            <asp:Button ID="btnSave" runat="server" /> &nbsp; <asp:Button ID="btnCancel" runat="server" CausesValidation="false" />
		        </td>
		    </tr>
		</table>
    </fieldset>
</div> 