<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>My Cab - Notice</title>
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
.detail-row {
    display: none;
    transition: all 0.3s ease;
}

.detail-row.active {
    display: table-row;
}

.filter-btn {
    background-color: #f8f9fa;
    color: #6c757d;
    border: 1px solid #ced4da;
    padding: 8px 16px;
    margin-right: 10px;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease, color 0.3s ease, border-color 0.3s ease;
}

/* 호버 효과 */
.filter-btn:hover {
    background-color: #e9ecef;
}

/* 액티브(선택된) 상태 */
.filter-btn.active {
    background-color: #0d6efd;
    color: #fff;
    border-color: #0d6efd;
}
/* 리셋 버튼 스타일 */
.reset-btn {
    background-color: #dc3545;
    color: #fff;
    border-color: #dc3545;
}

/* 리셋 버튼 호버 효과 */
.reset-btn:hover {
    background-color: #c82333;
    border-color: #bd2130;
}

td:hover {
    cursor: pointer;
}

/* 비활성화된 행 스타일 */
.inactive {
    background-color: #f8d7da;
}

.custom-table {
    width: 100%;
    table-layout: fixed; /* 테이블 너비 고정 */
}

.custom-table th,
.custom-table td {
    text-align: center; /* 텍스트 가운데 정렬 */
    vertical-align: middle; /* 수직 가운데 정렬 */
    word-wrap: break-word; /* 텍스트 줄바꿈 */
    white-space: nowrap; /* 텍스트 줄바꿈 방지 */
}

.custom-table thead th {
    background-color: #f8f9fa;
    font-weight: bold;
}

.custom-table tbody tr:hover {
    background-color: #e9ecef;
}

