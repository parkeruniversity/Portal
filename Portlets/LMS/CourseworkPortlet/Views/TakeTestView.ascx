<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TakeTestView.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.TakeTestView" %>
<%@ Register TagPrefix="JICS" Namespace="Jenzabar.Portal.Web.UI.Controls" Assembly="Jenzabar.Portal.Web" %>
<%@ Register TagPrefix="cwk" TagName="TestHeader" Src="Controls/TestHeaderDisplay.ascx" %>
<%@ Register TagPrefix="cwk" TagName="RichText" Src="Controls/RichTextDisplay.ascx" %>
<%@ Register TagPrefix="cwk" TagName="QuestionDisplay" Src="Controls/QuestionDisplay/QuestionDisplay.ascx" %>
<%@ Register TagPrefix="lms" TagName="Modal" Src="../../Common/Controls/Modal.ascx" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>

<link href="<%=GetFullScreenCSS()%>" type="text/css" rel="stylesheet">
<script src="CuteSoft_Client/CuteEditor/Scripts/spell.js"></script> <!--CuteEditor workaround-->
<script language="javascript" src="UI/Common/Scripts/jquery.blockui.js"></script>

<script type="text/javascript" language="javascript">
	var _isPageChange = true;
	Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
	function EndRequestHandler(sender, args) {
	    if (_isPageChange) {
	        ClearFocus();
	        scrollTo(0, 0);
	    }
	}
	function ClearFocus() {
	    //CuteEditor issue/workaround when changing pages with SA question types (16878) only in IE
		if ("ActiveXObject" in window) {
	        var f = $('input[type=text]').first(); 
	        if (f != null) {f.focus();f.blur();} 
	    }
	}
	function SetPageChange(isPageChange) {
	    _isPageChange = isPageChange;
	}
	function RestartMonitor() {
	    ClearHeartbeat();
	}
	function BlockUI() {
	    $.blockUI({ message: $('#divBlock'), css: { border: 'none', background: 'transparent' }, overlayCSS: { backgroundColor: '#000', opacity: 0.3} });
	    return true;
	}
	function UnblockUI() {
	    $.unblockUI();
	}

	Sys.Application.add_load(UnblockUI);
</script>
<script type="text/javascript">
	var hoursText = '<%= Globalizer.GetString("TXT_HOURS").ToLower() %>';
	var minutesText = '<%= Globalizer.GetString("TXT_MINUTES").ToLower() %>';
	var secondsText = '<%= Globalizer.GetString("TXT_SECONDS").ToLower() %>';
	var groupID = '';

	function Timer() {
		var seconds = 0;
		var container = '';
		var keepCounting = true;
		var timerVar = '';
		var timeOut = '';
		var isGroup = false;

		function UpdateTime() {
			if (seconds <= 0) {
				TriggerHeartbeat();
				keepCounting = false;
			}
			DisplayTime();
			seconds = seconds - 1;
		}
		function DisplayTime() {
			var elem = $('.' + container + ' > span.timeDisplay');
			var delim = ':';

			if (container == '' || elem == null || seconds <= 0) {
				if (elem != null)
					elem.html('');
				return;
			}
			var display = '';
			if (seconds > 7200 && !isGroup) {	//show hours and mins   34:00 hours   3:53 hours
				var hours = Math.floor(seconds / 3600);
				var mins = Math.floor(seconds / 60) % 60;
				display = hours + delim + (mins < 10 ? '0' : '') + mins + ' ' + hoursText;
			}
			else if (seconds > 300 && !isGroup) {	//show minutes only   120 minutes  6 minutes
				display = Math.floor(seconds / 60) + ' ' + minutesText;
			}
			else {		//under 5 mins so should mins and seconds, or QG
				var sec = Math.floor(seconds) % 60;
				if (seconds < 60)
					display = (sec < 10 ? '0' : '') + sec + ' ' + secondsText;
				else
					display = Math.floor(seconds / 60) + delim + (sec < 10 ? '0' : '') + sec + ' ' + minutesText;
				if (!isGroup && !$('.' + container).hasClass('warning')) {
					$('.' + container).addClass('warning');
				}
			}
			elem.html(display);
		}
		return {
			setSeconds: function (newSeconds) { seconds = newSeconds },
			init: function (origSeconds, cssContainer, timerVariable, isgroup) { seconds = origSeconds; container = cssContainer; timerVar = timerVariable; isGroup = isgroup; this.timer(); },
			timer: function () { UpdateTime(); if (keepCounting) { timeOut = setTimeout(timerVar + ".timer();", 1000); } },
			clear: function () { clearTimeout(timeOut); keepCounting = true; }
		};
	}

	var attemptTimer = new Timer();
	var groupTimer = new Timer();
	var hasSetAttemptTimer = false;

	function SetTimer(seconds, isGroup) {
	    if (!isGroup && !hasSetAttemptTimer) {
	        attemptTimer.init(seconds, 'timeRemaining', 'attemptTimer', false);
	        hasSetAttemptTimer = true;
	    }
		else if(isGroup)
			groupTimer.init(seconds, 'groupTimeRemaining', 'groupTimer', true);
	}
