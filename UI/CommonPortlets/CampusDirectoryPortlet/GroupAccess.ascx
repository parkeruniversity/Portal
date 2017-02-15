<%@ Import namespace="Jenzabar.Portal.Framework" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Import namespace="Jenzabar.Common" %>
<%@ Register TagPrefix="cmn" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="GroupAccess.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.CampusDirectoryPortlet.GroupAccess" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Import namespace="System.Data" %>
<style>
.Everyone { }
.EveryoneChecked { BACKGROUND: green; color:White; }
.GroupAccessItem { BACKGROUND: #eee; DISPLAY: block; FLOAT: left; MARGIN: 10px; WIDTH: 150px; height: 50px;}
.clearer { CLEAR: left; LINE-HEIGHT: 0; HEIGHT: 1% }
</style>

<b><asp:Literal ID="litGroupName" Runat="server"/></b>
<div class="hrDiv"></div>
<div class="blockCanView">
	<div class="canViewTxt">
		<b><cmn:GlobalizedLiteral runat="server" textkey="LBL_CAN_VIEW" /></b>
	</div>
	<div class="blockCanViewRadioButtons">
		<span runat="server" id="spanEveryone">
			<asp:RadioButton ID="chbEveryone" runat="server" GroupName="toggleEveryone"></asp:RadioButton> <cmn:GlobalizedLiteral runat="server" textkey="TXT_EVERYONE" />&nbsp;
		</span><br/>
		<asp:RadioButton ID="chbEveryoneNot" Runat="server" GroupName="toggleEveryone"></asp:RadioButton> <cmn:GlobalizedLiteral runat="server" textkey="TXT_SELECTED_ROLES" />
	</div>
</div>
<br/>
<div class="clearSpacer"></div> 
<div class="containerRolesColumns">
	<div>
		<div class="listTitle">
			<b><cmn:GlobalizedLiteral runat="server" textkey="TXT_COMMON_ROLES"/></b>
		</div>
		<div class="listContainer">
			<asp:DataList ID="dlCommonRoles" Runat="server" RepeatColumns="1" RepeatDirection="Vertical" RepeatLayout="Table">
				<ItemTemplate>
					<div class="checkboxItem">
						<input id="GroupSelected1" runat="server" type="checkbox" name="GroupSelected" value='<%#((DataRowView)Container.DataItem)["ID"]%>' />
						&nbsp;
						<%#((DataRowView)Container.DataItem)["RoleName"]%>
					</div>
				</ItemTemplate>
			</asp:DataList>
		</div>
	</div>
	<div class="clearSpacer"></div> 
	<div>
		<div class="listTitle">
			<b><cmn:GlobalizedLiteral runat="server" textkey="TXT_OTHER_ROLES"/></b>
		</div>
		<div class="listContainer">
			<asp:DataList ID="dlOtherRoles" Runat="server" RepeatColumns="2" RepeatDirection="Vertical" RepeatLayout="Table">
				<ItemTemplate>
					<div class="checkboxItem">
						<input id="GroupSelected2" runat="server" type="checkbox" name="GroupSelected" value='<%#((DataRowView)Container.DataItem)["ID"]%>' />
						&nbsp;
						<%#((DataRowView)Container.DataItem)["RoleName"]%>
					</div>
				</ItemTemplate>
			</asp:DataList>
		</div>
	</div>
	<div class="clearSpacer"></div>
</div>

<script>
ChangeEveryoneStyle('<%=chbEveryone.ClientID%>');
</script>