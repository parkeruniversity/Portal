
window.jenzabar = window.jenzabar || {};
jenzabar.ChatPortlet = jenzabar.ChatPortlet || {};
jenzabar.ChatPortlet.ChatHubManager = {};




(function (chatHubManager, $, chatRoom) {
    "use strict";

    var selectors = {
        portletContainer :  '.pContent',
        mainViewContainer: "[data-container='chatContainer']",
        portletInfoSelector : {
             portletId : "portlet-id"
        }
    };
    var onChatSessionInit = function () {
        // we are declaring our hub here. 
        var chat = $.connection.chatHub;

        // publishing the client side api to the server.

        chat.client.sendPublicMessage = chatRoom.ShowPublicChatMessage;
        chat.client.updateUsersInSession = chatRoom.UpdateUsersInSession;
        chat.client.loadCurrentSessionActivity = chatRoom.LoadCurrentSessionActivity;
        return chat;
    };

    var onChatSessionStart = function (chatHub) {
        
        // hooking all the events happening on the browser with the coresponding
        // server side methods that need to be called. 

         // When the portlet loads then register the rooms
        $(selectors.portletContainer).find(selectors.mainViewContainer).each(function (index, container) {
            var roomName = $(container).data(selectors.portletInfoSelector.portletId);
            chatHub.server.joinRoom(roomName);
        });
         
        // When the user requests to send a public message on the chat room.
        chatRoom.OnUserRequestToSentPublicMessage(function (sendMessageRequest) {
            chatHub.server.send(sendMessageRequest.roomName, sendMessageRequest.message);
        });

        // When the user's action mean he left the room
        chatRoom.OnUserLeavesRoom(function() {
            chatHub.server.leaveRoom();
        });
    };

    chatHubManager.Load = function () {

        signalRManager.registerHub(onChatSessionInit, onChatSessionStart);
        chatRoom.load();
    };

}(jenzabar.ChatPortlet.ChatHubManager, jQuery, jenzabar.ChatPortlet.ChatRoom));


$(document).ready(function () {
    "use strict";
    window.jenzabar.ChatPortlet.ChatHubManager.Load();

});
