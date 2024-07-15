<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>My Cab - Notice Detail</title>
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
        font-size: 1.1rem;
        background-color: #f4f6f9; /* 배경색 추가 */
    }
    .card {
        border: none; /* 카드 테두리 제거 */
        border-radius: 8px; /* 카드 모서리 둥글게 */
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 카드 그림자 */
    }
    .card-header {
        background-color: #007bff; /* 카드 헤더 배경색 */
        color: white; /* 카드 헤더 글자색 */
        border-bottom: none; /* 카드 헤더 테두리 제거 */
        border-radius: 8px 8px 0 0; /* 카드 헤더 모서리 둥글게 */
    }
    .card-body {
        background-color: white; /* 카드 바디 배경색 */
        border-radius: 0 0 8px 8px; /* 카드 바디 모서리 둥글게 */
    }
    .detail-label {
        font-weight: bold;
        background-color: #e9ecef; /* 라벨 배경색 */
        padding: 10px;
        vertical-align: middle;
        text-align: center;
    }
    .detail-content {
        padding: 10px;
        border: 1px solid #dee2e6;
        background-color: #f8f9fa; /* 내용 배경색 */
    }
    .content-height {
        height: 500px;
        overflow: auto;
    }
    .no-border {
        border: none;
    }
    .action-buttons {
        text-align: right;
    }
    .action-buttons .btn {
        margin-left: 5px;
        min-width: 60px;
        border-radius: 50px;
        border: none;
        color: white;
    }
    .action-buttons .btn-primary {
        background-color: #007bff; /* 기본 버튼 배경색 */
    }
    .action-buttons .btn-primary:hover {
        background-color: #0056b3; /* 기본 버튼 호버 색상 */
    }
    .action-buttons .btn-secondary {
        background-color: #6c757d; /* 보조 버튼 배경색 */
    }
    .action-buttons .btn-secondary:hover {
        background-color: #5a6268; /* 보조 버튼 호버 색상 */
    }
</style>
</head>

<body>
    <div class="page-wrapper">
        <div class="main-container">
            <jsp:include page="../sidebar.jsp" />
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
                        <a href="/"> <img src="/assets/images/logo-sm.svg" class="logo" alt="Bootstrap Gallery">
                        </a>
                    </div>
                    <ol class="breadcrumb d-none d-lg-flex ms-3">
                        <li class="breadcrumb-item"><a href="/"><i class="bi bi-house lh-1"></i></a> <a href="/" class="text-decoration-none">메인</a></li>
                        <li class="breadcrumb-item"><a href="./list" class="text-decoration-none">공지사항</a></li>
                        <li class="breadcrumb-item"><a href="./detail.go?notice_idx=${noticeDetail.notice_idx}" class="text-decoration-none">상세보기</a></li>
                    </ol>
                    <jsp:include page="../appHeader.jsp" />
                </div>
                <div class="app-body">
                    <div class="container-fluid">
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
                                                        <td class="detail-content" style="width: 35%">${noticeDetail.notice_writer}</td>
														<td class="detail-label" style="width: 15%">공지사항 대상</td>
														<td class="detail-content" style="width: 35%" id="noticeField">${noticeDetail.notice_field}</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="detail-label">첨부 파일</td>
                                                        <td class="detail-content" colspan="3">
                                                            <c:if test="${list.size()>0 }">
                                                                <c:forEach items="${list}" var="path">
                                                                    <a href="download/${path.notice_attach_file}">${path.notice_attach_file} 다운로드</a>
                                                                </c:forEach>
                                                            </c:if>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="detail-label">제목</td>
                                                        <td class="detail-content" colspan="3">${noticeDetail.notice_title}</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="detail-label">내용</td>
                                                        <td class="detail-content content-height" colspan="3">
                                                            ${noticeDetail.notice_content}
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="detail-label" style="text-align: right;">작성 일시</td>
                                                        <td class="detail-content" style="text-align: right;" colspan="3">${noticeDetail.notice_date}</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="action-buttons mt-3">
                                            <button type="button" id="noticeModify" class="btn btn-primary" data-notice_idx="${noticeDetail.notice_idx}">수정</button>
                                            <a href="./list" class="btn btn-secondary">목록</a>
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

    <script src="/assets/js/jquery.min.js"></script>
    <script src="/assets/js/bootstrap.bundle.min.js"></script>
    <script src="/assets/vendor/overlay-scroll/jquery.overlayScrollbars.min.js"></script>
    <script src="/assets/vendor/overlay-scroll/custom-scrollbar.js"></script>
    <script src="/assets/js/custom.js"></script>
    <script src="/assets/js/localStorage.js"></script>
    <script src="/assets/js/jquery.twbsPagination.min.js"></script>
    <script>
    $(document).ready(function() {
        // 수정 버튼 클릭 시 등록 페이지로 이동
        $('#noticeModify').click(function() {
            window.location.href = '/notice/modify.go?notice_idx=' + ${noticeDetail.notice_idx};
        });
    });
    
    $(document).ready(function() {
        // 공지사항 대상 한글 변환 함수
        function getKoreanField(field) {
            switch(field) {
                case 'all':
                    return '전체';
                case 'humanResources':
                    return '인사부';
                case 'sales':
                    return '영업부';
                case 'salesSupport':
                    return '영업지원부';
                case 'TaxiManagement':
                    return '택시관리부';
                default:
                    return field;
            }
        }

        // 공지사항 대상 값 변환하여 출력
        var noticeField = $('#noticeField').text().trim();
        $('#noticeField').text(getKoreanField(noticeField));

        // 수정 버튼 클릭 시 등록 페이지로 이동
        $('#noticeModify').click(function() {
            window.location.href = '/notice/modify.go?notice_idx=' + ${noticeDetail.notice_idx};
        });
    });
    </script>
</body>
</html>
