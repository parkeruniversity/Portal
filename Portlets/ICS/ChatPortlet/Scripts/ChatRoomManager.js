
window.jQuery = window.jQuery || window.$;
window.jenzabar = window.jenzabar || {};
jenzabar.ChatPortlet = jenzabar.ChatPortlet || {};

// ReSharper disable once InconsistentNaming
(function (chatRoom, $, Handlebars, serverCommunicationManager) {
    "use strict";

    var selector = {
        chat: {
            mainView: "[data-container='chatContainer'][data-isAvailable='True']",
            portletdata : {
               portletId : "portlet-id"
            },
            session: {
                mainView: "[data-container='session'][data-isAvailable='True']",
                message: {
                    messageSender: "[data-container='messageSender']",
                    sendPublicMessage: "[data-action='sendPublicMessage']",
                    publicMessageTextEditor: "[data-id='messageTextEditor']"     
                },
                users:{
                    mainView: "[data-container='usersInSession'][data-isAvailable='True']",
                    activeUsers: "[data-container='activeUsers']"
                },
                conversation: {
                    mainView: "[data-container='conversation'][data-isAvailable='True']",
                    activity: "[data-container='sessionActivity']"
                }
             }
         }
    };
    
    var getUsersInSessionTemplate = serverCommunicationManager.Templates.getUsersInSessionTemplate;
    var getActivityView = serverCommunicationManager.Templates.getSessionActivityView;
    var getGlobalizer = serverCommunicationManager.Globalizer.getGlobalizations;


    var bindData = function(html, context) {
        var template = Handlebars.compile(html);
        return template(context);
    };
    var setScroller = function() {
        $(selector.chat.session.conversation.mainView).scrollTop($(selector.chat.session.conversation.mainView)[0].scrollHeight);
    };

    chatRoom.load = function () {
        $(selector.chat.session.message.publicMessageTextEditor).each(function (index, editorElement) {

            // the portlet id is the room name which is attached to the DOM element containing the UI for the chat room. 
            var roomName = $($(this).closest(selector.chat.mainView)).data(selector.chat.portletdata.portletId);

            var sendMessageSelector = "[data-portlet-id='" + roomName + "'] *> " + selector.chat.session.message.sendPublicMessage;
            var textEditorSelector = "[data-portlet-id='" + roomName + "'] *> " + selector.chat.session.message.publicMessageTextEditor;

            textEditor.create($(textEditorSelector),
            {
                layout: 'chat',
                resize: true,
                height: 30,
                min_height: 30,
                //need to add this settings so that tinymce doesn't create paragraphs. 
                //we need bullets to be created on shit+enter just they would on regular enter. 
                forced_root_block: false,
                force_p_newlines: true,
                force_br_newlines: false,
                bodyClass: 'chatBody',
                contentCss:"Portlets/ICS/ChatPortlet/Styles/ChatTextEditorContent.css",
                clickOnEnter: sendMessageSelector
            });
        });
    };
    chatRoom.LoadCurrentSessionActivity = function (chatRoomInfo) {

        var chatRoomElement = $(selector.chat.mainView).filter(function () {
            return $(this).data(selector.chat.portletdata.portletId) === chatRoomInfo.roomId;
        });
        var previousMessagesContainer = $(chatRoomElement).find(selector.chat.session.conversation.activity);

        var previousUser;
        var isStart = false;
        var isEnd = false;

        $.when(getActivityView()).then(function (source) {
            $(chatRoomInfo.messages).each(function (index, messageInfo) {
                var previousActivityElement = previousMessagesContainer.find("tr:last");
                if (!previousUser) {
                    previousUser = messageInfo;
                    messageInfo.IsSameUser = false;
                    isStart = !messageInfo.IsSessionInfo;
                } else {
                    if (previousUser.IsSessionInfo !== messageInfo.IsSessionInfo) {
                        previousUser = messageInfo;
                        messageInfo.IsSameUser = false;
                        isStart = !messageInfo.IsSessionInfo;
                    } else {
                        if (previousUser.ChatUserDisplayName !== messageInfo.ChatUserDisplayName) {
                            previousUser = messageInfo;
                            messageInfo.IsSameUser = false;
                            isStart = !messageInfo.IsSessionInfo;
                        } else if (!messageInfo.IsSessionInfo) {
                            messageInfo.ChatUserDisplayName = '';
                            messageInfo.IsSameUser = true;
                            isEnd = !messageInfo.IsSessionInfo;
                        }
                    }
                }
                var activity = { activity: messageInfo };

                var html = bindData(source, activity);
                if (isStart)
                    html = $(html).addClass("start");
                if (isEnd) {
                    $(previousActivityElement).removeClass("end");
                    html = $(html).addClass("end");
                }
                previousMessagesContainer.append(html);
                isEnd = false;
                isStart = false;
            });
            setScroller();
        });
    };
    chatRoom.UpdateUsersInSession = function (chatRoomInfo) {
        $.when(getUsersInSessionTemplate()).then(function (source) {
            $.when(getGlobalizer).then(function (globalizer) {
                
                var html = source({
                    globalizer: globalizer,
                    inSessionUsers: chatRoomInfo.users
                });
                var chatRoomElement = $(selector.chat.mainView).filter(function () {
                    return $(this).data(selector.chat.portletdata.portletId) === chatRoomInfo.roomId;
                });

                $(chatRoomElement).find(selector.chat.session.users.activeUsers).remove();
                $(chatRoomElement).find(selector.chat.session.users.mainView).append(html);
            });
        });
    };

    chatRoom.ShowPublicChatMessage = function (messageInfo) {
        var roomId = messageInfo.PortletId;

        var chatRoomElement = $(selector.chat.mainView).filter(function () {
            return $(this).data(selector.chat.portletdata.portletId) === roomId;
        });

        var previousMessagesContainer = $(chatRoomElement).find(selector.chat.session.conversation.activity);

        var previouListingElement = previousMessagesContainer.find("tr:last");

        previouListingElement.removeClass("lastActivity");

        

        var previousUser = previouListingElement.find("[data-id='user']");
        messageInfo.IsSameUser = previousUser.data('value') === messageInfo.ChatUserDisplayName;

        var activity = { activity: messageInfo };
        $.when(getActivityView()).then(function (source) {
            var html = bindData(source, activity);

            if ( !messageInfo.IsSessionInfo) {
                html = $(html).addClass("lastActivity").addClass("start");
            }
            if (!messageInfo.IsSessionInfo && previousUser.data('value') === messageInfo.ChatUserDisplayName) {
                previouListingElement.removeClass("end");
                html = $(html).addClass("lastActivity").addClass("end");
            }
            previousMessagesContainer.append(html);
            setScroller();
        });
       
    };
    chatRoom.OnUserLeavesRoom = function(eventhandler) {
        //logout doesn't trigger chat hub to have the user leave the chat room.
        $('#logout').click(function () { eventhandler(); });
        $('#pg0_V_adminPageLink').click(function () { eventhandler(); });
    };
    chatRoom.OnUserRequestToSentPublicMessage = function (eventHandler) {

        $(selector.chat.session.message.messageSender).find(selector.chat.session.message.sendPublicMessage).click(function () {
            
            // need to look upward from the send button. This requires that the button be withing the MessageSender container. 
            var publicMessageElement = $(this).closest(selector.chat.session.message.messageSender).find(selector.chat.session.message.publicMessageTextEditor);
            if (publicMessageElement.val() !== '') {
                // the portlet id is the room name which is attached to the DOM element containing the UI for the chat room. 
                var roomName = $($(this).closest(selector.chat.mainView)).data(selector.chat.portletdata.portletId);

                eventHandler({ roomName: roomName, message: publicMessageElement.val() });
                // Clear text box and reset focus for next comment. 
                publicMessageElement.val('');
            }
            textEditor.focus(publicMessageElement);
        });
    };

}(jenzabar.ChatPortlet.ChatRoom = {}, jQuery, Handlebars, jenzabar.ChatPortlet.ResourceManager));