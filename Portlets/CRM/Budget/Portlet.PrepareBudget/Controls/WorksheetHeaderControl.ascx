<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WorksheetHeaderControl.ascx.cs" Inherits="Portlet.PrepareBudget.Controls.WorksheetHeaderControl" %>
<!-- Worksheet Header -->
<div class="PBFloatLeft">
    <table>
        <tr>
            <td>
                <asp:Label ID="WorksheetName" CssClass="PBBoldText PBHeader1Text" runat="server"><%=CurrentWorksheet.Name%></asp:Label>                    
                <asp:LinkButton ID="WorksheetNameLink" CssClass="PBHeader1Text PBHeaderLink" OnClick="openWorksheetLink_Click"
                    runat="server"><%=CurrentWorksheet.Name%></asp:LinkButton>
                <span class="PBHeader1Text">Worksheet</span>
            </td>
            <td id="RootWorksheetInfo" runat="server">
                <span class="PBInformativeText">for</span> <span class="PBLabelText PBBoldText">
                    <%=CurrentWorksheet.ForBudgetYear%>
                </span>
            </td>
        </tr>
        <tr>
            <td id="ParentWorksheetInfo" runat="server">
                <span class="PBInformativeText">Part of the</span> <span id="ParentNameLabel" runat="server"
                    class="PBLabelText PBBoldText">
                    <%=CurrentWorksheet.GetParentName()%>
                </span>
                <asp:LinkButton ID="ParentNameLink" CssClass="PBHeaderLink" OnClick="openWorksheetLink_Click"
                    runat="server" />
                <span class="PBInformativeText">
                    <%=CurrentWorksheet.GetParentDescription()%>
                </span><span class="PBLabelText PBBoldText">
                    <%=CurrentWorksheet.ForBudgetYear%>
                </span>
            </td>
        </tr>
    </table>
</div>
<div class="PBFloatRight">
    <asp:LinkButton ID="CancelGoBack" Text="Cancel, go back" OnClick="CancelGoBack_Click"
        runat="server" />
</div>
