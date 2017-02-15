<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Reorder_Categories.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.StudentRequest.Reorder_Categories" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<jenzabar:errordisplay id="error" Runat="server" />
<h4><asp:Literal ID="litHeader" runat="server" /></h4>
<div class="pSection" id="divMain" runat="server" visible="true">
	<table cellpadding="3" cellspacing="0" width="100%">
		<tr>
			<td>
				<asp:Repeater id="rptMainGrid" runat="server">
					<HeaderTemplate>
						<table width="100%" border="0" cellpadding="3" cellspacing="0">
						<tr><td colspan="2" class="BorderTopLeftBottomRight"><b>Categories</b></td></tr>
						<tr><td class="BorderLeftBottomSE">Order</td>
						<td class="BorderLeftRightBottomSE">Category Name</td></tr>
					</HeaderTemplate>
					<ItemTemplate>
						<tr  valign=middle>
							<td class="BorderLeftBottom" width=20>
								<asp:TextBox ID="tbNewOrder" MaxLength="3" Width="25px"	Text='<%#DataBinder.Eval(Container.DataItem, "Order")%>' Runat="server"	/>
							</td>
							<td class="BorderLeftRightBottom">
								<%#DataBinder.Eval(Container.DataItem, "Name")%>
								<input id="hOldOrder" type="hidden" value='<%#DataBinder.Eval(Container.DataItem, "Order")%>' runat="server" NAME="hOldOrder">
							</td>
						</tr>
					</ItemTemplate>
					<AlternatingItemTemplate>
						<tr valign=middle>
							<td class="BorderLeftBottomSE" width="20">
								<asp:TextBox ID="tbNewOrder" MaxLength="3" Width="25px"	Text='<%#DataBinder.Eval(Container.DataItem, "Order")%>' Runat="server"	/>
							</td>
							<td class="BorderLeftRightBottomSE">
								<%#DataBinder.Eval(Container.DataItem, "Name")%>
								<input	id="hOldOrder" type="hidden" value='<%#DataBinder.Eval(Container.DataItem, "Order")%>' runat="server" NAME="hOldOrder">
							</td>
						</tr>
					</AlternatingItemTemplate>
					<FooterTemplate>
						</table>
					</FooterTemplate> 
				</asp:Repeater> 
			</td>
		</tr>
	<tr>
		<td>
			<jenzabar:GlobalizedButton ID="gbSave" Runat="server" TextKey="TXT_REORDER" />&nbsp;
			<jenzabar:GlobalizedLinkButton ID="glbDone" Runat="server" TextKey="TXT_DONE_REORDERING" />
		</td>
	</tr>
	</table>
</div> 