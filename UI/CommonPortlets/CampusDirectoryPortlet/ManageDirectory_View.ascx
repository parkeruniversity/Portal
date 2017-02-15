<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ManageDirectory_View.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.CampusDirectoryPortlet.ManageDirectory_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="cmn" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Import namespace="Jenzabar.Portal.Framework" %>
<%@ Register TagPrefix="framework" namespace="Jenzabar.Portal.Framework.Web.UI.Controls" assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Import namespace="Jenzabar.Common" %>

<script language="JavaScript" src='<%=JCUtilities.ResolveUrl("~/UI/CommonPortlets/CampusDirectoryPortlet/CampusDirectory.js")%>'></script>
<cmn:Subheader id="subHeader" runat="server"/>
<div class="pSection">
	<cmn:ErrorDisplay id="ctlError" runat=server />
	<asp:PlaceHolder ID="plhMain" Runat="server">
	<fieldset>
		<table>
			<tr>
				<th><cmn:GlobalizedLabel runat="server" textkey="LBL_SHOW" ID="Globalizedlabel1" NAME="Globalizedlabel1"/></th>
				<td><asp:DropDownList Runat="server" AutoPostBack="True" ID="ddlRole"/></td>
				<td width=40%>&nbsp;
				</td>
				<td> <cmn:GlobalizedLiteral runat="server" textkey="LBL_PROFILE_TYPE"/>
					&nbsp;<asp:DropDownList ID="ddlHiddenType" Runat="server"/>
					</td>
				<td>
					<cmn:GlobalizedButton Runat="server" ID="btnSearch" textkey="TXT_GO"/>
				</td>
			</tr>
		</table>
	</div>
	<div class="pSection">
		<cmn:LetterSelector id="ltrSelector" runat="server" />
		<cmn:LetterNavigator id="ltrNav" runat="server" AutoBind="False" DataField="NameDetails.LastName" />
		<cmn:groupedgrid id="ItemsGrid" runat="server" rendertableheaders="True" HideTableHeadersWhenGridIsEmpty="True" DataKeyField="ID">
		<GroupHeaderTemplate>
		</GroupHeaderTemplate>
		<Columns>
			<asp:TemplateColumn HeaderText="HideUserFromList">
				<ItemTemplate>
					<input type="checkbox" ID="HideByAdmin" runat="server" onclick="DataChanged();"/>
				</ItemTemplate>
				<ItemStyle  Width="45px"/>
			</asp:TemplateColumn>
			<asp:TemplateColumn HeaderText="UserHasHiddenProfile">
				<ItemTemplate>
					<asp:Literal ID="litYes" Runat="server" Visible="False"/>
				</ItemTemplate>
				<ItemStyle  Width="45px"/>
			</asp:TemplateColumn>			
			<asp:TemplateColumn HeaderText="Name">
				<ItemTemplate>
					<framework:MyInfoPopup id="MyInfoLink" runat="server" UserId="<%#((PortalUser)Container.DataItem).ID.AsGuid.ToString()%>" InnerText="<%#GetUserDisplayName((PortalUser)Container.DataItem)%>"/>
					<asp:Literal ID="litName" Runat="server" Visible="False"/>
				</ItemTemplate>
			</asp:TemplateColumn>
		</Columns>
	<EmptyTableTemplate><%=Globalizer.GetGlobalizedString("MSG_NO_ITEMS_TO_DISPLAY")%></EmptyTableTemplate>
	</cmn:groupedgrid>
	</fieldset>	
	<div class="pActionsTransp">
		<asp:Button id="btnSubmit" runat="server" />
		&nbsp;
		<asp:Button id="btnCancel" CausesValidation="False" runat="server" />
	</div>
</div>
</asp:PlaceHolder>