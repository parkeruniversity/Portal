<%@ Control Language="c#" AutoEventWireup="false" Codebehind="FormBuilder_ManageForms_View.ascx.cs" Inherits="Jenzabar.CRM.AdvancementOfficer.Web.Portlets.RelationshipManagementPortlet.FormBuilder_ManageForms_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<script language="javascript" type="text/javascript" src="<%= this.ResolveUrl("~/Portlets/Modules/PortletModule.FormBuilder/Importing/utils.js") %>"></script>
<h4>Set Up Direct Updates</h4>
<table id="tbleMsg" runat="server">
	<tr>
		<td><div id="errorMessage"><asp:Literal ID="litMsg" Runat="server" /></div></td>
	</tr>
</table>
<div style="margin-left:25px;">
	<asp:Repeater ID="rptrCats" Runat="server">
		<HeaderTemplate>
			<table cellpadding="5" cellspacing="1" class="fbTblAdmin" width="100%">
				<tr class="fbTblAdminHead" >
					<td colspan="5"><b>Use Direct Update</b></td>
				</tr>
				<tr class="fbTblAdminSubHead">
					<td width="3%"><input onclick="doCheck(this.checked, 'cb', 'rptrCats');" type="checkbox"></td>
					<td width="20%">Category</td>
					<td with="57%">Description</td>
					<td width="10%" align="center">Useable</td>
					<td width="10%">&nbsp;</td>
				</tr>
		</HeaderTemplate>
		<ItemTemplate>
				<tr id="trData" runat="server">
					<td><asp:CheckBox ID="cb" Runat="server" /></td>
					<td><asp:Literal ID="litCat" Runat="server" /></td>
					<td><asp:Literal ID="litFDesc" runat="server" /></td>
					<td align="center"><asp:Image ID="imgIsValid" runat="server" Visible="false" /></td>
					<td>
						<img title="" src="UI/Common/Images/PortletImages/Icons/add.gif" id="imgAdd" runat="server">
						<img title="" src="UI/Common/Images/PortletImages/Icons/fb_edit.gif" id="imgEdit" runat="server">
						<asp:LinkButton ID="aFB" Runat="server" />
					</td>
				</tr>
		</ItemTemplate>
		<FooterTemplate>
			</table>
		</FooterTemplate>
	</asp:Repeater>
	<table>
		<tr>
			<td><br/><asp:Button ID="btnSubmit" Runat="server" Text="Save" /> &nbsp; <asp:Button ID="btnCancel" Runat="server" Text="Cancel" /><br/><br/></td>
		</tr>
	</table>
</div>
