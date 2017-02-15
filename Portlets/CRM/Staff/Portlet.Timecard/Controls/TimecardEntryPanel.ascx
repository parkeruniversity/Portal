<%@ Control Language="c#" AutoEventWireup="True" Codebehind="TimecardEntryPanel.ascx.cs" Inherits="Portlet.Timecard.Controls.TimecardEntryPanel" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions" %>
<%@ Register TagPrefix="common" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="entry" TagName="PeriodFormat" src="EntryPanelFormats/PeriodFormat.ascx" %>
<%@ Register TagPrefix="entry" TagName="PeriodGridFormat" src="EntryPanelFormats/PeriodGridFormat.ascx" %>
<%@ Register TagPrefix="entry" TagName="HourlyFormat" Src="EntryPanelFormats/HourlyFormat.ascx" %>
<%@ Register TagPrefix="entry" TagName="RealTimeFormat" Src="EntryPanelFormats/RealTimeFormat.ascx" %>

<link href="<%= this.ResolveUrl("Styles/TimecardEntryPanel.css") %>?v=182.1" rel="stylesheet" type="text/css" />
<!--[if lte IE 7]>
	<link href="<%= this.ResolveUrl("Styles/TimecardEntryPanel_IE7.css") %>?v=182" rel="stylesheet" type="text/css" />
<![endif]-->

<common:ErrorDisplay ID="ErrorPanel" visible="false" runat="server" />

<table class="tcHoursEntry <%= this.CssClass %>"><tr><td>

    <b><span id="time" style="display: none;" class="tcMarginRight"></span></b><asp:Label id="Header" CssClass="tcHeader" runat="server" />

	<asp:ValidationSummary ID="Summary" DisplayMode="BulletList" CssClass="tcValidationSummary" runat="server" />

	
			<entry:PeriodFormat ID="PeriodEntryPanel" visible="false" runat="server" />
			<entry:PeriodGridFormat ID="PeriodGridEntryPanel" visible="false" runat="server" />
			<entry:HourlyFormat ID="HourlyEntryPanel" visible="false" runat="server" />
			<entry:RealTimeFormat ID="RealTimeEntryPanel" visible="false" runat="server" />
		

	<div id="CommentsSection" class="tcComments" runat="server">
		<p>
			<common:GlobalizedLabel ID="CommentsControlLabel" TextKey="LBL_YOUR_COMMENTS" CssClass="tcLabel" runat="server" />
			<common:GlobalizedLabel ID="CommentsOptionalNote" TextKey="TXT_(OPTIONAL)" CssClass="tcNote" runat="server" />
		</p>
		<asp:TextBox ID="CommentsEntry" MaxLength="3000" Rows="0" Columns="0" TextMode="MultiLine" runat="server" />
		<p ID="CommentsDisplay" class="tcValue" visible="false" runat="server" />
	</div>

	<div id="ButtonBar" class="buttonBarCenteredVer2" runat="server">
		<common:GlobalizedButton ID="SaveButton" TextKey="TXT_SAVE_HOURS_AND_COMMENTS"
            CssClass="enhanced" runat="server" />
		<common:GlobalizedButton ID="CancelButton" TextKey="TXT_CANCEL" CausesValidation="false" runat="server" />
	</div>
    </td>
    </tr>
    </table>


<script type="text/javascript">
    function doing() {
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "<%=GetClockUrl() %>",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                document.getElementById("time").innerText = data.d;
            },
            error: function (jqX, status, err) { }
        });
    }

    function gettingTime() {
        document.getElementById("time").style.display = "inline";
        setInterval(doing, 1000);
    }  
</script>
