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
        th.sortable {
            position: relative;
            cursor: pointer;
        }

        th.sortable::after {
            content: '\f0dc'; /* FontAwesome 기본 sort 아이콘 */
            font-family: 'Font Awesome 5 Free';
            font-weight: 900;
            position: absolute;
            right: 8px;
            opacity: 0;
            transition: opacity 0.3s;
        }

        th.sortable:hover::after {
            opacity: 0.3; /* 흐릿하게 설정 */
        }

        th.sortable.asc::after {
            content: '\f0de'; /* FontAwesome sort up 아이콘 */
            opacity: 1;
        }

        th.sortable.desc::after {
            content: '\f0dd'; /* FontAwesome sort down 아이콘 */
            opacity: 1;
        }

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

        .ellipsis {
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
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
                        <a href="#" class="text-decoration-none">택시 관리</a>
                    </li>
                    <li class="breadcrumb-item">
                        <a href="/taxi/list.go" class="text-decoration-none">운행기록 조회</a>
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
                                    <h4 class="card-title">운행 기록 조회</h4>
                                </div>
                                <div class="card-body">
                                    <!-- 검색창 시작 -->
                                    <div class="search-filter-container border border-2 p-3 rounded mb-3">
                                        <div class="row">
                                            <div class="col-12 text-end">
                                                <input type="button" class="btn btn-secondary" onclick="filterReset()"
                                                       value="초기화">
                                                <input type="button" class="btn btn-primary" onclick="getTripList()"
                                                       value="검색" style="display:none;">
                                            </div>
                                        </div>
                                        <div class="row mb-3">
                                            <div class="col-6">
                                                <label for="filter-trip-date-div" class="form-label">운행 날짜</label>
                                                <div class="input-group" id="filter-trip-date-div">
                                                    <input type="text"
                                                           class="form-control datepicker-time-24 search-filter"
                                                           id="filter-trip-start-date">
                                                    <span class="input-group-text">~</span>
                                                    <input type="text"
                                                           class="form-control datepicker-time-24 search-filter"
                                                           id="filter-trip-end-date">
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <label for="filter-driver-name" class="form-label">택시기사 이름</label>
                                                <input type="text" class="form-control search-filter"
                                                       id="filter-driver-name"
                                                       placeholder="택시기사 이름을 입력해 주세요">
                                            </div>
                                        </div>
                                        <div class="row mb-3">
                                            <div class="col-6">
                                                <label for="filter-start-location" class="form-label">출발지</label>
                                                <input type="text" class="form-control search-filter"
                                                       id="filter-start-location"
                                                       placeholder="출발지를 입력해 주세요">
                                            </div>
                                            <div class="col-6">
                                                <label for="filter-end-location" class="form-label">도착지</label>
                                                <input type="text" class="form-control search-filter"
                                                       id="filter-end-location"
                                                       placeholder="도착지를 입력해 주세요">
                                            </div>
                                        </div>
                                        <div class="row mb-3">
                                            <div class="col-6">
                                                <label for="filter-distance" class="form-label">운행 거리 (km)</label>
                                                <div class="input-group" id="filter-distance">
                                                    <input type="number" class="form-control search-filter"
                                                           id="filter-min-distance"
                                                           placeholder="최소 거리">
                                                    <span class="input-group-text">~</span>
                                                    <input type="number" class="form-control search-filter"
                                                           id="filter-max-distance"
                                                           placeholder="최대 거리">
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <label for="filter-fare" class="form-label">운행 요금 (원)</label>
                                                <div class="input-group" id="filter-fare">
                                                    <input type="number" class="form-control search-filter"
                                                           id="filter-min-fare"
                                                           placeholder="최소 요금">
                                                    <span class="input-group-text">~</span>
                                                    <input type="number" class="form-control search-filter"
                                                           id="filter-max-fare"
                                                           placeholder="최대 요금">
                                                </div>
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
                                                    <th class="text-center sortable" id="th-trip-record-date"
                                                        style="width: 15%;" data-value="trip_record_date">운행 날짜
                                                    </th>
                                                    <th class="text-center sortable" id="th-trip-record-idx"
                                                        style="width: 10%;" data-value="trip_record_idx">운행 번호
                                                    </th>
                                                    <th class="text-center sortable" id="th-trip-record-driver-name"
                                                        style="width: 20%;" data-value="trip_record_driver_name">택시기사 이름
                                                    </th>
                                                    <th class="text-center sortable" id="th-trip-record-start-location"
                                                        style="width: 15%;" data-value="trip_record_start_location">출발지
                                                    </th>
                                                    <th class="text-center sortable" id="th-trip-record-end-location"
                                                        style="width: 15%;" data-value="trip_record_end_location">도착지
                                                    </th>
                                                    <th class="text-center sortable" id="th-trip-record-distance"
                                                        style="width: 10%;" data-value="trip_record_distance">운행 거리
                                                    </th>
                                                    <th class="text-center sortable" id="th-trip-record-fare"
                                                        style="width: 15%;" data-value="trip_record_fare">운행 요금
                                                    </th>
                                                </tr>
                                                </thead>

                                                <tbody id="trip-list">
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
<!-- 페이지네이션 -->
<script src="/assets/js/jquery.twbsPagination.min.js"></script>


<script>
$(document).ready(function() {
    // URL 파라미터 읽기 함수
    function getUrlParameter(name) {
        name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]');
        var regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
        var results = regex.exec(location.search);
        return results === null ? null : decodeURIComponent(results[1].replace(/\+/g, ' '));
    }

    // URL 파라미터에서 값 읽기
    var filterStartDate = getUrlParameter('filterStartDate');
    var filterEndDate = getUrlParameter('filterEndDate');
    var filterDriverName = getUrlParameter('filterDriverName');
    var filterStartLocation = getUrlParameter('filterStartLocation') || '';
    var filterEndLocation = getUrlParameter('filterEndLocation') || '';
    var filterMinDistance = getUrlParameter('filterMinDistance') || '';
    var filterMaxDistance = getUrlParameter('filterMaxDistance') || '';
    var filterMinFare = getUrlParameter('filterMinFare') || '';
    var filterMaxFare = getUrlParameter('filterMaxFare') || '';

    // 파라미터 값이 있을 경우 필터 입력란에 설정
    if (filterStartDate) {
        $('#filter-trip-start-date').val(filterStartDate);
    }
    if (filterEndDate) {
        $('#filter-trip-end-date').val(filterEndDate);
    }
    if (filterDriverName) {
        $('#filter-driver-name').val(filterDriverName);
    }
    if (filterStartLocation) {
        $('#filter-start-location').val(filterStartLocation);
    }
    if (filterEndLocation) {
        $('#filter-end-location').val(filterEndLocation);
    }
    if (filterMinDistance) {
        $('#filter-min-distance').val(filterMinDistance);
    }
    if (filterMaxDistance) {
        $('#filter-max-distance').val(filterMaxDistance);
    }
    if (filterMinFare) {
        $('#filter-min-fare').val(filterMinFare);
    }
    if (filterMaxFare) {
        $('#filter-max-fare').val(filterMaxFare);
    }

    // 초기 검색 실행
    getTotalPages();
    getList();
    
    // 기존 코드
    // 테이블 헤더 클릭 이벤트 설정
    $('th.sortable').click(function () {
        sortColumn = $(this).data('value');
        // 현재 정렬 상태 확인
        if ($(this).hasClass('asc')) {
            $(this).removeClass('asc').addClass('desc');
            sortOrder = 'desc';
        } else if ($(this).hasClass('desc')) {
            $(this).removeClass('desc').addClass('asc');
            sortOrder = 'asc';
        } else {
            $('th.sortable').removeClass('asc desc');
            $(this).addClass('asc');
            sortOrder = 'asc';
        }
        getList();
    });

    // 상세 페이지 이동
    $(document).on('click', '.trip-list-tbody-tr', function () {
        location.href = '/triprecord/detail.go?trip_record_idx=' + $(this).attr('id');
    });

    // 필터기능
    $('.search-filter').on('input', function () {
        currentPage = 1;
        getTotalPages();
        getList();
    });
    $('#filter-trip-start-date').on('change', function () {
        currentPage = 1;
        getTotalPages();
        getList();
    });
    $('#filter-trip-end-date').on('change', function () {
        currentPage = 1;
        getTotalPages();
        getList();
    });
});

