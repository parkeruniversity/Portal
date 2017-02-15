<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ReviewView.ascx.cs" Inherits="Jenzabar.Workflow.Review_Screen" %>
<style>
    @import "/ICS/Portlets/CUS/ICS/Jenzabar.ContainedForm/Scripts/demo_table.css";
</style>
<script type="text/javascript" src='<%= ResolveUrl("~/Portlets/CUS/ICS/Jenzabar.ContainedForm/Scripts/jquery.dataTables.min.js") %>'></script>
<script>
    jQuery(document).ready(function () {
        jQuery('.SummaryTable').dataTable({
            "aaSorting": [[1, 'desc'],[2, 'desc']]
        });
    });
</script>
<asp:HiddenField ID="hdn_da_currentUser" runat="server" />
<asp:HiddenField ID="hdn_da_currentDoc" runat="server" />
<asp:DropDownList runat="server" ID="drpTrack" OnSelectedIndexChanged="drpTrack_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
<asp:Panel runat="server" CssClass="pSection">
    <table id="docsGrid" class="SummaryTable">
        <thead>
            <tr>
                <th></th>
                <th></th>
                <th>Submitted Date</th>
                <th>User ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th runat="server" id="trackHeaderCol">Track</th>
                <th>Current Stage</th>
                <asp:PlaceHolder runat="server" ID="plExtraHeaders"></asp:PlaceHolder>
            </tr>
        </thead>
        <tbody>
            <asp:Repeater runat="server" ID="rptDocs" OnItemDataBound="rptDocs_ItemDataBound">
                <ItemTemplate>
                    <tr>
                        <td>
                            <asp:PlaceHolder runat="server" ID="plManual">
                                <asp:ImageButton runat="server" ID="imgPrevious" CommandArgument='<%# ((Jenzabar.Workflow.Entities.Document)Container.DataItem).DocumentID %>' OnClick="imgPrevious_OnClick" ImageUrl="~/Portlets/CUS/ICS/Jenzabar.Workflow/Images/arrow-left.png"/>
                                <asp:ImageButton runat="server" ID="imgPush" CommandArgument='<%# ((Jenzabar.Workflow.Entities.Document)Container.DataItem).DocumentID %>' OnClick="imgPush_OnClick" ImageUrl="~/Portlets/CUS/ICS/Jenzabar.Workflow/Images/arrow-right.png"/>
                            </asp:PlaceHolder>
                            <asp:PlaceHolder runat="server" ID="plJCF">
                                <a href='<%# ((Jenzabar.Workflow.Entities.Document)Container.DataItem).Path %>' target="_blank">View</a>
                            </asp:PlaceHolder>
                            <asp:PlaceHolder runat="server" ID="plINT">
                                <a href='<%# ((Jenzabar.Workflow.Entities.Document)Container.DataItem).Path %>' target="_blank">Form</a>
                            </asp:PlaceHolder>
                        </td>
                        <td><asp:CheckBox runat="server" ID="cbxResponded" Enabled="false"/></td>
                        <td><%# ((Jenzabar.Workflow.Entities.Document)Container.DataItem).SubmittedDate %></td>
                        <td><%# ((Jenzabar.Workflow.Entities.Document)Container.DataItem).GridUserID %></td>
                        <td><%# ((Jenzabar.Workflow.Entities.Document)Container.DataItem).GridFirstName %></td>
                        <td><%# ((Jenzabar.Workflow.Entities.Document)Container.DataItem).GridLastName %></td>
                        <td runat="server" id="trackNameCol"><%# ((Jenzabar.Workflow.Entities.Document)Container.DataItem).GridTrack %></td>
                        <td><%# ((Jenzabar.Workflow.Entities.Document)Container.DataItem).GridStage %></td>
                        <asp:PlaceHolder runat="server" ID="plExtraCols"></asp:PlaceHolder>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </tbody>
    </table>
</asp:Panel>

