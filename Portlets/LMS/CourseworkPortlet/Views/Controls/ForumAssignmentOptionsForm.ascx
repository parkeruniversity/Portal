<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ForumAssignmentOptionsForm.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.ForumAssignmentOptionsForm" %>
<!-- Step Two Header -->
<div id="divForumAssignmentOptionsHeader" onclick="toggleHeader(this,'divForumAssignmentOptions','<%=ShowText%>','<%=HideText%>','<%=ShowImgUrl %>','<%=HideImgUrl %>');"
    class="assignmentStepHeader expandable">
    <img class="rightArrow" src='<%=ShowImgUrl %>' />
    <img src='<%=ShowImgUrl %>' />
    <%=ShowText %>    
</div>
<div id="divForumAssignmentOptions" class="pSection" style="display: none;">
    <asp:Panel runat="server" ID="_panControls">
       <div class="forumOptionSection">
           <asp:Literal runat="server" ID="_litTopicSetting"></asp:Literal>
           <div class="forumOptionSectionSub">
               <div><asp:CheckBox runat="server" ID="_cbxDisableOpen"/></div>
               <div><asp:CheckBox runat="server" ID="_cbxDisableDue"/></div>
               <div><asp:CheckBox runat="server" ID="_cbxDisableMod"/></div>
               <div><asp:CheckBox runat="server" ID="_cbxPostFirst"/></div>
           </div>
       </div>
       <div class="forumOptionSection">
           <asp:Literal runat="server" ID="_litSpecReq"></asp:Literal>
           <div class="forumOptionSectionSub">
               <div class="forumRestriction">
                   <asp:CheckBox runat="server" ID="_cbxMinPost"/>
                   <asp:DropDownList runat="server" ID="_ddlMinPost"></asp:DropDownList>
                   <asp:Literal runat="server" ID="_litMinPost"></asp:Literal>
                   <div>
                       <asp:Literal runat="server" ID="_litMinPostWordBefore"></asp:Literal>
                       <asp:TextBox runat="server" ID="_txtMinPostWord" MaxLength="4"></asp:TextBox>
                       <asp:Literal runat="server" ID="_litMinPostWordAfter"></asp:Literal>
                   </div>
               </div>
               <div class="forumRestriction">
                    <asp:CheckBox runat="server" ID="_cbxMinReply"/>
                   <asp:DropDownList runat="server" ID="_ddlMinReply"></asp:DropDownList>
                   <asp:Literal runat="server" ID="_litMinReply"></asp:Literal>
                   <div>
                       <asp:Literal runat="server" ID="_litMinReplyWordBefore"></asp:Literal>
                       <asp:TextBox runat="server" ID="_txtMinReplyWord" MaxLength="4"></asp:TextBox>
                       <asp:Literal runat="server" ID="_litMinReplyWordAfter"></asp:Literal>
                   </div>
               </div>
               <div class="forumRestriction">
                   <asp:Literal runat="server" ID="_litAuto"></asp:Literal>
                   <div><asp:CheckBox runat="server" ID="_cbxAuto"/></div>
               </div>
           </div>
       </div>
   </asp:Panel>
</div>