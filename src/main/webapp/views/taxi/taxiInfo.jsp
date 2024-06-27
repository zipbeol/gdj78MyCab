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
                                                                <input type="button" class="btn btn-primary"
                                                                       onclick="getTaxiList()"
                                                                       value="검색" style="display: none">
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-4">
                                                                <label for="filter-taxi-reg-date" class="form-label">정비일
                                                                    필터</label>
                                                            </div>
                                                            <div class="col-2">
                                                            </div>
                                                            <div class="col-2">
                                                            </div>
                                                            <div class="col-4">
                                                                <label for="search-category-maintenance"
                                                                       class="form-label">번호판 검색</label>
                                                            </div>
                                                        </div>
                                                        <div class="row mb-3">
                                                            <div class="col-4">
                                                                <div class="input-group" id="filter-taxi-reg-date-div">
                                                                    <input type="text"
                                                                           class="form-control datepicker-range taxi-search-filter"
                                                                           id="filter-taxi-reg-date">
                                                                    <span class="input-group-text"><i
                                                                            class="bi bi-calendar2-range"></i></span>
                                                                </div>
                                                            </div>
                                                            <div class="col-2">
                                                            </div>
                                                            <div class="col-2">
                                                            </div>
                                                            <div class="col-4 text-end">
                                                                <div class="input-group mb-3">
                                                                    <select class="form-select"
                                                                            id="search-category-maintenance">
                                                                        <option value="">카테고리</option>
                                                                        <option value="maintenance_history_workshop_name">
                                                                            정비소
                                                                        </option>
                                                                        <option value="maintenance_history_description">
                                                                            정비 내용
                                                                        </option>
                                                                    </select>
                                                                    <input type="text" class="form-control"
                                                                           placeholder="검색 단어를 입력해 주세요.">
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
                                                                    <th class="text-center sortable"
                                                                        id="th-taxi-license-plate"
                                                                        style="width: 25%;"
                                                                        data-value="taxi-license-plate">번호판
                                                                    </th>
                                                                    <th class="text-center sortable" id="th-taxi-model"
                                                                        style="width: 20%;" data-value="taxi-model">차종
                                                                    </th>
                                                                    <th class="text-center sortable"
                                                                        id="th-taxi-reg-date"
                                                                        style="width: 25%;" data-value="taxi-reg-date">
                                                                        등록일
                                                                    </th>
                                                                    <th class="text-center sortable"
                                                                        id="th-taxi-is-active"
                                                                        style="width: 15%;" data-value="taxi-is-active">
                                                                        폐차 여부
                                                                    </th>
                                                                </tr>
                                                                </thead>
                                                                <tbody id="taxi-list">
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
                                                    <%--                                                    <div class="search-filter-container border border-2 p-3 rounded mb-3">--%>
                                                    <%--                                                        <div class="row mb-3">--%>
                                                    <%--                                                            <div class="col-10">--%>
                                                    <%--                                                            </div>--%>
                                                    <%--                                                            <div class="col-2 text-end d-md-flex justify-content-md-end gap-2">--%>
                                                    <%--                                                                <input type="button" class="btn btn-secondary" onclick="filterReset()"--%>
                                                    <%--                                                                       value="초기화">--%>
                                                    <%--                                                                <input type="button" class="btn btn-primary" onclick="getTaxiList()"--%>
                                                    <%--                                                                       value="검색" style="display: none">--%>
                                                    <%--                                                            </div>--%>
                                                    <%--                                                        </div>--%>
                                                    <%--                                                        <div class="row">--%>
                                                    <%--                                                            <div class="col-4">--%>
                                                    <%--                                                                <label for="filter-taxi-reg-date" class="form-label">등록일 필터</label>--%>
                                                    <%--                                                            </div>--%>
                                                    <%--                                                            <div class="col-2">--%>
                                                    <%--                                                                <label for="filter-taxi-model" class="form-label">차종 필터</label>--%>
                                                    <%--                                                            </div>--%>
                                                    <%--                                                            <div class="col-2">--%>

                                                    <%--                                                                <label for="filter-taxi-is-active" class="form-label">폐차여부 필터</label>--%>
                                                    <%--                                                            </div>--%>
                                                    <%--                                                            <div class="col-1"></div>--%>
                                                    <%--                                                            <div class="col-3">--%>

                                                    <%--                                                                <label for="search-taxi-license-plate" class="form-label">번호판 검색</label>--%>
                                                    <%--                                                            </div>--%>
                                                    <%--                                                        </div>--%>
                                                    <%--                                                        <div class="row mb-3">--%>
                                                    <%--                                                            <div class="col-4">--%>
                                                    <%--                                                                <div class="input-group" id="filter-taxi-reg-date-div">--%>
                                                    <%--                                                                    <input type="text"--%>
                                                    <%--                                                                           class="form-control datepicker-range taxi-search-filter"--%>
                                                    <%--                                                                           id="filter-taxi-reg-date">--%>
                                                    <%--                                                                    <span class="input-group-text"><i class="bi bi-calendar2-range"></i></span>--%>
                                                    <%--                                                                </div>--%>
                                                    <%--                                                            </div>--%>
                                                    <%--                                                            <div class="col-2">--%>
                                                    <%--                                                                <select id="filter-taxi-model" class="form-select taxi-search-filter">--%>
                                                    <%--                                                                    <option value="">차종</option>--%>
                                                    <%--                                                                    <c:forEach items="${taxiModelList}" var="taxiModel">--%>
                                                    <%--                                                                        <option value="${taxiModel}">${taxiModel}</option>--%>
                                                    <%--                                                                    </c:forEach>--%>
                                                    <%--                                                                </select>--%>
                                                    <%--                                                            </div>--%>
                                                    <%--                                                            <div class="col-2">--%>
                                                    <%--                                                                <select id="filter-taxi-is-active"--%>
                                                    <%--                                                                        class="form-select taxi-search-filter">--%>
                                                    <%--                                                                    <option value="">폐차 여부</option>--%>
                                                    <%--                                                                    <option value="1">폐차아님</option>--%>
                                                    <%--                                                                    <option value="0">폐차</option>--%>
                                                    <%--                                                                </select>--%>
                                                    <%--                                                            </div>--%>
                                                    <%--                                                            <div class="col-1"></div>--%>
                                                    <%--                                                            <div class="col-3 text-end">--%>
                                                    <%--                                                                <input type="text" class="form-control taxi-search-filter bg-"--%>
                                                    <%--                                                                       id="search-taxi-license-plate"--%>
                                                    <%--                                                                       placeholder="번호판을 입력해 주세요">--%>
                                                    <%--                                                            </div>--%>
                                                    <%--                                                        </div>--%>
                                                    <%--                                                    </div>--%>
                                                    <!-- 검색창 종료 -->
                                                    <!-- 리스트 테이블 시작 -->
                                                    <%--                                                    <div class="table-outer">--%>
                                                    <%--                                                        <div class="table-responsive">--%>
                                                    <%--                                                            <table class="table align-middle table-hover m-0">--%>
                                                    <%--                                                                <thead>--%>
                                                    <%--                                                                <tr>--%>
                                                    <%--                                                                    <th class="text-center sortable" id="th-taxi-license-plate"--%>
                                                    <%--                                                                        style="width: 25%;" data-value="taxi-license-plate">번호판--%>
                                                    <%--                                                                    </th>--%>
                                                    <%--                                                                    <th class="text-center sortable" id="th-taxi-model"--%>
                                                    <%--                                                                        style="width: 20%;" data-value="taxi-model">차종--%>
                                                    <%--                                                                    </th>--%>
                                                    <%--                                                                    <th class="text-center sortable" id="th-taxi-reg-date"--%>
                                                    <%--                                                                        style="width: 25%;" data-value="taxi-reg-date">등록일--%>
                                                    <%--                                                                    </th>--%>
                                                    <%--                                                                    <th class="text-center sortable" id="th-taxi-is-active"--%>
                                                    <%--                                                                        style="width: 15%;" data-value="taxi-is-active">폐차 여부--%>
                                                    <%--                                                                    </th>--%>
                                                    <%--                                                                </tr>--%>
                                                    <%--                                                                </thead>--%>
                                                    <%--                                                                <tbody id="taxi-list">--%>
                                                    <%--                                                                </tbody>--%>
                                                    <%--                                                            </table>--%>
                                                    <%--                                                        </div>--%>
                                                    <%--                                                    </div>--%>
                                                    <!-- 리스트 테이블 종료 -->
                                                    <!-- 페이지 네이션 시작 -->
                                                    <%--                                                    <nav aria-label="Page navigation example" class="mt-3">--%>
                                                    <%--                                                        <ul class="pagination justify-content-center" id="pagination"></ul>--%>
                                                    <%--                                                    </nav>--%>
                                                    <!-- 페이지 네이션 종료 -->
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
<!-- Custom JS files -->
<script src="/assets/js/custom.js"></script>
<script src="/assets/js/LocalStorage.js"></script>
<script src="/assets/js/showAlert.js"></script>
<!-- 페이지네이션 -->
<script src="/assets/js/jquery.twbsPagination.min.js"></script>
<!-- Moment JS -->
<script src="/assets/js/moment.min.js"></script>
<!-- Date Range JS -->
<script src="/assets/vendor/daterange/daterange.js"></script>
<script src="/assets/vendor/daterange/custom-daterange.js"></script>

<script>
    var searchText = '';
    var searchIdx = '${taxiDTO.taxi_idx}';
    var filterEndDate = '';
    var filterTaxiModel = '';
    var filterIsActive = '';
    var currentPage = 1; // 현재 페이지 번호
    var sortOrder = 'asc';
    var sortColumn = 'default';

    // 정비 비용 입력 필드에 대한 input 이벤트 리스너
    $('#maintenanceCost').on('input', function(e) {
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

        console.log('정비 날짜:', maintenanceDate);
        console.log('정비 비용:', maintenanceCost);
        console.log('정비소 이름:', workshopName);
        console.log('정비 내용:', maintenanceDescription);

        // 서버로 데이터 전송 예제
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
                    location.reload();
                    showAlert('success', '정비 이력이 등록되었습니다.');
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

        console.log(taxiLicensePlate);
        console.log(taxiModel);
        console.log(taxiFuelType);
        console.log(taxiYear);
        console.log('${taxiDTO.taxi_idx}');
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
</script>

</html>