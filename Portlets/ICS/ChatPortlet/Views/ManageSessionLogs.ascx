<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ManageSessionLogs.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.ChatPortlet.Views.ManageSessionLogs" %>
<%@ Import Namespace="Jenzabar.ICS.Chatting.Dto" %>
<%@ Import Namespace="Jenzabar.Common.Globalization" %>
<div class="chat-portlet logs">
    <asp:Repeater ID="sessionLogs" runat="server">
        <HeaderTemplate>
            <ul data-id="portlet-log">
                <li>
                    <a id="backToMainView" runat="server"  href="<%# this.MainViewURL %>"><%= string.Format(Globalizer.GetString("TXT_CHAT_BACK_TO_MAIN_VIEW"),ParentPortlet.Portlet.DisplayName) %></a>
                    <span class="log-title"><%= Globalizer.GetString("TXT_CHAT_All_HISTORY") %></span>
                    <span><a id="deleteAllLogs" data-id='downloadAll' data-portlet-id="<%# this.ParentPortlet.Portlet.ID.AsGuid %>"><%= Globalizer.GetString("TXT_CHAT_DOWNLOAD_ALL") %></a> | </span>
                    <span><a data-id='deleteAll' href="" onclick="return false" data-portlet-id="<%# this.ParentPortlet.Portlet.ID.AsGuid %>"><%= Globalizer.GetString("TXT_CHAT_DELETE_ALL") %></a>  </span>
                </li>
            </ul>
        </HeaderTemplate>
        <ItemTemplate>
            <ul data-id="monthly-portlet-log" class="sessions">

                <li>
                    <span class="month-title"><%#((MonthlyLogs)Container.DataItem).StartTime.ToString("MMMM yyyy") %> <%= Globalizer.GetString("TXT_CHAT_LOGS") %></span>
                    <span><a data-id='downloadAllMonthly' data-month="<%#((MonthlyLogs)Container.DataItem).Month %>" data-portlet-id="<%# this.ParentPortlet.Portlet.ID.AsGuid %>"><%= Globalizer.GetString("TXT_CHAT_DOWNLOAD_ALL") %></a> | </span>
                    <span><a data-id='deleteAllMonthly' data-month="<%#((MonthlyLogs)Container.DataItem).Month %>" href="" onclick="return false" data-portlet-id="<%# this.ParentPortlet.Portlet.ID.AsGuid %>"><%= Globalizer.GetString("TXT_CHAT_DELETE_ALL") %></a></span>
                </li>
                <asp:Repeater ID="monthlySessionLogs" DataSource="<%# ((MonthlyLogs)Container.DataItem).Logs%>" runat="server">
                    <ItemTemplate>
                        <li data-id="sessionContainer">
                            <div>
                                 <span><%# ((SessionLog)Container.DataItem).DateStartTime.ToString("d") %> </span>
                                <span>(<%# ((SessionLog)Container.DataItem).StartTime %> - </span>
                                <span><%# ((SessionLog)Container.DataItem).EndTime %>)</span>
                            </div>
                            <div>
                                <span><a href="" id="doanload" data-id="download" onclick="return false" data-session-id="<%# ((SessionLog)Container.DataItem).SessionId %>"><%= Globalizer.GetString("TXT_CHAT_DOWNLOAD") %></a> |</span>
                                <span><a href="#" id="delete" data-id="delete" onclick="return false" data-session-id="<%# ((SessionLog)Container.DataItem).SessionId %>"><%= Globalizer.GetString("TXT_CHAT_DELETE") %></a></span>
                            </div>
                        </li>
                    </ItemTemplate>

                </asp:Repeater>

            </ul>
        </ItemTemplate>
    </asp:Repeater>
</div>
