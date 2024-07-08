<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Main</title>
    <!-- Meta -->
    <meta name="description" content="Marketplace for Bootstrap Admin Dashboards">
    <meta name="author" content="Bootstrap Gallery">
    <link rel="canonical" href="https://www.bootstrap.gallery/">
    <meta property="og:url" content="https://www.bootstrap.gallery">
    <meta property="og:title" content="Admin Templates - Dashboard Templates | Bootstrap Gallery">
    <meta property="og:description" content="Marketplace for Bootstrap Admin Dashboards">
    <meta property="og:type" content="Website">
    <meta property="og:site_name" content="Bootstrap Gallery">
    <link rel="shortcut icon" href="/assets/images/favicon.svg">
    <!-- CSS Files -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/assets/fonts/bootstrap/bootstrap-icons.css">
    <link rel="stylesheet" href="/assets/css/main.min.css">
    <!-- Vendor Css Files -->
    <link rel="stylesheet" href="/assets/vendor/overlay-scroll/OverlayScrollbars.min.css">
    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    <!-- Date Range CSS -->
    <link rel="stylesheet" href="/assets/vendor/daterange/daterange.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="/assets/css/default.css">
    <!-- FontAwesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        .chat-container {
            height: 500px;
            display: flex;
            flex-direction: column;
            border: 1px solid #dee2e6;
        }

        .chat-messages {
            flex: 1;
            overflow-y: auto;
            padding: 10px;
            background-color: #ffffff;
            height: 400px;
            max-height: 400px;
        }

        .message {
            display: flex;
            align-items: flex-start;
            margin-bottom: 10px;
        }

        .message.sent {
            justify-content: flex-end;
            text-align: right;
        }

        .message.received {
            justify-content: flex-start;
            text-align: left;
        }

        .profile-pic {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            margin-right: 10px;
        }

        .message.sent .profile-pic {
            margin-right: 0;
            margin-left: 10px;
        }

        .message-content {
            max-width: 70%;
            padding: 10px;
            border-radius: 10px;
            background-color: #f1f0f0;
            position: relative;
        }

        .message.sent .message-content {
            background-color: #dcf8c6;
        }

        .sender-name {
            font-weight: bold;
            margin-bottom: 5px;
        }

        .timestamp {
            font-size: 0.8em;
            color: #999;
            margin-left: 10px;
        }

        .message.sent .timestamp {
            margin-left: 0;
            margin-right: 10px;
        }

        .message-input {
            padding: 10px;
            background-color: #f8f9fa;
            border-top: 1px solid #dee2e6;
        }

        .input-group {
            display: flex;
        }

        .input-group input {
            flex: 1;
            padding: 10px;
            border: 1px solid #dee2e6;
            border-right: none;
            border-radius: 4px 0 0 4px;
        }

        .input-group button {
            padding: 10px;
            border: 1px solid #dee2e6;
            border-left: none;
            border-radius: 0 4px 4px 0;
            background-color: #007bff;
            color: white;
        }

        .chat-date {
            text-align: center;
            font-size: 0.9em;
            color: #999;
            margin: 10px 0;
        }

        .chat-date.sent {
            text-align: right;
        }

        .chat-date.received {
            text-align: left;
        }

        /* Initially hide chat window */
        .chat-window {
            display: none;
        }

        /* Show chat window when a chat room is selected */
        .chat-window.active {
            display: block;
        }

        .search-result, .selected-employees {
            margin-top: 15px;
        }

        .employee-list {
            max-height: 200px;
            overflow-y: auto;
        }

        .employee-item {
            cursor: pointer;
        }

        .employee-item:hover {
            background-color: #f8f9fa;
        }

        .selected-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 5px 0;
        }

        .file-input-wrapper {
            position: relative;
            overflow: hidden;
        }

        .file-input {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            opacity: 0;
            cursor: pointer;
        }

        .file-name {
            font-size: 0.8em;
            color: #999;
            margin-left: 10px;
            align-self: center;
        }

        .delete-button {
            background: none;
            border: none;
            color: red;
            cursor: pointer;
            font-size: 0.8em;
            margin-left: 5px;
            display: none;
        }

        .message-content:hover .delete-button {
            display: block;
        }

        .deleted-message .delete-button {
            display: none;
        }


        .deleted-message {
            color: #999;
            font-style: italic;
        }

    </style>
