function initNoAccess(ApptApp) {
    ApptApp.NoAccessController = Ember.Controller.extend({
        g11n: apptPortlet.g11n
    });

    ApptApp.NoAccessView = Ember.View.extend({
        didInsertElement: function () {
            if (apptPortlet.name != null) {
                this.get('controller').transitionTo("main");
            }
        }
    });
}