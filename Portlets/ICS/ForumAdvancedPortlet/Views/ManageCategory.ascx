<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ManageCategory.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.ForumPortlet.Views.ManageCategoryView" %>
<%@ Register TagPrefix="cmn" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register src="Controls/Access.ascx" tagname="Access" tagprefix="JICS" %>
<%@ Register TagPrefix="jics" Namespace="Jenzabar.Portal.Framework.Web.TextEditor" Assembly="Jenzabar.Portal.Framework.Web" %> 
 
<div class="manageOuterContainer">
    <div class="manageContainer">
        <div class="manageTitle">
            <asp:Label ID="_lblTitle" runat="server" />
        </div>
            <div class="manageNameDescrip">
                    <div class="manageName">
                        <asp:Label ID="_lblName" CssClass="selTitle" AssociatedControlID="_txtName" runat="server" />
                        <asp:TextBox ID="_txtName" runat="server" MaxLength="250" TabIndex="1" />
                    </div>
                    <div class="manageDescrip">
                        <div class="label">
                            <asp:Label ID="_lblDescription" CssClass="selTitle" runat="server" /> 
                            <asp:Label ID="_lblDescripMaxChar" CssClass="catDescrip" runat="server" />
                        </div>
                        <jics:TextEditorControl id="_txtDescription" runat="server" Columns="95"></jics:TextEditorControl>
                    </div>
            </div>
        <div class="manageArea">
            <asp:Label id="_lblTopicOrder" CssClass="selTitle" AssociatedControlID="_ddlTopicOrder" runat="server" />
            <div  class="manageSelection">
                <asp:Label ID="_lblTopicOrderDescrip" runat="server" />
                <asp:DropDownList ID="_ddlTopicOrder" TabIndex="3" runat="server" />
            </div>
        </div>
        <div class="manageArea">
            <asp:Label ID="_lblPruning" CssClass="selTitle" AssociatedControlID="_ddlPruning" runat="server" />
            <div class="manageSelection">
                <asp:Label ID="_lblPruningDescrip"  runat="server" />
                <asp:DropDownList ID="_ddlPruning" TabIndex="4" runat="server" />
                <asp:Label ID="_lblPruningExtra" runat="server" />
            </div>
        </div>
        <JICS:Access id="_access" runat="server" RenderBottom="true" />
        <div class="actionButtons">
            <asp:Button id="_btnSave" runat="server" TabIndex="6" Font-Bold="true" />
            <asp:Button ID="_btnCancel" runat="server" TabIndex="7" />
        </div>
    </div>
</div>

<cmn:Mirror id="_mirBreadcrumbs" ControlID="_panBreadcrumbs" runat="server" />