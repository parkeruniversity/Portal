<%@ Control Language="c#" AutoEventWireup="false" Codebehind="CreateANewForm.ascx.cs" Inherits="Jenzabar.CRM.Common.Web.Portlets.FormBuilderPortlet.CreateANewForm" %>
<TABLE width="100%" cellpadding="3">
	<TR>
		<TD width="10%" align="left" valign="top" colspan="2">
			<asp:Label id="lblScreenMessage" runat="server"></asp:Label></TD>
	</TR>
	<TR>
		<TD width="10%" align="left" nowrap valign="top" colspan="3">
			<asp:Label id="lblNewFormName" runat="server"></asp:Label></TD>
		<TD width="80%" align="left" valign="top">
			<asp:TextBox id="txtNewFormName" runat="server" Width="368px"></asp:TextBox></TD>
	</TR>
	<TR>
		<TD width="10%" align="left" nowrap valign="top" colspan="3">
			<asp:Label id="lblUseThisForm" runat="server"></asp:Label></TD>
		<TD width="80%" align="left" valign="top">
			<asp:DropDownList id="ddlbUseThisForm" runat="server" width="315"></asp:DropDownList></TD>
	</TR>
	<TR>
		<TD width="10%" align="left" nowrap valign="top" colspan="3">
			<asp:Label id="lblErrorMsg" runat="server" Width="96px" ForeColor="Red"></asp:Label></TD>
		<TD width="80%" align="left" valign="top">
			<asp:Button id="btnSave" runat="server"></asp:Button>&nbsp;
			<asp:Button id="btnCancel" runat="server"></asp:Button></TD>
	</TR>
</TABLE>