</script>
<script language="javascript" type="text/javascript">
	var times = new Array();
	function RegisterHeartbeat(itemID, inter, isGroup) {
		if (isGroup)
			groupID = itemID;
		times[itemID] = setTimeout("Heartbeat('" + itemID + "'," + inter + ")", inter);
	}
	function ClearHeartbeat() {
		for (var i in times) {clearTimeout(times[i]);}
		times = new Array();
		$('#groupTimer').html('');
		groupTimer.clear();
	}
	function TriggerHeartbeat() {
		for(var i in times){setTimeout("Heartbeat('" + i + "'," + 0 + ")", 0);}
	}
	function Heartbeat(itemID, inter) {
		$.ajax({
			type: "POST",
			data: '{ itemID: "' + itemID + '" }',
			dataType: "json",
			url: "<%=GetHeatbeatUrl() %>",
			contentType: "application/json; charset=utf-8",
			success: function (data) { onSuccess(data, itemID, inter); },
			error: function (jqX, status, err) { alert('Error: ' + err); }
		});
	}
	function onSuccess(data, itemID, inter) {
	    var status = data.d;
	    if(status == null) {
	        RegisterHeartbeat(itemID, inter); 
	        return;
	    }
		if (status.IsExpired) {
			$('#<%=_hKey.ClientID %>').val(status.Key);
			$('#<%=_btnAuto.ClientID %>').click();
			AutoMask();
		}
		else if (inter > 0) {
			if (groupID == itemID) groupTimer.setSeconds(status.RemainingSeconds);
			else attemptTimer.setSeconds(status.RemainingSeconds);
			RegisterHeartbeat(itemID, inter); 
		}
	}
	function AutoMask() {
		$('.autoMask').css({ 'width': $(window).width(), 'height': $(document).height() });
		$('.autoMask').show();
	}
