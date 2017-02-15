
/*jslint
    ass:        true,   browser:    true,   nomen:  true,
    plusplus:   true,   todo:       true,   white:  true
*/

/*global jQuery */

window.signalRManager = window.signalRManager || {};
jenzabar.framework.signalRManager = window.signalRManager;

(function (srm, $) {
    'use strict';

    $(document).ready(function () {
        srm.start();
    });

    var
        returnedParams = [],
        initFuncs = [],
        startFuncs = [];

    srm.registerHub = function (initFunc, startFunc) {
        if (initFunc !== undefined && initFunc !== null) {
            initFuncs.push(initFunc);
            startFuncs.push(startFunc);
        } else {
            throw new Error("initFunc must be defined.");
        }
    };

    srm.start = function () {
        var i;
        
        for (i = 0; i < initFuncs.length; i++) {
            returnedParams.push(initFuncs[i].call(this));
        }

        $.connection.hub.start().done(function () {
            for (i = 0; i < startFuncs.length; i++) {
                if (startFuncs[i] !== undefined && startFuncs[i] !== null) {
                    startFuncs[i].call(this, returnedParams[i]);
                }
            }
        });
    };
}(jenzabar.framework.signalRManager || {}, jQuery));