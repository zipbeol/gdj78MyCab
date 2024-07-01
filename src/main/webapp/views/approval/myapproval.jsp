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
    <!-- *************
			************ CSS Files *************
		************* -->
    <link rel="stylesheet" href="/assets/fonts/bootstrap/bootstrap-icons.css">
    <link rel="stylesheet" href="/assets/css/main.min.css">

    <!-- *************
			************ Vendor Css Files *************
		************ -->

    <!-- Scrollbar CSS -->
    <link rel="stylesheet" href="/assets/vendor/overlay-scroll/OverlayScrollbars.min.css">

    <!-- 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

    <!-- 따로 적용한 CSS -->
    <link rel="stylesheet" href="/assets/css/default.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
        }
        .container {
            padding: 20px;
        }
        .card {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .card-header {
            background-color: #ffffff;
            color: #343a40;
            padding: 15px;
            border-bottom: 1px solid #343a40;
        }
        .card-title {
            margin: 0;
        }
        .btn-group .btn {
            margin-right: 5px;
        }
        .btn-outline-all {
            color: #6c757d;
            border-color: #6c757d;
        }
        .btn-outline-all:hover {
            background-color: #6c757d;
            color: #fff;
        }
        .btn-outline-temporary {
            color: #ffc107;
            border-color: #ffc107;
        }
        .btn-outline-temporary:hover {
            background-color: #ffc107;
            color: #fff;
        }
        .search-form input {
            margin-right: 5px;
        }
        .table thead th {
            background-color: #ffffff;
            color: #343a40;
        }
        .table-bordered th, .table-bordered td {
            border: 1px solid #dee2e6 !important;
        }
        .table tbody tr {
            transition: background-color 0.2s;
        }
        .table tbody tr:hover {
            background-color: #f1f1f1;
        }
        .date-range {
            text-align: right;
            margin-bottom: 10px;
        }
        .btn-container {
            display: flex;
            justify-content: flex-start;
            margin-top: 10px;
        }
        .pagination {
            justify-content: center;
        }
        .pagination .page-link {
            color: #343a40;
        }
        .pagination .page-item.active .page-link {
            background-color: #343a40;
            border-color: #343a40;
        }
        .form-inline label {
            margin-right: 10px;
        }
        .status-btn {
            margin-right: 10px;
        }
        .top-buttons {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .top-buttons .search-form {
            display: flex;
            align-items: center;
        }
        .card-body {
            overflow-x: auto;
        }
    </style>
</head>

<body>
<!-- Page wrapper start -->
<div class="page-wrapper">

    <!-- Main container start -->
    <div class="main-container">

        <!-- Sidebar wrapper start -->
        <jsp:include page="/views/sidebar.jsp"/>
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
                        <!-- 여기에 경로 추가 -->
                    </li>
                    <li class="breadcrumb-item">
                        <a href="#" class="text-decoration-none">전자결재</a>
                        <!-- 여기에 경로 추가 -->
                    </li>
                    <li class="breadcrumb-item">
                        <a href="/approval/myapproval" class="approvalWriteForm">기안서 작성</a>
                        <!-- 여기에 경로 추가 -->
                    </li>
                </ol>
                <!-- Bread
                <!-- App header actions start -->
                <jsp:include page="/views/appHeader.jsp"/>
                <!-- App header actions end -->

            </div>

            <!-- App header ends -->

            <!-- App body starts -->
            <div class="app-body">

                <!-- Container starts -->
              <div class="container mt-5">
        <!-- Row start -->
        <div class="row">
            <div class="col-12">
                <div class="card mb-3">
                    <div class="card-header">
                        <h4 class="card-title">내 결재 관리</h4>
                    </div>
                    <div class="card-body">
                        <div class="top-buttons mb-3">
                            <div>
                             	<button class="btn btn-outline-all status-btn">전체</button>
                                <button class="btn btn-outline-temporary status-btn">임시저장</button>
                                <button class="btn btn-outline-primary status-btn">진행중</button>
                                <button class="btn btn-outline-secondary status-btn">반려</button>
                                <button class="btn btn-outline-success status-btn">결재</button>
                            </div>
                            <form class="form-inline search-form">
                                <input type="text" class="form-control" placeholder="제목">
                                <button type="submit" class="btn btn-primary">Search(F3)</button>
                            </form>
                        </div>
                        <div class="date-range">
                            <label></label>
                        </div>
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th><input type="checkbox" id="checkAll"></th>
                                    <th>기안일자</th>
                                    <th>제목</th>
                                    <th>기안자</th>
                                    <th>중간결재자</th>
                                    <th>최종결재자</th>
                                    <th>결재일</th>
                                    <th>진행상태</th>
                                    <th>결재</th>
                                </tr>
                            </thead>
                                <tbody id="approvalDataBody">
        						<!-- 데이터가 동적으로 추가될 부분 -->
   								</tbody>
                        </table>
                        <div class="btn-container">
                            <button class="btn btn-outline-primary">신규(F2)</button>
                            <button class="btn btn-outline-secondary">My도장/서명</button>
                            <button class="btn btn-outline-warning">보내기</button>
                            <button class="btn btn-outline-danger">결재</button>
                        </div>
                        <nav aria-label="Page navigation">
                            <ul class="pagination">
                                <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item"><a class="page-link" href="#">Next</a></li>
                            </ul>
                        </nav>
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
            <!-- App footer end -->

        </div>
        <!-- App container ends -->

    </div>
    <!-- Main container end -->

</div>
<!-- Page wrapper end -->

<!-- *************
        ************ JavaScript Files *************
    ************* -->
<!-- Required jQuery first, then Bootstrap Bundle JS -->
<script src="/assets/js/jquery.min.js"></script>
<script src="/assets/js/bootstrap.bundle.min.js"></script>

<!-- *************
        ************ Vendor Js Files *************
    ************* -->

<!-- Overlay Scroll JS -->
<script src="/assets/vendor/overlay-scroll/jquery.overlayScrollbars.min.js"></script>
<script src="/assets/vendor/overlay-scroll/custom-scrollbar.js"></script>


<!-- Custom JS files -->
<script src="/assets/js/custom.js"></script>
<script src="/assets/js/LocalStorage.js"></script>
</body>
<script>
$(document).ready(function() {
    // 전체 선택 기능
    $('#checkAll').on('change', function() {
        const isChecked = $(this).is(':checked');
        $('#approvalDataBody input[type="checkbox"]').prop('checked', isChecked);
    });

    // 데이터 가져오기 함수
    function loadApprovalData() {
        $.ajax({
            url: '/getApprovalData.ajax', // 서버의 엔드포인트 URL
            type: 'POST',
            dataType: 'json', // 데이터 타입을 JSON으로 명시
            success: function(response) {
                $('#approvalDataBody').empty(); // 기존 데이터를 초기화

                response.forEach(function(item) {
                    // 테이블 행 생성
                    const row = $('<tr></tr>');

                    // 각 데이터 셀 생성
                    const checkboxCell = $('<td></td>').append($('<input>', {
                        type: 'checkbox',
                        value: item.approval_doc_idx
                    }));

                    const writeDateCell = $('<td></td>').text(item.approval_doc_write_date);
                    const titleCell = $('<td></td>').text(item.approval_doc_title);
                    const idCell = $('<td></td>').text(item.approval_doc_id);
                    const midApproverCell = $('<td></td>').text(item.appr_midapprover);
                    const finalApproverCell = $('<td></td>').text(item.appr_finalapprover);
                    const mngr_updt = $('<td></td>').text(item.appr_mngr_updt);
                    const stateCell = $('<td></td>').text(item.approval_doc__state);
                   
                    
                    const buttonCell = $('<td></td>').append($('<button>', {
                        class: 'btn btn-primary',
                        text: '결재',
                        click: function() {
                            approveDocument(item.approval_doc_idx);
                        }
                    }));

                    // 행에 각 셀 추가
                    row.append(checkboxCell, writeDateCell, titleCell, idCell, midApproverCell, finalApproverCell, mngr_updt, stateCell, buttonCell);

                    // 테이블에 행 추가
                    $('#approvalDataBody').append(row);
                });
            },
            error: function(xhr, status, error) {
                console.error('데이터를 가져오는 중 오류 발생:', error);
            }
        });
    }

    // 페이지 로드 시 데이터 가져오기
    loadApprovalData();
});

</script>
</html>