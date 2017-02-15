<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Main_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.MessageCenterPortlet.Main_View" targetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Import Namespace="Jenzabar.Common.Globalization" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<div xmlns:cmn="http://schemas.jenzabar.com/JICS/CommonControls">

<cmn:SubHeader textkey="TXT_INBOX" id="hdrInbox" runat="server"	>
	<cmn:AddImageAndTextButton id="btnNewMessage" runat="server" textkey="TXT_NEW_MESSAGE" tooltipkey="MSG_NEW_MESSAGE" /> &nbsp;
	<cmn:AddImageAndTextButton id="btnNewSystemAlert" runat="server" textkey="TXT_NEW_SYSTEM_ALERT" tooltipkey="MSG_NEW_SYSTEM_ALERT" />
</cmn:SubHeader>
<div class="pSection">
<cmn:GroupedGrid id="ggInbox" runat="server" RenderTableHeaders="true" datakeyfield="ID">
	<TableHeaderTemplate>
		<div style="text-align:right;width:100%">
		<span class="selectedFilter" style="float:left;"><%# Globalizer.GetEnumText(this.Filter) %> (<%# ((ICollection)ggInbox.DataSource).Count.ToString() %>)</span>
		<span style="float:right;">
		<cmn:GlobalizedLabel runat="server" textkey="LBL_SHOW" AssociatedControlID="ddlFilter" />
		<asp:DropDownList id="ddlFilter" runat="server" onselectedindexchanged="ChangeFilter" autopostback="True">
			<asp:ListItem value="AllMessages">All Messages</asp:ListItem>
			<asp:ListItem value="PersonalMessages">Personal Messages</asp:ListItem>
			<asp:ListItem value="PortletAlerts">Portlet Alerts</asp:ListItem>
			<asp:ListItem value="SystemAlerts">System Alerts</asp:ListItem>
		</asp:DropDownList>
		<cmn:GlobalizedLinkButton textkey="TXT_READ_ALL" tooltipkey="MSG_READ_ALL_MESSAGE_CENTER_MESSAGES" commandname="READ_ALL" id="Globalizedlinkbutton1" runat="server"/>
		</span>
		</div>
	</TableHeaderTemplate>	
	<HeaderRightColumns>
		<cmn:GroupedGridButtonColumn textkey="TXT_READ_ALL" commandname="READ_ALL" />
	</HeaderRightColumns>
	<columns>
		<cmn:CheckBoxColumn />
		<cmn:GroupedGridButtonColumn headertext="Subject" datatextfield="Subject" commandname="VIEW" />
		<asp:TemplateColumn>
			<HeaderTemplate>From</HeaderTemplate>
			<ItemTemplate><asp:Literal ID="litAuthor" runat="server" /></ItemTemplate>
		</asp:TemplateColumn>
		<cmn:GlobalizedTemplateColumn headertext="Date Recieved">			
			<ItemTemplate><%# GetDate( ((Jenzabar.ICS.Message)Container.DataItem).Sent ) + " " + ((Jenzabar.ICS.Message)Container.DataItem).Sent.ToShortTimeString() %></ItemTemplate>
		</cmn:GlobalizedTemplateColumn>
	</columns>
	<TableFooterTemplate><cmn:GlobalizedLinkButton textkey="TXT_DELETE_SELECTED" tooltipkey="MSG_DELETE_SELECTED_MESSAGES" commandname="DELETE_SELECTED" id="lbDeleteSelected" runat="server"/></TableFooterTemplate>
</cmn:GroupedGrid>

<cmn:PageNavigator id="pn" runat="server" />

</div>

</div>

<script runat="server">
private string GetDate(DateTime dt)
{
	if( dt.Date == DateTime.Now.Date )
		return Globalizer.GetGlobalizedString("TXT_TODAY");
	if( dt.Date.AddDays(1) == DateTime.Now.Date )
		return Globalizer.GetGlobalizedString("TXT_YESTERDAY");
	return dt.ToShortDateString();
}
</script>