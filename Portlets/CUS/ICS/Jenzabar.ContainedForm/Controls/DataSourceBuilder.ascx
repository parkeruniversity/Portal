<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DataSourceBuilder.ascx.cs" Inherits="Jenzabar.ContainedForm.Controls.DataSourceBuilder" %>
<%@ Register Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls"
    TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<script>
    var portletId = '<%= ((Jenzabar.Portal.Framework.Web.UI.PortletViewBase)this).ParentPortlet.Portlet.Guid.ToString() %>';
</script>
<asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
</asp:ScriptManagerProxy>
<asp:UpdateProgress runat="server" id="PageUpdateProgress" AssociatedUpdatePanelID="UpdatePanel1">
    <ProgressTemplate>
        Loading...
    </ProgressTemplate>
</asp:UpdateProgress>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <table width="100%">
            <tr>
                <td colspan="2">
                    <cc1:Hint ID="Hint1" runat="server">
                        Each data source query can have up to 3 columns. Access control list data sources may only have 1 column.<br/>
                        <b>Options Data Source:</b><br/>
                        <i>select [Value], [Text], [(Optional)DoubleValue] from [table] [where id_num='@@HostID']</i><br/>
                        <b>Auto Complete Data Source:</b><br />
                        <i>select [Text], [(Optional)DoubleValue] from [table] [where id_num='@@HostID']</i><br/>
                        <b>Access Control List:</b><br/>
                        <i>select [IDNumber] from [table]</i><br />
                        <b>Lookup Data Source:</b><br />
                        <a>The lookup data source allows you to create a SQL query that will take in a value and return an array of values to the form to be assigned to other questions.</a><br />
                        <i>select [IDNumber], [Gender], [BirthDate] from [biograph_master] where [id_num] = @@LookUpValue</i>
                    </cc1:Hint>
                </td>
            </tr>
            <tr>
                <td width="30%">
                    DataSource:
                </td>
                <td>
                    <asp:DropDownList runat="server" ID="_drpDataSources" AutoPostBack="True" 
                        onselectedindexchanged="_drpDataSources_SelectedIndexChanged"/>
                    <asp:ImageButton runat="server" ID="_imgAddDS" onclick="_imgAddDS_Click" 
                        style="width: 14px; height: 16px;"/>
                </td>
            </tr>
            <tr>
                <td>Name:</td>
                <td><asp:TextBox runat="server" ID="_tbxDSName" Enabled="False"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    Use Database:
                </td>
                <td>
                    <asp:DropDownList runat="server" ID="_drpUseDatabase" Enabled="False"/>
                </td>
            </tr>
            <tr>
                <td>
                    Is Access Control List:
                </td>
                <td>
                    <asp:CheckBox runat="server" ID="_cbxIsACL" Enabled="False"/>
                </td>
            </tr>
            
            <tr>
                <td>
                    DataSource Query:
                </td>
                <td>
                    <asp:TextBox runat="server" TextMode="MultiLine" ID="_tbxQuery" Enabled="False" style="height:150px;width:450px;"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <asp:Button runat="server" 
                        ID="_btnSaveDS" Enabled="False" Text="Save DataSource" 
                        onclick="_btnSaveDS_Click"/>
                    <asp:Button runat="server" 
                        ID="btnTestDS" Text="Test DataSource" 
                        Enabled="false"
                        OnClientClick="Jcf.events.initTestDataSource();return false;" />
                    <asp:Button runat="server" ID="_btnDeleteDS" OnClientClick="if (!confirm('Are you sure you want to delete this data source?')){return false;}" 
                        OnClick="_btnDeleteDS_Click" Text="Delete" Enabled="false"/></td>
            </tr>
        </table>
    </ContentTemplate>
</asp:UpdatePanel>
<center><asp:Button runat="server" ID="_btnDone" onclick="_btnDone_Click" 
        Text="Done"/></center>
<div class="testDSModal">
    <table>
        <tr>
            <td>DataSource Type:</td>
            <td>
                <select id="dsTestType" onchange="Jcf.events.onUpdateTestDSType();">
                    <option value="LookUp">Look Up</option>
                    <option value="Options">Options</option>
                    <option value="AutoComplete">Auto Complete</option>
                    <option value="AccessControl">Access Control List</option>
                </select>
            </td>
        </tr>
        <tr id="dsTestLU">
            <td>Source Value:</td>
            <td><input type="text" id="dsTestSource" /></td>
        </tr>
        <tr id="dsTestOptLK">
            <td>Look Up Key:</td>
            <td><input type="text" id="dsTestLK" /></td>
        </tr>
        <tr id="dsTestOpt">

        </tr>
        <tr id="dsTestAuto">
            <td colspan="2"></td>
        </tr>
        <tr id="dsTestAC">
            <td>ID Number:</td>
            <td><input type="text" id="dsTestID" /></td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="button" id="JcfTestDataSourceBtn" onclick="Jcf.func.testDataSource();" value="Test"/>
            </td>
        </tr>
        <tr id="dsOutput">
            
        </tr>
    </table>
</div>
