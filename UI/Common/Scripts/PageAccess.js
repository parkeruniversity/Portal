/*jslint
    browser: true, white: true
*/
/*global Sys,jQuery, moxman, jenzabar */

window.jenzabar.framework.PageAccess = window.jenzabar.framework.PageAccess || {};
// PageAccess
(function (pa, $) {
    'use strict';
    /**
    *  Moves the side panel of the page access to the selected role. 
    * @param JQuery Object Element actionElement, 
    * @param JQuery Object Element selectedButtonElement,
    * @param JQuery Object Element endOfPageReferenceElement,
    * @param JQuery Object Element actionWithAccessElement
    * @return void
    */
    pa.moveSidePanelBasedOnSelection = function (actionElemnet, selectedButtonElement, endOfPageReferenceElement, actionWithAccessElement) {

        if (selectedButtonElement.position().top - endOfPageReferenceElement.position().top - $(actionElemnet).height() / 2 > 0) {
            actionWithAccessElement.css(
            {
               "margin-top": selectedButtonElement.position().top - endOfPageReferenceElement.position().top - $(actionWithAccessElement).height() / 2
            });
            actionElemnet.css(
            {
                "margin-top": selectedButtonElement.position().top - endOfPageReferenceElement.position().top - $(actionElemnet).height() / 2
            });
        }
    };

    /**
    *  Initiates the modul which manages the position of the side panel in the page access page. 
    */
    pa.Init = function () {
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        if (prm !== 'undefined') {
            // We want to move the panel after the panel has been updated. 
            prm.add_endRequest(function () {
                var $actionElement, $selectedButtonElement, $endOfPageReferenceElement, $actionWithAccessElement,
                    $contextActionElemnet, $contextSelectedButtonElement, $contextEndOfPageReferenceElement, $contextActionWithAccessElement;

                $actionElement = $('[id*=pageGlobalPermissions].accessActions');
                $selectedButtonElement = $('a[id*=pageGlobalPermissions].selected');
                $endOfPageReferenceElement = $('#CP_V_pageGlobalPermissions_pageAccessRoleMenu');
                $actionWithAccessElement = $('[id*=pageGlobalPermissions].accessActions.canAccess');

                if ($selectedButtonElement.length > 0) {
                    pa.moveSidePanelBasedOnSelection($actionElement, $selectedButtonElement,
                        $endOfPageReferenceElement, $actionWithAccessElement);
                }

                $contextActionElemnet = $('[id*=pageContextPermissions].accessActions');
                $contextSelectedButtonElement = $('a[id*=pageContextPermissions].selected');
                $contextEndOfPageReferenceElement = $('#CP_V_pageContextPermissions_pageAccessRoleMenu');
                $contextActionWithAccessElement = $('[id*=pageContextPermissions].accessActions.canAccess');

                if ($contextSelectedButtonElement.length > 0) {
                    pa.moveSidePanelBasedOnSelection($contextActionElemnet, $contextSelectedButtonElement,
                        $contextEndOfPageReferenceElement, $contextActionWithAccessElement);
                }
            });
        }
    };
}(window.jenzabar.framework.PageAccess, jQuery));

jQuery(document).ready(function () {
    'use strict';
    window.jenzabar.framework.PageAccess.Init();
});
