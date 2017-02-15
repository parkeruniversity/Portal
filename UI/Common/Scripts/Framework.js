/* Framework objects 
    stringUtil - string manipulation.
    urlUtil - url manipulation.
    portalSettings - portal-wide config settings.
    ajaxUtil - calling asmx web services.
    timeoutWarning - session timeout warning UI and interaction.
    fileChooser - turns a text input into a file chooser.
*/

/*jslint
    browser: true, white: true
*/

/*global jQuery, moxman, jenzabar */

// framework namespace
window.jenzabar = window.jenzabar || {};
jenzabar.framework = jenzabar.framework || {};

// stringUtil
window.stringUtil = {};
jenzabar.framework.stringUtil = window.stringUtil;
(function (su) {
    'use strict';

    su.format = function (format) {
        var i, max, reg;

        for (i = 0, max = arguments.length - 1; i < max; i += 1) {
            reg = new RegExp("\\{" + i + "\\}", "gm");
            format = format.replace(reg, arguments[i + 1]);
        }
        return format;
    };

    su.splitFormat = function(format) {
	if (!format) return [];

        var reg = new RegExp("\\{[0-9]+?\\}", "gm");
        return format.split(reg);
    }
}(jenzabar.framework.stringUtil));

// urlUtil
window.urlUtil = {};
jenzabar.framework.urlUtil = window.urlUtil;
(function (uu) {
    'use strict';

    uu.getAppRoot = function () {
        var pathTokens = location.pathname.split('/');
        if (pathTokens.length > 1) {
            return '/' + pathTokens[1] + '/';
        }

        return '/ICS/';
    };
}(jenzabar.framework.urlUtil));

// portalSettings
window.portalSettings = {};
jenzabar.framework.portalSettings = window.portalSettings;
(function (ps) {
    'use strict';

    ps.webApiRootUrl = jenzabar.framework.urlUtil.getAppRoot() + 'api/';
    ps.emberRestRootUrl = ps.webApiRootUrl.substring(1, ps.webApiRootUrl.length - 1);
    ps.rpcRootUrl = jenzabar.framework.urlUtil.getAppRoot() + 'rpc/';
    ps.globalizerWebServiceUrl = ps.webApiRootUrl + "globalization/" ;
    ps.portletSettingsWebServiceUrl = ps.webApiRootUrl + "portletSettings/";
}(jenzabar.framework.portalSettings));


// ajaxUtil
window.ajaxUtil = {};
jenzabar.framework.ajaxUtil = window.ajaxUtil;
(function (au, $) {
    'use strict';

    au.callAsmxWebService = function (webService, data, callback, failureAction) {
        $.ajax({
            type: 'POST',
            url: webService,
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(data),
            dataType: 'json',
            success: callback,
			error: failureAction
        });
    };

    au.callSynchronousAsmxWebService = function (webService, data, callback, failureAction) {
        $.ajax({
            type: 'POST',
            url: webService,
            async: false,
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(data),
            dataType: 'json',
            success: callback,
            error: failureAction
        });
    };
}(jenzabar.framework.ajaxUtil, jQuery));

// timeoutWarning
jenzabar.framework.timeoutWarning = {};
(function (tw, $) {
    'use strict';

    // Private vars.
    // Predefining two functions that call each other with a setTimeout to avoid jslint warnings.
    var updateWarning, checkIfActive, timeoutAction;

    // Public vars.
    tw.warningModal = '<div id="twModal" title="{0}"></div>';
    tw.glob = {};
    tw.defaultSettings = {
        globUrl: jenzabar.framework.urlUtil.getAppRoot() + "api/globalization/timeoutwarning",
        sessionExpiresUrl: jenzabar.framework.urlUtil.getAppRoot() + ".sessionheartbeat",
        timeoutWarningTime: 1 * 60000
    };
    
    // Private methods.
    function stayLoggedIn() {
        clearTimeout(timeoutAction);
        jenzabar.framework.ajaxUtil.callAsmxWebService('services/sessionkeepalive.asmx/Ping');
        setTimeout(checkIfActive, 65000);
    }
    
    function timeoutRedirect() {
        jenzabar.framework.ajaxUtil.callAsmxWebService('services/sessionkeepalive.asmx/Logout', undefined,
            function () { window.location = jenzabar.framework.urlUtil.getAppRoot(); });
    }

    updateWarning = function (data) {
        if (data === 'refresh') {
            stayLoggedIn();
            return;
        }

        var msToTimeout = parseFloat(data);

        if (msToTimeout < tw.defaultSettings.timeoutWarningTime) {
            $('#twModal')
                .html(tw.glob.inactiveAlert)
                .dialog('open')
                .dialog('moveToTop');
            timeoutAction = setTimeout(timeoutRedirect, msToTimeout); 
        } else {
            setTimeout(checkIfActive, 60000);
        }
    };

    checkIfActive = function() {
        $.ajax({
            url: tw.defaultSettings.sessionExpiresUrl
        }).done(updateWarning);
    };

    // Public methods.
    tw.create = function () {
        $.ajax({
            url: tw.defaultSettings.globUrl
        }).then(function(response) {
            tw.glob = response;
            $('body').append(jenzabar.framework.stringUtil.format(tw.warningModal,
                tw.glob.stillThere));
            var dialogButtons = {};
            dialogButtons[tw.glob.stayLoggedIn] = function () {
                stayLoggedIn();
                $(this).dialog("close");
            };
            dialogButtons[tw.glob.logoutNow] = function () {
                location.href = $('#logout').attr('href');
            };
            $("#twModal").dialog({
                autoOpen: false,
                modal: true,
                width: 500,
                buttons: dialogButtons
            });
            setTimeout(checkIfActive, 65000); // Add 5 sec so won't "just miss" modal at warning time.
        });
    };
}(jenzabar.framework.timeoutWarning, jQuery));

