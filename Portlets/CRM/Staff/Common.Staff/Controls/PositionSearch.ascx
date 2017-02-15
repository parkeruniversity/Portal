<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PositionSearch.ascx.cs" Inherits="Jenzabar.CRM.Staff.Common.UserControls.PositionSearch" %>
<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
 
<div class="PositionSearch">

<%-- Search Form --%>
<table id="tableSearch" runat="server" style="margin-top: 5px;">
    <tr>
        <td colspan="3">
            <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRS_S_TITLE" CssClass="PSLightText" />
        </td>
    </tr>
    <tr>
        <td colspan="3">
            <asp:TextBox ID="txtPositionTitle" runat="server" MaxLength="256" Width="400" />
        </td>
    </tr>
    <tr>
        <td colspan="3" style="padding-top: 10px;">
            <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRS_S_KEYWORDS" CssClass="PSLightText" />
        </td>
    </tr>
    <tr>
        <td colspan="3">
            <asp:TextBox ID="txtKeywords" runat="server" MaxLength="256" Width="400" />
        </td>
    </tr>
    <tr>
        <td style="padding-top: 10px;">
            <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_DEPARTMENT" CssClass="PSLightText" />            
        </td>
        <td style="padding-top: 10px;">
            <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_CLASSIFICATION" CssClass="PSLightText" />            
        </td>
        <td style="padding-top: 10px;">
            <jenzabar:GlobalizedLabel ID="glblType" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_TYPE" CssClass="PSLightText" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:DropDownList ID="ddlDepartment" runat="server" Width="175" />
        </td>
        <td>
            <asp:DropDownList ID="ddlClassification" runat="server" Width="175" />
        </td>
        <td>
            <asp:DropDownList ID="ddlType" runat="server" Width="175" />
        </td>
    </tr>
    <tr>
        <td colspan="3" style="padding-top: 20px;">
            <jenzabar:GlobalizedCheckBox ID="gchkReports" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRS_S_REPORT" TextAlign="Right" />
        </td>
    </tr>
    <tr>
        <td colspan="3" style="padding-top: 20px;">
            <jenzabar:GlobalizedButton ID="gbtnSearch" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRS_S_SEARCH" OnClick="gbtnSearch_Click" />
            <span style="margin-left: 20px;">
                <jenzabar:GlobalizedButton ID="gbtnCancel" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_CANCEL" OnClick="gbtnCancel_Click" />
            </span>
            <span style="margin-left: 20px;">
                <jenzabar:GlobalizedLiteral ID="glNoPositions" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRS_NO_POSITIONS" Visible="false" />
                <jenzabar:GlobalizedLiteral ID="glNoPositionsFound" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRS_NO_POSITIONS_FOUND" Visible="false" />
            </span>
        </td>
    </tr>
</table>

<%-- New Position --%>
<div id="divNew" runat="server" class="PSNew PSBackgroundGray PSBorderAllGray" style="margin-top: 10px;">
    <div style="margin: 10px;">
        <p style="font-size: 14px; font-weight: bold;"><jenzabar:globalizedliteral Runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRS_N_HEADER" /></p>
        <p style="margin-top: 5px;"><jenzabar:globalizedliteral Runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRS_N_PARAGRAPH" /></p>
        <p style="margin-top: 10px;">
            <jenzabar:GlobalizedLinkButton ID="glbNew" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRS_N_LINK" OnClick="glbNew_Click" />        
        </p>
    </div>
</div>

<div style="clear: left;"></div>

<%-- Search Results --%>
<div id="divSearchText" runat="server" style="margin-top: 20px; margin-bottom: 10px;">
    <p class="PSLightText PSBoldText"><jenzabar:globalizedliteral Runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRS_SR_HEADER" /></p>
    <p class="PSLightText"><jenzabar:globalizedliteral ID="glSearchInfo" Runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRS_SR_INFO" /></p>
</div>

<asp:GridView ID="gvPositions" runat="server" AutoGenerateColumns="false" CellPadding="4" GridLines="None" Visible="false"
    CssClass="PositionSearchGridView" AlternatingRowStyle-CssClass="PositionSearchGridViewAlt" OnRowDataBound="gvPositions_RowDataBound">
    <Columns>
        <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left">
            <ItemTemplate>
                <asp:LinkButton runat="server" OnCommand="lbPosition_Command" CommandName="PositionID" CommandArgument='<%# Eval("ID") %>' Text='<%# Eval("Title") %>' />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="Department" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" />
        <asp:BoundField DataField="Classification" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" />
        <asp:BoundField DataField="WorkType" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" />
        <asp:BoundField DataField="PostingDate" DataFormatString="{0:MM/dd/yyyy}" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" />
    </Columns>
</asp:GridView>

<asp:GridView ID="gvPositionsAdmin" runat="server" AutoGenerateColumns="false" CellPadding="4" GridLines="None" Visible="false"
    CssClass="PositionSearchGridView" AlternatingRowStyle-CssClass="PositionSearchGridViewAlt">
    <Columns>
        <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left">
            <ItemTemplate>
                <asp:LinkButton runat="server" OnCommand="lbPositionAdmin_Command" CommandName="PositionOrgPos" CommandArgument='<%# Eval("OrgPos") %>' Text='<%# Eval("Title") %>' />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="Department" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" />
        <asp:BoundField DataField="ReportingTo" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" />
        <asp:BoundField DataField="HeldBy" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" />
    </Columns>
</asp:GridView>

</div>