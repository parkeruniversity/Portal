/* Text Editor - window.textEditor */

/*jslint
    ass:        true,   browser:    true,   nomen:  true,
    plusplus:   true,   todo:       true,   white:  true
*/

/*global jQuery, urlUtil, ajaxUtil, stringUtil, tinymce */

(function(te, $) {
    'use strict';

    // Private vars.
    var root = urlUtil.getAppRoot(),
        activeCheckStarted = false,
        isActive = false;

    // Public vars.
    te.stdTbr1 = "fontselect fontsizeselect | bold italic underline | forecolor backcolor | removeformat";
    te.stdTbr2 = "alignleft aligncenter alignright alignjustify | bullist numlist | link unlink | image insertfile | charmap emoticons | code print";
    te.simpleTbr = "bold italic underline | bullist numlist";

    te.plugins = [
        "advlist autolink link image lists charmap print preview hr anchor pagebreak",
        "searchreplace visualblocks visualchars code insertdatetime media nonbreaking",
        "table directionality emoticons template textcolor paste moxiemanager placeholder"
    ];

    te.Globalization = {};
    te.Globalization.SizeLimitExceeded = 'Length limit exceeded: {0} over the limit of {1} characters (including HTML markup).';

    te.defaultSettings = {
        script_url: root + 'UI/Common/Scripts/tinymce/tinymce.min.js',
        browser_spellcheck: true,
        gecko_spellcheck: true,
        encoding: "xml",
        document_base_url: root,
        relative_urls: false,
        height: '300',
        convert_urls: false,
        image_caption: true,
        extended_valid_elements: 'script[charset|defer|language|src|type]',

        setup: function(ed) {
            ed.on('keyup', function() {
                isActive = true;
                te.checkSizeLimit(ed);
            });
        }
    };

    // Private methods.
    function keepSessionAlive() {
        ajaxUtil.callAsmxWebService('services/sessionkeepalive.asmx/Ping');
        isActive = false;
    }

    function checkIfActive() {
        if (isActive) {
            keepSessionAlive();
        }
        setTimeout(checkIfActive, 60000);
    }

    function decodeHtmlEntities(text) {
        var i,
            max,
            entities = [
                ['apos', '\''],
                ['amp', '&'],
                ['lt', '<'],
                ['gt', '>'],
                ['quot', '\"']
            ];

        if (text === null) {
            text = "";
        }
        for (i = 0, max = entities.length; i < max; i++) {
            text = text.replace(new RegExp('&' + entities[i][0] + ';', 'g'), entities[i][1]);
        }

        return text;
    }

    // Public methods.
    te.create = function (textArea, options) {
        if (!activeCheckStarted) {
            activeCheckStarted = true;
            setTimeout(checkIfActive, 60000);
        }
        te.currentTextArea = textArea;
        if (options === undefined) {
            options = {};
        }

        textArea.tinymce(te.getSettings(options));
    };

    te.destroy = function (textArea) {
        textArea.tinymce().remove();
    };

    te.submitPartialPostback = function () {
        tinymce.triggerSave(false, true);
    };

    //For UpdatePanel partial postback
    te.reattach = function (textArea) {
        te.reattachTxt(textArea, textArea.val());
    };

    te.exists = function (textArea) {
        return !(textArea.tinymce() === null);
    };

    te.focus = function (textArea) {
        //have to explecitly fire the focus effect
        //so that the plugings which are listing to it have a chance to react to the event. 
        textArea.tinymce().focus();
        textArea.tinymce().fire('focus');
    }
    
    te.reattachTxt = function (textArea, txt)
    {
        if (textArea.tinymce() === null) {
            te.create(textArea);
            return;
        }
        
        textArea.tinymce().remove();
        textArea.val(decodeHtmlEntities(txt));
        te.create(textArea);
    };
    
    te.getSettings = function (options) {
        var previousSetup;
        var settings = te.getCopyOfDefaultSettings();
        te.getToolbars(settings, options);
        te.getPlugins(settings, options);
        if (options.initInstanceCallback) {
            settings.init_instance_callback = options.initInstanceCallback;
        }
        if (options.contentCss) {
            settings.content_css = options.contentCss;
        }
        if (options.bodyClass) {
            settings.body_class = options.bodyClass;
        }
        if (options.width) {
            settings.width = options.width;
        }
        if (options.height) {
            settings.height = options.height;
        }
        if (typeof (options.forced_root_block) != 'undefined') {
            settings.forced_root_block = options.forced_root_block;
        }
        if (typeof (options.forced_p_newlines) != 'undefined') {
            settings.force_p_newlines = options.forced_p_newlines;
        }
        if (typeof (options.force_br_newlines) != 'undefined') {
            settings.force_br_newlines = options.force_br_newlines;
        }
        if (options.inline) {
            settings.inline = options.inline;
        }
        if (options.min_height) {
            settings.min_height = options.min_height;
        }if (options.max_height) {
            settings.max_height = options.max_height;
        }
        if (typeof (options.resize) != "undefined") {
            settings.resize = options.resize;
        }
        if (options.encoding) {
            settings.encoding = options.encoding;
        }
        if (options.autoFocus) {
            previousSetup = settings.setup;

            settings.setup = function (ed) {
                ed.on('init', function () {
                    ed.focus();
                });

                if (previousSetup) previousSetup(ed);
            }
        }
        if (options.clickOnEnter) {
            previousSetup = settings.setup;

            settings.setup = function (ed) {
                ed.on('keydown', function (e) {
                    // we need to focus to the text area
                    // and raise the event. The plugins
                    // listening to this event will act apropiatly
                    ed.fire('focus');
                    if (e.shiftKey && e.keyCode === 13) {
                        return;
                    }
                    if (e.keyCode === 13) {
                        e.preventDefault();
                        $(options.clickOnEnter).click();
                    }
                });

                if (previousSetup) previousSetup(ed);
            }
        }
        if (options.allowedTagSet) {
            te.getAllowedTagSet(settings, options);
        }
        return settings;
    };

    te.getCopyOfDefaultSettings = function () {
        return $.extend({}, te.defaultSettings);
    };

    te.getAllowedTagSet = function (settings, options) {
        if (te.getCustomAllowedTagSet(settings, options)) return;
        switch (options.allowedTagSet) {
            case 'chat':
                settings.valid_elements = 'p,br,strong/b,em/i,span[!style="text-decoration: underline;"]';
                break;
            case 'simple':
                console.log('test');
                settings.valid_elements = 'p,br,strong/b,em/i,span[!style="text-decoration: underline;"],ul[style],ol[style],li';
                break;
            default:
                console.log('Unrecognized allowedTagSet value in JICS textEditor options: ' + options.allowedTagSet);
                break;
        }
    };

    te.getCustomAllowedTagSet = function(settings, options) {
        return false;
    }

    te.getToolbars = function (settings, options) {
        if (te.getCustomToolbars(settings, options)) return;
        settings.menubar = false;
        switch (options.layout) {
            case 'chat':
                te.currentTextArea.parent().addClass('teSimpleLayout');
                settings.toolbar1 = "bold italic underline";
                return;
            case 'simple':
                te.currentTextArea.parent().addClass('teSimpleLayout');
                settings.toolbar1 = te.simpleTbr;
                return;
            case 'wide':
                settings.toolbar1 = te.stdTbr1 + ' | ' + te.stdTbr2;
                return;
            default:
                settings.toolbar1 = te.stdTbr1;
                settings.toolbar2 = te.stdTbr2;
                return;
        }
    };

    te.getCustomToolbars = function (settings, options) {
        return false;
    }

    te.getPlugins = function (settings, options) {
        if (te.getCustomPlugins(settings, options)) return;
        switch (options.layout) {
            case 'chat':
            case 'simple':
                settings.plugins = te.plugins;
                return;
            default:
                te.plugins[te.plugins.length] = "wordcount";
                settings.plugins = te.plugins;
                return;
        }
    };

    te.getCustomPlugins = function (settings, options) {
        return false;
    }

    te.checkSizeLimit = function(ed) {
        var max,
            count = ed.getContent().length,
            edElem = $(ed.getElement()),
            msgElem = $('#' + ed.id + '-sl');
        
        if (edElem.attr('maxlength') && count > edElem.attr('maxlength')) {
            max = edElem.attr('maxlength');
            if (msgElem.length === 0) {
                edElem.after('<p id="' + ed.id + '-sl" class="teLimitMsg">'
                    + stringUtil.format(te.Globalization.SizeLimitExceeded, count - max, max) + '</p>');
            } else {
                msgElem.text(stringUtil.format(te.Globalization.SizeLimitExceeded, count - max, max));
            }
            edElem.parent().addClass('teLimitExceeded');
        } else {
            if (msgElem.length > 0) {
                msgElem.empty();
            }
            edElem.parent().removeClass('teLimitExceeded');
        }
    };

    te.decodeForHtmlDisplay = function(txt) {
        return txt != null && txt.length > 0 ? $('<div>').html(txt).text() : '';
    };

    te.addBulletsToText = function(txt) {
        var editableElement = $('<div />').html(txt);
        editableElement.find('ul, ol, li').addClass('withBullets');
        return editableElement.html();
    };

}(window.textEditor = window.textEditor || {}, jQuery));