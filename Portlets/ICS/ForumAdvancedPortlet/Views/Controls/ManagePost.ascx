<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ManagePost.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.ForumPortlet.Views.Controls.ManagePost" %>
<%@ Register TagPrefix="cmn" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="jics" assembly="Jenzabar.Portal.Framework.Web" namespace="Jenzabar.Portal.Framework.Web.TextEditor" %>
<%@ Register src="ManagePostOption.ascx" tagname="PostOption" tagprefix="JICS" %>
<%@ Register TagPrefix="jics" Namespace="Jenzabar.Portal.Web.UI.Controls" Assembly="Jenzabar.Portal.Web" %>

<asp:Panel ID="_panPost" runat="server" CssClass="postContainer managePostContainer">
        <div id="_divSeparator" runat="server" class="managePostSeparator" visible="false"></div>
        <div class="postAuthor">
            <asp:Image runat="server" ID="_imgAuthorImg" CssClass="authorImg" />
            <asp:Label ID="_lblAuthorName" runat="server" Font-Bold="true" />
            <asp:Label ID="_lblGroups" runat="server" CssClass="userRoles" />
        </div>
        <div class="post">
            <asp:Image ID="_imgEditWedge" runat="server" AlternateText="Post start"  CssClass="imgBubble"/>
            <div class="manageTitle">
                <asp:Literal ID="_litAnchor" runat="server" />
                <asp:Label ID="_lblEditTitle" runat="server" />
            </div>
            
            <cmn:contenttabgroup id="_contentTabs" runat="server">
	            <cmn:ContentTab id="_tabContent" runat="Server">
                    <div>
                        <asp:Label ID="_lblSubject" CssClass="manageSubjectTitle" runat="server" />
                        <asp:TextBox ID="_txtSubject" runat="server" MaxLength="200" Width="400" />
                    </div>
                    <div class="postEntry">
                        <asp:Label ID="_lblPost" CssClass="itemTitle" runat="server" AssociatedControlID="_txtContent" />
                        <jics:TextEditorControl id="_txtContent" runat="server" UseFullDynamicWidth="True" UseNarrowToolbarLayout="True"></jics:TextEditorControl>
                    </div>
                    
                    <asp:Label ID="_lblImages" CssClass="itemTitle" runat="server" />
                    <asp:Panel Id="_panFileUpload" runat="server">
                        
                    </asp:Panel>
                    <asp:Label ID="_lblFiles" CssClass="itemTitle" runat="server" />
                    <asp:Panel ID="_panAsyncFileUpload"  runat="server" >
                    
                    </asp:Panel>
                    <div class="maxBytes">
                        <asp:Label ID="_lblMaxBytes" runat="server" />
                    </div>
                    <div class="postPrivacy">
                        <asp:CheckBox ID="_cbxAnonymous" runat="server" /> 
                        <asp:CheckBox ID="_cbxShowPhoto" runat="server" />
                    </div>
	            </cmn:ContentTab>
	            <cmn:ContentTab ID="_tabOption" runat="server">
                     <JICS:PostOption id="_option" runat="server" />                   
	            </cmn:ContentTab>
            </cmn:contenttabgroup>
            
            <asp:PlaceHolder ID="_phPreview" runat="server">
                
            </asp:PlaceHolder>
            
            <div class="actionButtons">
                <asp:Button ID="_btnEditPreview" CssClass="focusAction" runat="server" />
                <asp:Button ID="_btnPreview" CssClass="focusAction" runat="server" />
                <asp:Button ID="_btnSubmit" runat="server" />
                <asp:Button ID="_btnCancel" runat="server" />
            </div>
        </div> 
        <asp:Panel ID="_panWordCount" CssClass="postWordCount" runat="server" />
    </asp:Panel>