<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>My Cab - 메일 작성</title>
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
    <link rel="stylesheet" href="/assets/fonts/bootstrap/bootstrap-icons.css">
    <link rel="stylesheet" href="/assets/css/main.min.css">
    <!-- Vendor Css Files -->
    <link rel="stylesheet" href="/assets/vendor/overlay-scroll/OverlayScrollbars.min.css">
    <link rel="stylesheet" href="/assets/vendor/daterange/daterange.css">
    <!-- 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    <!-- 따로 적용한 CSS -->
    <link rel="stylesheet" href="/assets/css/default.css">
    <!-- FontAwesome 추가 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

    <style>
        .alert-placeholder {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 1050;
            margin: 0;
            padding: 10px;
            text-align: center;
        }

        .mail-form-container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .mail-form-group {
            margin-bottom: 15px;
        }

        .mail-form-group label {
            display: block;
            margin-bottom: 5px;
        }

        .mail-form-group input,
        .mail-form-group textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .mail-form-group textarea {
            height: 200px;
            resize: none;
        }

        .mail-form-actions {
            text-align: right;
        }

        .mail-form-actions button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            background-color: #007bff;
            color: white;
            cursor: pointer;
        }

        .mail-form-actions button:hover {
            background-color: #0056b3;
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
                        <a href="#" class="text-decoration-none">메일</a>
                    </li>
                    <li class="breadcrumb-item">
                        <a href="/mail/write.go" class="text-decoration-none">메일 작성</a>
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
                    <!-- Alert placeholder start -->
                    <div id="alertPlaceholder" class="alert-placeholder"></div>
                    <!-- Alert placeholder end -->
                    <!-- Row start -->
                    <div class="row">
                        <div class="col-12">
                            <div class="card mb-3">
                                <div class="card-header">
                                    <h4 class="card-title">메일 전송</h4>
                                </div>
                                <div class="card-body">
                                    <form id="mailForm" action="/mail/send" method="post">
                                        <div class="mail-form-group">
                                            <label for="recipient">수신자</label>
                                            <input type="email" id="recipient" name="recipient" required>
                                        </div>
                                        <div class="mail-form-group">
                                            <label for="subject">제목</label>
                                            <input type="text" id="subject" name="subject" required>
                                        </div>
                                        <div class="mail-form-group">
                                            <label for="body">내용</label>
                                            <textarea id="body" name="body" required></textarea>
                                        </div>
                                        <div class="mail-form-actions">
                                            <button type="submit">전송</button>
                                        </div>
                                    </form>
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

</body>
<!-- JavaScript Files -->
<!-- Required jQuery first, then Bootstrap Bundle JS -->
<script src="/assets/js/jquery.min.js"></script>
<script src="/assets/js/bootstrap.bundle.min.js"></script>
<!-- Vendor Js Files -->
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

<script>
    $('#mailForm').on('submit', function (e) {
        e.preventDefault();

        var recipient = $('#recipient').val();
        var subject = $('#subject').val();
        var body = $('#body').val();

        if (!recipient || !subject || !body) {
            alert('모든 필드를 채워주세요.');
            return;
        }

        $.ajax({
            url: '/mail/write.ajax',
            type: 'POST',
            data: {
                recipient: recipient,
                subject: subject,
                body: body
            },
            success: function(response) {
                if (response.result) {
                    alert('메일이 성공적으로 전송되었습니다.');
                    $('#mailForm')[0].reset();
                }else {
                    alert('메일 전송이 실패하였습니다.');
                }
            },
            error: function(error) {
                alert('메일 전송에 실패했습니다. 다시 시도해주세요.');
            }
        });
    });
</script>
</html>