</head>
<body>
<div class="page-wrapper">
    <div class="main-container">
        <jsp:include page="../sidebar.jsp"/>
        <div class="app-container">
            <div class="app-header d-flex align-items-center">
                <div class="d-flex">
                    <button class="btn btn-outline-primary me-2 toggle-sidebar" id="toggle-sidebar">
                        <i class="bi bi-list fs-5"></i>
                    </button>
                    <button class="btn btn-outline-primary me-2 pin-sidebar" id="pin-sidebar">
                        <i class="bi bi-list fs-5"></i>
                    </button>
                </div>
                <div class="app-brand-sm d-lg-none d-sm-block">
                    <a href="/">
                        <img src="/assets/images/logo-sm.svg" class="logo" alt="Bootstrap Gallery">
                    </a>
                </div>
                <ol class="breadcrumb d-none d-lg-flex ms-3">
                    <li class="breadcrumb-item">
                        <a href="/"><i class="bi bi-house lh-1"></i></a>
                        <a href="/" class="text-decoration-none">메인</a>
                    </li>
                    <li class="breadcrumb-item">
                        <a href="/chat/chat.go" class="text-decoration-none">채팅</a>
                    </li>
                </ol>
                <jsp:include page="../appHeader.jsp"/>
            </div>
            <div class="app-body">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12">
                            <div class="card mb-3">
                                <div class="card-header">
                                    <h4 class="card-title">메신저</h4>
                                </div>
                                <div class="card-body chat-container">
                                    <div class="row h-100">
                                        <div class="col-3 chat-list p-3">
                                            <button class="btn btn-success btn-block mb-3" data-toggle="modal"
                                                    data-target="#newChatModal">새로 만들기
                                            </button>
                                            <input type="text" class="form-control mb-3" placeholder="메시지방, 메시지 검색">
                                            <div class="list-group">
                                                <c:choose>
                                                    <c:when test="${chatRoomList.size() > 0}">
                                                        <c:forEach items="${chatRoomList}" var="room">
                                                            <a href="#"
                                                               class="list-group-item chat-room-list list-group-item-action"
                                                               data-room-idx="${room.roomIdx}"
                                                               data-room-name="${room.roomName}"
                                                               data-room-user-count="${room.roomMemberCount}"
                                                               data-room-last-message="${room.roomLastMessage}">
                                                                <div class="d-flex w-100 justify-content-between">
                                                                    <h5 class="mb-1">${room.roomName}</h5>
                                                                </div>
                                                                <small>
                                                                    <c:choose>
                                                                        <c:when test="${room.roomLastMessage == ''}">
                                                                            메세지가 없습니다.
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <c:choose>
                                                                                <c:when test="${room.roomLastMessage.length() > 7}">
                                                                                    ${room.roomLastMessage.substring(0, 7)}...
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    ${room.roomLastMessage}
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </small>
                                                            </a>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        채팅방을 만들어 주세요
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                        <div class="col-9 d-flex flex-column p-0 position-relative">
                                            <div class="chat-window p-3" id="chatWindow">
                                                <div class="d-flex w-100 justify-content-between border-bottom pb-2 mb-3">
                                                    <small>멤버 <span id="roomUserCount"></span></small>
                                                    <h5 class="mb-1" id="roomName">테스트</h5>
                                                    <button class="btn btn-danger btn-sm" id="leaveRoomButton">방 나가기
                                                    </button>
                                                </div>
                                                <div class="chat-messages" id="message-container">
                                                    <div class="text-center text-muted small my-2">2024.7.1. (월)</div>
                                                    <div class="text-center text-muted small my-2">박채현님이 그룹 메시지방에
                                                        참여합니다.
                                                    </div>
                                                </div>
                                                <div class="message-input p-3">
                                                    <div class="input-group">
                                                        <input type="text" class="form-control" id="messageInput"
                                                               placeholder="메시지를 입력해주세요. (Enter: 전송)">
                                                        <div class="input-group-append">
                                                            <div class="file-input-wrapper btn btn-secondary">
                                                                파일 선택
                                                                <input type="file" id="fileInput" class="file-input">
                                                            </div>
                                                            <button class="btn btn-primary" type="button"
                                                                    onclick="sendMessage()">전송
                                                            </button>
                                                        </div>
                                                        <div id="fileName" class="file-name"></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="text-center p-5" id="selectChatRoomMessage">
                                                <h5>채팅방을 선택해 주세요</h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="app-footer">
                <span>GDJ78FINALPROJECTMYCAB</span>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="newChatModal" tabindex="-1" role="dialog" aria-labelledby="newChatModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="newChatModalLabel">멤버 선택</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12">
                        <input type="text" class="form-control" id="searchInput" placeholder="Search for employees...">
                    </div>
                </div>
                <div class="row search-result">
                    <div class="col-md-12">
                        <div class="employee-list" id="employeeList">
                        </div>
                    </div>
                </div>
                <div class="row selected-employees">
                    <div class="col-md-12">
                        <h6>Selected Employees:</h6>
                        <div id="selectedEmployees">
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary">확인</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="/assets/vendor/overlay-scroll/jquery.overlayScrollbars.min.js"></script>
<script src="/assets/vendor/overlay-scroll/custom-scrollbar.js"></script>
<script src="/assets/js/moment.min.js"></script>
<script src="/assets/vendor/daterange/daterange.js"></script>
<script src="/assets/vendor/daterange/custom-daterange.js"></script>
<script src="/assets/js/custom.js"></script>
<script src="/assets/js/LocalStorage.js"></script>
<script src="/assets/js/showAlert.js"></script>

