<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Unit.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseOrganizerPortlet.Views.Controls.Unit" %>
<%@ Register TagPrefix="LMS" TagName="Modal" Src="../../../Common/Controls/Modal.ascx" %>
<%@ Register TagPrefix="cwk" TagName="AddOrganizationalTypePopup" Src="../../../CourseworkPortlet/Views/Controls/AddOrganizationalUnitPopup.ascx" %>
<%@ Register TagPrefix="framework" Assembly="Jenzabar.Portal.Framework.Web" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>

<asp:UpdatePanel ID="_updatePanelUnit" runat="server">
    <ContentTemplate>
        <div class="coSectionHeader"><asp:Label ID="_lblTitle" runat="server" /></div>
        <table width="100%">
            <tr>
                <td valign="top"><a id="_aBack" runat="server"><asp:Image ID="_imgBack" runat="server" /></a></td>
                <td valign="top" align="center">
                    <asp:Label CssClass="unitName" ID="_lblUnitName" runat="server" />             
                    <framework:PortalImageButton ID="_editUnitButton" ImageCategory="PortletIcon" ImageUrl="16/pencil.png" runat="server" ToolTip="Edit Unit" />
                    <framework:PortalImageButton ID="_addUnitButton" ImageCategory="PortletIcon" ImageUrl="16/add.png" runat="server" ToolTip="Add Unit" />                    
                    <br />
                    <asp:DropDownList CssClass="coDropDown" ID="_ddlUnits" runat="server" />
                </td>
                <td valign="top" align="right"><a id="_aNext" runat="server"><asp:Image ID="_imgNext" runat="server" /></a></td>
            </tr>
            <tr id="_trAlerts" runat="server">
                <td colspan="3">
                    <div class="courseOrganizerAlert">
                    <asp:Repeater ID="_rptrAlerts" runat="server">
                        <ItemTemplate>
                            <asp:Image ID="_imgAlert" runat="server" /> <asp:Label ID="_lblAlert" runat="server" /><br />
                        </ItemTemplate>
                    </asp:Repeater>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Label ID="_lblUnitDescription" runat="server" />
                </td>
            </tr>
        </table>
        <LMS:Modal ID="_editUnitPopup" TargetControlID="_editUnitButton" CssClass="orgUnitModal" runat="server">
			<ContentArea>
				<cwk:AddOrganizationalTypePopup ID="_editUnitPopupContents" HideHeader="true" HideButtons="true" runat="server" />
			</ContentArea>
		</LMS:Modal>
        <LMS:Modal ID="_addUnitPopup" TargetControlID="_addUnitButton" CssClass="orgUnitModal" runat="server">
            <ContentArea>
                <cwk:AddOrganizationalTypePopup ID="_addUnitPopupContents" HideHeader="true" HideButtons="true" runat="server" />
            </ContentArea>
        </LMS:Modal>
    </ContentTemplate>
</asp:UpdatePanel>