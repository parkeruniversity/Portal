<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Setup.ascx.cs" Inherits="Jenzabar.CRM.Faculty.Web.Portlets.CourseAuthorizationPortlet.Setup" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<div class="pSection" id="divError" visible="false" runat="server"><jenzabar:errordisplay id="ctlError" RunAt="server"></jenzabar:errordisplay></div>
<div class="pSection" id="divMessage" visible="False" runat="server"><asp:label id="lblMessage" Runat="server"></asp:label></div>
<h4><jenzabar:globalizedliteral id="caPageSettings" runat="server" TextKey="TXT_PORTAL_SETTINGS"></jenzabar:globalizedliteral></h4>
<div id="divDetail" class="pSection" visible="True" runat="server">
	<jenzabar:hint id="lblInstruction" runat="server" Visible="True"></jenzabar:hint>
	<table runat="server" cellpadding="3" cellspacing="3" ID="Table1">
		<tr>
			<td>&nbsp;&nbsp;&nbsp;
				<asp:checkbox id="cbxAllowSecReqAuth" runat="server" Visible="False"></asp:checkbox>
			</td>
			<td>
				<asp:label id="lblAllowSecReqAuthDesc" runat="server" Visible="False"></asp:label>
			</td>
		</tr>
		<tr>
			<td>&nbsp;&nbsp;&nbsp;
				<asp:checkbox id="cbxAllowReqAuth" runat="server"></asp:checkbox>
			</td>
			<td>
				<asp:label id="lblAllowReqAuthDesc" runat="server"></asp:label>
			</td>
		</tr>
		<tr>
			<td>&nbsp;&nbsp;&nbsp;
				<asp:checkbox id="cbxAllowCapAuth" runat="server"></asp:checkbox>
			</td>
			<td>
				<asp:label id="lblAllowCapAuthDesc" runat="server"></asp:label>
			</td>
		</tr>
		<tr>
			<td>&nbsp;&nbsp;&nbsp;
				<asp:checkbox id="cbxAllowSchConAuth" runat="server"></asp:checkbox>
			</td>
			<td>
				<asp:label id="lblAllowSchConAuthDesc" runat="server"></asp:label>
			</td>
		</tr>
	</table>
	<P>&nbsp;
		<TABLE id="Table2" height="0" cellSpacing="3" cellPadding="3" width="100%" border="0">
			<TR>
				<TD><asp:button id="btnSave" runat="server" Width="75px"></asp:button>&nbsp;&nbsp;&nbsp;<asp:button id="btnCancel" runat="server" Width="75px" CausesValidation="False"></asp:button>
				</TD>
			</TR>
		</TABLE>
	</P>
</div>
