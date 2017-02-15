<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DatabaseView.ascx.cs" Inherits="Jenzabar.ContainedForm.Controls.DatabaseView" %>  
<%@ Register Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls"
    TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Import Namespace="Jenzabar.ContainedForm.Helpers" %>
<%@ Import Namespace="Jenzabar.Common.Globalization" %>
<asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
</asp:ScriptManagerProxy>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <table width="100%">
            <tr>
                <td colspan="2">
                    <cc1:Hint ID="dbHint" runat="server">
                    </cc1:Hint>
                </td>
            </tr>
            <tr>
                <td width="30%">Database:</td>
                <td><asp:DropDownList runat="server" ID="_drpDatabases" 
                        onselectedindexchanged="_drpDatabases_SelectedIndexChanged" AutoPostBack="True"/>
                    <asp:ImageButton runat="server" ID="_imgAddDB" onclick="_imgAddDB_Click" 
                        style="width: 14px"/></td>
            </tr>
            <tr>
                <td colspan="2">
                    <table width="100%">
                        <tr>
                            <td width="30%">Name:</td>
                            <td><asp:TextBox runat="server" ID="_tbxDBName" Enabled="False"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Connection String:</td>
                            <td><asp:TextBox runat="server" ID="_tbxDBConnectionString" Enabled="False"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align: center;"><asp:Button runat="server" 
                                    ID="_btnSaveDB" Enabled="False" Text="Save Database" 
                                    onclick="_btnSaveDB_Click"/><asp:Button runat="server" ID="_btnDeleteDB" Enabled="false" Text="Delete Database" OnClientClick="if(!confirm('Are you sure you want to delete this database? Data sources associated with this database may stop working.')){return false;}" OnClick="_btnDeleteDB_Click" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </ContentTemplate>
</asp:UpdatePanel>
<center><asp:Button runat="server" ID="_btnDone" onclick="_btnDone_Click" 
        Text="Done"/></center>