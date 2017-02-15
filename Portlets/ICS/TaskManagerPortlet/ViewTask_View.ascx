<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ViewTask_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.TaskManagerPortlet.ViewTask_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="cmn" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>

<cmn:errordisplay id=ctlError runat="server"></cmn:ErrorDisplay>
<cmn:subheader id=subHeader runat="server"></cmn:Subheader>
<div class=pSection>
<asp:PlaceHolder ID="pnEdit" Runat="server" Visible="False">
<div align="right">
	<asp:imagebutton id=imbEditItem Runat="server"  CommandName="EditItem"></asp:ImageButton>
	<asp:linkbutton id="lnkEditItem" Runat="server" CommandName="EditItem"></asp:LinkButton>
</div>
</asp:PlaceHolder>

<fieldset>
<table >
	<tr>
		<th>
			<cmn:GlobalizedLiteral runat="server" textkey="LBL_PRIORITY"/> 
		</th>
		<td>
			<asp:label id=lblPriority Runat="Server"></asp:Label>
		</td>
	</tr>
	<tr>
		<th>
			<cmn:GlobalizedLiteral runat="server" textkey="LBL_DUE_DATE" />
		</th>
		<td>
			<asp:label id="lblDueDate" Runat="Server"></asp:Label>
		</td>
	</tr>
	<tr>
		<th>
		</th>
		<td><asp:label id=lblDescription Runat="Server"></asp:Label>
		</td>
	</tr>
	<tr>
		<th>
			<asp:label id=lblStatus Runat="Server"></asp:Label>
		</th>
		<td>
			<asp:DropDownList ID="ddlStatus" Runat="server"/>&nbsp;&nbsp;
			<asp:Button ID="btnSave" Runat="server"/>
		</td>
	</tr>
  </TABLE>
</FIELDSET> 
</DIV>
<div class="buttonBar">
	<asp:LinkButton ID="lnkBack" Runat="server"/></asp:LinkButton>
</div>