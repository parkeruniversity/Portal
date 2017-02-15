window.jQuery = window.jQuery || window.$;
window.jenzabar = window.jenzabar || {};
jenzabar.ChatPortlet = jenzabar.ChatPortlet || {};

(function (chatAvailabilityMessageEditor, $, resourceManager) {
    var selectors = {

        messageEditor: {
            editButton: '#editvalidationMessage',
            portlet: {
                portletId: 'portletid'
            },
            chatAvailabilityMessageEditorContainer: '#chatAvailabilityMessageEditorContainer',
            availabilityMessageEditorTextArea: '#chatAvailabilityMessageEditorTextArea',
            availabilityMessageEditor: '#chatAvailabilityMessageEditor',
            chatAvailabilityMessage: '#chatAvailabilityMessage',
            updateAvailabilityMessage:'#updateAvailabilityMessage'
        }

    };
    var clearContent = function() {
        $(selectors.messageEditor.availabilityMessageEditor).html('');
    }
    chatAvailabilityMessageEditor.load = function (globalizer) {
        var portletId = $(selectors.messageEditor.availabilityMessageEditor).data(selectors.messageEditor.portlet.portletId);
        $.when(resourceManager.Templates.getAvailabilityMessageTemplate()).done(function(template) {
            $.when(resourceManager.AvailabilityMessage.getAvailabilityMessage(portletId)).done(function (settings) {
                var html = template({ 'globalizer': globalizer, 'message': settings.message });
                $(selectors.messageEditor.availabilityMessageEditor).append(html);
                $(selectors.messageEditor.editButton).on('click', function() {
                    clearContent();
                    chatAvailabilityMessageEditor.loadEditMode(globalizer);
                });
             });
        });
    };
    chatAvailabilityMessageEditor.loadEditMode = function (globalizer) {
        var portletId = $(selectors.messageEditor.availabilityMessageEditor).data(selectors.messageEditor.portlet.portletId);
        $.when(resourceManager.Templates.getAvailabilityMessageEditorTemplate()).done(function (template) {
            $.when(resourceManager.AvailabilityMessage.getAvailabilityMessage(portletId)).done(function(settings) {
                var html = template({ 'globalizer': globalizer });
                $(selectors.messageEditor.availabilityMessageEditor).append(html);
                // ReSharper disable once UseOfImplicitGlobalInFunctionScope
                textEditor.create($(selectors.messageEditor.availabilityMessageEditorTextArea), {
                    height: 80,
                    initInstanceCallback : function(editor) {
                        editor.setContent(settings.message);
                    }
                });
                $(selectors.messageEditor.updateAvailabilityMessage).on('click', function () {
                    $.when(resourceManager.AvailabilityMessage.updateAvailabilityMessage(portletId, $(selectors.messageEditor.availabilityMessageEditorTextArea).val())).done(function() {
                        $(selectors.messageEditor.availabilityMessageEditorTextArea).tinymce().destroy();
                        clearContent();
                        chatAvailabilityMessageEditor.load(globalizer);
                    });                 
                });
            });          
        });
    };
})(jenzabar.ChatPortlet.ChatAvailabilityMessageEditor = {},$,jenzabar.ChatPortlet.ResourceManager)