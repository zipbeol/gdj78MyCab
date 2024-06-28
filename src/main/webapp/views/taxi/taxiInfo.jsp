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

    <!-- Date Range CSS -->
    <link rel="stylesheet" href="/assets/vendor/daterange/daterange.css">
    <!-- 따로 적용한 CSS -->
    <link rel="stylesheet" href="/assets/css/default.css">
    <!-- FontAwesome 추가 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

    <style>
        .maintenance-list-tbody-tr td.ellipsis {
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            max-width: 1px; /* 추가: 텍스트가 잘릴 수 있도록 설정 */
        }

        .table-responsive {
            overflow-x: initial; /* 스크롤 바 방지 */
        }

        table.table {
            table-layout: fixed; /* 고정된 테이블 레이아웃 */
            width: 100%;
        }

        table.table th, table.table td {
            overflow: hidden;
            text-overflow: ellipsis;
        }

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

        .info-label {
            font-weight: bold; /* Optionally make labels bold */
        }

        .info-value {
            font-size: 16px; /* Adjust font size as needed */
        }

        .edit-save-buttons {
            text-align: end; /* Align buttons to the right */
            margin-top: 10px; /* Add space above the buttons */
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
                        <a href="/taxi/list.go" class="text-decoration-none">택시 조회</a>
                    </li>
                    <li class="breadcrumb-item">
                        <a href="/taxi/detail.go?taxi_idx=${taxiDTO.taxi_idx}"
                           class="text-decoration-none">택시 상세</a>
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
                                                    data-bs-target="#taxi-detail" type="button" role="tab"
                                                    aria-controls="taxi-detail" aria-selected="true">택시 상세
                                            </button>
                                        </li>
                                        <li class="nav-item" role="presentation">
                                            <button class="nav-link" id="taxi-schedule-tab" data-bs-toggle="tab"
                                                    data-bs-target="#taxi-schedule" type="button" role="tab"
                                                    aria-controls="taxi-schedule" aria-selected="false">택시 스케쥴
                                            </button>
                                        </li>
                                    </ul>
                                </div>
                                <div class="card-body tab-content" id="taxiTabsContent">
                                    <div class="tab-pane fade show active" id="taxi-detail" role="tabpanel"
                                         aria-labelledby="taxi-detail-tab">
                                        <!-- 택시 상세 내용 -->
                                        <div class="row mb-3">
                                            <div class="col-8">
                                                <h1>택시 정보</h1>
                                            </div>
                                            <div class="col-4 text-end edit-save-buttons">
                                                <input type="button" class="btn btn-primary" value="수정"
                                                       id="edit-button">
                                                <input type="button" class="btn btn-success" value="저장" id="save-button"
                                                       style="display: none;">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <dl class="row">
                                                    <dt class="col-3 info-label">택시 번호판:</dt>
                                                    <dd class="col-9 info-value mb-3" id="taxi-license-plate"
                                                        data-value="${taxiDTO.taxi_license_plate}">${taxiDTO.taxi_license_plate}</dd>
                                                    <dt class="col-3 info-label">택시 차종:</dt>
                                                    <dd class="col-9 info-value mb-3" id="taxi-model"
                                                        data-value="${taxiDTO.taxi_model}">${taxiDTO.taxi_model}</dd>
                                                    <dt class="col-3 info-label">택시 연료타입:</dt>
                                                    <dd class="col-9 info-value mb-3" id="taxi-fuel-type"
                                                        data-value="${taxiDTO.taxi_fuel_type}">${taxiDTO.taxi_fuel_type}</dd>
                                                    <dt class="col-3 info-label">택시 등록일:</dt>
                                                    <dd class="col-9 mb-3">${taxiDTO.taxi_registration_date}</dd>
                                                    <dt class="col-3 info-label">택시 연식:</dt>
                                                    <dd class="col-9 info-value mb-3" id="taxi-year"
                                                        data-value="${taxiDTO.taxi_year}">${taxiDTO.taxi_year}</dd>
                                                    <dt class="col-3 info-label">택시 폐차여부:</dt>
                                                    <dd class="col-9 mb-3" id="taxi-is-active"
                                                        data-value="${taxiDTO.taxi_is_active}">
                                                        <c:choose>
                                                            <c:when test="${taxiDTO.taxi_is_active == 1}">
                                                                폐차 아님
                                                            </c:when>
                                                            <c:otherwise>
                                                                폐차
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </dd>
                                                </dl>
                                            </div>
                                        </div>
                                        <!-- 새로운 탭을 위한 영역 -->
                                        <div class="new-tabs">
                                            <ul class="nav nav-tabs mb-3" id="newTabs" role="tablist">
                                                <li class="nav-item" role="presentation">
                                                    <button class="nav-link active" id="maintenance-tab"
                                                            data-bs-toggle="tab"
                                                            data-bs-target="#maintenance" type="button" role="tab"
                                                            aria-controls="maintenance" aria-selected="true">정비 이력
                                                    </button>
                                                </li>
                                                <li class="nav-item" role="presentation">
                                                    <button class="nav-link" id="accident-tab" data-bs-toggle="tab"
                                                            data-bs-target="#accident" type="button" role="tab"
                                                            aria-controls="accident" aria-selected="false">사고 이력
                                                    </button>
                                                </li>
                                            </ul>
                                            <div class="tab-content" id="newTabsContent">
                                                <div class="tab-pane fade show active" id="maintenance" role="tabpanel"
                                                     aria-labelledby="maintenance-tab">
                                                    <h2>정비 이력 조회</h2>
                                                    <div class="text-end mb-1">
                                                        <input type="button" class="btn btn-primary" value="정비 이력 등록"
                                                               id="maintenance-reg-btn">
                                                    </div>
                                                    <!-- 검색창 시작 -->
                                                    <div class="search-filter-container border border-2 p-3 rounded mb-3">
                                                        <div class="row mb-3">
                                                            <div class="col-10">
                                                            </div>
                                                            <div class="col-2 text-end d-md-flex justify-content-md-end gap-2">
                                                                <input type="button" class="btn btn-secondary"
                                                                       onclick="filterReset()"
                                                                       value="초기화">
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-4">
                                                                <label for="filter-maintenance-reg-date"
                                                                       class="form-label">정비일
                                                                    필터</label>
                                                            </div>
                                                            <div class="col-2">
                                                            </div>
                                                            <div class="col-2">
                                                                <label for="search-category-maintenance"
                                                                       class="form-label">검색 카테고리</label>
                                                            </div>
                                                            <div class="col-4">
                                                                <label for="search-text-maintenance"
                                                                       class="form-label">검색</label>
                                                            </div>
                                                        </div>
                                                        <div class="row mb-3">
                                                            <div class="col-4">
                                                                <div class="input-group"
                                                                     id="filter-maintenance-reg-date-div">
                                                                    <input type="text"
                                                                           class="form-control datepicker-range maintenance-search-filter"
                                                                           id="filter-maintenance-reg-date">
                                                                    <span class="input-group-text"><i
                                                                            class="bi bi-calendar2-range"></i></span>
                                                                </div>
                                                            </div>
                                                            <div class="col-2">
                                                            </div>
                                                            <div class="col-2 d-flex">
                                                                <select class="form-select maintenance-search-filter"
                                                                        id="search-category-maintenance">
                                                                    <option value="">카테고리</option>
                                                                    <option value="maintenance_history_workshop_name">
                                                                        정비소
                                                                    </option>
                                                                    <option value="maintenance_history_description">
                                                                        정비 내용
                                                                    </option>
                                                                </select>
                                                            </div>
                                                            <div class="col-4">
                                                                <input type="text"
                                                                       class="form-control maintenance-search-filter"
                                                                       id="search-text-maintenance"
                                                                       placeholder="검색 단어를 입력해 주세요.">
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
                                                                    <th class="sortable"
                                                                        id="th-maintenance-history-date"
                                                                        style="width: 10%;"
                                                                        data-value="maintenance-history-date">정비일
                                                                    </th>
                                                                    <th class="sortable"
                                                                        id="th-maintenance-history-workshop-name"
                                                                        style="width: 25%;"
                                                                        data-value="maintenance-history-workshop-name">
                                                                        정비소
                                                                    </th>
                                                                    <th class="sortable"
                                                                        id="th-maintenance-history-description"
                                                                        style="width: 50%;"
                                                                        data-value="maintenance-history-description">
                                                                        정비 내용
                                                                    </th>
                                                                    <th class="sortable"
                                                                        id="th-maintenance-history-cost"
                                                                        style="width: 15%;"
                                                                        data-value="maintenance-history-cost">정비 비용
                                                                    </th>
                                                                </tr>
                                                                </thead>
                                                                <tbody id="maintenance-list">
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                    <!-- 리스트 테이블 종료 -->
                                                </div>
                                                <div class="tab-pane fade" id="accident" role="tabpanel"
                                                     aria-labelledby="accident-tab">
                                                    <h2>사고 이력 내용</h2>
                                                    <!-- 사고 이력 내용을 여기에 추가 -->
                                                    <!-- 검색창 시작 -->
                                                    <div class="search-filter-container border border-2 p-3 rounded mb-3">
                                                        <div class="row mb-3">
                                                            <div class="col-10">
                                                            </div>
                                                            <div class="col-2 text-end d-md-flex justify-content-md-end gap-2">
                                                                <input type="button" class="btn btn-secondary"
                                                                       onclick="filterReset()"
                                                                       value="초기화">
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-4">
                                                                <label for="filter-accident-reg-date"
                                                                       class="form-label">사고 날짜
                                                                    필터</label>
                                                            </div>
                                                            <div class="col-2">
                                                            </div>
                                                            <div class="col-2">
                                                                <label for="search-category-accident"
                                                                       class="form-label">검색 카테고리</label>
                                                            </div>
                                                            <div class="col-4">
                                                                <label for="search-text-accident"
                                                                       class="form-label">검색</label>
                                                            </div>
                                                        </div>
                                                        <div class="row mb-3">
                                                            <div class="col-4">
                                                                <div class="input-group"
                                                                     id="filter-accident-reg-date-div">
                                                                    <input type="text"
                                                                           class="form-control datepicker-range accident-search-filter"
                                                                           id="filter-accident-reg-date">
                                                                    <span class="input-group-text"><i
                                                                            class="bi bi-calendar2-range"></i></span>
                                                                </div>
                                                            </div>
                                                            <div class="col-2">
                                                            </div>
                                                            <div class="col-2 d-flex">
                                                                <select class="form-select accident-search-filter"
                                                                        id="search-category-accident">
                                                                    <option value="">카테고리</option>
                                                                    <option value="accident_history_location">
                                                                        사고 장소
                                                                    </option>
                                                                    <option value="accident_history_description">
                                                                        사고 내용
                                                                    </option>
                                                                    <option value="accident_history_driver_name">
                                                                        사고 기사
                                                                    </option>
                                                                </select>
                                                            </div>
                                                            <div class="col-4">
                                                                <input type="text"
                                                                       class="form-control maintenance-search-filter"
                                                                       id="search-text-accident"
                                                                       placeholder="검색 단어를 입력해 주세요.">
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
                                                                    <th class="sortable"
                                                                        id="th-accident-history-date"
                                                                        style="width: 15%;"
                                                                        data-value="accident-history-date">사고 날짜
                                                                    </th>
                                                                    <th class="sortable"
                                                                        id="th-accident-history-address"
                                                                        style="width: 25%;"
                                                                        data-value="accident-history-address">
                                                                        사고 장소
                                                                    </th>
                                                                    <th class="sortable"
                                                                        id="th-accident-history-description"
                                                                        style="width: 50%;"
                                                                        data-value="accident-history-description">
                                                                        사고 내용
                                                                    </th>
                                                                    <th class="sortable"
                                                                        id="th-accident-history-driver-name"
                                                                        style="width: 10%;"
                                                                        data-value="accident-history-driver-name">사고 기사
                                                                    </th>
                                                                </tr>
                                                                </thead>
                                                                <tbody id="accident-list">
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                    <!-- 리스트 테이블 종료 -->
                                                </div>
                                            </div>

                                            <!-- 페이지 네이션 시작 -->
                                            <nav aria-label="Page navigation example" class="mt-3">
                                                <ul class="pagination justify-content-center"
                                                    id="pagination"></ul>
                                            </nav>
                                            <!-- 페이지 네이션 종료 -->
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="taxi-schedule" role="tabpanel"
                                         aria-labelledby="taxi-schedule-tab">
                                        <h1>택시 스케쥴</h1>
                                        <!-- 택시 스케쥴 내용을 여기에 추가 -->
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

<!-- 정비 이력 등록 모달 시작 -->
<div class="modal fade" id="maintenanceRegModal" tabindex="-1" aria-labelledby="maintenanceRegModalLabel"
     aria-hidden="true">
    <!-- Alert placeholder start -->
    <div id="alertModalPlaceholder" class="alert alert-placeholder"></div>
    <!-- Alert placeholder end -->
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="maintenanceRegModalLabel">정비 이력 등록</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="maintenanceRegForm" class="needs-validation" novalidate>
                    <div class="mb-3">
                        <label for="maintenanceDate" class="form-label">정비 날짜</label>
                        <input type="text" class="form-control datepicker" id="maintenanceDate" required>
                    </div>
                    <div class="mb-3">
                        <label for="maintenanceCost" class="form-label">정비 비용</label>
                        <input type="text" class="form-control" maxlength="10" id="maintenanceCost" required>
                    </div>
                    <div class="mb-3">
                        <label for="workshopName" class="form-label">정비소 이름</label>
                        <input type="text" class="form-control" id="workshopName" required>
                    </div>
                    <div class="mb-3">
                        <label for="maintenanceDescription" class="form-label">정비 내용</label>
                        <textarea class="form-control" id="maintenanceDescription" rows="3" required></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-primary" id="saveMaintenanceBtn">저장</button>
            </div>
        </div>
    </div>
</div>
<!-- 정비 이력 등록 모달 끝 -->
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
<script src="/assets/js/LocalStorage.js"></script>
<script src="/assets/js/showAlert.js"></script>
<!-- 페이지네이션 -->
<script src="/assets/js/jquery.twbsPagination.min.js"></script>

<script>
    var searchText = '';
    var searchCategory = '';
    var searchIdx = '${taxiDTO.taxi_idx}';
    var today = moment().format('YYYY/MM/DD');
    var filterMaintenanceAllDay = '${maintenanceFirstDate}' + ' - ' + today;
    var filterAccidentAllDay = '${accidentFirstDate}' + ' - ' + today;
    var filterStartDate = '${maintenanceFirstDate}';
    var filterEndDate = '';
    var currentPage = 1; // 현재 페이지 번호
    var sortOrder = 'asc';
    var sortColumn = 'default';
    var nowTab = 'maintenance';

    $('#filter-maintenance-reg-date').val(filterMaintenanceAllDay);


    getTotalPages();
    getList();

    // 현재 탭 구분
    $('#accident-tab').on('click', function () {
        nowTab = 'accident'
        currentPage = 1;
        filterStartDate = '${accidentFirstDate}';
        $('#filter-accident-reg-date').val(filterAccidentAllDay);
        getTotalPages();
        getList();
    });
    $('#maintenance-tab').on('click', function () {
        nowTab = 'maintenance'
        currentPage = 1;
        filterStartDate = '${maintenanceFirstDate}';
        $('#filter-maintenance-reg-date').val(filterMaintenanceAllDay);
        getTotalPages();
        getList();
    });

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
    $('#filter-accident-reg-date').on('change', function () {
        currentPage = 1;
        getTotalPages();
        getList();
    });
    $('.accident-search-filter').on('input', function () {
        currentPage = 1;
        getTotalPages();
        getList();
    });
    $('#filter-maintenance-reg-date').on('change', function () {
        currentPage = 1;
        getTotalPages();
        getList();
    });
    $('.maintenance-search-filter').on('input', function () {
        currentPage = 1;
        getTotalPages();
        getList();
    });

    // 정비 비용 입력 필드에 대한 input 이벤트 리스너
    $('#maintenanceCost').on('input', function (e) {
        var value = $(this).val().replace(/,/g, '');

        // 숫자만 허용하고, 최대 10자리로 제한
        if (/^\d*$/.test(value) && value.length <= 12) {
            // 3자리마다 쉼표 추가
            $(this).val(value.replace(/\B(?=(\d{3})+(?!\d))/g, ','));
        } else {
            // 입력값이 10자리를 초과하는 경우 첫 10자리까지만 사용
            var truncated = value.substring(0, 10);
            $(this).val(truncated.replace(/\B(?=(\d{3})+(?!\d))/g, ','));
        }
    });
    // 정비 이력 등록 버튼 클릭 시 모달 표시
    $('#maintenance-reg-btn').click(function () {
        $('#maintenanceRegModal').modal('show');
    });

    // 저장 버튼 클릭 시 데이터 처리
    $('#saveMaintenanceBtn').click(function () {
        isModalAlert = true;
        var form = document.querySelector('.needs-validation');
        if (!form.checkValidity()) {
            form.classList.add('was-validated');
            showAlert('danger', '입력 값이 올바르지 않습니다.');
            return;
        }
        // 입력된 데이터 가져오기
        var workshopName = $('#workshopName').val();
        var maintenanceDescription = $('#maintenanceDescription').val();
        var maintenanceDate = $('#maintenanceDate').val();
        var maintenanceCost = $('#maintenanceCost').val().replace(/,/g, ''); // 쉼표 제거

        // console.log('정비 날짜:', maintenanceDate);
        // console.log('정비 비용:', maintenanceCost);
        // console.log('정비소 이름:', workshopName);
        // console.log('정비 내용:', maintenanceDescription);

        // 서버로 데이터 전송
        $.ajax({
            url: '/maintenance/create.ajax',
            type: 'POST',
            data: {
                'maintenance_history_workshop_name': workshopName,
                'maintenance_history_description': maintenanceDescription,
                'maintenance_history_date': maintenanceDate,
                'maintenance_history_taxi_idx': '${taxiDTO.taxi_idx}',
                'maintenance_history_cost': maintenanceCost
            },
            dataType: 'JSON',
            success: function (data) {
                if (data.result) {
                    // 성공 시 모달 닫기 및 메시지 표시
                    $('#maintenanceRegModal').modal('hide');
                    isModalAlert = false;
                    showAlert('success', '정비 이력이 등록되었습니다.');
                    currentPage = 1;
                    getTotalPages();
                    getList();
                } else {

                    showAlert('danger', '정비 이력 등록에 실패했습니다.');
                }
            },
            error: function (error) {
                console.log(error);
                showAlert('danger', '정비 이력 등록에 실패했습니다.');
            }
        });
    });

    $('#edit-button').click(function () {
        $('.info-value').each(function () {
            var value = $(this).data('value');
            var id = $(this).attr('id');
            $(this).html('<input type="text" class="form-control" id="' + id + '" value="' + value + '">');
        });
        $('#edit-button').hide();
        $('#save-button').show();
    });

    $('#save-button').click(function () {
        var taxiLicensePlate = $('#taxi-license-plate input').val();
        var taxiModel = $('#taxi-model input').val();
        var taxiFuelType = $('#taxi-fuel-type input').val();
        var taxiYear = $('#taxi-year input').val();

        <%--console.log(taxiLicensePlate);--%>
        <%--console.log(taxiModel);--%>
        <%--console.log(taxiFuelType);--%>
        <%--console.log(taxiYear);--%>
        <%--console.log('${taxiDTO.taxi_idx}');--%>
        $.ajax({
            url: './update.ajax',
            type: 'POST',
            data: {
                'taxi_license_plate': taxiLicensePlate,
                'taxi_model': taxiModel,
                'taxi_fuel_type': taxiFuelType,
                'taxi_year': taxiYear,
                'taxi_idx': '${taxiDTO.taxi_idx}'
            },
            dataType: 'JSON',
            success: function (data) {
                console.log(data);
                if (data.result) {
                    $('.info-value').each(function () {
                        var value = $(this).find('input').val();
                        $(this).data('value', value);
                        $(this).text(value);
                    });
                    $('#save-button').hide();
                    $('#edit-button').show();
                    showAlert('success', '수정이 완료되었습니다.');
                } else {
                    showAlert('danger', '수정에 실패했습니다.');
                }
            },
            error: function (error) {
                console.log(error);
                showAlert('danger', '수정에 실패했습니다.');
            }
        });
    });

    // 필터 값 리셋
    function filterReset() {
        if (nowTab === 'maintenance') {
            $('#search-category-maintenance').val('');
            $('#search-text-maintenance').val('');
            $('#filter-maintenance-reg-date').val(filterMaintenanceAllDay);
        } else if (nowTab === 'accident') {
            $('#search-category-accident').val('');
            $('#search-text-accident').val('');
            $('#filter-accident-reg-date').val(filterAccidentAllDay);
        }
        currentPage = 1; // 페이지 번호 초기화
        getTotalPages();
        getList(); // 목록 새로고침
    }

    // 리스트 호출
    function getList() {
        getSearchValue();
        if (nowTab === 'maintenance') {
            maintenanceListAjax();
        } else if (nowTab === 'accident') {
            accidentListAjax();
        }
    }

    function maintenanceListAjax() {
        $.ajax({
            url: '/maintenance/list.ajax',
            type: 'GET',
            data: {
                'searchIdx': searchIdx,
                'searchText': searchText,
                'category': searchCategory,
                'filterStartDate': filterStartDate,
                'filterEndDate': filterEndDate,
                'page': currentPage,
                'sortColumn': sortColumn,
                'sortOrder': sortOrder
            },
            dataType: 'JSON',
            success: function (data) {
                drawTaxiList(data.maintenanceList);
            },
            error: function (error) {
                console.log(error);
            }
        });
    }

    function accidentListAjax() {
        $.ajax({
            url: '/accident/list.ajax',
            type: 'GET',
            data: {
                'searchIdx': searchIdx,
                'searchText': searchText,
                'category': searchCategory,
                'filterStartDate': filterStartDate,
                'filterEndDate': filterEndDate,
                'page': currentPage,
                'sortColumn': sortColumn,
                'sortOrder': sortOrder
            },
            dataType: 'JSON',
            success: function (data) {
                console.log(data);
                drawTaxiList(data.accidentList);
            },
            error: function (error) {
                console.log(error);
            }
        });
    }

    // 토탈 페이지 호출
    function getTotalPages() {
        getSearchValue();
        if (nowTab === 'maintenance') {
            maintenanceTotalPagesAjax();
        } else if (nowTab === 'accident') {
            accidentTotalPagesAjax();
        }
    }

    function maintenanceTotalPagesAjax() {
        $.ajax({
            url: '/maintenance/getTotalPages.ajax',
            type: 'GET',
            data: {
                'searchText': searchText,
                'filterStartDate': filterStartDate,
                'filterEndDate': filterEndDate,
                'category': searchCategory,
                'searchIdx': searchIdx
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

    function accidentTotalPagesAjax() {
        console.log("ajax 직전", filterStartDate);
        console.log("ajax 직전", filterEndDate);
        $.ajax({
            url: '/accident/getTotalPages.ajax',
            type: 'GET',
            data: {
                'searchText': searchText,
                'filterStartDate': filterStartDate,
                'filterEndDate': filterEndDate,
                'category': searchCategory,
                'searchIdx': searchIdx
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
        var filterDate = '';
        var dates = '';
        if (nowTab === 'maintenance') {
            filterDate = $('#filter-maintenance-reg-date').val();
            if (filterDate) {
                dates = filterDate.split(' - ');
                filterStartDate = dates[0];
                filterEndDate = dates[1];
            }
            searchCategory = $('#search-category-maintenance').val();
            searchText = $('#search-text-maintenance').val();
        } else if (nowTab === 'accident') {
            filterDate = $('#filter-accident-reg-date').val();
            if (filterDate) {
                dates = filterDate.split(' - ');
                filterStartDate = dates[0];
                filterEndDate = dates[1];
            }
            searchCategory = $('#search-category-accident').val();
            searchText = $('#search-text-accident').val();
        }
        console.log(filterStartDate);
        console.log(filterEndDate);

    }

    // 리스트 보여주기
    function drawTaxiList(list) {
        var content = '';
        if (nowTab === 'maintenance') {
            // console.log(list);
            if (list) {
                for (item of list) {
                    var formattedCost = Number(item.maintenance_history_cost).toLocaleString();
                    content += '<tr class="maintenance-list-tbody-tr" id="' + item.taxi_idx + '">'
                        + '<td class="">' + item.maintenance_history_date + '</td>'
                        + '<td class="">' + item.maintenance_history_workshop_name + '</td>'
                        + '<td class="ellipsis">' + item.maintenance_history_description + '</td>'
                        + '<td class="">' + formattedCost + ' 원</td>'
                        + '</tr>';
                }
            } else {
                content = '<tr><td colspan="4" class="text-center">데이터가 존재하지 않습니다.</td></tr>';
            }
            $('#maintenance-list').html(content);
        } else if (nowTab === 'accident') {
            // console.log(list);
            if (list) {
                for (item of list) {
                    content += '<tr class="maintenance-list-tbody-tr" id="' + item.taxi_idx + '">'
                        + '<td class="">' + item.accident_history_accident_date + '</td>'
                        + '<td class="">' + item.accident_history_location + '</td>'
                        + '<td class="ellipsis">' + item.accident_history_description + '</td>'
                        + '<td class="">' + item.accident_history_driver_name + '</td>'
                        + '</tr>';
                }
            } else {
                content = '<tr><td colspan="4" class="text-center">데이터가 존재하지 않습니다.</td></tr>';
            }
            $('#accident-list').html(content);
        }
    }
</script>

</html>