<script>
    var wsChat = null;
    var selectedRoomId = null;
    var selectedEmployeeIds = new Set(); // Set to track selected employees
    var myId = '${sessionScope.loginId}'; // 로그인한 사용자의 ID

    // Initialize roomInfo and create a mapping from empNo to empName
    var roomInfo = [];
    var empNameMapping = {}; // Mapping for empNo to empName

    <c:forEach items="${chatRoomList}" var="room">
    var empList = [];
    <c:forEach items="${room.empList}" var="emp">
    empList.push({
        empNo: '${emp.emp_no}',
        empName: '${emp.emp_name}',
        empPhoto: '${emp.profile_new}'
    });
    empNameMapping['${emp.emp_no}'] = '${emp.emp_name}'; // Populate the mapping
    </c:forEach>
    roomInfo.push({
        roomIdx: '${room.roomIdx}',
        roomName: '${room.roomName}',
        roomLastMessage: '${room.roomLastMessage}',
        roomLastMessageDate: '${room.roomLastMessageDate}',
        roomUserCount: '${room.roomMemberCount}',
        empList: empList
    });
    </c:forEach>

    $(document).ready(function () {
        populateChatRoomList();

        // Chat room list item click handler
        $(document).on('click', '.chat-room-list', function () {
            $('.list-group-item').removeClass('active');
            $(this).addClass('active');

            selectedRoomId = $(this).data("room-idx");
            var selectedRoomName = $(this).data("room-name");
            var selectedRoomUserCount = $(this).data("room-user-count");

            $('#roomName').text(selectedRoomName);
            $('#roomUserCount').text(selectedRoomUserCount);

            $('#selectChatRoomMessage').hide();
            $('#chatWindow').addClass('active');

            fetchChatMessages();
        });

        // Enter key handler for message input
        $('#messageInput').on("keypress", function (event) {
            if (event.key === "Enter" && $(this).val() !== '') {
                sendMessage();
            }
        });

        // File input change handler
        $('#fileInput').on('change', function (event) {
            var file = event.target.files[0];
            fileUpload(file);
        });

        // Leave room button click handler
        $(document).on('click', '#leaveRoomButton', function () {
            leaveRoom();
        });

        // Implement the search functionality
        $('#searchInput').on('keyup', function () {
            var searchValue = $(this).val().toLowerCase();
            $('#employeeList .employee-item').filter(function () {
                $(this).toggle($(this).text().toLowerCase().indexOf(searchValue) > -1);
            });
        });

        // New chat room creation confirmation
        $('.modal-footer .btn-primary').on('click', function () {
            createChatRoom();
        });
    });

    function populateChatRoomList() {
        var chatRoomListContainer = $('.list-group');
        chatRoomListContainer.empty();

        if (roomInfo.length > 0) {
            roomInfo.forEach(function (room) {
                var roomItem = $('<a href="#" class="list-group-item chat-room-list list-group-item-action"></a>');
                roomItem.data('room-idx', room.roomIdx);
                roomItem.data('room-name', room.roomName);
                roomItem.data('room-user-count', room.roomUserCount);
                roomItem.data('room-last-message', room.roomLastMessage);

                var roomHeader = $('<div class="d-flex w-100 justify-content-between"></div>');
                roomHeader.append('<h5 class="mb-1">' + room.roomName + '</h5>');

                var roomLastMessage = room.roomLastMessage ? room.roomLastMessage : '메세지가 없습니다.';
                var roomMessagePreview = $('<small></small>').text(roomLastMessage.length > 7 ? roomLastMessage.substring(0, 7) + '...' : roomLastMessage);

                roomItem.append(roomHeader);
                roomItem.append(roomMessagePreview);
                chatRoomListContainer.append(roomItem);
            });
        } else {
            chatRoomListContainer.append('채팅방을 만들어 주세요');
        }
    }

    function fetchChatMessages() {
        $.ajax({
            url: '/chat/messages.ajax',
            method: 'GET',
            data: {roomId: selectedRoomId},
            success: function (data) {
                console.log(data);
                var chatMessages = $('#message-container');
                chatMessages.empty();

                if (data && data.messages && Array.isArray(data.messages)) {
                    data.messages.forEach(function (chatMessage) {
                        handleIncomingMessage(chatMessage);
                    });

                    chatMessages.scrollTop(chatMessages[0].scrollHeight);
                    wsChat = chatWebSocketConnect(wsChat);
                } else {
                    console.error('Invalid messages data:', data);
                }
            },
            error: function (error) {
                console.log('Error fetching chat messages:', error);
            }
        });
    }

    function chatWebSocketConnect(ws) {
        if (ws) {
            ws.close();
        }
        ws = new WebSocket("ws://" + window.location.host + "/chat/" + selectedRoomId);
        ws.onmessage = function (event) {
            var chatMessage = JSON.parse(event.data);
            console.log("chatMessage: {}", chatMessage);
            handleIncomingMessage(chatMessage);
        };
        return ws;
    }

    function handleIncomingMessage(chatMessage) {
        var messageElement = $('<div>').addClass('message').attr('data-chat-idx', chatMessage.chatIdx);
        if (chatMessage.sender === myId) {
            messageElement.addClass('sent');
        } else {
            messageElement.addClass('received');
        }

        var profilePic = $('<img>').attr('src', 'profile.png').addClass('profile-pic');
        var messageContent = $('<div>').addClass('message-content');
        var senderName = $('<span>').addClass('sender-name').text(empNameMapping[chatMessage.sender]);
        var timestamp = $('<div>').addClass('timestamp').text(new Date().toLocaleTimeString());

        messageContent.append(senderName);
        if (chatMessage.messageIsDelete) {
            var deletedText = $('<div>').addClass('deleted-message').text('Message deleted');
            messageContent.append(deletedText);
        } else {
            if (chatMessage.type === 'file' && chatMessage.attachments && chatMessage.attachments.length > 0) {
                var file = chatMessage.attachments[0];

                if (file.fileType.startsWith('image')) {
                    var imagePreview = $('<img>').attr('src', '/src/main/resources/static/upload/' + file.fileName).css('max-width', '100%');
                    messageContent.append(imagePreview);
                }
                var fileLink = $('<a>')
                    .attr('href', '/api/download/' + file.fileName)
                    .attr('download', file.fileName)
                    .text('Download ' + file.fileName);
                messageContent.append(fileLink);
            } else {
                var messageText = $('<div>')
                    .addClass('chat-messages-div')
                    .attr('id', chatMessage.chatId)
                    .text(chatMessage.message);
                messageContent.append(messageText);
            }

            if (chatMessage.sender === myId) {
                var deleteButton = $('<button>')
                    .addClass('delete-button')
                    .text('삭제')
                    .click(function () {
                        deleteMessage(chatMessage.chatIdx, chatMessage.type, chatMessage.chatId, $(this));
                    });
                messageContent.append(deleteButton);
            }
        }

        if (chatMessage.sender === myId) {
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
    }

    function sendMessage() {
        var message = $('#messageInput').val();
        sendMessageToServer(wsChat, 'text', message, myId, selectedRoomId, null);
        $('#messageInput').val('');
    }

    function sendMessageToServer(ws, type, message, sender, room, attachment) {
        var chatMessage = {
            type: type,
            message: message,
            sender: sender,
            room: room,
            attachments: attachment
        };
        ws.send(JSON.stringify(chatMessage));
    }

    function deleteMessage(chatIdx, type, chatId, deleteButton) {
        console.log(chatId);
        $.ajax({
            url: '/chat/deleteMessage.ajax',
            type: 'GET',
            data: {
                chatId: chatId,
                type: type
            },
            success: function (data) {
                if (data.result) {
                    alert('메시지가 삭제되었습니다.');
                    var messageElement = $('#' + chatId);
                    messageElement.empty().append('<div class="deleted-message">Message deleted</div>');
                    deleteButton.remove();
                } else {
                    alert('메시지 삭제에 실패했습니다.');
                }
            },
            error: function (error) {
                console.error('Error deleting message:', error);
                alert('메시지 삭제에 실패했습니다.');
            }
        });
    }

    function fileUpload(file) {
        var uploadFileName = '';
        var formData = new FormData();
        formData.append('file', file);
        $.ajax({
            url: '/chat/uploadAttachment.ajax',
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            success: function (data) {
                uploadFileName = data.fileName;
                console.log(uploadFileName);
                fileSend(uploadFileName, file.type, file.name);
            },
            error: function (error) {
                console.error('File upload failed:', error);
            }
        });
    }

    function fileSend(fileName, fileType, oriFileName) {
        var chatMessage = {
            type: 'file',
            message: '',
            sender: myId,
            room: selectedRoomId,
            attachments: [
                {
                    fileName: fileName,
                    fileType: fileType,
                    oriFileName: oriFileName
                }
            ]
        };
        wsChat.send(JSON.stringify(chatMessage));
    }

    function leaveRoom() {
        if (selectedRoomId !== null) {
            $.ajax({
                url: '/chat/exitChatRoom.ajax',
                method: 'POST',
                data: {
                    roomIdx: selectedRoomId,
                    roomEmpIdx: myId
                },
                success: function (data) {
                    if (data.result) {
                        alert('방에서 나갔습니다.');
                        $('#chatWindow').removeClass('active');
                        $('#selectChatRoomMessage').show();
                        selectedRoomId = null;
                        $('#message-container').empty();
                        wsChat.close();
                        location.reload();
                    } else {
                        alert('방 나가기에 실패했습니다. 다시 시도해주세요.');
                    }
                },
                error: function (error) {
                    console.log('Error leaving room:', error);
                    alert('방 나가기에 실패했습니다. 다시 시도해주세요.');
                }
            });
        }
    }

    $('#newChatModal').on('show.bs.modal', function (e) {
        fetchEmployeeList();
    });

    function fetchEmployeeList() {
        $.ajax({
            url: '/emp/emp/noOffsetEmpList.ajax',
            method: 'GET',
            success: function (data) {
                console.log(data);
                renderEmployeeList(data.EmpList);
            },
            error: function (error) {
                console.log('Error fetching employee list:', error);
            }
        });
    }

    function renderEmployeeList(data) {
        var employeeListContainer = $('#employeeList');
        employeeListContainer.empty();

        if (data && Array.isArray(data)) {
            data.forEach(function (employee) {
                if (!selectedEmployeeIds.has(employee.emp_no) && employee.emp_no !== myId) {
                    var employeeItem = $('<div class="employee-item list-group-item"></div>');
                    employeeItem.text(employee.emp_name + " (" + employee.emp_no + ")");
                    employeeItem.data('employee-id', employee.emp_no);
                    employeeListContainer.append(employeeItem);
                }
            });
        } else {
            employeeListContainer.append('<div>No employees found</div>');
        }
    }

    $(document).on('click', '.employee-item', function () {
        var employeeId = $(this).data('employee-id');
        var employeeName = $(this).text();

        selectedEmployeeIds.add(employeeId);

        var selectedEmployeesContainer = $('#selectedEmployees');
        var selectedEmployeeItem = $('<div class="selected-item list-group-item"></div>');
        selectedEmployeeItem.text(employeeName);
        selectedEmployeeItem.data('employee-id', employeeId);

        var removeButton = $('<button class="btn btn-danger btn-sm ml-2">Remove</button>');
        removeButton.on('click', function () {
            selectedEmployeeItem.remove();
            selectedEmployeeIds.delete(employeeId);
            fetchEmployeeList();
        });

        selectedEmployeeItem.append(removeButton);
        selectedEmployeesContainer.append(selectedEmployeeItem);

        $(this).remove();
    });

    $('#newChatModal').on('hidden.bs.modal', function () {
        selectedEmployeeIds.clear();
        $('#selectedEmployees').empty();
    });

    function createChatRoom() {
        selectedEmployeeIds.add(myId);
        var selectedEmployeeNoArray = Array.from(selectedEmployeeIds).map(id => ({ emp_no: id }));
        console.log(selectedEmployeeNoArray);

        $.ajax({
            url: '/chat/createChatRoom.ajax',
            type: 'POST',
            contentType: 'application/json',
            dataType: 'json',
            data: JSON.stringify({
                roomName: 'chat_room',
                empList: selectedEmployeeNoArray,
                roomEmpIdx: myId
            }),
            success: function (response) {
                if (response.result) {
                    $('#newChatModal').modal('hide');
                    alert('채팅방이 생성되었습니다.');
                    location.reload();
                } else {
                    alert('채팅방 생성에 실패했습니다. 다시 시도해주세요.');
                }
            },
            error: function (error) {
                console.error('Error creating chat room:', error);
                alert('채팅방 생성에 실패했습니다. 다시 시도해주세요.');
            }
        });
    }

</script>

</html>
