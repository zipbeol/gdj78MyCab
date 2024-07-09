<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
    
     <!-- Calendar CSS -->
    <link rel="stylesheet" href="/assets/vendor/calendar/css/main.min.css">
    <link rel="stylesheet" href="/assets/vendor/calendar/css/custom.css">

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
    
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

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

        .info-label {
            font-weight: bold; /* Optionally make labels bold */
        }

        .info-value {
            font-size: 16px; /* Adjust font size as needed */
        }

      	.ui-datepicker {
    background-color: #fff;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    padding: 10px;
    z-index: 1000;
}

/* Monthpicker 헤더 스타일 */
.ui-datepicker-header {
    font-size: 16px;
    font-weight: bold;
    padding: 10px;
    text-align: center;
    background-color: #3659CD;
    color: #fff;
    border-bottom: 1px solid #ccc;
    border-radius: 5px 5px 0 0;
}

/* Monthpicker 월 선택 스타일 */
.mtz-monthpicker-month {
    display: inline-block;
    justify-content: center;
    width: 65px;
    height: 40px;
    line-height: 40px;
    margin: 5px;
    text-align: center;
    border: 1px solid #ccc;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s, color 0.3s;
}

.mtz-monthpicker-month:hover {
    background-color: #f0f0f0;
}

.mtz-monthpicker-month.ui-state-active {
    background-color: #3659CD;
    color: #fff;
}

