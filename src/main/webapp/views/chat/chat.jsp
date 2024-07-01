<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <!-- Scrollbar CSS -->
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
            height: 60vh; /* 카드 바디 내에서 적절한 높이 설정 */
            display: flex;
            flex-direction: column;
        }

        .chat-list {
            overflow-y: auto;
            border-right: 1px solid #dee2e6;
        }

        .chat-window {
            flex: 1;
            overflow-y: auto;
            padding-bottom: 60px; /* 메시지 입력창 높이만큼 패딩 추가 */
        }

        .chat-messages {
            height: calc(60vh - 60px); /* 적절한 높이 설정 (전체 높이에서 여백과 입력창 높이를 뺀 값) */
            overflow-y: auto;
            padding-bottom: 10px; /* 메시지 입력창과 간격 */
        }

        .message-input {
            position: relative; /* 'absolute'에서 'relative'로 변경 */
            bottom: 0;
            left: 0;
            width: 100%;
            height: 60px; /* 메시지 입력창 높이 */
            background-color: #f8f9fa;
            border-top: 1px solid #dee2e6; /* 위쪽 경계선 추가 */
        }

        /* Custom Modal Size */
        .modal-dialog {
            max-width: 40vw;
            max-height: 30vh;
        }

        .modal-content {
            height: 100%;
            overflow: auto;
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
                                            <button class="btn btn-success btn-block mb-3" data-toggle="modal" data-target="#newChatModal">새로 만들기</button>
                                            <input type="text" class="form-control mb-3" placeholder="메시지방, 메시지 검색">
                                            <div class="list-group">
                                                <a href="#" class="list-group-item list-group-item-action active">
                                                    <div class="d-flex w-100 justify-content-between">
                                                        <h5 class="mb-1">테스트 1</h5>
                                                        <small>오전 12:05</small>
                                                    </div>
                                                    <small>...</small>
                                                </a>
                                                <a href="#" class="list-group-item list-group-item-action">
                                                    <div class="d-flex w-100 justify-content-between">
                                                        <h5 class="mb-1">박채현</h5>
                                                        <small>오전 12:04</small>
                                                    </div>
                                                    <small>메시지 메시지 메시지</small>
                                                </a>
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
                                                    <div class="text-center text-muted small my-2">박채현님이 그룹 메시지방에 참여합니다.</div>
                                                </div>
                                                <div class="message-input p-3">
                                                    <div class="input-group">
                                                        <input type="text" class="form-control" id="messageInput" placeholder="메시지를 입력해주세요. (Enter: 전송)">
                                                        <div class="input-group-append">
                                                            <button class="btn btn-secondary" type="button"><i class="far fa-smile"></i></button>
                                                            <button class="btn btn-secondary" type="button"><i class="fas fa-paperclip"></i></button>
                                                            <button class="btn btn-primary" type="button" onclick="sendMessage()">전송</button>
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
<div class="modal fade" id="newChatModal" tabindex="-1" aria-labelledby="newChatModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="newChatModalLabel">멤버 선택</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <input type="text" class="form-control" id="searchMember" placeholder="이름 검색">
                    </div>
                </form>
                <ul class="nav nav-tabs" id="myTab" role="tablist">
                    <li class="nav-item" role="presentation">
                        <a class="nav-link active" id="organization-tab" data-toggle="tab" href="#organization" role="tab" aria-controls="organization" aria-selected="true">개인</a>
                    </li>
                    <li class="nav-item" role="presentation">
                        <a class="nav-link" id="group-tab" data-toggle="tab" href="#group" role="tab" aria-controls="group" aria-selected="false">그룹</a>
                    </li>
                </ul>
                <div class="tab-content" id="myTabContent">
                    <div class="tab-pane fade" id="organization" role="tabpanel" aria-labelledby="organization-tab">
                        <div class="row">
                            <div class="col-4">
                                <ul class="list-group">
                                    <li class="list-group-item">My Cab</li>
                                </ul>
                            </div>
                            <div class="col-8">
                                <ul class="list-group">
                                    <li class="list-group-item">
                                        <div class="d-flex align-items-center">
                                            <img src="profile.png" alt="Profile" class="rounded-circle mr-2" width="30">
                                            <div>
                                                <div>박채현</div>
                                                <div class="text-muted small">관리직 내회사</div>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="group" role="tabpanel" aria-labelledby="group-tab">
                        <!-- 그룹 내용 -->
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                <button type="button" class="btn btn-primary">선택</button>
            </div>
        </div>
    </div>
</div>

<!-- JavaScript Files -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- Overlay Scroll JS -->
<script src="/assets/vendor/overlay-scroll/jquery.overlayScrollbars.min.js"></script>
<script src="/assets/vendor/overlay-scroll/custom-scrollbar.js"></script>
<!-- Vendor Js Files -->
<script src="/assets/vendor/overlay-scroll/jquery.overlayScrollbars.min.js"></script>
<script src="/assets/vendor/overlay-scroll/custom-scrollbar.js"></script>

<!-- Custom JS files -->
<script src="/assets/js/custom.js"></script>
<script src="/assets/js/LocalStorage.js"></script>

<script>
    var ws;

    function connect() {
        ws = new WebSocket("ws://" + window.location.host + "/chat/test");

        ws.onopen = function() {
            console.log("Connected to the chat server");
        };

        ws.onmessage = function(event) {
            var chatMessages = document.querySelector(".chat-messages");
            var newMessage = document.createElement("div");
            newMessage.textContent = event.data;
            chatMessages.appendChild(newMessage);
            chatMessages.scrollTop = chatMessages.scrollHeight;
        };

        ws.onclose = function() {
            console.log("Disconnected from the chat server");
        };
    }

    function sendMessage() {
        var messageInput = document.getElementById("messageInput");
        var message = messageInput.value;

        var chatMessage = {
            type: "message",
            message: message
        };

        ws.send(JSON.stringify(chatMessage));
        messageInput.value = '';
    }

    window.onload = function() {
        connect();

        var messageInput = document.getElementById("messageInput");
        messageInput.addEventListener("keypress", function(event) {
            if (event.key === "Enter") {
                sendMessage();
            }
        });
    };
</script>

</body>
</html>
