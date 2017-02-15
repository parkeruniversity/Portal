<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddPost.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.ForumPortlet.Views.AddPost" %>
<%@ Register Assembly="System.Web.Extensions"Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register TagPrefix="cmn" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register src="Controls/ManagePost.ascx" tagname="ManagePost" tagprefix="JICS" %>
 
<script type="text/javascript" language="javascript">

    //This code makes the text editor work properly in UpdatePanels and Modals.

    Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(function () {
        $('.managePostContainer .postEntry').hide();
        $('.managePostContainer .postEntry textarea').each(function () {
            textEditor.destroy($(this));
        });
    });

    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
        $('.managePostContainer .postEntry textarea').each(function () {
            textEditor.create($(this));
        });
    });

</script>

<div style="padding:10px;">
    <asp:Panel ID="_panPrivate" runat="server" CssClass="privateTopic">
        <asp:Label ID="_lblPrivateTitle" runat="server" />
        <div>
            <asp:Literal ID="_litPrivateInfo" runat="server" />
        </div>
    </asp:Panel>
    <div class="newPost originalPost">

        <div class="navHeader">
            <asp:Label ID="_lblTitle" runat="server" CssClass="navTitle" />
        </div>
            <asp:UpdatePanel ID="_updatePanel" runat="server"  >
           <ContentTemplate>
                <JICS:ManagePost id="_managePost" IsInPartialPostback="true" runat="server" />
            </ContentTemplate>
            </asp:UpdatePanel>
    </div>
</div>
<cmn:Mirror id="_mirBreadcrumbs" ControlID="_panBreadcrumbs" runat="server" />
