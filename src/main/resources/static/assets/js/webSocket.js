var chatSocket = new WebSocket("ws://" + window.location.host + "/chat");
chatSocket.onopen = function () {
    sender
};
chatSocket.onmessage = function (event) {
    var chatMessage = JSON.parse(event.data);
    console.log(chatMessage);

    var messageElement = $('<div>').addClass('message');
    if (chatMessage.sender === sender) {
        messageElement.addClass('sent');
    } else {
        messageElement.addClass('received');
    }

    var profilePic = $('<img>').attr('src', 'profile.png').addClass('profile-pic');
    var messageContent = $('<div>').addClass('message-content');
    var senderName = $('<span>').addClass('sender-name').text(chatMessage.sender);
    var messageText = $('<div>').text(chatMessage.message);
    var timestamp = $('<div>').addClass('timestamp').text(new Date().toLocaleTimeString());

    messageContent.append(senderName);
    messageContent.append(messageText);

    if (chatMessage.sender === sender) {
        messageElement.append(timestamp);
        messageElement.append(messageContent);
        messageElement.append(profilePic);
    } else {
        messageElement.append(profilePic);
        messageElement.append(messageContent);
        messageElement.append(timestamp);
    }

    var chatMessages = $('.chat-messages');
    chatMessages.append(messageElement);
    chatMessages.scrollTop(chatMessages[0].scrollHeight);
};

chatSocket.onclose = function () {
    console.log("Disconnected from the chat server");
};

function sendMessage(type, message, sender, room) {
    var chatMessage = {
        type: type,
        message: message,
        sender: sender,
        room: room
    };

    ws.send(JSON.stringify(chatMessage));
}