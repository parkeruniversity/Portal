<%@ Control Language="c#" AutoEventWireup="True" Codebehind="StageConfiguration.ascx.cs" Inherits="Jenzabar.CRM.Candidate.Web.Portlets.AdmissionsStatusPortlet.StageConfiguration" %>
<%@ Import Namespace="Jenzabar.Common.Globalization" %>
<%@ Register TagPrefix="jenzabar" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>

<br />
<table cellpadding="5" cellspacing="5">
    <tr>
        <td>
            <table class="hint" border="0" width="850">
                <tr>
                    <td>
                        <b><%=Globalizer.GetGlobalizedString("TXT_DEFINE_AS_LINK_TITLE")%></b><br />
                        <%=Globalizer.GetGlobalizedString("TXT_DEFINE_AS_LINK_BLURB")%>
                    </td>
                </tr>
                <tr>
                    <td id="errorMessage"><asp:Literal ID="litChooseAppNotifyUpdate" runat="server" /></td>
                </tr>
                <tr>
                    <td><%=Globalizer.GetGlobalizedString("TXT_AS_LINK_TO")%> <asp:DropDownList ID="ddlChooseApp" runat="server" /></td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnSaveChooseApp" runat="server" /> &nbsp; 
                        <asp:Button ID="btnCancelChooseApp" runat="server" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>


<asp:Label ID="lblMessage" Runat="server" Visible="False"></asp:Label><br>
<asp:Label ID="lblError" CssClass="PortletError" Runat="server" Visible="False"></asp:Label>
<jenzabar:groupedgrid id="gdgStages" runat="server" RenderTableHeaders="True" Width="100%" Height="56px">
	<Columns>
		<asp:TemplateColumn>
			<ItemTemplate>
				<asp:Label ID="lblStageIdentifier" Runat="server" Text='<%# DataBinder.Eval( Container.DataItem, "stageIdentifier" ) %>'>
				</asp:Label>
			</ItemTemplate>
		</asp:TemplateColumn>
	</Columns>
	<Columns>
		<asp:TemplateColumn>
			<ItemTemplate>
				<asp:Label ID="lblStageAdminDesc" Runat="server" Text='<%# DataBinder.Eval( Container.DataItem, "stageAdminDesc" )%>'>
				</asp:Label>
			</ItemTemplate>
		</asp:TemplateColumn>
	</Columns>
	<Columns>
		<asp:TemplateColumn>
			<ItemTemplate>
				<asp:CheckBox ID="cbShowStage" Runat="server" Checked='<%# ConvertToBoolean(DataBinder.Eval(Container.DataItem, "showStage").ToString())%>'>
				</asp:CheckBox>
			</ItemTemplate>
		</asp:TemplateColumn>
	</Columns>
	<Columns>
		<asp:TemplateColumn>
			<ItemTemplate>
				<asp:TextBox id="txtPortletMessage" TextMode="SingleLine" runat="server" Columns="20" Text='<%# DataBinder.Eval(Container.DataItem, "stagePortletDesc") %>'>
				</asp:TextBox>
			</ItemTemplate>
		</asp:TemplateColumn>
	</Columns>
	<Columns>
		<asp:TemplateColumn>
			<ItemTemplate>
				<asp:TextBox id="txtNonPortletMessage" TextMode="MultiLine" Rows="2" runat="server" Columns="20" Text='<%# DataBinder.Eval( Container.DataItem, "showStageNMess" ) %>'>
				</asp:TextBox>
			</ItemTemplate>
		</asp:TemplateColumn>
	</Columns>
	<Columns>
		<asp:TemplateColumn>
			<ItemTemplate>
				<asp:CheckBox ID="cbShowApplyLink" Runat="server" Checked='<%# ConvertToBoolean(DataBinder.Eval(Container.DataItem, "showApplyLink").ToString())%>'>
				</asp:CheckBox>
			</ItemTemplate>
		</asp:TemplateColumn>
	</Columns>
</jenzabar:groupedgrid>
<table width="100%">
	<tr>
		<td align="center">
			<asp:Button ID="btnSaveStages" Runat="server" Visible="False" onclick="btnSaveStages_Click"></asp:Button>&nbsp;
			<asp:Button ID="btnCancel" Runat="server"></asp:Button>
		</td>
	</tr>
</table>
