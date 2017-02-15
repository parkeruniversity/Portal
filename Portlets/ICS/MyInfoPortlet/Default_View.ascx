<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Default_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.MyInfoPortlet.Default_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="common" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Import namespace="Jenzabar.ICS" %>

<!-- THE DEFAULT VIEW APPEARS IN THE POPUP WINDOW. -->

<style>
	ul.mainInfoBar { margin: 0px; }
	ul.mainInfoBar li { margin-top: 1px; }
	ul.mainInfoBar li.mainInfoHeader { font-weight: bold; margin-top: 10px; }
	ul.mainInfoBar li.mainInfoNote { font-size: 80%; margin-top: 0px; margin-left: 10px; }
</style>

<table cellSpacing="0" cellPadding="10" border="0">
	<tr>
		<td vAlign="top"><asp:image id="Photo" ImageAlign="Top" Runat="server"></asp:image></td>
		<td vAlign="top">
			<ul class="mainInfoBar">
				<li><asp:label id="FullName" Runat="server" /></li>
				<li id="EmailAddressContainer" runat="server"><a id="hrefEmail" runat="server"><asp:label id="EmailAddress" Runat="server" /></a></li>
				<li id="OfficeHoursContainer" class="mainInfoHeader" runat="server"><asp:Label ID="OfficeHoursHeader" Runat="server" /></li>
				<asp:repeater id="OfficeHoursRepeater" Runat="server">
					<ItemTemplate>
						<li><%# ((OfficeHours)Container.DataItem).MainText %></li>
						<li id="Note" class="mainInfoNote" visible="false" runat="server"><%# ((OfficeHours)Container.DataItem).SecondaryText %></li>
					</ItemTemplate>
				</asp:repeater>
			</ul>
		</td>
	</tr>
</table>
<div id="PersonalInformation">
	<common:SubHeader textKey="TXT_PERSONAL_INFO_TITLE" id="shPersonalInfo" runat=server />
	<common:SuperTabs  runat=server id="PersonalInfoTabs" />
	<asp:PlaceHolder ID="ctlPersonalInfo" Runat=server />
</div>

