function initEmberApp() {
    Ember.Handlebars.registerBoundHelper('stringFormat', function (g11nString, str) {
        return new Handlebars.SafeString(stringUtil.format(g11nString, str));
    });
    ApptApp = Ember.Application.create({
        rootElement: "#appointmentWrapper"
    });
    ApptApp.Router.map(function () {
        this.route("main", { path: '/' });
        this.route("mainParam", { path: "/:val" });
        this.route('mainId', { path: '/mainId/:appt_id' });
        this.route('mainDirect', { path: '/mainDirect/:appt_id' });
        this.route("schedule");
        this.resource('userSchedule', { path: '/schedule/:user_id' });
        this.route('scheduleId', { path: '/scheduleId/:appt_id' });
        this.route('userScheduleId', { path: '/userScheduleId/:ids' });
        this.route('scheduleSpecific');
        this.route('scheduleSpecificId',{path: '/scheduleSpecificId/:appt_id'});
        this.route('scheduleDate', { path: '/scheduleDate/:date' });
        this.route('scheduleResource', { path: '/scheduleResource/:resource_id' });
        this.route("settings");
        this.route("campus");
        this.route("noAccess");
    });
    ApptApp.history = {name:'',view:'',param:null, isSchedule:false}

    initViews();
}

function initViews() {
    initMain(ApptApp);
    initSchedule(ApptApp);
    initSettings(ApptApp);
    initCampus(ApptApp);
    initNoAccess(ApptApp);
}