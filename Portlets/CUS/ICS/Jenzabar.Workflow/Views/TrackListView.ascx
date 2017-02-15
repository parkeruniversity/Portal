<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TrackListView.ascx.cs" Inherits="Jenzabar.Workflow.TrackListView" %>
<script>
    jQuery(document).ready(function () {
        jQuery('#itemTabs').tabs();
    });
</script>
<script src='<%= ResolveUrl("~/Portlets/CUS/ICS/Jenzabar.Workflow/Scripts/workflowScripts.js") %>'></script>
<asp:HiddenField runat="server" ID="pgeUrl" />

<div class="pSection">
    <table>
        <tr>
            <td>
                <asp:FileUpload runat="server" ID="fuTrackImport"/>&nbsp;<asp:Button runat="server" 
        ID="btnImportTrack" onclick="btnImportTrack_Click" Text="Import"/>
            </td>
        </tr>
    </table>
    <div id="itemTabs">
	    <ul>
		    <li><a href='<%= jQueryURL + "#tabs-1" %>'>Tracks</a></li>
            <li><a href='<%= jQueryURL + "#tabs-2" %>'>Document Types</a></li>
	    </ul>
        <div id="tabs-1">
            <table>
                <tr>
                    <td style="width:25%;"><asp:Image runat="server" ID="imgBtnAddTrack"></asp:Image><asp:LinkButton runat="server" ID="_lnkAdd" OnClick="imgBtnAddTrack_Click">Add Track</asp:LinkButton></td>
                    <td>
            
                    </td>
                </tr>
            </table>
            <asp:Repeater ID="rptTracks" runat="server" OnItemDataBound="rptTracks_ItemDataBound" >
                <ItemTemplate>
                    <asp:Panel runat="server" ID="AdminTrackRow" CssClass="AdminTrackRow" style="margin-bottom:2px;">
                        <asp:LinkButton ID="lnkTrackName" runat="server" OnClick="lnkTrackName_Click" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "TrackID") %>' CommandName="Edit"><%# DataBinder.Eval(Container.DataItem, "Name") %></asp:LinkButton><br /><%# DataBinder.Eval(Container.DataItem, "Description") %>
                        <div class="TrackLinks">
                            <asp:ImageButton ID="imgExport" runat="server" ToolTip="Export" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "TrackID") %>' OnClick="imgExport_Click"/>
                            <asp:ImageButton ID="imgTrackDelete" runat="server" ToolTip="Delete" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "TrackID") %>' OnClientClick="if (!confirm('Are you sure you want to delete this?')){return false;}" OnClick="imgTrackDelete_Click"/>
                        </div>
                    </asp:Panel>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <div id="tabs-2">
            <asp:Panel runat="server" ID="pnlDocDefs">
            <table>
                <tr>
                    <td style="width:25%;"><asp:Image runat="server" ID="imgAddDoc"></asp:Image><asp:LinkButton runat="server" ID="lnkAddDoc" OnClick="lnkAddDoc_Click">Add Document Type</asp:LinkButton></td>
                    <td>
            
                    </td>
                </tr>
            </table>
            <div>
            <asp:Repeater ID="rptDocuments" runat="server" OnItemDataBound="rptDocuments_ItemDataBound">
                <ItemTemplate>
                    <asp:Panel runat="server" ID="AdminTrackRow" CssClass="AdminTrackRow" style="margin-bottom:2px;">
                        <asp:LinkButton ID="lnkDocName" runat="server" OnClick="lnkDocName_Click" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "DocumentDefID") %>' CommandName="Edit"><%# DataBinder.Eval(Container.DataItem, "Name") %></asp:LinkButton><br /><%# DataBinder.Eval(Container.DataItem, "Description") %>
                        <div class="TrackLinks">
                            <asp:ImageButton ID="imgDocDelete" runat="server" ToolTip="Delete" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "DocumentDefID") %>' OnClientClick="if (!confirm('Are you sure you want to delete this document type?')){return false;}" OnClick="imgDocDelete_Click"/>
                        </div>
                    </asp:Panel>
                </ItemTemplate>
            </asp:Repeater>
            </div>
            </asp:Panel>
        </div>
    </div>
</div>