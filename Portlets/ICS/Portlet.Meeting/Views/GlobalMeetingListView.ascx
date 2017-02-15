<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GlobalMeetingListView.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.MeetingPortlet.Views.GlobalMeetingListView" %>
<%@ Register TagPrefix="jics" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="jics" Namespace="Jenzabar.Portal.Web.UI.Controls" Assembly="Jenzabar.Portal.Web" %>

<script language="javascript">

    function confirmMeetingDelete() {
        var message = "<%= Globalizer.GetString("MSG_DELETE_CONFIRM") %>";
        return confirm(message);
    }

</script>

<div class="pSection globalMeetingListView">
    <div>
        <asp:HyperLink runat="server" ID="BackLink" />
    </div>
    <h5><%= Globalizer.GetString("TXT_GLOBAL_PAST_MEETINGS") %></h5>
    <asp:Repeater ID="GlobalMeetingList" runat="server">
        <HeaderTemplate>
            <table class="MeetingListTable">
                <tr>
                    <th class="headrow"><%= Globalizer.GetString("TXT_STARTED_TIME") %></th>
                    <th class="headrow"><%= Globalizer.GetString("TXT_NAME") %></th>
                    <th class="headrow"><%= Globalizer.GetString("TXT_CREATOR") %></th>
                </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td class="time">
                    <asp:Label ID="lblTime" runat="server" />
                </td>
                <td>
                    <asp:HyperLink ID="MeetingInfoLink" runat="server" class="meetingInfoLink" Target="_blank"></asp:HyperLink>
                </td>
                <td>
                    <asp:Literal runat="server" ID="StartedBy" />
                </td>
                <td>
                    <asp:HyperLink runat="server" ID="HasRecording" CssClass="watchRecordingLink">
                        <%= Globalizer.GetString("TXT_WATCH") %>
                    </asp:HyperLink>
                </td>
                <td>
                    <asp:LinkButton runat="server" ID="DeleteButton" CssClass="meetingDeleteLink" CommandName="Delete" OnClientClick="return confirmMeetingDelete();">
                        <%= Globalizer.GetString("TXT_DELETE") %>
                    </asp:LinkButton>
                </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate></table></FooterTemplate>
    </asp:Repeater>
    <div id="NoMeetingsMessage" runat="server" Visible="false">No meetings have occurred.</div>
    <jics:Paging ID="paging" runat="server" />
    <div>
        <jics:Mirror ControlID="BackLink" runat="server" />
    </div>
</div>