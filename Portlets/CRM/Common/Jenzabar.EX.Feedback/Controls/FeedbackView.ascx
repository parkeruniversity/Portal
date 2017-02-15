<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FeedbackView.ascx.cs" 
    Inherits="Jenzabar.EX.Feedback.FeedbackView" %>
<link rel='stylesheet' type='text/css' href='<%= Page.ResolveUrl("./Portlets/CRM/Common/Jenzabar.EX.Feedback/FBStyle.css")%>' />
<%@ Import Namespace="Jenzabar.EX.Feedback" %>
<%@ Register TagPrefix="ex" TagName="FeedbackEditorControl" Src="FeedbackEditorControl.ascx" %>
<%@ Register TagPrefix="ex" TagName="FeedbackFileUploaderControl" Src="FeedbackFileUploaderControl.ascx" %>
<%@ Register TagPrefix="jics" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register TagPrefix="cmn" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<input type="hidden" name="AllowPostback" value="true" />

<table>
    <tr>
        <td>
            <div class="FeedbackViewSection">                 
                <asp:UpdatePanel ID="upFeedbackList" ChildrenAsTriggers="true" UpdateMode="Conditional"
                    runat="server">
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="rFeedbackList" />
                        <asp:AsyncPostBackTrigger ControlID="HiddenFeedbackListButton" />
                    </Triggers>
                    <ContentTemplate>
                        <asp:Repeater ID="rFeedbackList" runat="server">
                            <HeaderTemplate>
                                <div class="feedbackDisplayList">
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Literal ID="_entry" runat="server" />
                                <asp:ImageButton ID="_delete" ImageUrl="<%# GetDeleteIcon() %>"
                                    CommandName="Delete" OnCommand="divFeedbackList_Command" runat="server" />
                                </div></div>
                            </ItemTemplate>
                            <FooterTemplate>
                                </div></div>
                            </FooterTemplate>
                        </asp:Repeater>
                        <input type="hidden" id="hiddenFeedbackGOID" runat="server" />
                        <asp:Button ID="HiddenFeedbackListButton" CommandName="Refresh" CommandArgument="<%# FeedbackGOID %>"
                            OnCommand="divFeedbackList_Command" Style="display: none;" runat="server" />
                    </ContentTemplate>
                </asp:UpdatePanel>

                <asp:UpdatePanel ID="upNoFeedback" ChildrenAsTriggers="true" UpdateMode="Conditional"
                    runat="server">
                    <ContentTemplate>
                    <div id="_noFeedback" runat="server">
                        <div class="feedbackDisplayList">
                            <div class="feedbackDisplay feedbackDisplayEmpty">
                                <img src="<%= Page.ResolveUrl(FBConstants.IconsPath + FBConstants.IconCommentLarge)%>"
                                    class="feedbackImageGeneric" alt="No Feedback" />
                                <div class="feedbackWedge">
                                </div>
                                <div class="feedbackWedgeOutline">
                                </div>
                                <div class="feedbackEntry">
                                    No Comments/Attachments                                
                                </div>
                            </div>
                        </div>
                    </div>
                    </ContentTemplate>
                </asp:UpdatePanel>

                <div class="fdbkText">
                    <table id="_editorContainer" runat="server">
                        <tr>
                            <td>
                                <ex:FeedbackEditorControl ID="_feedbackEditor" Visible="<%# !IsModalFeedback %>"
                                    runat="server" />
                            </td>
                            <td>
                                <span class="spacer"></span>
                            </td>
                            <td>
                                <ex:FeedbackFileUploaderControl ID="_feedbackFileUploader" runat="server" />
                            </td>
                        </tr>
                    </table>
                </div>

                <div id="divAddComment" class="FeedbackAddCommentSection" runat="server">
                    <asp:UpdatePanel ID="upAddComment" ChildrenAsTriggers="true" UpdateMode="Conditional" runat="server">
                        <ContentTemplate>
                            <asp:TextBox ID="tbAddComment" MaxLength="1000" TextMode="MultiLine" CssClass="FBStretch"
                                runat="server" Rows="5" />
                            <br />
                            <div class="FBFloatRight">
                                <asp:Label ID="_commentLength" Text="0" CssClass="FBInformativeText" runat="server" /><span
                                    class="FBInformativeText">/1000</span>
                            </div>
                            <br />
                            <div class="FBModalButtons">
                                <asp:Button ID="AddCommentButton" Text="Add Comment" runat="server" />
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </td>
    </tr>
</table>

<input type="hidden" id="hiddenGlobalObjectType" runat="server" />
<input type="hidden" id="hiddenAttachmentTypeCde" runat="server" />
<input type="hidden" id="hiddenIsModalFeedback" runat="server" />
<input type="hidden" id="hiddenAttachmentUseCde" runat="server" />
<input type="hidden" id="hiddenValidFileExtensions" runat="server" />

<script language="javascript" type="text/javascript">
    function DisplayTextLength(txtText, lblLengthID) {
        var lblLength = document.getElementById(lblLengthID);
        lblLength.innerText = txtText.value.length;
    }
</script>
