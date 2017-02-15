<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DefaultView.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.Portlet.Appointments.Views.DefaultView" %>
<script type="text/javascript">
    $(document).ready(function () {
        bindData<%=ClientID%>();
    });
    function bindData<%=ClientID%>() {
        var portletInfo = <%=GetPortletInfo()%>;

        var chooser = $("#<%=peopleChooser.ClientID%>");
        if (chooser.length) {
            chooser.peopleChooser({
                peopleSource: 'rpc/appointmentsInfo/GetUserSearch',
                watermark: '<%=GetWatermark()%>',
                onSelect: function (person) {
                    $(person.isResource ? "#<%=_hResource.ClientID%>" : "#<%=_hUser.ClientID%>").val(person.id);
                    $("#<%=_btnTrigger.ClientID%>").click();
                }
            });
        }

        var myCal = $("#<%=datePicker.ClientID%>");
        myCal.datepicker({
            showOtherMonths: true,
            selectOtherMonths: true,
            onChangeMonthYear: function (year, month, picker) {
                processMiniCalAppts<%=ClientID%>($(this), moment({ year: year, month: month - 1, day: 1 }),portletInfo.portletId);
            },
            onSelect: function (date) { $("#<%=_hDate.ClientID%>").val(date); $("#<%=_btnTrigger.ClientID%>").click(); },
            beforeShowDay: function (day) {
                var css = "";
                var cal = $(this);
                if (cal.data('appts') != null) {
                    $(cal.data('appts')).each(function (i, appt) {
                        css += appt.date.isSame(day) ? ' miniAttendee' : '';
                    });
                }
                return [true, css, ""];
            },
        });
        myCal.datepicker("option", "dayNamesMin", myCal.datepicker("option", "dayNamesShort"));
        processMiniCalAppts<%=ClientID%>(myCal, moment(myCal.datepicker('getDate')),portletInfo.portletId);
        
        $("#<%=notification.ClientID%>").apptNotification({ g11n: portletInfo.g11n, apptSetting: portletInfo.apptSetting, resourceId: portletInfo.resourceId, hostIds: (portletInfo.hosts == null ? '' : $.map(portletInfo.hosts, function (host) { return host.id; }).join(',')), baseUrl: portletInfo.baseUrl });
    }
    function processMiniCalAppts<%=ClientID%>(myCal, startDate, portletId) {
        var currDate = myCal.data('currDate');

        if (currDate == null || currDate.month() != startDate.month() || currDate.year() != startDate.year()) {
            //get or refresh mini month appt data
            myCal.data('currDate', startDate);
            $.get('rpc/appointmentsInfo/GetMyMiniCalendar', { currentDate: startDate.format('MM/DD/YYYY'), portletId: portletId }, function (apptInfo) {
                $(apptInfo.appts).each(function (i, appt) { appt.date = moment(appt.date); }); //create moment wrapper on each date
                myCal.data('appts', apptInfo.appts);
                myCal.datepicker('refresh');
            });
        }
    }
</script>
<div class="pSection">
    <div >
        <asp:Label runat="server" ID="_lblFind" CssClass="apptsHeader-default"></asp:Label>
        <asp:PlaceHolder runat="server" ID="_phChooser">
            <div id="peopleChooser" class="defaultSearch" runat="server"></div>
        </asp:PlaceHolder>
        <asp:PlaceHolder runat="server" ID="_phHeader" Visible="False">
             <div class="mySchedulePersonal">
                <asp:HyperLink runat="server" id="_hypPhoto"><asp:Image runat="server" ID="_imgPhoto" CssClass="userPhoto"/></asp:HyperLink> 
                <div id="_divHeader" runat="server"  class="myScheduleInfo">
                    <asp:HyperLink runat="server" ID="_hypHeader" CssClass="apptsHeader"></asp:HyperLink>
                    <asp:Label runat="server" ID="_lblLocation" CssClass="rg-location"></asp:Label>
                    <asp:Label runat="server" ID="_lblDescip" CssClass="rg-descrip"></asp:Label>
                </div>
            </div>
            <div style="clear:both;"></div>
        </asp:PlaceHolder>
        <asp:HiddenField runat="server" ID="_hUser" />
        <asp:HiddenField runat="server" ID="_hDate" />
        <asp:HiddenField runat="server" ID="_hResource" />
        <asp:Button runat="server" ID="_btnTrigger" UseSubmitBehavior="False" style="display: none;"/>
    </div>
    <div id="notification" runat="server"></div>
    <div>
        <asp:Label runat="server" ID="_lblMyAppts" CssClass="apptsHeader-default"></asp:Label>
        <div id="datePicker" runat="server"></div>
    </div>
    <asp:HyperLink runat="server" ID="_hypMain" CssClass="activeItem"></asp:HyperLink>
</div>

