<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OfflineAssignmentOptionsForm.ascx.cs"
    Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.OfflineAssignmentOptionsForm" %>
<%@ Register Src="ReadingDetails.ascx" TagName="ReadingDetails" TagPrefix="CWK" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<!-- Step Two Header -->
<div id="divOfflineAssignmentOptionsHeader" onclick="toggleHeader(this,'divOfflineAssignmentOptions','<%=ShowText%>','<%=HideText%>','<%=ShowImgUrl %>','<%=HideImgUrl %>');"
    class="assignmentStepHeader expandable">
    <img class="rightArrow" src='<%=ShowImgUrl %>' />
    <img src='<%=ShowImgUrl %>' />
    <%=ShowText %>    
</div>

<!-- Offline Options -->
<div id="divOfflineAssignmentOptions" class="pSection" style="display: none;">
    <br />
    <div id="_divLearningTool" runat="server">
        <asp:Label ID="_lblLearningToolTitle" runat="server" />
        <p>
            <br /><asp:Label ID="_lblLearningToolInstrux" runat="server" CssClass="descriptiveText" /><br />
        </p>        
        <asp:UpdatePanel ID="upTools" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
            <table>
                <tr>
                    <td><asp:Label ID="_lblLearningToolDdl" runat="server" /><asp:Label ID="_lblNoTools" runat="server" /></td>
                    <td><asp:Label ID="_lblMyToolLocation" runat="server" /></td>
                </tr>
                <tr>
                    <td><asp:DropDownList ID="_ddlLearningTool" runat="server" AutoPostBack="true" /></td>
                    <td><asp:TextBox ID="_tbToolLocation" runat="server" Width="350" /> <asp:Label ID="_lblErrToolLocation" runat="server" CssClass="" /></td>
                </tr>
            </table>            
            <p>
                <br /><asp:Label ID="_lblLearningToolInstruxAddNew" runat="server" CssClass="descriptiveText" />
            </p>
            </ContentTemplate>
        </asp:UpdatePanel>
        <div class="lineSeparator"></div>
    </div>
    <br />
    <asp:Label ID="lblOfflineDescription" runat="server" />
    <br />
    <br />
    <asp:UpdatePanel ID="upReadings" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <CWK:ReadingDetails runat="server" ID="ReadingDetails" />
        </ContentTemplate>
    </asp:UpdatePanel>
</div>