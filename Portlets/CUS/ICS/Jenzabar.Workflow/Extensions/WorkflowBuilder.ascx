<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WorkflowBuilder.ascx.cs" Inherits="Jenzabar.ContainedForm.Controls.WorkflowBuilder" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls"
    TagPrefix="cc1" %>
<style>
    .dropDownOptions
    {
        width:350px;
    }
</style>
<cc1:Hint runat="server">
    Data points are used in Jenzabar Workflow to automate actions in each stage. The left column is the name of the data point expected by the
    selected track. The right column is a list of all questions on the current form that are allowed to be mapped. After the data points have been
    mapped, you will still need to associate the form with the track via question events.
</cc1:Hint>
<table>
    <tr>
        <td>Track:</td>
        <td><asp:DropDownList runat="server" ID="drpTracks" CssClass="dropDownOptions" AutoPostBack="true" OnSelectedIndexChanged="drpTracks_SelectedIndexChanged"></asp:DropDownList></td>
    </tr>
    <tr>
        <td>Submitter's Email:</td>
        <td><asp:DropDownList runat="server" ID="drpEmailQuestion" CssClass="dropDownOptions"></asp:DropDownList></td>
    </tr>
    <asp:Repeater runat="server" ID="rptDataPoints" OnItemDataBound="rptDataPoints_ItemDataBound">
        <ItemTemplate>
            <tr>
                <td>
                    <asp:HiddenField runat="server" ID="hdnDataPointID" Value='<%# ((Jenzabar.Workflow.Entities.DataPoint)Container.DataItem).DataPointID %>' />
                    <%# ((Jenzabar.Workflow.Entities.DataPoint)Container.DataItem).TagName %></td>
                <td><asp:DropDownList runat="server" ID="drpQuestions" CssClass="dropDownOptions"></asp:DropDownList></td>
            </tr>
        </ItemTemplate>
    </asp:Repeater>
</table>
<center>
    <asp:Button runat="server" Text="Save" ID="btnSave" OnClick="btnSave_Click" /> 
</center>
<center>
    <asp:Button runat="server" Text="Done" ID="btnDone" OnClick="btnDone_Click" />
</center>
