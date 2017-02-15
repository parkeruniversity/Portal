<%@ Control Language="c#" AutoEventWireup="false" Codebehind="AddOrEditHeader.ascx.cs" Inherits="Jenzabar.CRM.Common.Web.Portlets.FormBuilderPortlet.AddOrEditHeader" %>
<div class="pSection">
	<TABLE width="100%">
		<TR>
			<TD vAlign="top" colspan="2" noWrap align="left" width="10%"><asp:label id="lblErrorMsg" runat="server" Width="96px" ForeColor="Red"></asp:label></TD>
		</TR>
		<TR>
			<TD vAlign="top" colspan="2" align="left" width="10%"><asp:label id="lblScreenMessage" runat="server"></asp:label></TD>
		</TR>
		<TR>
			<TD vAlign="top" noWrap align="left" width="10%" colSpan="2"><asp:label id="lblHeaderInstruct" runat="server"></asp:label></TD>
		</TR>
		<TR>
			<TD vAlign="top" noWrap align="left" width="10%"></TD>
			<TD vAlign="top" noWrap align="left" width="10%"></TD>
		</TR>
		<TR>
			<TD vAlign="top" noWrap align="left" width="10%" colSpan="1"><asp:label id="lblHeaderText" runat="server"></asp:label></TD>
			<TD vAlign="top" align="left" width="80%"><asp:textbox id="txtHeader" runat="server" Width="368px"></asp:textbox></TD>
		</TR>
		<TR>
			<TD vAlign="top" noWrap align="left" width="10%"></TD>
			<TD vAlign="top" align="left" width="80%"></TD>
		</TR>
		<TR>
			<TD colspan="2" vAlign="top" align="left" width="80%">
				<asp:button id="btnSave" runat="server"></asp:button>&nbsp;
				<asp:button id="btnCancel" runat="server"></asp:button></TD>
		</TR>
	</TABLE>
</div>
