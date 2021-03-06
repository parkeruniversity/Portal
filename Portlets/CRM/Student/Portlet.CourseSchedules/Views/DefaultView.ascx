<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="True" Codebehind="DefaultView.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.CourseSchedulesPortlet.DefaultView" %>
<%@ Import Namespace="System.Web.Optimization" %>
<%@ Import namespace="Jenzabar.CRM"%>

<%: Styles.Render("~/Portlets/CRM/Common/Jenzabar.EX.Common/css/dependency-bundle.css") %>

<jenzabar:subheader id="litHeader" runat="server"></jenzabar:subheader>
<div id="divAdminLink" runat="server" visible="false">
	<table class="GrayBordered" width="50%" align="center" cellpadding="3" border="0">
		<tr>
			<td align="center"><IMG title="" alt="*" src="UI\Common\Images\PortletImages\Icons\portlet_admin_icon.gif">&nbsp;<jenzabar:globalizedlinkbutton id="glnkAdmin" runat="server" TextKey="TXT_CS_ADMIN_THIS_PORTLET"></jenzabar:globalizedlinkbutton></td>
		</tr>
	</table>
</div>
<jenzabar:errordisplay id="ctlError" RunAt="server">
	<IMG title="" alt="*" src="UI\Common\Images\PortletImages\Icons\exclam_icon.gif"></jenzabar:errordisplay>
<div class="pSection">
<div id="divHiddenForRegAgreement" runat="server" visible="true">
	<div id="divTermInfo" runat="server">
		<jenzabar:Hint id="hntMessage" Visible="False" Runat="server"></jenzabar:Hint>
		<table cellSpacing="2" cellPadding="2" width="100%">
			<tr>
				<th noWrap width="20%" align="right">
					<jenzabar:globalizedliteral id="litTerm" Runat="server" TextKey="TXT_CURRENT_TERM"></jenzabar:globalizedliteral>:</th>
				<td><jenzabar:globalizedlabel id="lblTerm" Runat="server"></jenzabar:globalizedlabel></td>
			</tr>
			<!--<tr>
				<th align="right">
					<jenzabar:globalizedliteral id="litDivision" Runat="server"></jenzabar:globalizedliteral>:</th>
				<td><jenzabar:globalizedlabel id="lblDivision" Runat="server"></jenzabar:globalizedlabel></td>
			</tr>-->
			<tr>
				<td colspan="2">
					<jenzabar:globalizedlabel id="lblAdd" Runat="server"></jenzabar:globalizedlabel>
					/
					<jenzabar:globalizedlabel id="lblDrop" Runat="server"></jenzabar:globalizedlabel></td>
			</tr>
			<tr id="trHolds" runat="server">
				<th vAlign="top" align="right">
					<jenzabar:globalizedliteral id="glitHolds" TextKey="TXT_HOLDS" runat="server"></jenzabar:globalizedliteral>:</th>
				<td><asp:datalist id="dgHolds" Runat="server">
						<ItemTemplate>
							<%# DataBinder.Eval(Container.DataItem, "HoldDescription") %>
						</ItemTemplate>
					</asp:datalist></td>
			</tr>
		</table>
	</div>
	<br>
	<table cellSpacing="2" cellPadding="2" width="100%">
		<tr>
			<td width="190">
				<a id="lnkAddDrop" runat="server" style="VERTICAL-ALIGN: bottom"><asp:Label id="addDropIcon" class="icon-add-drop" runat="server" />
					<asp:Label ID="lblAddDrop" Runat="server" />
				</a>
			</td>
			<td width="30"></td>
			<td>
				<a id="lnkAdvancedSearch" runat="server" style="VERTICAL-ALIGN: bottom"><span class="icon-search"></span>
					<asp:Label ID="lblAdvancedSearch" Runat="server" />
				</a>
			</td>
		</tr>
	</table>
	<br>
	<div id="divCourses" runat="server">
		<jenzabar:GroupedGrid id="dgCourses" runat="server" CssClass="groupedGrid" RenderTableHeaders="True">
			<TableHeaderTemplate>
				<jenzabar:GlobalizedLiteral id="glitSelCrsSubHeader" runat="server" TextKey="TXT_CS_COURSES_CONFIRMED"></jenzabar:GlobalizedLiteral>
			</TableHeaderTemplate>
			<Columns>
				<jenzabar:GlobalizedTemplateColumn HeaderTextKey="TXT_COURSE">
					<ItemTemplate>
						<jenzabar:GlobalizedLinkButton ID="lnkCourse" CommandArgument='<%# DataBinder.Eval( Container.DataItem, "ERPCourseKey" )%>' OnCommand="Course_Click" Runat="server">
							<%# DataBinder.Eval( Container.DataItem, "DisplayedCourseCode" ).ToString() %>
						</jenzabar:GlobalizedLinkButton>
					</ItemTemplate> 
				</jenzabar:GlobalizedTemplateColumn>
				<jenzabar:GlobalizedBoundColumn DataField="Title" HeaderTextKey="TXT_TITLE"></jenzabar:GlobalizedBoundColumn>
				<jenzabar:GlobalizedBoundColumn DataField="Status" HeaderTextKey="TXT_STATUS"></jenzabar:GlobalizedBoundColumn>
			</Columns>
		</jenzabar:GroupedGrid></div>
	<br>
	</div>
    <div id="divShowForRegAgreement" runat="server" visible="false">
        <table width="95%">
        <div id="divPersonalInfo" visible="True" runat="server">
            <tr>
                <td colspan="3">
                    <h5><jenzabar:GlobalizedLiteral ID="glitAddDropSettings" runat="server" /></h5>
                </td>
            </tr>
            <tr>
                <td width="4%">
                    &nbsp;
                </td>
                <td colspan="2">
                    <jenzabar:Hint ID="hntPersonalInfoHint" runat="server" />
                </td>
            </tr>
            <tr>
                <td width="4%">
                    &nbsp;
                </td>

                <td colspan="2">
                    <asp:LinkButton runat="server" ID="lbPersonalInfoUpdate"></asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    &nbsp;
                </td>
            </tr>
        </div>
        <div id="divRegistrationAgreement" visible="True" runat="server">
            <tr>
                <td colspan="3">
                    <h5><jenzabar:GlobalizedLiteral ID="glitRegistrationAgreement" runat="server" /></h5>
                </td>
            </tr>
            <tr>
                <td width="4%">
                    &nbsp;
                </td>
                <td colspan="2">
                    <jenzabar:Hint ID="hntRegHint" runat="server" />
                </td>
            </tr>
            <tr>
                <td width="4%">
                    &nbsp;
                </td>
                <td colspan="2">
                    <asp:LinkButton ID="lbRegistrationAgreement" runat="server" />
                </td>
            </tr>
            <tr>
                <td colspan="3">
                &nbsp;<br />
                    <a id="lnkAddDropBypass" runat="server" style="VERTICAL-ALIGN: bottom">
					<asp:Label ID="lblAddDropBypass" Runat="server" />
				</a>
                </td>
            </tr>
        </div>
    </table>
    </div>
</div>
