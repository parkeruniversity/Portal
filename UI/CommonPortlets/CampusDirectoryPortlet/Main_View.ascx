<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Main_View.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.CampusDirectoryPortlet.Main_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="cmn" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Import namespace="Jenzabar.Portal.Framework" %>
<%@ Register TagPrefix="framework" namespace="Jenzabar.Portal.Framework.Web.UI.Controls" assembly="Jenzabar.Portal.Framework.Web" %>

<cmn:Subheader id="subHeader" runat="server"/>
<div class="pSection">
	<cmn:ErrorDisplay id="ctlError" runat=server />
	<asp:PlaceHolder ID="plhMain" Runat="server">
	<fieldset>
		<table>
			<tr>
				<th><cmn:GlobalizedLabel runat="server" textkey="LBL_SHOW"/></th>
				<td><asp:DropDownList Runat="server" AutoPostBack="True" ID="ddlRole"/></td>
				<td></td>
			</tr>
		</table>
	</div>
	<div class="pSection">
		<cmn:LetterSelector id="ltrSelector" runat="server" />
		<cmn:LetterNavigator id="ltrNav" AutoBind="False" runat="server" DataField="NameDetails.LastName" />
		<cmn:groupedgrid id="ItemsGrid" runat="server" rendertableheaders="True" HideTableHeadersWhenGridIsEmpty="True" DataKeyField="ID" >
		<GroupHeaderTemplate>
		</GroupHeaderTemplate>
		<Columns>
			<asp:TemplateColumn HeaderText="Name">
				<ItemTemplate>
					<framework:MyInfoPopup id="MyInfoLink" runat="server" UserId="<%#((PortalUser)Container.DataItem).ID.AsGuid.ToString()%>" InnerText="<%#GetUserDisplayName((PortalUser)Container.DataItem)%>" Visible="True"/>
					<i><asp:Literal ID="litName" Runat="server" Visible="False"/></i>
				</ItemTemplate>
			</asp:TemplateColumn>
		</Columns>
	<EmptyTableTemplate><%=Globalizer.GetGlobalizedString("MSG_NO_ITEMS_TO_DISPLAY")%></EmptyTableTemplate>
	</cmn:groupedgrid>
	</fieldset>	
	</asp:PlaceHolder>
</div>
