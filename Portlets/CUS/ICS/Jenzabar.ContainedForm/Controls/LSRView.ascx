<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LSRView.ascx.cs" Inherits="Jenzabar.ContainedForm.Controls.LSRView" %>
<%@ Import Namespace="Jenzabar.ContainedForm.Views" %>
<%@ Register Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls"
    TagPrefix="cc1" %>
<cc1:Hint ID="Hint1" runat="server">
    Literals can be defined to be used as default variables in controls or as replacable variables in a datasource. 
</cc1:Hint>
<style type="text/css">
    #ulSettings li label
    {
        display: inline-block;
        width: 125px;
        zoom: 1;
        *display: inline;
        vertical-align: top;
    }

    #helpDivAlt
    {
        background-color: #e4e4e4;
        border: 1px solid #000000;
        padding: 3px;
    }

    #ulSettings img
    {
        cursor: pointer;
        margin-left: 3px;
        vertical-align: middle;
    }

    #ulSettings select
    {
        width: 280px;
    }

    .inlineHelp
    {
        cursor: help !important;
    }

    #tbConnectionString
    {
        margin-left: 0 !important;
    }
    .testLSRModal
    {
        display:none;
    }
</style>
<script>
    var portletId = '<%= ((Jenzabar.Portal.Framework.Web.UI.PortletViewBase)this).ParentPortlet.Portlet.Guid.ToString() %>';
</script>
<div class="pSection">
    <div id="error" class="feedbackError" style="display: none">
    </div>

    <ul id="ulSettings">
        <li style="width: 125px;">Literal:</li>
        <li>
            <asp:DropDownList runat="server" ID="ddlLiterals" AutoPostBack="true" OnSelectedIndexChanged="ddlLiterals_SelectedIndexChanged"></asp:DropDownList>&nbsp;
            <asp:ImageButton runat="server" ID="imgRemove" 
                ImageUrl="/ICS/UI/Common/Images/PortletImages/Icons/16/delete.png" OnClick="imgRemove_Click" />
            <asp:ImageButton runat="server" ID="imgAdd" 
                ImageUrl="/ICS/UI/Common/Images/PortletImages/Icons/16/add.png" OnClick="imgAdd_Click" />

        </li>
        <li runat="server" id="liName" visible="false">
            Name:<br />
            <asp:TextBox runat="server" ID="tbxNewName"></asp:TextBox>
        </li>
        <li style="clear:left;width: 125px;">
            Literal Type:
        </li>
            <li>
                <asp:DropDownList ID="ddlSourceType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlSourceType_SelectedIndexChanged">
                    <asp:ListItem Value="0">Static</asp:ListItem>
                    <asp:ListItem Value="1">SQL Fragment</asp:ListItem>
                </asp:DropDownList>
        </li>
        <li id="liConnectionInfo" style="clear:left;" runat="server" visible="false" >
            <span id="spanConnectionString">Database:</span><br />
            <asp:DropDownList ID="drpConnectionString" CssClass="tbConnectionString" runat="server"></asp:DropDownList>
        </li>
        <li style="clear:left;width: 125px;">
            Cache Mode:
        </li>
            <li>
                <asp:DropDownList runat="server" ID="ddlCacheMode">
                    <asp:ListItem Value="0">None</asp:ListItem>
                    <asp:ListItem Value="1">User</asp:ListItem>
                    <asp:ListItem Value="2">Application</asp:ListItem>
                </asp:DropDownList>
        </li>
        <li style="clear:left;width: 125px;">
            Description:
        </li>
        <li>
            <asp:TextBox runat="server" ID="taDescription" Rows="7" Columns="80" TextMode="MultiLine"></asp:TextBox>
        </li>
        <li style="clear:left;width: 125px;">
            Expanded Value:
        </li>
        <li>
            <asp:TextBox runat="server" ID="taValue" Rows="7" Columns="80" TextMode="MultiLine"></asp:TextBox>
        </li>
    </ul>
    <div style="float:left;clear:left; ">
        <asp:Button runat="server" ID="btnSave" OnClick="btnSave_Click" Text="Save"/>
        <asp:Button runat="server" ID="btnTest" OnClientClick="Jcf.func.saveLSR();Jcf.events.initTestLSR();return false;" Text="Save and Test" />
    </div>
    <center style="clear:left; "><br/><asp:Button runat="server" ID="btnDone" onclick="btnDone_Click" Text="Done"/></center>
</div>
<div class="testLSRModal">
    <table class="lsrTest">

    </table>
    <button onclick="Jcf.func.testLSR();">Test</button>
    <div class="lsrTestOutput"></div>
</div>