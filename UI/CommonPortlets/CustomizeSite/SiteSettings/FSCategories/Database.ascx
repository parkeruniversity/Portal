<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Database.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.CustomizeSite.SiteSettings.FSCategories.Database" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Import namespace="Jenzabar.Portal.Web.UI.CommonPortlets" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Import namespace="Jenzabar.Portal.Framework.Configuration" %>
<script language="javascript" type="text/javascript">
userID = "";
pword = "";
initCat = "";
dSource = "";
function checkLCS(sender, args){
    setVars();
    if(userID.length == 0 || pword.length == 0 || initCat.length == 0 || dSource.length == 0){
        args.IsValid = false;
    }else{
        args.IsValid = true;
    }
}
function writeLCS(c){
    setVars();
    document.getElementById("divLCS").innerHTML = String.format('<%=lcsFormat%>',userID,pword,initCat,dSource);
    if(c == 1){
        setTimeout("writeLCS(2)",100);
    }
}
function setVars(){
    userID = document.getElementById("<%=tbUserID.ClientID %>").value;
    pword = document.getElementById("<%=tbPWord.ClientID %>").value;
    initCat = document.getElementById("<%=tbInitCat.ClientID %>").value;
    dSource = document.getElementById("<%=tbDSource.ClientID %>").value;
}
</script>
<tr>
	<td align="right"><b><%= Settings.DBCONNECTION_STRING %>:</b></td>
	<td><%= Globalizer.GetGlobalizedString("MSG_FSC_DBCONNECTION_STRING") %></td>
</tr>
<tr>
    <td colspan="2"><asp:CustomValidator ID="cvLCS" runat="server" ClientValidationFunction="checkLCS" /></td>
</tr>
<tr>
    <td align="right"><b><%= Settings.LOGGING_CONNECTION_STRING%>:</b></td>
    <td>
        <div id="divLCS"><asp:Literal ID="litLCS" runat="server" /></div>
        <br />
        <table>
            <tr>
                <td><%=Globalizer.GetGlobalizedString("MSG_LCS_USERID")%></td>
                <td><asp:TextBox ID="tbUserID" runat="server" /></td>
            </tr>
            <tr>
                <td><%=Globalizer.GetGlobalizedString("MSG_LCS_PWORD")%></td>
                <td><asp:TextBox ID="tbPWord" runat="server" /></td>
            </tr>
            <tr>
                <td><%=Globalizer.GetGlobalizedString("MSG_LCS_INITIAL_CATALOG")%></td>
                <td><asp:TextBox ID="tbInitCat" runat="server" /></td>
            </tr>
            <tr>
                <td><%=Globalizer.GetGlobalizedString("MSG_LCS_DATA_SOURCE")%></td>
                <td><asp:TextBox ID="tbDSource" runat="server" /></td>
            </tr>
        </table>
    </td>
</tr>
<tr>
	<th><%= Settings.LOG_SITE_STATS %>:</th>
	<td>
	    <asp:DropDownList ID="ddlLogSiteStats" Runat="server">
	        <asp:ListItem Value="true" Text="True" />
	        <asp:ListItem Value="false" Text="False" />
	    </asp:DropDownList>
    </td>
</tr>