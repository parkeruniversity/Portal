
window.jenzabar = window.jenzabar || {};
jenzabar.ChatPortlet = jenzabar.ChatPortlet || {};
(function (chatError, $) {
    "use strict";
    chatError.PublishErrorMessage = function (portletId, errorMessage) {
     var errorHtml = $("<div />").text(errorMessage).html();
      $("div[attribute='" + portletId + "']")
      .find("#errorMessage > #errorMessageContainer")
      .append("<li>" + errorHtml + "</li>");
    };

    chatError.Clear = function(portletId) {
        $("div[attribute='" + portletId + "']")
        .find("#errorMessage > #errorMessageContainer")
        .html("");
    };
}(jenzabar.ChatPortlet.ChatError = {}, jQuery));