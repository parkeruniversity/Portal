<%@ Control Language="c#" AutoEventWireup="false" Codebehind="SiteAddEditLoginPages.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.SiteAddEditLoginPages" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="jenzabar" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="txt" Namespace="Jenzabar.Portal.Framework.Web.TextEditor" Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Import namespace="Jenzabar.ICS.Web.Portlets.Common" %>
<script language="JavaScript" src="<%= this.ResolveUrl("~/UI/Common/Scripts/jenz.js") %>"></script>
<div class="pSection">
	<table>
		<asp:PlaceHolder ID="phForm" Runat="server" >
			<tr>
				<th>
					<asp:label ID="lblName" Runat="server"></asp:label>
				</th>
				<td>
					<asp:textbox id=txtName runat="server" MaxLength="250" Columns="40" />&nbsp; 
					<asp:requiredfieldvalidator id=RFValidator1 
						runat="server" ControlToValidate="txtName" 
						Display="Dynamic" />
				</td>
			</tr>
			<tr>
				<th>
					<LABEL><a id="lnkContent" runat="server" href="#" target="_blank" ></a></LABEL>
				</th>
				<td>
					<txt:TextEditorControl id=txtContent runat="server" />
				</td>
			</tr>
			<TR>
				<Th><asp:LABEL ID="lblPosition" Runat="server"></asp:LABEL></Th>
				<TD>
					<asp:dropdownlist id="ddPositions" runat="server"></asp:dropdownlist>
				</TD>
			</TR>
			<TR>
				<Th></Th>
				<TD>
					<asp:checkbox id="cbFirstOnly" runat="server" /><asp:LABEL ID="lblFirstTime" Runat="server"></asp:LABEL>
				</TD>
			</TR>
			<tr height="5px">
				<td>
					&nbsp;
				</td>
			</tr>
			<tr>
				<td colSpan=2>
					<jenzabar:displayindicator id=ctlDisplayIndicator runat="server" ShowTime="True" />
				</td>
			</tr>
		</asp:PlaceHolder>
		<asp:PlaceHolder ID="phPreview" Runat="server" >
			<tr>
				<td>
					<asp:Literal ID="litPreview" Runat="server"/>
				</td>
			</tr>
		</asp:PlaceHolder>
		<tr height="5px">
			<td>
				&nbsp;
			</td>
		</tr>
		<tr>
			<th></th>
			<td>
				<asp:button id=btnSave runat="server" />&nbsp;
				<asp:button id="btnPreview" runat="server" />
				<asp:button id="btnEdit" runat="server" Visible="false" CausesValidation="False" />&nbsp;
				<asp:button id=btnCancel runat="server" CausesValidation="False" />
			</td>
		</tr>
	</table>
</div>