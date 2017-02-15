<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RuleDef.ascx.cs" Inherits="Jenzabar.ContainedForm.Controls.RuleDef" %>

<div class="EventDef">
    <asp:ImageButton runat="server" ID="img_delete" OnClick="img_delete_Click"/>
    <asp:TextBox ID="tbx_order" runat="server" Width="32px"></asp:TextBox>
    <asp:DropDownList runat="server" ID="drpConjunction" AutoPostBack="True" OnSelectedIndexChanged="drpConjunction_SelectedIndexChanged"></asp:DropDownList>
    <asp:TextBox ID="tbx_ansValue" runat="server"></asp:TextBox>
    <div id="EventDefOptions" style="margin-left: 15px;">
        <asp:DropDownList ID="drp_do" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drp_do_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:DropDownList ID="drp_eventOptions" runat="server">
        </asp:DropDownList>
        <asp:DropDownList ID="drp_groups" runat="server" Visible="False">
        </asp:DropDownList>
        <asp:DropDownList ID="drp_tracks" runat="server" AutoPostBack="true" OnSelectedIndexChanged="drp_tracks_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:DropDownList runat="server" ID="drp_question" style="max-width:125px;"></asp:DropDownList>
        <asp:DropDownList runat="server" ID="drp_datasources" style="max-width:125px;"/>
        <asp:DropDownList runat="server" ID="drp_tabs" style="max-width:125px;" />
        <asp:TextBox runat="server" ID="tbx_message"></asp:TextBox>
        <asp:DropDownList ID="drp_EmailTemplates" runat="server">
        </asp:DropDownList>&nbsp;
        <asp:ImageButton ID="img_add_email" runat="server" 
            ImageUrl="~/UI/Common/Images/PortletImages/Icons/add.gif" onclick="img_add_email_Click" 
            style="cursor:pointer;" OnClientClick="jQuery('[id*=\'_hdnShowEmail\']').val('1');"/>&nbsp;
        <asp:ImageButton ID="img_edit_email" runat="server"
            ImageUrl="~/UI/Common/Images/PortletImages/Icons/edit.gif" OnClientClick="jQuery('[id*=\'_hdnShowEmail\']').val('1');getEmail();return false;"/>
    </div>
</div>