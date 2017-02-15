window.jQuery = window.jQuery || window.$;
window.jenzabar = window.jenzabar || {};
jenzabar.ChatPortlet = jenzabar.ChatPortlet || {};


(function (validator, moment, $, resourceManager) {
    "use strict";
// ReSharper disable once InconsistentNaming
    var _portletId,_globalizer;
    validator.isDuplicate = function (timeSlot) {
        var validationPromise = $.Deferred();
        $.when(resourceManager.ChatAvailability.getChatAvailabilities(_portletId)).done(function (availabilitySlots) {
            var duplicateOnStartTime = $(availabilitySlots).filter(function () {
                var existingTimeSlot = $(this)[0];
                return existingTimeSlot.dayOfTheWeek === timeSlot.dayOfTheWeek &&
                    moment(existingTimeSlot.start, moment.ISO_8601).isSame(moment(timeSlot.start, "MM/DD/YYYY hh:mm a")) && 
                    moment(existingTimeSlot.end, moment.ISO_8601).isSame(moment(timeSlot.end, "MM/DD/YYYY hh:mm a")) &&
                    existingTimeSlot.availabilityId !== timeSlot.availabilityId;
            });
            if (duplicateOnStartTime.length > 0) {
                $.when(resourceManager.Templates.getValidationMessageTemplate()).done(function(template) {
                    var html = template({ message: _globalizer.duplicateTimeInterval });
                    validationPromise.resolve({
                        valid: false,
                        messageHtml: html
                    });
                });
            } else {
                validationPromise.resolve({valid: true});
            }

        });
        return validationPromise.promise();
    };
    validator.noConflict = function (timeSlot) {
        var validationPromise = $.Deferred();

        $.when(resourceManager.ChatAvailability.getChatAvailabilities(_portletId)).done(function (availabilitySlots) {
            var timeSlotsOftheSameDay = $(availabilitySlots).filter(function () {
                 var existingTimeSlot = $(this)[0];
                 return existingTimeSlot.dayOfTheWeek === timeSlot.dayOfTheWeek && existingTimeSlot.availabilityId !== timeSlot.availabilityId;
            });
            var isValid = true;
            var message = _globalizer.conflict;
            $(timeSlotsOftheSameDay).each(function() {
                var currentTimeSlot = $(this)[0];
                var existingTimeStart = moment(currentTimeSlot.start, moment.ISO_8601);
                var existingTimeEnd = moment(currentTimeSlot.end, moment.ISO_8601);
                var timeToBeAddedStart = moment(timeSlot.start, "MM/DD/YYYY hh:mm a");
                var timeToBeAddedEnd = moment(timeSlot.end, "MM/DD/YYYY hh:mm a");
                if (currentTimeSlot.allDay) {
                    isValid = false;
                    message = _globalizer.alldayEventExist;
                }
                if (timeToBeAddedEnd.isBetween(existingTimeStart, existingTimeEnd)) {
                    isValid = false;
                }
                if (timeToBeAddedStart.isBetween(existingTimeStart, existingTimeEnd)) {
                    isValid = false;
                };
                if (existingTimeStart.isBetween(timeToBeAddedStart, timeToBeAddedEnd)) {
                    isValid = false;
                };
                if (existingTimeEnd.isBetween(timeToBeAddedStart, timeToBeAddedEnd)) {
                    isValid = false;
                };
                
            });

            if (isValid) {
                validationPromise.resolve({ valid: true });
            } else {
                $.when(resourceManager.Templates.getValidationMessageTemplate()).done(function (template) {
                    var html = template({ message: message});
                    validationPromise.resolve({
                        valid: false,
                        messageHtml: html
                    });
                });
            }
        });
        return validationPromise.promise();
    };
    validator.isValidInterval = function (startTime, endTIme) {
        var timeFormat = "MM/DD/YYYY hh:mm a";
        var validationPromise = $.Deferred();
        var validInterval = moment(startTime, timeFormat, true).isBefore(moment(endTIme,timeFormat, true)) &&
            !moment(startTime, timeFormat, true).isSame(moment(endTIme, timeFormat, true));
        if (validInterval) {
            validationPromise.resolve({ valid: true });
        } else {
            $.when(resourceManager.Templates.getValidationMessageTemplate()).done(function (template) {
                var html = template({ message: _globalizer.notValidTimeInterval });
                validationPromise.resolve({
                    valid: false,
                    messageHtml: html
                });
            });
        }

        return validationPromise.promise();
    };
    validator.isValidTime = function (timeSpan, timeFormat) {
        
        var validationPromise = $.Deferred();
        if (!moment(timeSpan, timeFormat, true).isValid()) {
            $.when(resourceManager.Templates.getValidationMessageTemplate()).done(function(template) {
                var html = template({ message: _globalizer.notValidTime });
                validationPromise.resolve({
                    valid: false,
                    messageHtml: html
                });
            });
        } else {
            validationPromise.resolve({valid: true});
        }
        
        return validationPromise.promise();
    };
    validator.isValid = function (timeSlot) {
        var validationFailed = false;
        var validationPromise = $.Deferred();
        $.when(validator.isValidTime(timeSlot.start, "MM/DD/YYYY hh:mm a")).done(function (result) {
            if (!result.valid && !validationFailed) {
                validationFailed = true;
                validationPromise.resolve(result);
            }
        });
        $.when(validator.isValidTime(timeSlot.end, "MM/DD/YYYY hh:mm a")).done(function (result) {
            if (!result.valid && !validationFailed) {
                validationFailed = true;
                validationPromise.resolve(result);
            }
        });
        $.when(validator.isValidInterval(timeSlot.start, timeSlot.end)).done(function (result) {
            if (!result.valid && !validationFailed) {
                validationFailed = true;
                validationPromise.resolve(result);
            }
        });
        $.when(validator.noConflict(timeSlot)).done(function (result) {
            if (!result.valid && !validationFailed) {
                validationFailed = true;
                validationPromise.resolve(result);
            } else {
                $.when(validator.isDuplicate(timeSlot)).done(function (result) {

                    if (!result.valid) {
                        validationFailed = true;
                        validationPromise.resolve(result);
                    } else {
                        validationPromise.resolve({ valid: true });
                    }
                });
            }
        });
        return validationPromise.promise();
    }
    validator.load = function (portletId) {
        var loader = $.Deferred();
        _portletId = portletId;
        $.when(resourceManager.Globalizer.getGlobalizations).done(function (globalizer) {
            _globalizer = globalizer;
            loader.resolve();
        });
        return loader.promise();
    }
})(jenzabar.ChatPortlet.Validator = {},moment, jQuery, jenzabar.ChatPortlet.ResourceManager);