</script>
<script language="javascript" type="text/javascript">
	var multiChoices = new Array();
	function ClearMulti() {
		multiChoices = new Array();
	}
	function BindMulti(qNum, cbxIds, lim) {
		var item = new MultiItem(qNum, cbxIds, lim);
		multiChoices.push(item);
		for (var i = 0; i < item.checkBoxes.length; i++)
			$('#' + item.checkBoxes[i]).click(function () { return CheckMulti(item.questionNumber); });
	}
	function CheckMulti(qNum) {
		if (qNum == null && multiChoices.length > 0) {
			var requiredCount = multiChoices.length;
			var questions = new Array();
			for (var i = 0; i < multiChoices.length; i++)
			{
				if(multiChoices[i].hasReachedLimit())
					requiredCount-=1;
				else
					questions.push(multiChoices[i].questionNumber);
			}
			if (requiredCount > 0)
				alert('<%=GetQuestionsLimitText() %>   ' + questions.join(','));
			return requiredCount <= 0;
		}
		else if(qNum != null &&  multiChoices.length > 0){
		for (var i = 0; i < multiChoices.length; i++) {
			if (multiChoices[i].questionNumber == qNum) {
				var isValid = multiChoices[i].isCurrentCheckedValid();
				if (!isValid)
					alert('<%=GetLimitText() %>');
				return isValid;
				}
			}
		}
		return true;
	}
	function MultiItem(qNum, cbxIds, lim) {
		this.questionNumber = qNum;
		this.checkBoxes = cbxIds;
		this.limit = lim;
		this.hasReachedLimit = function () {
			var count = this.getCount();
			return count >= this.limit || count == 0;
		}
		this.isCurrentCheckedValid = function () {
			var count = this.getCount();
			return count <= this.limit || count == 0;
		}
		this.getCount = function() {
			var count = 0;
			for (var i = 0; i < this.checkBoxes.length; i++)
				count += $('#' + this.checkBoxes[i]).is(':checked') ? 1 : 0;
			return count;
		}
	}
</script>
<div id="divBlock" style="display:none;" >
    <img src="<%=GetAJAXImageUrl()%>" />
</div>
<div class="testArea">
	<div id="_divAutoMask" class="autoMask" runat="server"></div>
	<cwk:TestHeader id="_header" runat="server" />
	<asp:PlaceHolder ID="_phLightBox" runat="server" />
	<div class="questionArea">
		<asp:Repeater ID="_rptGroups" EnableViewState="false"  runat="server">
			<ItemTemplate>
				<div>
					<asp:Panel ID="_panTimed" CssClass="timedGroup" runat="server">
						<asp:Literal ID="_litTimed" runat="server" />
						<span class="groupTimeRemaining">
							<asp:Label ID="_lblTimeRemaining" CssClass="timeDisplay" runat="server" />
							<asp:Label ID="_lblRemaining"  runat="server" />
						</span>
						<div class="timedInfo">
							<asp:Literal ID="_litTimedInfo" runat="server" />
						</div>
					</asp:Panel>
					<asp:Label ID="_lblGroupName" CssClass="groupName" runat="server" />
					<cwk:RichText id="_rtInstructions" runat="server" />
				</div>

				<asp:Repeater ID="_rptQuestions" runat="server">
					<ItemTemplate>
						<cwk:QuestionDisplay id="_qDisplay" runat="server" />
					</ItemTemplate>
				</asp:Repeater>
			</ItemTemplate>
		</asp:Repeater>
	</div>
    <asp:HiddenField ID="_hPage" runat="server" />
	<asp:HiddenField ID="_hKey" runat="server" />
	<asp:Button id="_btnAuto" style="display:none;" runat="server" />
	<asp:Panel ID="_panSubmit" CssClass="testSubmit" runat="server">
		<div class="testSubmitInfo">
			<asp:Literal ID="_litSubmitInfo" runat="server" />
		</div>
		<div align="center">
			<span class="testSubmitAction">
				<asp:Button ID="_btnSubmit" runat="server" />
			</span>
		</div>
	</asp:Panel>
    <div id="_testFooter" runat="server" class="testFooter">
        <JICS:Paging id="_paging" runat="server" />
    </div>
	<lms:Modal id="_modalExpire" runat="server">
		<ContentArea>
			<div class="timeExpired">
				<asp:Label id="_lblExpiredInfo" CssClass="timeExpiredText" runat="server" />
				<asp:Label ID="_lblSubmitAction" runat="server" class="testSubmitAction">
					<asp:Button ID="_btnSub" runat="server"/>
				</asp:Label>
				<asp:Hyperlink ID="_hypNext" CssClass="expiredNext" runat="server" />
				<asp:LinkButton ID="_lbtnNext" CssClass="expiredNext" runat="server" />
				<asp:LinkButton ID="_lbtnPrevious" runat="server" />
			</div>
		</ContentArea>
	</lms:Modal>
</div>
