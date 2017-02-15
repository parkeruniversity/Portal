<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Access.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.ForumPortlet.Views.Controls.Access" %>
<%@ Register TagPrefix="jenz" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" Assembly="Jenzabar.Portal.Framework.Web" %>
<script language="javascript" type="text/javascript">
    $(document).ready(function() {
    $('#<%=_radAllUsers.ClientID%>').click(function() { $('#<%=_divSelector.ClientID%>').hide('normal'); });
    $('#<%=_radSelectedUsers.ClientID%>').click(function() { $('#<%=_divSelector.ClientID%>').show('normal'); });
    });
</script>
 
<div class="manageArea" id="_divArea" runat="server">
    <asp:Label ID="_lblAccess"  CssClass="selTitle"  runat="server" />
    <div class="manageSelection">
        <div>
            <asp:RadioButton ID="_radAllUsers" GroupName="access" runat="server" />
        </div>
        <div>
            <asp:RadioButton ID="_radSelectedUsers"  GroupName="access" runat="server" />
        </div>
        <div id="_divSelector" runat="server">
            <jenz:PrincipalSelector id="_pSelector" runat="server" ></jenz:PrincipalSelector>
        </div>
        
    </div>
</div>