var searchText = '';
var today = moment().format('YY/MM/DD hh:mm A');
var filterStartDate = ''; // 초기 값 설정
var filterEndDate = today; // 초기 값 설정
var filterDriverName = '';
var filterStartLocation = '';
var filterEndLocation = '';
var filterMinDistance = '';
var filterMaxDistance = '';
var filterMinFare = '';
var filterMaxFare = '';
var currentPage = 1; // 현재 페이지 번호
var sortOrder = 'asc';
var sortColumn = 'default';

// 초기 필터 값 설정
$('#filter-trip-end-date').val(today);
$('#filter-trip-start-date').val('');

// 필터 값 리셋
function filterReset() {
    $('#filter-trip-end-date').val(today);
    $('#filter-trip-start-date').val('');
    $('#filter-driver-name').val('');
    $('#filter-start-location').val('');
    $('#filter-end-location').val('');
    $('#filter-min-distance').val('');
    $('#filter-max-distance').val('');
    $('#filter-min-fare').val('');
    $('#filter-max-fare').val('');
    currentPage = 1; // 페이지 번호 초기화
    getTotalPages();
    getList(); // 목록 새로고침
}

// 리스트 호출
function getList() {
    getSearchValue();
    console.log(filterStartDate);

    $.ajax({
        url: './list.ajax',
        type: 'GET',
        data: {
            'filterStartDate': filterStartDate,
            'filterEndDate': filterEndDate,
            'filterDriverName': filterDriverName,
            'filterStartLocation': filterStartLocation,
            'filterEndLocation': filterEndLocation,
            'filterMinDistance': filterMinDistance,
            'filterMaxDistance': filterMaxDistance,
            'filterMinFare': filterMinFare,
            'filterMaxFare': filterMaxFare,
            'page': currentPage,
            'sortColumn': sortColumn,
            'sortOrder': sortOrder
        },
        dataType: 'JSON',
        success: function (data) {
            console.log(data);
            drawList(data.list);
        },
        error: function (error) {
            console.log(error);
        }
    });
}

