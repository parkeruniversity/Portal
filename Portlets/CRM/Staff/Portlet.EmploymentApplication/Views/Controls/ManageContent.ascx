<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ManageContent.ascx.cs" Inherits="Jenzabar.CRM.Staff.Web.Portlets.EmploymentApplicationPortlet.Views.Controls.ManagePost" %>
<%@ Register TagPrefix="cmn" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>

    <asp:Panel ID="_panContent" runat="server" CssClass="contentContainer manageContentContainer">
        <div id="_divSeparator" runat="server" class="manageContentSeparator" visible="false"></div>
        <div class="content">
            <asp:Image ID="_imgEditWedge" runat="server"  CssClass="imgBubble"/>
            <div class="manageTitle">
                <asp:Literal ID="_litAnchor" runat="server" />
                <asp:Label ID="_lblEditTitle" runat="server" />
            </div>
            
            <div>
                <asp:Label ID="_lblPost" CssClass="itemTitle" runat="server" />
                    <cmn:TextBoxEditor id="_txtContent" runat="server" Width="100%" ></cmn:TextBoxEditor>
            </div>
                    
            <asp:Label ID="_lblImages" CssClass="itemTitle" runat="server" />
            <asp:Panel Id="_panFileUpload" runat="server">
                        
            </asp:Panel>

            <div class="maxBytes">
                <asp:Label ID="_lblMaxBytes" runat="server" />
            </div>
            
            <asp:PlaceHolder ID="_phPreview" runat="server">
                
            </asp:PlaceHolder>
            
            <div class="actionButtons">
                <asp:Button ID="_btnEditPreview" CssClass="focusAction" runat="server" />
                <asp:Button ID="_btnPreview" CssClass="focusAction" runat="server" />
                <asp:Button ID="_btnSubmit" runat="server" />
                <asp:Button ID="_btnCancel" runat="server" />
            </div>
        </div> 
        <asp:Panel ID="_panWordCount" CssClass="contentWordCount" runat="server" />
    </asp:Panel>