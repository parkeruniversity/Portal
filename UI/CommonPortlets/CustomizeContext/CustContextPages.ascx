<%@ Control Language="c#" AutoEventWireup="false" Codebehind="CustContextPages.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.Controls.CustContextPages" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="cust" tagname="ContextAddEditPage" src="~/UI/CommonPortlets/CustomizeContext/ContextAddEditPage.ascx" %>
<%@Import namespace="Jenzabar.Portal.Framework"%>
<%@Import namespace="Jenzabar.Common.Globalization"%>


<script language="JavaScript" src="UI/Common/Scripts/PortletUtils.js"></script>
<cmn:Subheader id="subHeader" runat="server"></cmn:Subheader>
<div class="pSection">
<p></p>
<cmn:groupedgrid id="ItemsGrid" runat="server" HideTableHeadersWhenGridIsEmpty="True" DataKeyField="ID" GroupKeyField="ID" rendertableheaders="True" EnableAutoConfirmation="False" allowsorting="true">
<COLUMNS>
	<ASP:TEMPLATECOLUMN SortExpression="" HeaderText="DefaultPage">
		<ITEMTEMPLATE>
			<asp:RadioButton ID="PageSelected" Runat="server" AutoPostBack="True" OnCheckedChanged="radio_CheckedChanged"></asp:RadioButton>
		</ITEMTEMPLATE>
	</ASP:TEMPLATECOLUMN>
	<ASP:TEMPLATECOLUMN SortExpression="" HeaderText="PageName">
		<ITEMTEMPLATE>
					<%# ((PortalPageInfo)Container.DataItem).DisplayName %>
					<asp:Literal ID="PageInfo" Runat="server"></asp:Literal>
		</ITEMTEMPLATE>
	</ASP:TEMPLATECOLUMN>
	<ASP:TEMPLATECOLUMN SortExpression="" HeaderText="">
		<ITEMTEMPLATE>
					<asp:ImageButton ID="imbRenameItem" CommandName="RenameItem" Runat="server" Visible="False"></asp:ImageButton>
					&nbsp;
					<asp:ImageButton ID="imbDeleteItem" CommandName="DeleteItem" Runat="server" Visible="False"></asp:ImageButton>
		</ITEMTEMPLATE>
	</ASP:TEMPLATECOLUMN>
</COLUMNS>
<EmptyTableTemplate><%=Globalizer.GetGlobalizedString("MSG_NO_ITEMS_TO_DISPLAY")%></EmptyTableTemplate>
</cmn:groupedgrid>
<p>
<asp:ImageButton ID="imbCreateItem" CommandName="AddItem" Runat="server"></asp:ImageButton>
<asp:LinkButton ID="lnkCreateItem" CommandName="AddItem" Runat="server"></asp:LinkButton></p>
<p>
<asp:ImageButton ID="imbReorder" CommandName="Reorder" Runat="server"></asp:ImageButton>
<asp:LinkButton ID="lnkReorder" CommandName="Reorder" Runat="server"></asp:LinkButton></p>
</div>