/* Monthpicker 비활성화된 월 스타일 */
.mtz-monthpicker-month.ui-state-disabled {
    background-color: #e9ecef;
    color: #6c757d;
    cursor: not-allowed;
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
                        <a href="#" class="text-decoration-none">인사 관리</a>
                    </li>
                    <li class="breadcrumb-item">
                        <a href="/attendance/attendance/list.go" class="text-decoration-none">급여 관리</a>
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
                <ul class="nav nav-tabs card-header-tabs" id="taxiTabs" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="taxi-detail-tab" data-bs-toggle="tab"
                                data-bs-target="#taxi-detail-content" type="button" role="tab"
                                aria-controls="taxi-detail-content" aria-selected="true">급여 관리
                        </button>
                    </li>
                </ul>
            </div>
            <div class="card-body tab-content" id="newTabsContent">
                <div class="tab-pane fade show active" id="taxi-detail-content" role="tabpanel"
                     aria-labelledby="taxi-detail-tab">
                    <!-- 전체 근태 내역 -->
                    <h2>급여 관리</h2>
                    <div class="text-end mb-1">
                    <input type="button" class="btn btn-primary" onclick="filterReset()"
                                       value="급여 설정">
                    </div>
                    <!-- 검색창 시작 -->
                    <div class="search-filter-container border border-2 p-3 rounded mb-3">
                        <div class="row mb-3">
                            <div class="col-md-8 offset-md-4">
                            </div>
                            
                        </div>
                        <div class="row">
                        <div class="col-12 text-end d-md-flex justify-content-md-end gap-2">
                        <input type="button" class="btn btn-secondary" onclick="filterReset()"
                                       value="초기화">
                                       </div></div>
                        <div class="row">
                        <div class="col-2">
                                                                <label for="filter-maintenance-reg-date"
                                                                       class="form-label">년월 선택
                                                                    </label>
                                                            </div>
                                                            <div class="col-2">
                                                            </div>
                                                            <div class="col-2">
                                                                <label for="search-category-maintenance"
                                                                       class="form-label">카테고리</label>
                                                            </div>
                                                            <div class="col-4">
                                                                <label for="search-text-maintenance"
                                                                       class="form-label">검색</label>
                                                            </div>
                                                            <div class="col-2">
                                                                <label for="search-text-maintenance"
                                                                       class="form-label">작성 여부</label>
                                                            </div>
                                                        </div>
                                                        <div class="row mb-3">
                                                            <div class="col-2">
                                                                <div class="input-group"
                                                                     id="filter-maintenance-reg-date-div">
                                                                    <input type="text"
                                                                           class="form-control maintenance-search-filter"
                                                                           id="monthpicker" value="">
                                                                    <span class="input-group-text"><i
                                                                            class="bi bi-calendar2-range"></i></span>
                                                                </div>
                                                            </div>
                                                            <div class="col-2">
                                                            </div>
                                                            <div class="col-2 d-flex">
                                                                <select class="form-select maintenance-search-filter"
                                                                        id="filterforsearch">
                                                                    <option value="emp_no">사번</option>
																	<option value="emp_name">이름</option>
																	<option value="title_name">직급</option>
																	<option value="dept_name">부서</option>
                                                                </select>
                                                            </div>
                                                            <div class="col-4">
                                                                <input type="text"
                                                                       class="form-control maintenance-search-filter"
                                                                       id="search-emp"
                                                                       placeholder="검색어를 입력해 주세요.">
                                                            </div>
                                                            <div class="col-2 d-flex">
                                                                <select class="form-select maintenance-search-filter"
                                                                        id="filter-sal-result">
                                                                    <option value="">작성 여부</option>
                                                                    <option value="true">작성</option>
																	<option value="false">미작성</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- 검색창 종료 -->
                            
                    <!-- 리스트 테이블 시작 -->
                    <div class="table-outer">
                        <div class="table-responsive">
                            <table class="table align-middle table-hover m-0">
                                <thead>
                                    <tr>
                                        <th class="text-center" id="th-emp-no"
																style="width: 20%;">사번</th>
															<th class="text-center sortable" id="th-emp-name"
																style="width: 20%;" >이름</th>
															<th class="text-center sortable" id="th-title-name"
																style="width: 10%;" >직급</th>
															<th class="text-center sortable" id="th-dept-name"
																style="width: 20%;" >부서</th>
															<th class="text-center" id="th-att-time"
																style="width: 10%;" >당월 급여
																</th>
																<th class="text-center" id="th-leave-time"
																style="width: 10%;" >명세 작성 여부
																</th>
                                                                </tr>
                                                                </thead>
                                                                <tbody id="total-sal-list">
                                    
                                    <!-- 테이블 내용 정의 -->
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- 리스트 테이블 종료 -->
                    <!-- 페이지 네이션 시작 -->
                    <nav aria-label="Page navigation example" class="mt-3">
                        <ul class="pagination justify-content-center" id="pagination"></ul>
                    </nav>
                    <!-- 페이지 네이션 종료 -->
                </div>
                
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Row end -->
                    
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
<!-- *************
        ************ JavaScript Files *************
    ************* -->
<!-- Required jQuery first, then Bootstrap Bundle JS -->
<script src="/assets/js/jquery.min.js"></script>
<script src="/assets/js/bootstrap.bundle.min.js"></script>

<!-- *************
        ************ Vendor Js Files *************
    *************

 -->

<!-- Overlay Scroll JS -->
<script src="/assets/vendor/overlay-scroll/jquery.overlayScrollbars.min.js"></script>
<script src="/assets/vendor/overlay-scroll/custom-scrollbar.js"></script>
<!-- Moment JS -->
<script src="/assets/js/moment.min.js"></script>
<!-- Date Range JS -->
<script src="/assets/vendor/daterange/daterange.js"></script>
<script src="/assets/vendor/daterange/custom-daterange.js"></script>
<!-- Custom JS files -->
<script src="/assets/js/custom.js"></script>
<script src="/assets/js/localStorage.js"></script>
<script src="/assets/js/showAlert.js"></script>
<!-- 페이지네이션 -->
<script src="/assets/js/jquery.twbsPagination.min.js"></script>
<!-- 캘린더  -->
<script src="/assets/vendor/calendar/js/main.min.js"></script>
<script src="/assets/vendor/calendar/custom/mycab-cal.js"></script>
<!-- monthPicker  -->
<script src="/assets/js/jquery.mtz.monthpicker.js"></script>
<script>
    
/* 전체 근태 내역 스크립트 시작  */
 
 var months = [];
var dateObj = new Date();
var selectYear = dateObj.getFullYear();
var disableYear = dateObj.getFullYear();
var month = dateObj.getMonth() + 1;
var j = 0;

// 해당하지 않는 월 disable
for (var i = month + 1; i <= 12; i++) {
    months[j++] = i;
}

var currentMonth = dateObj.getFullYear() + '-' + ('0' + month).slice(-2);

$(document).ready(function() {
    getTotalPages();
    getList();

    /* MonthPicker 옵션 */
    var options = {
        pattern: 'yyyy-mm', // Default is 'mm/yyyy' and separator char is not mandatory
        selectedYear: selectYear,
        startYear: 2023,
        finalYear: disableYear,
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        openOnFocus: true
    };

    /* MonthPicker Set */
    $('#monthpicker').val(currentMonth);
    $('#monthpicker').monthpicker(options);

    if (disableYear == selectYear) {
        $("#monthpicker").monthpicker('disableMonths', months);
    }
    // 년도 바꿀 경우 월 able
    $('#monthpicker').monthpicker().on('monthpicker-change-year', function(e, year) {
        if (year == selectYear.toString()) {
            $('#monthpicker').monthpicker('disableMonths', months);
        } else {
            $('#monthpicker').monthpicker('disableMonths', []);
        }
    });

    $('#search-emp').on('keyup', function() {
        currentPage = 1;
        getTotalPages();
        getList();
    });

    $('#monthpicker').on('change', function() {
        currentPage = 1;
        getTotalPages();
        getList();
    });

    $('#filter-sal-result').on('change', function() {
        currentPage = 1;
        getTotalPages();
        getList();
    });
    
    $(document).on('click', '.total-sal-list-tbody-tr', function() {
        location.href = '/emp/sal/write.go?emp_no=' + $(this).attr('id');
    });
});

var searchText = '';
var filterSalMonth = '';
var filterSalResult = '';
var filterforSearch = '';
var currentPage = 1; // 현재 페이지 번호

// 검색 값들 변수에 저장
function getSearchValue() {
    filterSalResult = $('#filter-sal-result').val();
    filterforSearch = $('#filterforsearch').val();
    searchText = $('#search-emp').val();
    filterSalMonth = $('#monthpicker').val();
}

// 필터 값 리셋
function filterReset() {
    $('#filter-sal-result').val('');
    $('#search-emp').val('');
    $('#filterforsearch').val('emp_no');
    $('#monthpicker').val(currentMonth);
    currentPage = 1; // 페이지 번호 초기화
    getTotalPages();
    getList(); // 목록 새로고침
}

// 급여 리스트 호출
function getList() {
    getSearchValue();
    $.ajax({
        url: '/totalSalList.ajax',
        type: 'GET',
        data: {
            'searchText': searchText,
            'filterSalResult': filterSalResult,
            'filterForSearch': filterforSearch,
            'filterSalMonth': filterSalMonth,
            'page': currentPage
        },
        dataType: 'JSON',
        success: function(data) {
            drawList(data.empList);
        },
        error: function(error) {
            console.log(error);
        }
    });
}

// 토탈 페이지 호출
function getTotalPages() {
    getSearchValue();
    $.ajax({
        url: '/getSalTotalPages.ajax',
        type: 'GET',
        data: {
            'searchText': searchText,
            'filterSalResult': filterSalResult,
            'filterForSearch': filterforSearch,
            'filterSalMonth': filterSalMonth
        },
        dataType: 'JSON',
        success: function(data) {
            console.log(data);
            $('#pagination').twbsPagination('destroy');
            $('#pagination').twbsPagination({
                totalPages: data.totalPages, // 서버에서 받은 총 페이지 수
                visiblePages: 5,
                startPage: currentPage,
                paginationClass: 'pagination align-items-center',
                onPageClick: function(event, page) {
                    if (page !== currentPage) {
                        currentPage = page;
                        getList();
                    }
                }
            });
        },
        error: function(error) {
            console.log(error);
        }
    });
}

// 리스트 보여주기
function drawList(list) {
    var content = '';
    if (list.length > 0) {
        for (item of list) {
            content += '<tr class="total-sal-list-tbody-tr" id="' + item.emp_no + '">'
                + '<td class="text-center">' + item.emp_no + '</td>'
                + '<td class="text-center">' + item.emp_name + '</td>'
                + '<td class="text-center">' + item.title_name + '</td>'
                + '<td class="text-center">' + item.dept_name + '</td>'
                + '<td class="text-center">' + item.sal_total + '</td>'
                + '<td class="text-center">' + item.salwrite + '</td>'
                + '</tr>';
        }
    } else {
        content = '<tr><td colspan="6" class="text-center">데이터가 존재하지 않습니다.</td></tr>';
    }
    $('#total-sal-list').html(content);
}
        

</script>

</html>
