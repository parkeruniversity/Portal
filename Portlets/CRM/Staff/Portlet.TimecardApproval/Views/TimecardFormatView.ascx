<%@ Import Namespace="Jenzabar.Common.Globalization"%>
<%@ Control Language="c#" AutoEventWireup="True" Codebehind="TimecardFormatView.ascx.cs" Inherits="Portlet.TimecardApproval.TimecardFormatView" %>
<%@ Register TagPrefix="common" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<common:Subheader ID="PageHeader" runat="server" />

<div id="MainSection" class="pSection" runat="server">
 	<p><common:GlobalizedLabel ID="DescriptionText" TextKey="MSG_TCAPPROVAL_FORMATPAGE_DESCRIPTION" runat="server" /></p>
	<common:ContentBox id="TimecardFormatBox" CssClass="tcaContentBox" TextKey="TXT_CHOOSE_TIMECARD_FORMAT" runat="server">
	<table id="tblMain" class="tcaTimecardTableFormat" style="margin: 0px;" runat="server">
	    <tr>
	        <td>
	            <p>
	            <span class="tcaTimecardInfoMsg">
		            <img id="WarningImage" class="tcaFloatLeft" alt="exclamation-point.gif" runat="server" />
		            <common:GlobalizedLabel ID="WarningText" TextKey="MSG_TCAPPROVAL_FORMATPAGE_WARNING" runat="server" />
	            </span>
	            </p>
	        </td>
	    </tr>
	    <tr>
	        <td>
		    <asp:RadioButton ID="HourlyFormat" GroupName="TimecardFormat" runat="server" />
			    <common:GlobalizedLabel ID="HourlyLabel" ForControl="HourlyFormat" TextKey="MSG_TCAPPROVAL_FORMATPAGE_HOURLYDESCRIPTION" runat="server" />
			    <!--<a href=""><common:GlobalizedLabel ID="ExampleLink1" TextKey="TXT_EXAMPLE_TIMECARD" runat="server" /></a>-->
	        </td>
		</tr>
        <tr>
            <td>
                <asp:CheckBox ID="RealTime" CssClass="IndentMargin" runat="server" />
                <common:GlobalizedLabel ID="RealTimeLabel" ForControl="RealTime" TextKey="MSG_TCAPPROVAL_FORMATPAGE_REALTIMEDESCRIPTION"
                    runat="server" />
            </td>
        </tr>
		 <tr>
		    <td>
			    <asp:RadioButton ID="DailyFormat" GroupName="TimecardFormat" runat="server" />
			    <common:GlobalizedLabel ID="DailyLabel" ForControl="DailyFormat" TextKey="MSG_TCAPPROVAL_FORMATPAGE_DAILYDESCRIPTION" runat="server" />
			    <!--<a href=""><common:GlobalizedLabel ID="ExampleLink2" TextKey="TXT_EXAMPLE_TIMECARD" runat="server" /></a>-->
		    </td>
		</tr>
		<tr>
		    <td>
			    <asp:RadioButton ID="PeriodFormat" GroupName="TimecardFormat" runat="server" />
			    <common:GlobalizedLabel ID="PeriodLabel" ForControl="PeriodFormat" TextKey="MSG_TCAPPROVAL_FORMATPAGE_PERIODDESCRIPTION" runat="server" />
			    <!--<a href=""><common:GlobalizedLabel ID="ExampleLink3" TextKey="TXT_EXAMPLE_TIMECARD" runat="server" /></a>-->
		    </td>
		</tr>
	    <tr>
	        <td class="buttonBarCenteredVer2">
	
		        <common:GlobalizedButton ID="SaveButton" TextKey="TXT_SAVE_FORMAT" runat="server"/>
		        <common:GlobalizedButton ID="CancelButton" TextKey="TXT_CANCEL" runat="server"/>
	
	        </td>
	    </tr>
	</table>
	</common:ContentBox>
</div>
