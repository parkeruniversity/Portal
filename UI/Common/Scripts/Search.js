/* Search objects 
    searchBox - functions for the search box.   
*/

/*jslint
    ass:        true,   browser:    true,   nomen:  true,
    plusplus:   true,   todo:       true,   white:  true
*/

/*global jQuery, searchBox, urlUtil*/

// searchBox
(function (searchBox, $) {
    'use strict';

    function getAutoCompleteRequestObject() {
        var data = {
            "Terms": $('#' + searchBox.textBox).val(),
            "UserId": searchBox.userId,
            "MaxNumberOfResults": 10
        };
        return JSON.stringify(data);
    }

    function getWebServicePath() {
        var base = "api/autocomplete?request=", json = getAutoCompleteRequestObject();
        return base + json;
    }

    function autocompleteAjaxSuccess(data, response) {
        response($.map(data.results, function (item) {
            return {
                label: item,
                value: item
            };
        }));
    }

    function setAdvancedLinkClick() {
        $(".advancedSearchLink").click(advancedLinkClick);
    }
    
    function advancedLinkClick() {
        $(this).prev(".advancedSearchContent").slideToggle(200);
        var selected = $('#' + searchBox.showHideLabel).text();
        $('#' + searchBox.showHideLabel).text(selected === "Show" ? 'Hide' : 'Show');
        if (selected === "Show") {
            $(".advancedSearchLink").css('background', 'url(UI/Common/images/PortletImages/Icons/wedge-up.gif) center left no-repeat');
        } else { $(".advancedSearchLink").css('background', 'url(UI/Common/images/PortletImages/Icons/wedge-down.gif) center left no-repeat'); }
    }
    
    searchBox.initAutoComplete = function () {
        $("#" + searchBox.textBox).autocomplete({
            source: function (request, response) {
                $.ajax({
                    url: urlUtil.getAppRoot() + getWebServicePath(),
                    dataType: "json",
                    success: function (data) {
                        autocompleteAjaxSuccess(data, response);
                    }
                });
            },
            minLength: 2,
            width: 150,
            select: searchBox.autoCompleteSelect,
            appendTo: ".searchAutoComplete"
        });

        searchBoxOnLoad();
        setAdvancedLinkClick();
    };

    function searchBoxOnLoad() {
        var i = 0, cb = document.getElementById(searchBox.includePastCheckBox), searchParam = getQueryStringVariable("query"), processddls = searchBox.showInSideBar, show = false, whereParam = getQueryStringVariable("where"), includeparam = getQueryStringVariable("includePastFutureCourses"), whatParam = getQueryStringVariable("what"), dd = document.getElementById(searchBox.whatDropDown);

        if (searchParam !== null) {
            document.getElementById(searchBox.textBox).value = searchParam;
            document.getElementById(searchBox.textBox).style.color = "#000000";
        } else if (document.getElementById(searchBox.textBox).value === "Search...") {
            document.getElementById(searchBox.textBox).style.color = "#808080";
        }

        if (processddls === "True" || processddls === "true") {
            if (whereParam !== null) {
                for (i = 0; i < dd.options.length; i++) {
                    if (dd.options[i].value === whereParam) {
                        dd.selectedIndex = i;
                        break;
                    }
                }
                if (whereParam !== "Everywhere")
                { show = true; }
            }

            if (whatParam !== null) {
                dd = document.getElementById(searchBox.whatDropDown);
                for (i = 0; i < dd.options.length; i++) {
                    if (dd.options[i].value === whatParam) {
                        dd.selectedIndex = i;
                        break;
                    }
                }
                if (whatParam !== "Everything")
                { show = true; }
            }

            if (includeparam !== null) {
                cb.checked = true;
                if (includeparam === "true") {
                    show = true;
                }
            }

            if (show !== true) {
                $(".advancedSearchContent").hide();
                $(".advancedSearchLink").css('background', 'url(UI/Common/images/PortletImages/Icons/wedge-down.gif) center left no-repeat');
                $(searchBox.showHideLabel).text('Show');
            } else {
                $(".advancedSearchLink").css('background', 'url(UI/Common/images/PortletImages/Icons/wedge-up.gif) center left no-repeat');
                $(searchBox.showHideLabel).text('Hide');
            }
        }
    };

    searchBox.searchClick = function () {
        var searchBoxValue = document.getElementById(searchBox.textBox).value;
        if (searchBoxValue === 'Search...' || searchBoxValue === '') {
            return false;
        }
        return true;
    };

    searchBox.validate = function () {
        console.log("validate");
        if (document.getElementById(searchBox.textBox).value === "" || document.getElementById(searchBox.textBox).value === "Search...") {
            document.getElementById(searchBox.textBox).focus();
            return false;
        }
        console.log("valid");
        return true;
    };

    searchBox.cleardefault = function () {
        if (document.getElementById(searchBox.textBox).value === "Search...") {
            document.getElementById(searchBox.textBox).value = "";
            document.getElementById(searchBox.textBox).style.color = "#000000";
            return false;
        }
        return true;
    };

    searchBox.restoredefault = function () {
        if (document.getElementById(searchBox.textBox).value === "") {
            document.getElementById(searchBox.textBox).value = "Search...";
            document.getElementById(searchBox.textBox).style.color = "#808080";
            return false;
        }
        return true;
    };

}(window.searchBox = window.searchBox || {}, jQuery));