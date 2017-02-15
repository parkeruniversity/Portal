<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RealTimeFormat.ascx.cs"
    Inherits="Portlet.Timecard.Controls.EntryPanelFormats.RealTimeFormat" %>
<%@ Register TagPrefix="common" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="validation" Namespace="Jenzabar.Common.Web.UI.Controls.Validation"
    Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="framework" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls"
    Assembly="Jenzabar.Portal.Framework.Web" %>
<ul id="EntryTable" class="tcEntryPanel" runat="server">
    <li id="ValidationMessages" runat="server">
        <table>
            <tr>
                <td>
                    <common:GlobalizedLabel ID="PriorDayOpenShift" TextKey="MSG_FORMAT_REALTIME_PRIORDAYOPENSHIFT"
                        runat="server" Visible="false" CssClass="tcWrap tcErrorText" />
                </td>
            </tr>
            <tr>
                <td>
                    <common:GlobalizedLabel ID="PastDayOpenShift" TextKey="MSG_FORMAT_REALTIME_PASTDAYOPENSHIFT"
                        runat="server" Visible="false" CssClass="tcWrap tcErrorText" />
                </td>
            </tr>
            <tr>
                <td>
                    <common:GlobalizedLabel ID="OverlapRange1" TextKey="MSG_FORMAT_REALTIME_RANGEOVERLAP_1"
                        runat="server" Visible="false" CssClass="tcWrap tcErrorText" /><common:GlobalizedLinkButton
                            ID="OverlapRange2" TextKey="MSG_FORMAT_REALTIME_RANGEOVERLAP_2" OnCommand="OverlapRange2_Command"
                            runat="server" Visible="false" /><common:GlobalizedLabel ID="OverlapRange3" TextKey="MSG_FORMAT_REALTIME_RANGEOVERLAP_3"
                                runat="server" Visible="false" CssClass="tcWrap tcErrorText" />
                </td>
            </tr>
            <tr>
                <td>
                    <common:GlobalizedLabel ID="NotCurrentDay1" TextKey="MSG_FORMAT_REALTIME_NOTCURRENTDAY_1"
                        runat="server" Visible="false" CssClass="tcWrap tcErrorText" /><common:GlobalizedLinkButton
                            ID="NotCurrentDay2" TextKey="MSG_FORMAT_REALTIME_NOTCURRENTDAY_2" OnClick="NotCurrentDay2_Click"
                            runat="server" Visible="false" /><common:GlobalizedLabel ID="NotCurrentDay3" TextKey="MSG_FORMAT_REALTIME_NOTCURRENTDAY_3"
                                runat="server" Visible="false" CssClass="tcWrap tcErrorText" />
                </td>
            </tr>
        </table>
    </li>
    <li id="DayRow" runat="server">
        <table >
            <tr>
                <td>
                    <asp:Table ID="TimecardEntryTable" runat="server">
                        <asp:TableRow>
                            <asp:TableCell>
                                <common:GlobalizedButton ID="ClockInButton" TextKey="TXT_CLOCK_IN" Visible="false"
                                    CssClass="enhanced" runat="server" OnClick="clockIn_Click" />&nbsp;
                            </asp:TableCell>
                            <asp:TableCell>
                                <common:GlobalizedLabel ID="ForTypeOfPay" TextKey="TXT_FOR" runat="server"
                                    Visible="false" />&nbsp;
                                <asp:DropDownList ID="TypeOfPaySelect" Visible="false" runat="server" />
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label ID="ClockedInText" runat="server" Visible="false" />
                            </asp:TableCell>
                            <asp:TableCell>
                                <common:GlobalizedButton ID="ClockOutButton" Visible="false" TextKey="TXT_CLOCK_OUT"
                                    CssClass="enhanced" runat="server" OnCommand="clockOut_Command" />
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                    <asp:Table ID="OtherHoursTodayTable" runat="server">
                    </asp:Table>
                </td>
            </tr>
        </table>
    </li>
    <li class="tcFooter">
        <div class="tcFloatRight tcPadRightNone">
                <common:GlobalizedLabel ID="TotalLabel" TextKey="LBL_TOTAL" CssClass="tcFloatLeft" runat="server" />
            
                <asp:Label ID="TotalHourlyHours" CssClass="tcPadLeft20 tcPadRightNone tcFloatLeft" runat="server" />
        </div>
    </li>
</ul>
