<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Post.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.ForumPortlet.Views.Controls.Post" %>
<%@ Register TagPrefix="framework" namespace="Jenzabar.Portal.Framework.Web.UI.Controls" assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Register Src="ManagePost.ascx" TagName="ManagePost" TagPrefix="JICS" %>
<%@ Register Src="EditPostSection.ascx" TagName="EditPostSection" TagPrefix="JICS" %>
<%@ Register Src="Comment.ascx" TagName="Comment" TagPrefix="JICS" %>
<%@ Register Src="PostData.ascx" TagName="PostData" TagPrefix="JICS" %>
<%@ Register TagPrefix="fwk" TagName="GradeInput" Src="~/UI/Controls/UserControls/GradeInput.ascx" %>
 
<asp:Panel CssClass="postRow" id="_panPostRow" runat="server">
    <asp:Panel ID="_panPost" runat="server">
        <asp:PlaceHolder ID="_phPostRenderData" runat="server">
            <div class="postAuthor">
                <asp:Image runat="server" ID="_imgAuthorImg" CssClass="authorImg" />
                <asp:Label ID="_lblAuthorName" runat="server" Font-Bold="true" />
                <asp:Label ID="_lblGroups" runat="server" CssClass="userRoles" />
                <asp:HyperLink ID="_hypEmail" runat="server" /> &nbsp;
                <framework:MyInfoPopup id="_myInfo" runat="server" />
            </div>
            <div class="post">
                <asp:Image ID="_imgWedge" runat="server" CssClass="imgBubble" />
                <asp:LinkButton ID="_lbtnReply" CssClass="postReply"  runat="server"/>
                <asp:Hyperlink ID="_hypQuote" CssClass="postQuote" runat="server"></asp:Hyperlink>
                <JICS:PostData id="_postData" runat="server" />
                <JICS:EditPostSection ID="_editPostSection" runat="server" />
                <div id="_divAssignment" runat="server" class="facultyPost">
                    <div class="facultyPostRightBox">
                        <div class="facultyPostRightBoxLayerOne">
                            <div class="facultyPostRightBoxLayerOneRight">
                                <div class="facultyAssignmentPostExpand" onclick="facultyGrading.toggleExpand(this);"></div>
                                <div ID="_validationStatus" Visible="False" class="facultyValidationStatus" runat="server"></div>
                                <div class="facultyPostRightBoxLayerOneLeft">
                                    <asp:Label ID="_lblAssignmentLink" runat="server" />
                                </div>
                            </div>
                        </div>
                        <div class="facultyPostRightBoxLayerTwo">
                            <asp:Label ID="_lblUserNameMade" CssClass="gradedTopicUserPostTotals" runat="server" /> <a id="_aReadAll" runat="server" /><br/>
                            <a id="_aViewTheAssignment" runat="server" />
                        </div>
                        <div class="facultyPostRightBoxLayerThree">
                            <div class="forumAssignmentSummaryControlValid">
                                <div class="forumAssignmentSummaryControlValidIcon"><asp:Image ID="_imgDisqualify" runat="server"/></div>
                                <div class="forumAssignmentSummaryControlValidMsgBox">
                                    <asp:LinkButton ID="_lbtnTogglePostValidity" runat="server" />
                                    <asp:Label ID="_lblInvalidMsgs" runat="server" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="facultyPostLeftBox">
                        <div id="_divGradeDisplay" class="facultyGradeDisplay" runat="server">
                            <asp:Label ID="_lblGradeDisplay" runat="server" />
                        </div>
                        <div class="facultyGradeInput">
                            <fwk:GradeInput ID="_gradeEntryCtl" EnableViewState="false" runat="server" />
                            <a id="_aToGrading" runat="server" />
                        </div>
                    </div>
                </div>
                <div style="clear: both;"></div>
                <div id="_divAssignmentStudent" runat="server">
                    <table cellspacing="0" class="studentAssignmentThreadViewPostContainer">
                        <tr>
                            <td class="studentAssignmentThreadViewPostFirst"><asp:Image ID="_imgStudentIcon" runat="server" ImageAlign="AbsMiddle" /> <asp:Label ID="_lblStudentInvalidMsg" runat="server" /></td>
                            <td class="studentAssignmentThreadViewPost"><asp:Label ID="_lblStudentAssignmentName" runat="server" /></td>
                            <td class="studentAssignmentThreadViewPostLast"><a id="_aStudentAssignment" runat="server" /></td>
                        </tr>
                    </table>
                </div>
            </div>
            <asp:Panel ID="_panWordCount" CssClass="postWordCount" runat="server" />
            <asp:Panel ID="_panPostList" CssClass="postListContainer" runat="server" />
            <JICS:Comment ID="_comment" runat="server"/>
            <asp:Panel ID="_panNextPrev" CssClass="postNav" runat="server">
                <div style="float:right;"><asp:HyperLink ID="_hypNext" runat="server" /> <asp:Image ID="_imgNext" runat="server" /></div>
                <div style="float:left;"><asp:Image ID="_imgPrev" runat="server" /> <asp:HyperLink ID="_hypPrev" runat="server" /></div>
            </asp:Panel>
        </asp:PlaceHolder>
        <JICS:ManagePost id="_managePost" runat="server" />
    </asp:Panel>
   </asp:Panel>