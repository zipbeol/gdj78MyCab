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
    <!-- 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    <!-- Date Range CSS -->
    <link rel="stylesheet" href="/assets/vendor/daterange/daterange.css">
    <!-- 따로 적용한 CSS -->
    <link rel="stylesheet" href="/assets/css/default.css">
    <!-- FontAwesome 추가 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        .chat-container {
            height: 500px; /* 적절한 높이로 설정하세요 */
            display: flex;
            flex-direction: column;
            border: 1px solid #dee2e6;
        }

        .chat-messages {
            flex: 1;
            overflow-y: auto;
            padding: 10px;
            background-color: #ffffff;
            height: 400px; /* 기본 높이 */
            max-height: 400px; /* 최대 높이 */
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
    </style>
</head>

<body>
<!-- Page wrapper start -->
<div class="page-wrapper">
    <!-- Main container start -->
    <div class="main-container">
        <!-- Sidebar wrapper start -->
        <jsp:include page="../sidebar.jsp"/>
        <!-- Sidebar wrapper end -->

        <!-- App container starts -->
        <div class="app-container">
            <!-- App header starts -->
            <div class="app-header d-flex align-items-center">
                <!-- Toggle buttons start -->
                <div class="d-flex">
                    <button class="btn btn-outline-primary me-2 toggle-sidebar" id="toggle-sidebar">
                        <i class="bi bi-list fs-5"></i>
                    </button>
                    <button class="btn btn-outline-primary me-2 pin-sidebar" id="pin-sidebar">
                        <i class="bi bi-list fs-5"></i>
                    </button>
                </div>
                <!-- Toggle buttons end -->

                <!-- App brand sm start -->
                <div class="app-brand-sm d-lg-none d-sm-block">
                    <a href="/">
                        <img src="/assets/images/logo-sm.svg" class="logo" alt="Bootstrap Gallery">
                    </a>
                </div>
                <!-- App brand sm end -->

                <!-- Breadcrumb start -->
                <ol class="breadcrumb d-none d-lg-flex ms-3">
                    <li class="breadcrumb-item">
                        <a href="/"><i class="bi bi-house lh-1"></i></a>
                        <a href="/" class="text-decoration-none">메인</a>
                    </li>
                    <li class="breadcrumb-item">
                        <a href="/chat/chat.go" class="text-decoration-none">채팅</a>
                    </li>
                </ol>
                <!-- Breadcrumb end -->

                <!-- App header actions start -->
                <jsp:include page="../appHeader.jsp"/>
                <!-- App header actions end -->
            </div>
            <!-- App header ends -->

            <!-- App body starts -->
            <div class="app-body">
                <!-- Container starts -->
                <div class="container-fluid">
                    <!-- Row start -->
                    <div class="row">
                        <div class="col-12">
                            <div class="card mb-3">
                                <div class="card-header">
                                    <h4 class="card-title">메신저</h4>
                                </div>
                                <div class="card-body chat-container">
                                    <!-- 메시지 UI 시작 -->
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
                                                            <a href="#" class="list-group-item list-group-item-action"
                                                               data-roomID="${room.chatRoomIdx}">
                                                                <div class="d-flex w-100 justify-content-between">
                                                                    <h5 class="mb-1">${room.chatRoomName}</h5>
                                                                    <small>${room.chatRoomLastMessage}</small>
                                                                </div>
                                                                <small>${room.chatRoomLastMessage}</small>
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
                                            <div class="chat-window p-3">
                                                <div class="d-flex w-100 justify-content-between border-bottom pb-2 mb-3">
                                                    <h5 class="mb-1">테스트</h5>
                                                    <small>멤버 1</small>
                                                </div>
                                                <div class="chat-messages">
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
                                                            <button class="btn btn-secondary" type="button"><i
                                                                    class="far fa-smile"></i></button>
                                                            <button class="btn btn-secondary" type="button"><i
                                                                    class="fas fa-paperclip"></i></button>
                                                            <button class="btn btn-primary" type="button"
                                                                    onclick="sendMessage()">전송
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- 메시지 UI 끝 -->
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Row end -->
                </div>
                <!-- Container ends -->
            </div>
            <!-- App body ends -->

            <!-- App footer start -->
            <div class="app-footer">
                <span>GDJ78FINALPROJECTMYCAB</span>
            </div>
            <!-- App footer end -->
        </div>
        <!-- App container ends -->
    </div>
    <!-- Main container end -->
</div>
<!-- Page wrapper end -->

<!-- New Chat Modal -->
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
                <input type="text" class="form-control mb-3" placeholder="이름, 부서 검색" id="memberSearch">
                <ul class="nav nav-tabs" id="myTab" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" id="organization-tab" data-toggle="tab" href="#organization"
                           role="tab"
                           aria-controls="organization" aria-selected="true">조직도</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="groups-tab" data-toggle="tab" href="#groups" role="tab"
                           aria-controls="groups" aria-selected="false">그룹</a>
                    </li>
                </ul>
                <div class="tab-content" id="myTabContent">
                    <div class="tab-pane fade show active" id="organization" role="tabpanel"
                         aria-labelledby="organization-tab">
                        <div class="list-group mt-3">
                            <a href="#"
                               class="list-group-item list-group-item-action d-flex justify-content-between align-items-center">
                                <span>박채현</span>
                                <span class="badge badge-primary badge-pill">관리직</span>
                            </a>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="groups" role="tabpanel" aria-labelledby="groups-tab">
                        <div class="list-group mt-3">
                            <span class="list-group-item">그룹에 추가된 멤버가 없습니다.</span>
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
<!-- Required jQuery first, then Bootstrap Bundle JS -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- Vendor JS Files -->
<script src="/assets/vendor/overlay-scroll/jquery.overlayScrollbars.min.js"></script>
<script src="/assets/vendor/overlay-scroll/custom-scrollbar.js"></script>
<!-- Moment JS -->
<script src="/assets/js/moment.min.js"></script>
<!-- Date Range JS -->
<script src="/assets/vendor/daterange/daterange.js"></script>
<script src="/assets/vendor/daterange/custom-daterange.js"></script>
<!-- Custom JS files -->
<script src="/assets/js/custom.js"></script>
<script src="/assets/js/LocalStorage.js"></script>
<script src="/assets/js/showAlert.js"></script>
<!-- 페이지네이션 -->
<script src="/assets/js/jquery.twbsPagination.min.js"></script>
<script>
    var ws;
    var sender = '${sessionScope.loginId}';
    var roomInfo = [];
    var selectedRoom = '';
    function chatRoomList() {
        <c:forEach items="${chatRoomList}" var="room">
        var roomIdx = '${room.chatRoomIdx}';
        var roomName = '${room.chatRoomName}';
        var roomLastMessage = '${room.chatRoomLastMessage}';
        roomInfo.push(
            {
                roomIdx: roomIdx,
                roomName: roomName,
                roomLastMessage: roomLastMessage
            }
        );
        </c:forEach>
    }

    console.log(roomInfo);

    function connect(roomIdx) {
        ws = new WebSocket("ws://" + window.location.host + "/chat/test");

        ws.onopen = function () {
            var firstMessage = sender + ' 님이 입장하셨습니다.';
            sendMessage('join', firstMessage, sender, roomIdx);
        };

        ws.onmessage = function (event) {
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

        ws.onclose = function () {
            console.log("Disconnected from the chat server");
        };
    }



    $('.list-group-item').on('click', function () {
        $('.list-group-item').removeClass('active');
        $(this).addClass('active');
        selectedRoom = $(this).data("room-id");

        connect(selectedRoom);
    });


    $('#messageInput').on("keypress", function (event) {
        if (event.key === "Enter") {
            var message = $(this).val();
            sendMessage('text', message, sender, selectedRoom);
        }
    });
</script>
</html>
