<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Default_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.ReadingPortlet.Default_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="secured" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls.Secured" Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Import namespace="Jenzabar.ICS" %>
<%@ Import namespace="Jenzabar.ICS.Web.Portlets.ReadingPortlet" %>
<div class="pSection">
<asp:PlaceHolder ID="plhAdd" Runat="server">
<div>
<asp:ImageButton id="AddNewReading" Visible="False" Runat="server" CommandName="AddItem"></asp:ImageButton>&nbsp;
<asp:LinkButton id="lnkAddNewReading" runat="server" CommandName="AddItem" CausesValidation="False"></asp:LinkButton>
</div>
</asp:PlaceHolder>
	<div><jenzabar:PageNavigator id="pNav" AutoBind="False" runat="server" /></div>
	<jenzabar:groupedgrid id="ItemsGrid" runat="server" HideTableHeadersWhenGridIsEmpty="True" EnableAutoConfirmation="False" DataKeyField="ID">
		<GroupHeaderTemplate>
			<div class="PortletSetTitle"><%# ((Header)Container.DataItem).Name %></div>
		</GroupHeaderTemplate>
		<GroupSubHeaderTemplate>
			<div class="PortletSetDescription"><%# ((Header)Container.DataItem).Description %></div>
		</GroupSubHeaderTemplate>		
		<Columns>
			<asp:TemplateColumn HeaderText="link">
				<ItemTemplate>
					<div class="PortletItemTitle">
						<asp:linkbutton id="lnkViewDetails" runat="server" CausesValidation="False" CommandName="ViewItem">
							<%# ((Reading)Container.DataItem).Title %>
						</asp:linkbutton></div>
					<div class="PortletItemStatus"><%# Jenzabar.ICS.Web.Portlets.Common.PortletUtilities.GetTextFromEnumValue(((Reading)Container.DataItem).Status) %></div>
				</ItemTemplate>
			</asp:TemplateColumn>
		</Columns>
	<EmptyTableTemplate><%=Globalizer.GetGlobalizedString("MSG_NO_READINGS_FOR_PORTLET")%></EmptyTableTemplate>
	</jenzabar:groupedgrid>
</div>
<div class="buttonBar">
	<asp:LinkButton ID="lnkGoToMain" Runat="server"></asp:LinkButton>
</div>