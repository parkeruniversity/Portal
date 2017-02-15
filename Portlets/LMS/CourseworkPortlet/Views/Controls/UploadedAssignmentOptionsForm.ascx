<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UploadedAssignmentOptionsForm.ascx.cs"
    Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.UploadedAssignmentOptionsForm" %>
<!-- Step Two Header -->
<div id="divUploadAssignmentOptionsHeader" onclick="toggleHeader(this,'divUploadedAssignmentOptions','<%=ShowText%>','<%=HideText%>','<%=ShowImgUrl %>','<%=HideImgUrl %>');"
    class="assignmentStepHeader expandable">
    <img class="rightArrow" src='<%=ShowImgUrl %>' />
    <img src='<%=ShowImgUrl %>' />
    <%=ShowText %>    
</div>

<!-- Upload Assignment Options -->
<div id="divUploadedAssignmentOptions" class="pSection" style="display: none;">
    <br />
    <asp:Label ID="labErrMinVsMax" runat="server" />
    <br />
    <asp:Label ID="lblMinimum" runat="server" CssClass="headerText" />
    <asp:Label ID="lblNumberOfFilesRequired" runat="server" />
    <asp:DropDownList ID="ddlMinNumberOfFilesRequired" runat="server" />
    <br />
    <br />
    <asp:Label ID="lblMazimum" runat="server" CssClass="headerText" />
    <asp:Label ID="lblNumberOfFilesAllowed" runat="server" />
    <asp:DropDownList ID="ddlMaxNumberOfFilesAllowed" runat="server" />
    <br />
    <br />
</div>
