<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="FormStart.ascx.cs" Inherits="Jenzabar.Portal.Framework.Web.PortletModules.FormBuilder.PortletScreens.FormStart" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<jenzabar:errordisplay id="error" Runat="server" />
<h4><asp:Label id="lblHeaderBar" runat="server" /></h4>
<div class="pSection">
	<table cellSpacing="0" cellPadding="0" width="100%" class="GrayBordered">
		<tr>
			<td align="center"><asp:Literal ID="litFormName" Runat="server" /></td>
		</tr>
		<tr>
			<td align="center"><asp:Literal ID="litFormDesc" Runat="server" /></td>
		</tr>
		<tr>
			<td align="center"><asp:LinkButton ID="lbStartApp" Runat="server" /></td>
		</tr>
	</table>
	<table cellSpacing="0" cellPadding="0" width="100%" border="0" id="tblRetrieve" runat="server">
		<tr>
			<td colspan=3><h5><b><asp:Literal ID="litRetrieve" Runat="server" /></b></h5></td>
		</tr>
		<tr>
			<td colspan=3>&nbsp;</td>
		</tr>
		<tr>
			<td width="20">&nbsp;</td>
			<td colspan="2"><asp:Label id="lblAppText" runat="server" /></td>
		</tr>
		<tr>
			<td colspan=3>&nbsp;</td>
		</tr>
		<tr>
			<td colspan="2"></td>
			<td>
				<div class="FormBuilder">
					<span class="ErrorMsg"><asp:Literal ID="litKeyNotFound" Runat="server" /></span>
				</div>
			</td>
		</tr>
		<tr>
			<td width="20">&nbsp;</td>
			<td width="40">&nbsp;</td>
			<td>
			      <asp:Label runat="server" style="display: none;" Text="Your Key:"  ID="accesibilitynewName" AssociatedControlID="tbSavedKey"></asp:Label>
			 	<%=Globalizer.GetGlobalizedString("TXT_YOUR_KEY")%>&nbsp;<asp:TextBox ID="tbSavedKey" Runat="server" Width="150" MaxLength="10" />&nbsp;&nbsp;
				<asp:button id="gbGetSaved" runat="server" />
			</td>
		</tr>
	</table>
</div>
