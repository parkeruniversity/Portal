<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="True" Codebehind="Default_View.ascx.cs" Inherits="Jenzabar.CRM.Candidate.Web.Portlets.ApplyOnline.Default_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Import Namespace="Jenzabar.Common.Globalization"%>
<script language="javascript" type="text/javascript">function initIETOC(){};function resizeTheDiv(){}</script>
<jenzabar:errordisplay id="error" Runat="server" />
<div id="divAdminLink" runat="server" visible="false">
	<table class="GrayBordered" width="50%" align="center" cellpadding="3" border="0">
		<tr>
			<td align="center"><IMG title="" src="UI/Common/Images/PortletImages/Icons/portlet_admin_icon.gif"  >&nbsp;<jenzabar:globalizedlinkbutton id="glnkAdmin" runat="server" TextKey="TXT_AO_ADMIN_THIS_PORTLET" /></td>
		</tr>
	</table>
</div>
<div class="pSection">
	<table cellSpacing="0" cellPadding="0" width="100%" border="0">
		<tr>
			<td colspan="3"><jenzabar:complexcontentdisplay id="ccdMain" runat="server" /></td>
		</tr>
		<tr id="trCcdMainSpacer" runat="server">
			<td colspan="3">&nbsp;</td>
		</tr>
		<tr id="trNoActive" runat="server">
			<td colspan="3" align="center">
				<table class="GrayBordered" width="50%" align="center" cellpadding="3" border="0">
					<tr>
						<td align="center"><jenzabar:GlobalizedLiteral ID="gLitNoActive" Runat="server" TextKey="TXT_AO_NO_APPS" /></td>
					</tr>
				</table>
			</td>
		</tr>
		<asp:Repeater ID="rptMainGrid" Runat="server">
			<HeaderTemplate />
			<ItemTemplate>
				<tr>
					<td colspan="3"><h5 style="padding:0px;margin:5px;"><b><%#DataBinder.Eval(Container.DataItem, "Name")%></b></h5><asp:Label ID="labAdminMsg" runat="server" CssClass="fbNoBoldItal" Visible="false"><dd /><%=Globalizer.GetGlobalizedString("TXT_ADMIN_VIEW_FB2CAT_NO_PERMISSION")%><br /><br /></asp:Label></td>
				</tr>
				<tr id="trCatDesc" runat="server" style="padding:0px;margin:0px;">
					<td width="3%">&nbsp;</td>
					<td colspan="2"><%#DataBinder.Eval(Container.DataItem, "Description")%></td>
				</tr>
				<tr id="trCatDescSpacer" runat="server" style="height:10px;">
					<td colspan="3"></td>
				</tr>
				<asp:Repeater id="rptFormLevel" DataSource=<%#DataBinder.Eval(Container.DataItem, "FormCategories")%> Runat="server">
					<HeaderTemplate />
					<ItemTemplate>
						<tr>
							<td>&nbsp;</td>
							<td width="3%">&nbsp;</td>
							<td><a href=<%# this.ParentPortlet.GetNextScreenURL("Begin//" + DataBinder.Eval(Container.DataItem, "Form.ID"))%>'><%#DataBinder.Eval(Container.DataItem, "Form.Name")%></a> &nbsp;<asp:Label ID=lblHasSubmission Runat=server><span style="FONT-WEIGHT: bold; COLOR: #1d9f13">(In Progress)</span></asp:Label></td>
						</tr>
						<tr id="trFormDesc" runat="server">
							<td>&nbsp;</td>
							<td width="3%">&nbsp;</td>
							<td><%#DataBinder.Eval(Container.DataItem, "Form.Description")%></td>
						</tr>
						<tr id="trFormDescSpacer" runat="server" style="height:10px;">
							<td colspan="3"></td>
						</tr>
					</ItemTemplate>
					<FooterTemplate />
				</asp:Repeater>
			</ItemTemplate>
			<FooterTemplate />
		</asp:Repeater>
	</table>
</div>