<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AssignmentBatchDateEdit.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.AssignmentBatchDateEdit" %>
<%@ Register TagPrefix="cmn" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<asp:Panel ID="_panEdit" runat="server" CssClass="assignmentView">
    <asp:Panel ID="_panInvalidDates" CssClass="notifyMsgBox" runat="server">
        <asp:Literal ID="_litMesg" runat="server"></asp:Literal>
    </asp:Panel>
    <asp:Panel ID="_panUnit" CssClass="unitEdit" runat="server">
        <asp:Literal ID="_litUnit" runat="server" />
        <cmn:DatePicker ID="_dpFrom" Size="10" runat="server" />
        <asp:Literal ID="_litTo" runat="server" />
        <cmn:DatePicker ID="_dpTo" Size="10" runat="server" />
    </asp:Panel>
    <asp:GridView id="_gvAssignments" runat="server" Width="100%"  CssClass="assignmentGrid itemHover" AlternatingRowStyle-CssClass="altAssignmentGrid" HeaderStyle-CssClass="headerAssignmentGrid"  CellPadding="0" CellSpacing="0"
            AutoGenerateColumns="False" EnableViewState="false">
        <Columns>
        <asp:TemplateField >
            <ItemTemplate>
				<asp:HiddenField runat="server" ID="_hfID"/>
                <asp:Literal runat="server" ID="_litName" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField>
            <ItemTemplate>
                <div style="white-space: nowrap">
                    <asp:DropDownList runat="server" ID="_ddlActive"/>
                    <asp:Panel ID="_panStart" CssClass="editStart" runat="server">
                        <cmn:DatePicker ID="_dpStart" Size="10" runat="server" />  
                    </asp:Panel>
                </div>
            </ItemTemplate>
        </asp:TemplateField>
		<asp:TemplateField>
			<ItemTemplate>
				<cmn:DatePicker ID="_dpDue" Size="10" runat="server" />
			</ItemTemplate>
		</asp:TemplateField>
    </Columns>
    </asp:GridView>
    <asp:Button runat="server" ID="_btnSaveEdit" />
    <asp:Button runat="server" ID="_btnCancelEdit"/>
    <span class="FormTxtErr"><asp:Literal ID="_litBtnMsg" runat="server" /></span>
</asp:Panel>