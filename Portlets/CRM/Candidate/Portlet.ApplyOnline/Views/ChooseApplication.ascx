<%@ Control CodeBehind="ChooseApplication.ascx.cs" Language="c#" AutoEventWireup="True" Inherits="Jenzabar.CRM.Candidate.Web.Portlets.ApplyOnline.ChooseApplication" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="framework" namespace="Jenzabar.Portal.Framework.Web.UI.Controls" assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<script language="JavaScript" src="<%= this.ResolveUrl("~/UI/Common/Scripts/jenz.js") %>"></script>
<jenzabar:errordisplay id="error" Runat="server" />
<h4><jenzabar:globalizedliteral id="litChoose" runat="server" textkey="TXT_AO_CHOOSE_APPLICATION" /></h4>
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
			<td><a href=<%=this.ParentPortlet.GetNextScreenURL(@"FormBuilder//Main_View")%>><img src="UI/Common/Images/PortletImages/Icons/add.gif"><jenzabar:GlobalizedLiteral TextKey="TXT_AO_ADD_A_NEW_APPLICATION" id="glwiAddApplication" runat=server /></a></td>
		</tr>
		<tr>
			<td><jenzabar:GlobalizedLinkButton id=glbBack runat=server TextKey="FB_BACK_TO_ADMIN" /></td>
		</tr>
	</table>
</div>