.custom-table .detail-row {
    background-color: #f1f1f1;
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
                                        <button class="btn btn-secondary" onclick="resetFilters()">초기화</button>
                                        <!-- 검색창 시작 -->
                                        <div class="search-filter-container border border-2 p-3 rounded mb-3">
                                            <!-- 날짜 필터링 입력 -->
                                            <div class="mt-3">
                                                <label for="startDate" class="form-label">시작 날짜&nbsp;</label> 
                                                <input type="date" id="startDate"> 
                                                <label for="endDate" class="form-label">&nbsp;&nbsp;-&nbsp;&nbsp;종료 날짜&nbsp;</label> 
                                                <input type="date" id="endDate">
                                            </div>
                                            <div class="row mt-2">
                                                <div class="col-2">
                                                    <!-- 필터링 버튼 -->
                                            <label for="searchQuery" class="form-label mt-2">검색</label>
                                                    <select id="searchFilter" name="filter" class="form-select" required>
                                                        <option value="" selected disabled>필터 선택</option>
                                                        <option value="noticeWriter">작성자</option>
                                                        <option value="noticeTitle">제목</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="d-flex">
                                                <!-- 검색 입력 필드 -->
                                                <input type="text" id="searchQuery" placeholder="검색 내용을 입력하세요.">
                                                <!-- 검색 버튼 -->
                                                <button id="go" class="btn btn-outline-info">찾기</button>
                                            </div>
                                            <div class="row mt-3">
                                                <div class="col-12 text-end">
                                                    <button id="registerButton" class="btn btn-primary">등록</button>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- 공지사항 리스트 테이블 -->
                                        <div class="table-outer mt-3">
                                            <table class="table table-hover align-middle custom-table m-0">
                                                <thead>
                                                    <tr>
                                                        <th class="inactive-column" style="display:none;">비활성화</th>
                                                        <th>중요도</th>
                                                        <th>대상자</th>
                                                        <th>제목</th>
                                                        <th>작성자</th>
                                                        <th>작성 날짜</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="noticeTableBody">
                                                    <!-- AJAX 요청으로 항목들이 여기에 추가됩니다 -->
                                                </tbody>
                                            </table>
                                            <!-- 페이지 네이션 시작 -->
                                            <nav aria-label="Page navigation example" class="mt-3">
                                                <ul class="pagination justify-content-center" id="pagination"></ul>
                                            </nav>
                                            <!-- 페이지 네이션 종료 -->
                                        </div>
                                        <!-- 비활성화 버튼 추가 -->
                                        <div class="text-end mt-3">
                                            <button id="toggleInactiveButton" class="btn btn-warning">비활성화</button>
                                            <button id="applyInactiveButton" class="btn btn-danger" style="display:none;">비활성화 적용</button>
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
    
    var currentPage = 1;
    var searchFlag = false;
    var isInactiveMode = false;
    
    getTotalPages();
    refreshNoticeList();
    
    $('#searchFilter').on('change',function(){
    	currentPage = 1
        getTotalPages();
        refreshNoticeList();
    });
    
    $('#go').on('click',function(){
    	currentPage = 1
        getTotalPages();
        refreshNoticeList();
    });
    

    // 리셋 버튼 클릭 시 호출되는 함수
    function resetFilters() {
        // 선택된 버튼의 active 클래스 제거
        $('.filter-btn').removeClass('active');

        // 날짜 입력 필드 초기화
        $('#startDate').val('');
        $('#endDate').val('');

        // 필터링 선택 필드 초기화
        $('#searchFilter').val('');

        // 검색 입력 필드 초기화
        $('#searchQuery').val('');

        // 총 페이지
        currentPage = 1;
        getTotalPages();
        
        // 공지 리스트 다시 불러오기
        refreshNoticeList();

        // 필터링 버튼 위치로 스크롤 이동 (선택하지 않은 경우)
        $('html, body').animate({
            scrollTop: $(".mt-3").offset().top
        }, 500);
    }

    $(document).ready(function() {
        // 등록 버튼 클릭 시 등록 페이지로 이동
        $('#registerButton').click(function() {
            window.location.href = '/notice/register.go';
        });
    });


    function displayNoticeList(noticeList) {
        var tbody = $('#noticeTableBody');
        console.log(noticeList);
        tbody.empty(); // 테이블 본문을 비웁니다.
        var row = '';
        var importanceCount = 0;

        // 중요 공지사항과 일반 공지사항을 분리
        for (item of noticeList) {
            var importance = item.notice_imp === 'true' ? '중요' : '일반';
            var inactiveClass = item.inactive ? ' inactive' : '';
            var noticeRow = '<tr class="clickable-row' + (importance === '중요' && importanceCount < 3 ? ' important' : '') + inactiveClass + '">' +
                '<td class="inactive-column" style="display:none;"><input type="checkbox" class="inactive-checkbox" data-id="' + item.notice_idx + '"></td>' +
                '<td>' + importance + '</td>' +
                '<td>' + item.notice_field + '</td>' +
                '<td>' + item.notice_title + '</td>' +
                '<td>' + item.notice_writer + '</td>' +
                '<td>' + item.notice_date + '</td>' +
                '</tr>';
            if (importance === '중요' && importanceCount < 3) {
                row = noticeRow + row; // 중요 공지사항은 상단에 추가
                importanceCount++;
            } else {
                row += noticeRow; // 일반 공지사항은 하단에 추가
            }
        }

        tbody.html(row);

        // 각 행에 클릭 이벤트 추가
        $('.clickable-row').on('click', function () {
            $(this).next('.detail-row').toggleClass('active');
        });
    }


    $('#toggleInactiveButton').click(function () {
        isInactiveMode = !isInactiveMode;
        if (isInactiveMode) {
            $('#toggleInactiveButton').hide();
            $('#applyInactiveButton').show();
            $('.inactive-column').show();
        } else {
            $('#toggleInactiveButton').show();
            $('#applyInactiveButton').hide();
            $('.inactive-column').hide();
        }
    });

    $('#applyInactiveButton').click(function () {
        var selectedIds = [];
        $('.inactive-checkbox:checked').each(function () {
            selectedIds.push($(this).data('id'));
        });
        if (selectedIds.length > 0) {
            $.ajax({
                url: '/notice/inactivate.ajax',
                type: 'POST',
                data: JSON.stringify(selectedIds),
                contentType: 'application/json',
                success: function (response) {
                    alert('선택된 항목이 비활성화 되었습니다.');
                    refreshNoticeList();
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert('비활성화에 실패 하였습니다. 다시 시도해 주세요.');
                    console.error('Error:', textStatus, errorThrown);
                }
            });
        }
        $('#toggleInactiveButton').show();
        $('#applyInactiveButton').hide();
        $('.inactive-column').hide();
        refreshNoticeList();
    });

 // 공지사항 리스트 갱신 함수
    function refreshNoticeList() {
        $.ajax({
            type: 'POST',
            url: '/notice/list.ajax',
            data: {
                'filterStartDate': $('#startDate').val(),
                'filterEndDate': $('#endDate').val(),
                'searchFilter': $('#searchFilter').val(),
                'searchQuery': $('#searchQuery').val(),
                'page': currentPage
            },
            dataType: 'json',
            success: function(data) {
                displayNoticeList(data.notice); // 공지사항 리스트 표시 함수 호출
            },
            error: function(error) {
                console.error("AJAX 요청 실패:", error);
            }
        });
    }


	
 // 총 페이지 수 갱신 함수
    function getTotalPages() {
        $.ajax({
            url: './getTotalPages.ajax',
            type: 'GET',
            data: {
                'searchFilter': $('#searchFilter').val(),
                'searchQuery': $('#searchQuery').val(),
                'filterStartDate': $('#startDate').val(),
                'filterEndDate': $('#endDate').val(),
                'page': currentPage
            },
            dataType: 'json',
            success: function (data) {
                $('#pagination').twbsPagination('destroy');
                $('#pagination').twbsPagination({
                    totalPages: data.totalPages, // 서버에서 받은 총 페이지 수
                    visiblePages: 5,
                    startPage: currentPage,
                    paginationClass: 'pagination align-items-center',
                    onPageClick: function (event, page) {
                        currentPage = page;
                        refreshNoticeList();
                    }
                });
            },
            error: function (error) {
                console.log(error);
            }
        });
    }
 
    $(document).ready(function() {
        getTotalPages();
        refreshNoticeList();
    });

</script>
</body>
</html>
