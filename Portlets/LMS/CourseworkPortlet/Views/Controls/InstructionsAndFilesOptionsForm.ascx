<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="InstructionsAndFilesOptionsForm.ascx.cs"
    Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.InstructionsAndFilesOptionsForm" %>
<%@ Register TagPrefix="JICS" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register Src="AssignmentFileUploader.ascx" TagName="AssignmentFileUploader" TagPrefix="JICS" %>
<!-- Step Three Header -->
<div onclick="toggleHeader(this,'divInstructionsAndFiles','<%=ShowText%>','<%=HideText%>','<%=ShowImgUrl %>','<%=HideImgUrl %>');"
    class="assignmentStepHeader expandable">
    <img class="rightArrow" src='<%=ShowImgUrl %>' />
    <img src='<%=ShowImgUrl %>' /> 
    <%=ShowText %>    
</div>

<!-- Instructions and Files -->
<div id="divInstructionsAndFiles" <% if (!AssignmentFileUploader.IsAddFilePostBack) {%> style="display: none;"<% }%>>
    <br />
    <table cellpadding="5">
        <tr>
            <td valign="top" align="right">
                <asp:Label ID="lblDescription" runat="server" />
            </td>
            <td>
                <asp:Label ID="lblDescriptionDescription" runat="server" />
                <br />
                <br />
                <JICS:TextBoxEditor ID="tbeDescription" runat="server" />
            </td>
        </tr>
        <tr>
            <td valign="top" align="right">
                <asp:Label ID="lblInstructions" runat="server" />
            </td>
            <td>
                <asp:Label ID="lblInstructionsDescription" runat="server" />
                <br />
                <br />
                <JICS:TextBoxEditor ID="tbeInstructions" runat="server" />
            </td>
        </tr>
        <tr>
            <td valign="top" align="right">
                <asp:Label ID="lblFiles" runat="server" />
            </td>
            <td valign="top">
                <JICS:AssignmentFileUploader ID="AssignmentFileUploader" runat="server" />
            </td>
        </tr>
    </table>
</div>
