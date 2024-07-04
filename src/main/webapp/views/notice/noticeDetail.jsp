<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>My Cab - Finance</title>
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

<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

<!-- 따로 적용한 CSS -->
<link rel="stylesheet" href="/assets/css/default.css">

<style>
body {
        font-size: 1.1rem; /* 기본 글씨체 크기 조정 */
    }
    .detail-label {
        font-weight: bold;
        background-color: #f8f9fa;
        padding: 10px;
        vertical-align: middle; /* 세로 가운데 정렬 */
        text-align: center; /* 텍스트 가운데 정렬 */
    }
    .detail-content {
        padding: 10px;
        border: 1px solid #dee2e6;
    }
    .content-height {
        height: 500px; /* 내용 높이 더 늘림 */
        overflow: auto;
    }
    .no-border {
        border: none; /* 테이블의 빈 셀의 선 없애기 */
    }
    .action-buttons {
        text-align: right;
    }
    .action-buttons .btn {
        margin-left: 5px;
        min-width: 60px; /* 버튼 크기 조정 */
        border-radius: 50px; /* 둥근 버튼 */
        background-color: #6c757d; /* 버튼 배경 색상 조정 (명도 약간 낮춤) */
        border: none; /* 기본 테두리 제거 */
        color: white; /* 버튼 텍스트 색상 */
    }
    .action-buttons .btn-primary {
        background-color: #dc3545; /* 빨간색 */
    }
    .action-buttons .btn-primary:hover {
        background-color: #c82333; /* 빨간색 호버 */
    }
    .action-buttons .btn-secondary {
        background-color: #6c757d; /* 더 진한 회색 */
    }
    .action-buttons .btn-secondary:hover {
        background-color: #5a6268; /* 더 진한 회색 호버 */
    }
</style>
</head>

<body>
    <!-- Page wrapper start -->
    <div class="page-wrapper">

        <!-- Main container start -->
        <div class="main-container">

            <!-- Sidebar wrapper start -->
            <jsp:include page="../sidebar.jsp" />
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
                        <a href="/"> <img src="/assets/images/logo-sm.svg" class="logo" alt="Bootstrap Gallery">
                        </a>
                    </div>
                    <!-- App brand sm end -->

                    <!-- Breadcrumb start -->
                    <ol class="breadcrumb d-none d-lg-flex ms-3">
                        <li class="breadcrumb-item"><a href="/"><i class="bi bi-house lh-1"></i></a> <a href="/" class="text-decoration-none">메인</a></li>
                        <li class="breadcrumb-item"><a href="notice/list" class="text-decoration-none">공지사항</a></li>
                    </ol>
                    <!-- Breadcrumb end -->

                    <!-- App header actions start -->
                    <jsp:include page="../appHeader.jsp" />
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
                                        <h4 class="card-title">공지사항</h4>
                                    </div>
                                    <div class="card-body">
										<div class="table-responsive">
										    <table class="table table-bordered">
										        <tbody>
										            <tr>
										                <td class="detail-label" style="width: 15%">작성자</td>
										                <td class="detail-content" style="width: 85%">관리자</td>
										            </tr>
										            <tr>
										                <td class="detail-label">첨부 파일</td>
										                <td class="detail-content">.jsp</td>
										            </tr>
										            <tr>
										                <td class="detail-label">제목</td>
										                <td class="detail-content">관리환경을 오픈하였습니다.</td>
										            </tr>
										            <tr>
										                <td class="detail-label">내용</td>
										                <td class="detail-content content-height">
										                    관리환경을 오픈하였습니다.
										                    관리환경은 시스템관리, 협력관리, 변경관리, SR관리, 현장지원, 문제관리로 구성되어 있습니다.
										                </td>
										            </tr>
										            <tr>
										                <td class="detail-label" style="text-align: right;">작성 일시</td>
										                <td class="detail-content" style="text-align: right;">2009-10-19</td>
										            </tr>
										        </tbody>
										    </table>
										</div>
										<div class="action-buttons mt-3">
										    <button type="button" class="btn btn-primary">수정</button>
										    <a href="./list" class="btn btn-secondary">목록</a>
										</div>
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

    <!-- Required jQuery first, then Bootstrap Bundle JS -->
    <script src="/assets/js/jquery.min.js"></script>
    <script src="/assets/js/bootstrap.bundle.min.js"></script>

    <!-- Vendor Js Files -->
    <script src="/assets/vendor/overlay-scroll/jquery.overlayScrollbars.min.js"></script>
    <script src="/assets/vendor/overlay-scroll/custom-scrollbar.js"></script>

    <!-- Custom JS files -->
    <script src="/assets/js/custom.js"></script>
    <script src="/assets/js/LocalStorage.js"></script>
    <!-- 페이지네이션 -->
    <script src="/assets/js/jquery.twbsPagination.min.js"></script>
    <!-- AJAX 및 모달 스크립트 -->
    <script>
    
    </script>
</body>
</html>
