<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PageAccess.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.CustomizePage.Security.PageAccess" %>

<%@ Register Src="~/UI/CommonPortlets/CustomizePage/Security/PagePermissions.ascx" TagPrefix="jics" TagName="PagePermissions" %>
<%@ Register TagPrefix="cust" tagname="ContextSecurity" src="~/UI/CommonPortlets/CustomizeContext/ContextSecurity.ascx" %>
<%@ Register Src="~/UI/CommonPortlets/CustomizeSite/BaseRoles/SiteAddEditRole.ascx" TagPrefix="jics" TagName="SiteAddEditRole" %>
<%@ Register Src="~/UI/Controls/RoleManager.ascx" TagPrefix="jics" TagName="RoleManager" %>


<script type="text/javascript" >

    $(document).ready(function () {
        var ls = $(".pageAccessPanel");
        if (ls != NaN) {
            $(".portlet").addClass("pageAccess");
        }

        var showRoleManager = function() {

            window.RoleManager.ShowEditRole($(".roleManager"));
            
        };
        
        //Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(showRoleManager);
        
        ////TODO: figure out to register this maybe just once. To be figured out. 
        //// Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(function() { window.RoleManager.ShowAddRole($(".roleManager")); });
        
        //Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(function () {
        //    console.log("before Request");
        //    console.log($("#CP_V_pageGlobalPermissions_editRole2"));
        //});

        //Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(function () {
        //    console.log("after Request");
        //    if ($("#CP_V_pageGlobalPermissions_editRole2").length > 0) {
        //        console.log("binding click edit role Request");
        //        showRoleManager = function () { window.RoleManager.ShowEditRole($(".roleManager")); };
        //    }
        //    if ($("#CP_V_pageGlobalPermissions_addRole").length > 0) {
        //        console.log("binding click add Request");
        //        showRoleManager = function () { window.RoleManager.ShowAddRole($(".roleManager")); };
        //    }
        //});
    });
</script>
<asp:Panel runat="server" ID="pageAccessPanel" CssClass="pageAccessPanel">
    <div class="popupBox">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
        <a class="topBackButton" id="backButtonTop" runat="server"></a>
        <div class="titleContainer">
            <p id="title" runat="server" class="accesstitle"></p>
            <p id="description" runat="server" class="description"></p>
        </div>
        <div style="clear: both"></div>
        <div class="innerModal">
                    <jics:RoleManager runat="server" id="roleManager" Visible="false"/>
                    <jics:SiteAddEditRole runat="server" ID="SiteAddEditRole" ShowExitButton="false"  Visible="False"/>
                    <jics:PagePermissions ID="pageContextPermissions" Visible="False" runat="server"></jics:PagePermissions>
                    <jics:PagePermissions ID="pageGlobalPermissions" runat="server"></jics:PagePermissions>
                
            <div style="clear: both"></div>
            <a id="backtoAccess" runat="server" Visible="False" class="backButton"></a>
            <a class="backButton" id="BackButton" runat="server"></a>
        </div>
          </ContentTemplate>
         </asp:UpdatePanel>
    </div>
    <asp:Literal ID="litSiteFooter" Visible="False" runat="server" />
</asp:Panel>
