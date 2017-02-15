<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DataPointBuilder.ascx.cs" Inherits="Jenzabar.Workflow.Controls.DataPointBuilder" %>
<%@ Register Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" TagPrefix="cc1" %>
<cc1:Hint runat="server" ID="Hint1">
    Data points are defined and must be supplied at the time a document is added to the track. These will be used in the rules process to automatically perform actions.
</cc1:Hint>
<table>
    <tr>
        <th>Tag Name</th>
        <th>Description</th>
        <th>Show In Grid</th>
    </tr>
    <tr>
        <td><asp:TextBox runat="server" ID="tbxDataPointName" MaxLength="50"></asp:TextBox></td>
        <td><asp:TextBox runat="server" ID="tbxDataPointDesc" MaxLength="1000"></asp:TextBox></td>
        <td><asp:CheckBox runat="server" ID="cbxDataPointGrid" /></td>
        <td><asp:Button runat="server" ID="btnSaveDP" Text="Add" OnClick="btnSaveDP_Click"/></td>
    </tr>
</table>
<cc1:GroupedGrid runat="server" ID="grdDataPoints" DataKeyField="ProcedureID" RenderGroupHeaders="true" ShowHeader="true">
    <EmptyTableTemplate>
        There are no data points for this track.
    </EmptyTableTemplate>
    <TableHeaderTemplate>
        Data Points
    </TableHeaderTemplate>
    <Columns>
        <asp:TemplateColumn HeaderText="Name">
            <ItemTemplate>
                <%# DataBinder.Eval(Container.DataItem, "TagName") %>
            </ItemTemplate>
        </asp:TemplateColumn>
        <asp:TemplateColumn HeaderText="Description">
            <ItemTemplate>
                <%# DataBinder.Eval(Container.DataItem, "Description") %>
            </ItemTemplate>
        </asp:TemplateColumn>
        <asp:TemplateColumn HeaderText="Show In Grid">
            <ItemTemplate>
                <asp:CheckBox runat="server" 
                    CssClass='<%# DataBinder.Eval(Container.DataItem, "DataPointID") %>'
                    ID="cbxShowInGrid" 
                    Checked='<%# Convert.ToBoolean(DataBinder.Eval(Container.DataItem, "ShowInGrid")) %>'
                    AutoPostBack="true"
                    OnCheckedChanged="cbxShowInGrid_CheckedChanged"
                    />
            </ItemTemplate>
        </asp:TemplateColumn>
        <asp:TemplateColumn>
            <ItemTemplate>
                <asp:ImageButton runat="server" 
                    ID="imgDPDelete" 
                    ImageUrl='<%# Jenzabar.Workflow.Helpers.WorkflowHelper.GetImageIconUrl("delete.gif") %>' 
                    CommandArgument='<%# DataBinder.Eval(Container.DataItem, "DataPointID") %>' 
                    OnClick="imgDPDelete_Click" />
            </ItemTemplate>
        </asp:TemplateColumn>
    </Columns>
</cc1:GroupedGrid>