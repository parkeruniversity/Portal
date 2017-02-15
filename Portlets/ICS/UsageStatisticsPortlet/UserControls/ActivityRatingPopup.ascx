<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ActivityRatingPopup.ascx.cs"
    Inherits="Jenzabar.ICS.Web.Portlets.UsageStatisticsPortlet.UserControls.ActivityRatingPopup" %>

<script language="javascript" type="text/javascript">

    function ToggleRatingsKeyPopup(boolShow) {

        var popup = document.getElementById('RatingsKeyPopupOuterDiv');

        if (!boolShow) {
            popup.style.display = "none";
        }
        else {
            popup.style.display = "block";
            popup.style.position = "absolute";
        }
    }
</script>

<table>
    <tr>
        <td align="right">
            <img src="ui/common/images/PortletImages/Icons/icon_ratingkey.gif" />
            <asp:Label ID="lblRatingsKey" runat="server" CssClass="LabelLink" onclick="ToggleRatingsKeyPopup(true)" />
        </td>
        <td>
           <div id="RatingsKeyPopupOuterDiv" class="RatingsKeyPopupOuterDiv">
                <table cellpadding="0" cellspacing="0" class="RatingsKeyPopup">
                    <tr class="RatingsKeyPopupHeaderRow">
                        <td class="RatingsKeyPopupCell">
                            <asp:Label ID="lblActivityRatingKeyHeader" runat="server" />
                        </td>
                        <td class="RatingsKeyPopupCellClose">
                            <img src="ui/common/images/PortletImages/Icons/close_me.gif" onclick="ToggleRatingsKeyPopup(false)" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="RatingsKeyPopupCell">
                            <img src="ui/common/images/PortletImages/Icons/icon_rating_wellabove_16.gif" />
                            &nbsp;
                            <asp:Label ID="lblWellAboveAverage" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="RatingsKeyPopupCell">
                            <img src="ui/common/images/PortletImages/Icons/icon_rating_above_16.gif" />
                            &nbsp;
                            <asp:Label ID="lblAboveAverage" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="RatingsKeyPopupCell">
                            <img src="ui/common/images/PortletImages/Icons/icon_rating_average_16.gif" />
                            &nbsp;
                            <asp:Label ID="lblAverage" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="RatingsKeyPopupCell">
                            <img src="ui/common/images/PortletImages/Icons/icon_rating_below_16.gif" />
                            &nbsp;
                            <asp:Label ID="lblBelowAverage" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="RatingsKeyPopupCell">
                            <img src="ui/common/images/PortletImages/Icons/icon_rating_wellbelow_16.gif" />
                            &nbsp;
                            <asp:Label ID="lblWellBelowAverage" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center" class="RatingsKeyPopupCell">
                            <div class="RatingsKeyPopupDescription">
                                <asp:Label ID="lblDescription" runat="server" />
                            </div>
                            <br />
                            <asp:Label ID="lblClose" runat="server" CssClass="LabelLink" onclick="ToggleRatingsKeyPopup(false)" />
                            <br />
                            <br />
                        </td>
                    </tr>
                </table>
            </div>
        </td>
    </tr>
</table>