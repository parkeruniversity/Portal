<%@ Control Language="c#" AutoEventWireup="false" Codebehind="AddEditOwnTask_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.TaskManagerPortlet.AddEditOwnTask_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Portal.Framework.Web.TextEditor" Assembly="Jenzabar.Portal.Framework.Web" %>
<script language="JavaScript" src="<%= this.ResolveUrl("~/UI/Common/Scripts/jenz.js") %>"></script>
<asp:PlaceHolder ID="phControls" runat="server">
<cmn:errordisplay id=ctlError runat="server"></cmn:errordisplay>
<div class=pSection>
<fieldset>
<div><asp:validationsummary id=valSummary runat="server"></asp:validationsummary></div>
<table>
  <tr>
    <th><cmn:formlabel id=lblName runat="server" forcontrol="txtName"></cmn:formlabel></th>
    <td><asp:textbox id=txtName runat="server" MaxLength="250" Columns="35" ></asp:textbox>&nbsp; 
    <asp:requiredfieldvalidator id=vldName runat="server" Display="Dynamic" ControlToValidate="txtName" Text="*"></asp:requiredfieldvalidator>
	</td>
  </tr>
  <tr>
    <th><cmn:formlabel id=lblDescription runat="server" forcontrol="txtDescription"></cmn:formlabel></th>
      <td><cmn:TextEditorControl id=txtDescription MaxLength="2000" runat="server" /></td></tr>
    <tr>
    <th></th>
    <td><cmn:formlabel id=lblMaxChars runat="server" forcontrol="txtDescription"></cmn:formlabel></td></tr>
  <tr>
    <th><cmn:formlabel id=lblDatePicker runat="server" forcontrol="ctlDatePicker"></cmn:formlabel></th>
    <td><cmn:datepicker id=ctlDatePicker runat="server" TimeDisplayFormat="Short"></cmn:datepicker></td></tr>
  <tr>
    <th><cmn:formlabel id=lblStatus runat="server" forcontrol="ddlStatus"></cmn:formlabel></th>
    <td><asp:dropdownlist id=ddlStatus runat="server" Font-Size="x-small"></asp:dropdownlist>&nbsp;</td></tr>
  <tr>
    <th><cmn:formlabel id=lblPriority runat="server" forcontrol="ddlPriority"></cmn:formlabel></th>
    <td><asp:dropdownlist id=ddlPriority runat="server" Font-Size="x-small"></asp:dropdownlist>&nbsp;</td></tr>
  <tr>
    <th></th>
    <td><asp:button id="btnSave" runat="server" Font-Size="x-small"></asp:button>&nbsp; 
		<asp:button id="btnCancel" runat="server" Font-Size="x-small" CausesValidation="False"></asp:button>
	</td>
  </tr>
</table>
</fieldset> 
</div>
</asp:PlaceHolder>