// fileChooser
jenzabar.framework.fileChooser = {};
(function (fc, $) {
    'use strict';

    fc.create = function (fileUrl, fcOptions) {
        var minimumWindowSize = 550,
            uniqueId = Math.random().toString().substring(2),
            chooserHtml;

        if (fileUrl.prev().hasClass("file-chooser")) {
        	return fileUrl.prev().find(".choose-file");
        }

	    if (!fcOptions) fcOptions = {};

        chooserHtml = $(
            '<div id="fileChooser-' + uniqueId + '" class="file-chooser">' +
            '	<button type="button" id="fileChooser-button-' + uniqueId + '" class="choose-file">Choose File</button>' +
            '	<span id="fileChooser-fileName-' + uniqueId + '" class="chosen-file-name"></span>' +
            '</div>'
        ).insertBefore(fileUrl);

        chooserHtml
            .find(".choose-file")
            .click(function (event) {
                var isScreenTooSmall = $(window).height() <= minimumWindowSize;
                moxman.browse({
                    fields: fileUrl.attr('id'),
                    multiple: fcOptions.allowMultipleFiles ? true : false,
                    fullscreen: isScreenTooSmall,
                    insert_filter: fcOptions.allowFolders ? null : filterFolderInsert
                });
                event.preventDefault();
            });

        fileUrl
            .hide()
            .change(function () {
                var url, fileName;

                url = $(this).val();
                fileName = decodeURIComponent(url.substr(url.lastIndexOf('/') + 1));

                chooserHtml
                    .find(".chosen-file-name")
                    .text(fileName);
            });

            return fileUrl.prev().find(".choose-file");
    };

	function filterFolderInsert(file) {
		if (!file.isFile) {
			file.url = null;
		}
	}

}(jenzabar.framework.fileChooser, jQuery));

(function ($) {
    'use strict';

	$.fn.inlineLoading = function (options) {
		var _this = $(this),
			_options = options || {},
			_loadingPanel = $('<span class="inlineAsyncLoading"></span>'),
			_defaultMessageKey = 'MSG_INLINE_ASYNC_LOADING',
			_isLoading = false,
			_isDone = true; //need to track the state to avoid timing issues

		this.start = function () {
			_isDone = false;
			_this.prop('disabled', true);

			if (_options.messageText) {
				_loadingPanel.html(_options.messageText)
			}
			else {
				var messageKey = _options.messageKey || _defaultMessageKey;
				$.ajax({
					url: urlUtil.getAppRoot() + "api/globalization?id=" + messageKey,
					success: function (data) {
						_loadingPanel.html(data[messageKey.toLowerCase()]);
					}
				});
			}

			//Avoids a "flicker" effect when the response from server is instant.
			setTimeout(showLoadingText, 200);
		};

		function showLoadingText() {
			if (_isDone) return;

			_this
				.after(_loadingPanel)
				.hide();

			_isLoading = true;
		}

		this.stop = function () {
			if (_isLoading) {
				_loadingPanel.remove();
			}

			_this.show().prop('disabled', false);

			_isLoading = false;
			_isDone = true;
		};

		return this;
	};
}(jQuery));

jenzabar.framework.isFirefox = function () {
    return typeof InstallTrigger !== 'undefined';
}

jenzabar.framework.emberFirefoxFormFix = function() {
    var isFirefox = jenzabar.framework.isFirefox();
    if (isFirefox) {
        __doPostBack = function(eventTarget, eventArgument) {
            if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
                theForm.__EVENTTARGET.value = eventTarget;
                theForm.__EVENTARGUMENT.value = eventArgument;
                $('<button>', { type: 'submit' }).appendTo('form').click();
            }
        }
    }
}

// Create an extension method on String's prototype
String.prototype.endsWith = function (suffix) {
    return this.indexOf(suffix, this.length - suffix.length) !== -1;
};
