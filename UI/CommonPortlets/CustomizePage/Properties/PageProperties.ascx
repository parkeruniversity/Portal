<%@ Import namespace="Jenzabar.Portal.Framework.Web.Configuration"%>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="PageProperties.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.Controls.PageProperties" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="cust" tagname="Links" src="~/UI/CommonPortlets/CommonControls/SideBarLinks.ascx" %>

<cmn:subheader id=subHeaderInfo 
runat="server"></cmn:Subheader>
<asp:ValidationSummary id="valSummary" runat="server"/>
<div class=pSection>
<fieldset>
<table>
  <tr>
    <th><cmn:formlabel id=lblPageName runat="server" forcontrol="txtPageName">Page name:</cmn:FormLabel></TH>
    <td><asp:textbox id=txtPageName runat="server" MaxLength="50"/>&nbsp;
		<asp:RequiredFieldValidator id="vldPageName" runat="server" ControlToValidate ="txtPageName" Display="Dynamic"/>
		<asp:RegularExpressionValidator id="vldPageName2" Text="*" ControlToValidate="txtPageName" runat="server" Display="Dynamic"></asp:RegularExpressionValidator>
	</td>
  </tr>
  <tr>
	<th>&nbsp;</th>
	<td><cmn:GlobalizedCheckBox id="chkChangeURL" runat="server" textKey="TXT_CHANGE_URL"/><BR><cmn:Hint id="hntChangeURL" runat="server" textKey="MSG_CHANGE_PAGE_URL_HINT"/></td>
  </tr>
  <tr>
    <th>&nbsp;</TH>
    <td><asp:checkbox id=chkMakeDefaultPage runat="server" text="Make this my default home page."></asp:CheckBox><asp:literal 
      id=lblDefaultPage Runat="server"></asp:Literal></TD></TR>
  <tr>
    <th>&nbsp;</TH>
    <td><asp:Button id=btnSave Runat="server"/>&nbsp;
	    <asp:button id=btnCancel CausesValidation="False" Runat="server"></asp:button>
		<asp:literal id=litDivider Text="&nbsp;|&nbsp;" runat="server"></asp:literal>
		<asp:ImageButton id=imgbtnDeletePage CausesValidation="False" Runat="server"></asp:ImageButton>
		<asp:LinkButton id=lnkbtnDeletePage CausesValidation="False" Runat="server"></asp:LinkButton>
	</TD></TR></TABLE></FIELDSET> 
</DIV>
