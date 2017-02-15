<%@ Control Language="c#" AutoEventWireup="false" Codebehind="FrameworkSettings.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.FrameworkSettings" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="cmn" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<div class="pSection">
	<asp:PlaceHolder ID="phCategorySelect" Runat="server">
	    
        <label ID="selectCategoryLabel" runat="server">
            <%= Globalizer.GetGlobalizedString("LBL_SELECT_CATEGORY") %>
        </label>

		
		&nbsp;
		<asp:DropDownList ID="ddlCategories" Runat="server" AutoPostBack="true">
			<asp:ListItem Value="" Selected="true"></asp:ListItem>
			<asp:ListItem Value="DataImport">Data Import</asp:ListItem>
			<asp:ListItem Value="Email">E-mail</asp:ListItem>
			<asp:ListItem Value="ERP">ERP</asp:ListItem>
			<asp:ListItem Value="Globalization">Globalization</asp:ListItem>
			<asp:ListItem Value="Location">Location</asp:ListItem>
			<asp:ListItem Value="PortletSettings">Portlet Settings</asp:ListItem>
			<asp:ListItem Value="Security">Security</asp:ListItem>
            <asp:ListItem Value="SiteStats">Site Stats</asp:ListItem>
            <asp:ListItem Value="SMS">SMS</asp:ListItem>
			<asp:ListItem Value="Validation">Validation</asp:ListItem>
		</asp:DropDownList>
	</asp:PlaceHolder>
	<asp:PlaceHolder ID="phSettingForm" Runat="server" Visible="False">
		<h4 id="subCategory" runat="server"></h4>
		<fieldset>
			<table width="100%">
				<asp:PlaceHolder ID="phSettingList" Runat="server" />
				<tr>
				    <td align=center colspan=2>
				        <br />
				        <cmn:GlobalizedButton id="btnSave" runat="server" TextKey="TXT_SAVE" />
		                &nbsp;
		                <cmn:GlobalizedButton id="btnCancel" runat="server" TextKey="TXT_CANCEL" />
		            </td>
		        </tr>
			</table>
		</fieldset>
	</asp:PlaceHolder>	
</div>