<%@ Control Language="c#" AutoEventWireup="false" Codebehind="AddEditLoginPage_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.LoginPortlet.AddEditLoginPage_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="common" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
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
						/>
				</td>
			</tr>
			<tr>
				<th>
					<LABEL><a id="lnkContent" runat="server" href="#" target="_blank" ></a></LABEL>
				</th>
				<td>
					<asp:textbox id=txtContent runat="server" MaxLength="8000" Columns="50" Font-Size="x-small" Rows="6" TextMode="MultiLine" />
					<asp:requiredfieldvalidator id="RFValidator2" 
						runat="server" ControlToValidate="txtContent" 
						/>
				</td>
			</tr>
			<tr>
				<th></th>
				<td vAlign="top" align=right>
					<asp:LABEL ID="lblMaxChar" Runat="server"></asp:LABEL>
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
					<common:displayindicator id=ctlDisplayIndicator runat="server" ShowTime="True" />
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