// 토탈 페이지 호출
function getTotalPages() {
    getSearchValue();
    $.ajax({
        url: './getTotalPages.ajax',
        type: 'GET',
        data: {
            'filterStartDate': filterStartDate,
            'filterEndDate': filterEndDate,
            'filterDriverName': filterDriverName,
            'filterStartLocation': filterStartLocation,
            'filterEndLocation': filterEndLocation,
            'filterMinDistance': filterMinDistance,
            'filterMaxDistance': filterMaxDistance,
            'filterMinFare': filterMinFare,
            'filterMaxFare': filterMaxFare
        },
        dataType: 'JSON',
        success: function (data) {
            console.log(data);
            $('#pagination').twbsPagination('destroy');
            $('#pagination').twbsPagination({
                totalPages: data.totalPages, // 서버에서 받은 총 페이지 수
                visiblePages: 5,
                startPage: currentPage,
                paginationClass: 'pagination align-items-center',
                onPageClick: function (event, page) {
                    currentPage = page;
                    getList();
                }
            });
        },
        error: function (error) {
            console.log(error);
        }
    });
}

// 검색 값들 변수에 저장
function getSearchValue() {
    const startDateValue = $('#filter-trip-start-date').val();
    const endDateValue = $('#filter-trip-end-date').val();

    // 날짜 형식을 명시적으로 지정하여 변환합니다.
    console.log('startDate : ', startDateValue);
    filterStartDate = startDateValue;
    console.log('format startDate : ', filterStartDate);

    filterEndDate = endDateValue;
    filterDriverName = $('#filter-driver-name').val();
    filterStartLocation = $('#filter-start-location').val();
    filterEndLocation = $('#filter-end-location').val();

    // 운행 거리 값을 km단위로 변환합니다.
    filterMinDistance = $('#filter-min-distance').val() ? parseFloat($('#filter-min-distance').val()) * 1000 : '';
    filterMaxDistance = $('#filter-max-distance').val() ? parseFloat($('#filter-max-distance').val()) * 1000 : '';

    filterMinFare = $('#filter-min-fare').val();
    filterMaxFare = $('#filter-max-fare').val();
}

// 리스트 보여주기
function drawList(list) {
    var content = '';
    if (list.length > 0) {
        for (item of list) {
            var tripRecordDate = moment(item.trip_record_date).format('YY/MM/DD HH:mm:ss');
            var tripRecordDistance = (item.trip_record_distance / 1000).toFixed(2) + ' km';
            var tripRecordFare = numberWithCommas(item.trip_record_fare) + ' 원';
            content += '<tr class="trip-list-tbody-tr" id="' + item.trip_record_idx + '">'
                + '<td class="text-center ellipsis">' + tripRecordDate + '</td>'
                + '<td class="text-center ellipsis">' + item.trip_record_idx + '</td>'
                + '<td class="text-center ellipsis">' + item.trip_record_driver_name + '</td>'
                + '<td class="text-center ellipsis">' + item.trip_record_start_location + '</td>'
                + '<td class="text-center ellipsis">' + item.trip_record_end_location + '</td>'
                + '<td class="text-center ellipsis">' + tripRecordDistance + '</td>'
                + '<td class="text-center ellipsis">' + tripRecordFare + '</td>'
                + '</tr>';
        }
    } else {
        content = '<tr><td colspan="7" class="text-center">데이터가 존재하지 않습니다.</td></tr>';
    }
    $('#trip-list').html(content);
}

// 숫자에 콤마 추가
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

</script>

</html>
