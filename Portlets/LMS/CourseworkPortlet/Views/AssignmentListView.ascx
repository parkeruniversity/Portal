<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AssignmentListView.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.AssignmentListView" %>
<%@ Register TagPrefix="framework" Assembly="Jenzabar.Portal.Framework.Web" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" %>

<div class="cwkBorderButtonBar top">
	<framework:PortalImageAndHyperLink ID="_pihBack" ImageCategory="PortletIcon"  runat="server" />
</div>
<div class="pSection">
    <div>
        <asp:Label ID="lblUpcomingAssignments" runat="server" CssClass="headerText" />
    </div>
    <div>
        <asp:Label ID="lblDescription" runat="server" />
    </div>
    <div>
        <asp:Image ID="imgCheck" runat="server" Visible="false" />
        <asp:HyperLink ID="lnkShowHideClosed" runat="server" />
    </div>
    <asp:GridView ID="grdAssignments" runat="server" Width="100%" CssClass="assignmentGrid itemHover"
        AlternatingRowStyle-CssClass="altAssignmentGrid" HeaderStyle-CssClass="headerAssignmentGrid"
        CellPadding="0" CellSpacing="0" AutoGenerateColumns="False" EnableViewState="false">        
        <Columns>
            <asp:TemplateField HeaderText="Assignment" >
                <ItemTemplate>
                    <asp:HyperLink ID="lnkAssignment" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Due">
                <ItemTemplate>
                    <asp:Label ID="lblDueDate" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Status">
                <ItemTemplate>
                    <asp:Label ID="lblStatus" CssClass="assignmentStatusDisplay" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField >
                <HeaderTemplate>
                    <asp:HyperLink ID="lnkType" runat="server" Visible="false" />
                    <asp:Label ID="lblType" runat="server" />
                    |
                    <asp:HyperLink ID="lnkUnit" runat="server" Visible="false" />
                    <asp:Label ID="lblUnit" runat="server" />
                </HeaderTemplate>
                <ItemTemplate>                    
                    <asp:Image ID="imgType" runat="server" Visible="false" />
                    <asp:Label ID="_lblAssignmentType" runat="server"/>
                    <asp:Label ID="_lblRequired" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</div>
