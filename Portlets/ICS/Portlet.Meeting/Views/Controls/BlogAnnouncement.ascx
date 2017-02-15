<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BlogAnnouncement.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.MeetingPortlet.Views.Controls.BlogAnnouncement" %>
<%@ Register Src="Modal.ascx" TagName="Modal" TagPrefix="JICS" %>
<%@ Register TagPrefix="jics" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="txt" Namespace="Jenzabar.Portal.Framework.Web.TextEditor" Assembly="Jenzabar.Portal.Framework.Web" %>


<div class="meetingBlogAnnouncmentContainer">
    <div id="iconContainer" class="meetingBlogAnnouncmentIconContainer">
        <div class="meetingBlogIconContainer"></div>
    </div>
    <div class="meetingAnnounceInBlogLinkContainer">
        <asp:HyperLink runat="server" ID="lnkOpenModal"></asp:HyperLink>
    </div>
</div>





<jics:Modal Id="modal" runat="server">
    <contentarea>
        
        <div class="meetingBlogAnnouncmentModalHeader">
            <div class="meetingBlogAnnouncmentIconContainer">
                <div class="meetingBlogIconContainer"></div> 
            </div>
            <div>
                <div>
                    <asp:Label runat="server" ID="lblAnnounceThe" />
                </div>
                <strong>
                    <asp:Label runat="server" ID="lblMeetingName" />
                </strong>
                <asp:Label runat="server" ID="lblMeeting" />
            </div>
        </div>
        
        <div id="divNoPermissions" runat="server" class="meetingNoBlogPortletContainer" Visible="False">
            <asp:Label runat="server" ID="lblNoPermissions" />
        </div>
        
        <div id="divNoBlogPortlet" runat="server" Visible="False" class="meetingNoBlogPortletContainer">
            <asp:Label runat="server" ID="lblNoBlogPortlet" />
        </div>

        <div id="divBlogEntry" runat="server" Visible="False">
            <table cellpadding="5px">
                <tr>
                    <td align="right">
                        <asp:Label runat="server" ID="lblHeadline" AssociatedControlID="txtHeadline" />
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="txtHeadline" Width="400" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Label runat="server" ID="lblPriority" />
                        <asp:RadioButton runat="server" ID="rbRegularPriority" GroupName="Priority" Checked="True" />
                        <asp:Label runat="server" ID="lblRegular" CssClass="meetingBlogRegularPriorityLabel" AssociatedControlID="rbRegularPriority" />
                        <asp:RadioButton runat="server" ID="rbHighPriority" GroupName="Priority"/>
                        <asp:Label runat="server" ID="lblHigh" CssClass="meetingBlogHighPriorityLabel" AssociatedControlID="rbHighPriority" />
                    </td>
                </tr>
                 <tr>
                    <td style="vertical-align: top;" align="right">
                        <asp:Label runat="server" ID="lblText" />
                    </td>
                    <td>
                        <txt:TextEditorControl  ID="txtText" runat="server" Width="650px" Height="150px" /> 
                    </td>
                </tr>
            </table>
            
            <div class="emailerButtons">
                <div class="emailerSendMail">
                    <asp:Button runat="server" ID="btnSave"/> 
                </div>
                <div class="emailerCancelMail">
                    <asp:HyperLink runat="server" ID="lnkCancel" />
                </div>
            </div>
        </div>
        
        
        
        
        

        </contentarea>
</jics:Modal>