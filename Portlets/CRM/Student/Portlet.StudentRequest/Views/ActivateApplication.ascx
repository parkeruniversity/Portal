<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ActivateApplication.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.StudentRequest.ActivateApplication" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="framework" namespace="Jenzabar.Portal.Framework.Web.UI.Controls" assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<h4><asp:Literal ID="litPTitle" runat="server" /></h4>
<div class="pSection">
	<table>
		<tr>
			<td class="GrayBordered">
				<asp:literal id="litHeader" runat="server" />
				<span id="spanHeader" runat="server">Click <a href=<%=this.ParentPortlet.GetNextScreenURL(@"FormBuilder//Main_View")%>>here</a> to add a new one.</span>
			</td>
		</tr>
		<tr>
			<td>
				<asp:Repeater ID="rptMainGrid" Runat="server">
					<HeaderTemplate>
						<table>
					</HeaderTemplate>
					<ItemTemplate>
						<tr>
							<td><asp:LinkButton ID=lbMain Runat=server CommandName="Add" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "ID")%>'><%#DataBinder.Eval(Container.DataItem, "Name")%></asp:LinkButton><asp:Literal ID=litMain Runat=server Visible=False /> <asp:HyperLink ID="hlMain" Runat="server" Visible="False" /></td>
						</tr>
					</ItemTemplate>
					<FooterTemplate>
						</table>
					</FooterTemplate>
				</asp:Repeater>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr id=trAddNew runat=server>
			<td><a href=<%=this.ParentPortlet.GetNextScreenURL(@"FormBuilder//Main_View")%>><img src="UI/Common/Images/PortletImages/Icons/add.gif"> <asp:Literal ID="litAddNew" runat="server" /></td>
		</tr>
		<tr>
			<td><a id="aBack" runat="server" /></td>
		</tr>
    </table>
</div> 