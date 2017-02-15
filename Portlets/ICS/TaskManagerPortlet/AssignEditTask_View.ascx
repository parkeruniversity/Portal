<%@ Register TagPrefix="jenz" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="AssignEditTask_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.TaskManagerPortlet.AssignEditTask_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Portal.Framework.Web.TextEditor" Assembly="Jenzabar.Portal.Framework.Web" %>
<script language="JavaScript" src="<%= this.ResolveUrl("~/UI/Common/Scripts/jenz.js") %>"></script>

<cmn:errordisplay id=ctlError Visible=true runat="server"></cmn:errordisplay>
<div class=pSection>
<fieldset>
<div><asp:validationsummary id=valSummary runat="server"></asp:validationsummary></div>
<table>
  <tr>
    <th><cmn:formlabel id=lblName runat="server" forcontrol="txtName"></cmn:formlabel></th>
    <td><asp:textbox id=txtName runat="server" MaxLength="250" Columns="35" Font-Size="x-small"></asp:textbox>&nbsp; 
<asp:requiredfieldvalidator id=vldName runat="server" Display="Dynamic" EnableClientScript="False" ControlToValidate="txtName" Text="*"></asp:requiredfieldvalidator></td></tr><asp:placeholder
  id=plhAssignTo Runat="server"></asp:placeholder>
  <tr>
    <th><cmn:formlabel id=lblAssignTo runat="server" forcontrol="psAssignTo"></cmn:formlabel></th>
    <td><jenz:principalselector id=psAssignTo runat="server"></jenz:principalselector></td></tr>
  <tr>
    <th><cmn:formlabel id=lblDescription runat="server" forcontrol="txtDescription"></cmn:formlabel></th>
      <td><cmn:TextEditorControl id=txtDescription runat="server" MaxLength="2000" /></td></tr>
  <tr>
    <th></th>
    <td><cmn:formlabel id=lblMaxChars runat="server" forcontrol="txtDescription"></cmn:formlabel></td></tr>
  <tr>
    <th><cmn:formlabel id=lblDatePicker runat="server" forcontrol="ctlDatePicker"></cmn:formlabel></th>
    <td><cmn:datepicker id=ctlDatePicker runat="server" TimeDisplayFormat="Short"></cmn:datepicker>
    <asp:CustomValidator ID=vld EnableClientScript="False" Visible="False" runat="server"></asp:CustomValidator></td></tr>
  <tr>
    <th><cmn:formlabel id=lblPriority runat="server" forcontrol="ddlPriority"></cmn:formlabel></th>
    <td><asp:dropdownlist id=ddlPriority runat="server" Font-Size="x-small"></asp:dropdownlist>&nbsp;</td></tr>
  <tr>
    <th></th>
    <td>
		<asp:button id="btnSave" runat="server" Font-Size="x-small"></asp:button>&nbsp; 
		<asp:button id="btnCancel" runat="server" Font-Size="x-small" CausesValidation="False"></asp:button>
	</td>
  </tr>
  </table>
  </fieldset> 
</div>