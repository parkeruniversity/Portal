<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DynApproverBldr.ascx.cs" Inherits="Jenzabar.Workflow.Controls.DynApproverBldr" %>
<%@ Register Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls"
    TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
</asp:ScriptManagerProxy>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>

<table width="100%">
    <tr>
        <td colspan="2">
            <cc1:Hint ID="Hint1" runat="server">
                Each dynamic approver query can only have 1 column labeled 'HostID'. The tags @@SubmitterHostID and @@DocumentID may be used in the query.<br/>
                <b>Example Query:</b><br/>
                <i>select [approver_id_num] as HostID from [table] [where id_num='@@SubmitterHostID']</i><br/>
            </cc1:Hint>
        </td>
    </tr>
    <tr>
        <td width="30%">
            Approver:
        </td>
        <td>
            <asp:DropDownList runat="server" ID="drpQueries" AutoPostBack="True" OnSelectedIndexChanged="drpQueries_SelectedIndexChanged" />
            <asp:ImageButton runat="server" ID="imgAddDS" style="width: 14px; height: 16px;" OnClick="imgAddDS_Click"/>
        </td>
    </tr>
    <tr>
        <td>Name:</td>
        <td><asp:TextBox runat="server" ID="tbxDSName" Enabled="False"></asp:TextBox></td>
    </tr>
    <tr>
        <td>
            Use Database:
        </td>
        <td>
            <asp:DropDownList runat="server" ID="drpUseDatabase" Enabled="False"/>
        </td>
    </tr>     
    <tr>
        <td>
            Approver Query:
        </td>
        <td>
            <asp:TextBox runat="server" TextMode="MultiLine" ID="tbxQuery" Enabled="False" style="width: 90%; height: 150px;"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td colspan="2" style="text-align: center;">
            <asp:Button runat="server" ID="btnSaveDS" Enabled="False" Text="Save Query" OnClick="btnSaveDS_Click" />
            <asp:Button runat="server" ID="btnDeleteDS" Text="Delete" Enabled="false" OnClick="btnDeleteDS_Click"/>
        </td>
    </tr>
</table>
</ContentTemplate>
</asp:UpdatePanel>
<center><asp:Button runat="server" ID="btnDone" onclick="btnDone_Click"
        Text="Done"/></center>

