<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>

<%@ Control Language="c#" AutoEventWireup="false" Codebehind="OrderCategories_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.ForumPortlet.OrderCategories_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<div class="pSection">
<p>
	<table cellpadding="3" cellspacing="0" width="100%">
		<tr>
			<td>
				<jenzabar:groupedgrid id="CategoryOrder" runat="server" DataKeyField="ID" GroupKeyField="ID">
					<GroupHeaderTemplate>
						<input id="OldOrder" type="hidden" value='<%# DataBinder.Eval(Container.DataItem, "Order") %>' runat="server" NAME="OldOrder">
						<asp:TextBox ID="NewOrder" MaxLength="3" Width="25px" Text='<%# DataBinder.Eval(Container.DataItem, "Order") %>' Runat="server" />
						<b><%# DataBinder.Eval(Container.DataItem, "Label") %></b>
						<asp:ImageButton ID="AddTopicButton" CommandName="AddTopic" Runat="server" />
						<asp:ImageButton ID="EditCategoryButton" CommandName="EditCategory" Runat="server" />
						<asp:ImageButton ID="DeleteCategoryButton" CommandName="DeleteCategory" Runat="server" />
					</GroupHeaderTemplate>
				</jenzabar:groupedgrid>
			</td>
		</tr>
		<tr>
			<td>
				&nbsp;<asp:linkbutton id="AddCategory" Runat="server" Visible="False">Add a Category</asp:linkbutton>
			</td>
		</tr>
		<tr>
			<td>
				<asp:Button ID="SaveButton" Text="Save" Runat="server" />
				&nbsp;
				<asp:Button ID="CancelButton" Text="Cancel" Runat="server" />
			</td>
		</tr>
	</table>
</p>
</div>
