<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SubmissionStatus.ascx.cs" Inherits="Jenzabar.CRM.Common.Web.PortletModule.EX.FormBuilder.PortletScreens.UserControls.SubmissionStatus" %>
<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>

		<table class="GrayBordered" cellpadding="4" width="100%">
			<tr>
			    <td style="font-weight: bold;"><asp:Label ID="_formTitle" runat="server" /></td>			    
			</tr>
			<tr>
			    <td><asp:Label ID="_submittedBy" runat="server" /></td>			    
			</tr>
			<tr>
			    <td>
			        <asp:Label ID="_statusTitle" runat="server" />
			        <asp:Image ID="_submittedImage" runat="server" />
			        <asp:Label style="font-weight:bold;" ID="_submissionStatus" runat="server" />
			    </td>			    
			</tr>
			<tr id="trFormKey" runat="server">
			    <td><asp:Literal ID="litKeyCode" runat="server" /></td>
			</tr>
			<tr>
			   <td class="smalltext"><asp:Label ID="_feedbackForStudentTitle" runat="server" /></td>
			</tr>
			
			<asp:Repeater ID="_studentCommentRepeater" runat="server">
			    <ItemTemplate>
			        <tr id="trComment" runat="server">
			            <td  style="padding-left: 20px;">
			                <asp:Label ID="studentComment" runat="server" />
			                <asp:ImageButton ID="studentEditButton" runat="server" />
			                <asp:ImageButton ID="studentDeleteButton" OnClientClick="return confirm('Are you sure you want to delete this comment?');" runat="server" />
			            </td>
			        </tr>      
		        </ItemTemplate>
		    </asp:Repeater>
		        
		    <tr>
		        <td class="smalltext"><asp:Label ID="_notesForReviewersTitle" runat="server" /></td>
		    </tr>
		    
			<asp:Repeater ID="_reviewerCommentRepeater" runat="server">
			    <ItemTemplate>
			        <tr id="trComment" runat="server">
			            <td  style="padding-left: 20px;">
			                <asp:Label ID="reviewerComment" runat="server" />
			                <asp:ImageButton ID="reviewerEditButton" runat="server" />
			                <asp:ImageButton ID="reviewerDeleteButton" OnClientClick="return confirm('Are you sure you want to delete this comment?');" runat="server" />
			            </td>
			        </tr>
		        </ItemTemplate>
		    </asp:Repeater>
				    
		    <tr> 
		        <td>
		            <table id="_reviewerControls" runat="server">
		                <tr>
		                    <td>
		                        <span id="spanAddLink" style="padding-right:10px;">
		                           <img ID="_addCommentImage" runat="server" /> 
		                           <a ID="_addCommentTextLink" runat="server" /> 
		                        </span>
		                        <span id="spanCommentTitle" style="display:none"></span>
		                       <asp:Image ID="_emailStudentImage" runat="server" />
		                       <asp:LinkButton ID="_emailStudentLB" runat="server" />
		                   </td>
		                </tr>
    		    
		                <tr>
		                    <td>
		                        <div id="addEditCommentDiv" style="display:none;">
		                            <asp:Label ID="_commentTitle" runat="server" Visible="false" />
		                            <asp:TextBox ID="_commentBox" Height="50" Width="500" runat ="server" TextMode="MultiLine" /><br />
		                            <span style="padding-top:10px; padding-bottom:10px; display:block;">
		                                <asp:CheckBox ID="_isPrivateCheckBox" runat="server" />
		                                <asp:Label ID="_IsPrivateLabel" runat="server" />
		                            </span>
		                            <asp:Button ID="_addCommentButton" runat="server" />
		                            <input type="button" id="_cancelButton" value="Cancel" onclick="toggleAddEditCommentDiv()" />
		                        </div>
		                    </td>
		                </tr>
		            </table>
		        </td>
		    </tr>
		    
		    <tr>
		        <td>
		            <asp:Literal ID="litContactText" runat="server" /><asp:LinkButton ID="lbContactAdmin" runat="server" /> <asp:Image ID="imgAdminEmail" runat="server" />
		        </td>
		    </tr>
		</table>
		
        <asp:HiddenField ID="hiddenCommandName" runat="server" />
		<script language=javascript>
		    function toggleAddEditCommentDiv(d)
		    {
		        var elem = document.getElementById('addEditCommentDiv');
		        var spanAddLink = document.getElementById('spanAddLink');
		        var tb = document.getElementById('<%=_commentBox.ClientID %>');
		        var txt = document.getElementById('spanCommentTitle');
		        var hidden = document.getElementById('<%=hiddenCommandName.ClientID %>');

		        if (elem.style.display == 'none')
		        {
		            elem.style.display = '';
		            spanAddLink.style.display = 'none';
		            tb.focus();
		            txt.style.display = '';
		            switch (d)
		            {
		                case "add":
		                    txt.innerHTML = " &nbsp; <b>Add a Comment</b> &nbsp; ";
		                    tb.value = "";
		                    hidden.value = d;
		                    break;
		                case "edit":
		                    txt.innerHTML = " &nbsp; <b>Edit Comment</b> &nbsp; ";
		                    hidden.value = d;
		                    break;		                   
		            }
		        }
		        else
		        {
		            elem.style.display = 'none';
		            spanAddLink.style.display = '';
		            txt.style.display = 'none';
		        }
		    }
		</script>
			
	
