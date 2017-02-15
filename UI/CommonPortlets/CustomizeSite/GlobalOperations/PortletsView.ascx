<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="PortletsView.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.PortletsView" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>

<cmn:Subheader id="subHeader" textKey="TXT_PORTLETS" runat="server" />
<div class="pSection">
	<cmn:Hint id="hntInstructions" runat="server" textKey="TXT_GLOBAL_OPERATIONS_CHOOSE_PORTLET" />
	<cmn:GroupedGrid id="ggPortlets" runat="server">
		<COLUMNS>
			<ASP:TEMPLATECOLUMN SortExpression="" HeaderText="TabName">
				<ItemTemplate>
					<asp:LinkButton ID="btnPortlet" Runat="server" />
                    <asp:Literal ID="litPortlet" Runat="server" />
				</ItemTemplate>
			</ASP:TEMPLATECOLUMN>
		</COLUMNS>
	</cmn:GroupedGrid>
</div>