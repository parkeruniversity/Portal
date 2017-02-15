<%@ Control Language="c#" AutoEventWireup="false" Codebehind="FormEMailTemp.ascx.cs" Inherits="Jenzabar.CRM.Common.Web.Portlets.FormBuilderPortlet.FormEMailTemp" %>
<div class="pSection">
<TABLE cellPadding=3 cellspacing="0" width="100%" border="0">
  <TR>
    <TD align=left colSpan=2><asp:label id=lblScreenMessage runat="server"></asp:Label></TD></TR>
  <TR>
    <TD vAlign=top noWrap align=left width="10%"><asp:label id=lblNewFormName runat="server"></asp:Label></TD>
    <TD vAlign=top align=left width="90%"></TD>
 </TR>
  <TR>
    <TD vAlign=top noWrap align=left colspan="2">&nbsp;</TD>
  </TR>
  <TR>
    <TD vAlign=top noWrap align=left><asp:label id=lblEMailResp runat="server"></asp:Label></TD>
    <TD vAlign=top align=left ><asp:dropdownlist id=ddlEMailResponse runat="server"></asp:DropDownList></TD>
</TR>
  <TR>
    <TD vAlign=top noWrap align=left colspan="2">&nbsp;</TD>
  </TR>
  <TR>
    <TD vAlign=top noWrap align=left  colSpan=2><asp:label id=lblEMailSubmitSuccess runat="server"></asp:Label></TD>
  </TR>
  <TR>
    <TD vAlign=top noWrap align=left><asp:label id=lblEMailTempNameSuccess runat="server"></asp:Label></TD>
    <TD vAlign=top noWrap align=left >
    <asp:dropdownlist id=ddlbSuccess  runat="server"></asp:DropDownList>&nbsp;
     <asp:imagebutton id=imgCreateNewSuccess Runat="server"></asp:ImageButton>&nbsp;
     <asp:imagebutton id=imgModifySuccess Runat="server"></asp:ImageButton> 
	</TD>
    </TR>
  <TR>
    <TD vAlign=top noWrap align=left colspan="2">&nbsp;</TD>
</TR>
  <TR>
    <TD vAlign=top noWrap align=left colspan=2><asp:label id=lblEMailSubmitUnsuccessful runat="server"></asp:Label></TD>
</TR>
  <TR>
    <TD vAlign=top noWrap align=left><asp:label id=lblEMailTempUnsuccessful runat="server"></asp:Label></TD>
    <TD vAlign=top align=left  nowrap><asp:dropdownlist id=ddlUnsuccessful runat="server"></asp:DropDownList>&nbsp; 
	<asp:imagebutton id=imgCreateNewNotSuccessful Runat="server"></asp:ImageButton>&nbsp;
	<asp:imagebutton id=imgModifyNotSuccessful Runat="server"></asp:ImageButton> 
	</TD>
  </TR>
  <TR>
    <TD vAlign=top noWrap align=left><asp:label id=lblSetupComplete runat="server"></asp:Label></TD>
    <TD vAlign=top align=left ><asp:radiobuttonlist id=rblSetupComplete runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal"></asp:RadioButtonList></TD>
    </TR>
  <TR>
    <TD vAlign=top noWrap align=left colspan="2"><asp:label id=lblErrorMsg runat="server" CssClass="PortletError"></asp:Label></TD></TR>
  <TR>
    <TD vAlign=top noWrap align=left colspan="2">&nbsp;</TD>
  </TR>
  <TR>
		<TD align="left" colspan="2">
			<asp:Button id="btnSave" runat="server"></asp:Button>&nbsp;
			<asp:Button id="btnCancel" runat="server"></asp:Button></TD>
  </TR>
</TABLE>
</div>
