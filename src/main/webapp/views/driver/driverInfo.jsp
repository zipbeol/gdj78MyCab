<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>My Cab - 기사 정보</title>
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
    <!-- FontAwesome 추가 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

    <style>
        .alert-placeholder {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 9999; /* Set a high z-index value */
            margin: 0;
            padding: 10px;
            text-align: center;
        }

        .list-group-item {
            display: flex;
            justify-content: space-between; /* 각 span 사이에 공간 배분 */
        }

        .taxi-info {
            flex: 1; /* 각 span이 동일한 공간을 차지하게 함 */
            text-align: center; /* 각 span 내의 텍스트를 중앙 정렬 */
            padding: 0 10px; /* 좌우 패딩 추가 */
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

        /* 새로 추가할 스타일 */
        #accident-detail-description {
            resize: none;
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
                        <a href="/driver/list.go" class="text-decoration-none">기사 조회</a>
                    </li>
                    <li class="breadcrumb-item">
                        <a href="/driver/Detail.go?driver_idx=${driverInfo.driver_idx}"
                           class="text-decoration-none">기사 상세</a>
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
                                <div class="card-body">
                                    <form id="driver-form" class="needs-validation" novalidate>
                                        <div class="row">
                                            <div class="col-8">
                                                <h1>기사 정보</h1>
                                            </div>
                                            <div class="col-4 text-end">
                                                <input type="button" class="btn btn-primary" value="수정"
                                                       id="edit-button">
                                                <input type="button" class="btn btn-success" value="저장" id="save-button"
                                                       style="display: none;">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <hr/>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <dl class="row">
                                                    <dt class="col-12 mb-3">기사
                                                        입사일: ${driverInfo.driver_registration_date}</dt>
                                                    <dt class="col-6">기사 사진</dt>
                                                    <dt class="col-6">면허 사진</dt>
                                                    <dd class="col-6 d-flex">
                                                        <img src="/api/imgView/${driverInfo.driver_photo}"
                                                             style="width: 150px; height: 150px;" id="driver-photo">
                                                        <input type="file" id="driver-photo-input"
                                                               data-value="driver-photo" style="display: none;"
                                                               class="form-control">
                                                    </dd>
                                                    <dd class="col-6 d-flex">
                                                        <img src="/api/imgView/${driverInfo.driver_taxi_license_photo}"
                                                             style="width: 200px; height: 150px;"
                                                             id="driver-taxi-license-photo">
                                                        <input type="file" id="license-photo-input"
                                                               data-value="driver-taxi-license-photo"
                                                               style="display: none;" class="form-control">
                                                    </dd>
                                                    <dt class="col-4">기사 이름:</dt>
                                                    <dt class="col-4">기사 재직 여부:</dt>
                                                    <dt class="col-4">기사 연락처:</dt>
                                                    <dd class="col-4 info-value mb-3" id="driver-name"
                                                        data-value="${driverInfo.driver_name}">${driverInfo.driver_name}</dd>
                                                    <dd class="col-4 info-value mb-3" id="driver-is-retired"
                                                        data-value="${driverInfo.driver_is_retired}">
                                                        <c:choose>
                                                            <c:when test="${driverInfo.driver_is_retired == 0}">
                                                                재직중
                                                            </c:when>
                                                            <c:otherwise>
                                                                퇴사
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </dd>
                                                    <dd class="col-4 info-value mb-3" id="driver-phone"
                                                        data-value="${driverInfo.driver_phone}">
                                                        ${fn:substring(driverInfo.driver_phone, 0, 3)}-${fn:substring(driverInfo.driver_phone, 3, 7)}-${fn:substring(driverInfo.driver_phone, 7, 11)}
                                                    </dd>
                                                    <dt class="col-6">기사 주소:</dt>
                                                    <dt class="col-6">기사 상세 주소:</dt>
                                                    <dd class="col-6">
                                                        <div class="col-6">
                                                            <span class="info-value" id="driver-address"
                                                                  data-value="${driverInfo.driver_address}">${driverInfo.driver_address}</span>
                                                        </div>
                                                    </dd>
                                                    <dd class="col-6">
                                                        <div class="col-6">
                                                            <span class="info-value" id="driver-address-detail"
                                                                  data-value="${driverInfo.driver_address_detail}">${driverInfo.driver_address_detail}</span>
                                                        </div>
                                                    </dd>
                                                </dl>
                                            </div>
                                        </div>
                                        <hr/>
                                        <div class="row d-flex">
                                            <div class="col-10 mb-2">
                                                <h2>사고 이력</h2>
                                            </div>
                                            <div class="col-2 text-end">
                                                <!-- 사고 이력 등록 버튼 -->
                                                <input type="button" value="등록" class="btn btn-primary"
                                                       onclick="getTaxiList()" data-bs-toggle="modal"
                                                       data-bs-target="#accidentModal">
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
                                                        <label for="filter-accident-reg-date"
                                                               class="form-label">사고일 필터</label>
                                                    </div>
                                                    <div class="col-2">
                                                        <label for="filter-accident-is-driver-fault"
                                                               class="form-label">기사책임 필터</label>
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
                                                        <select class="form-select accident-is-driver-fault accident-search-filter"
                                                                id="filter-accident-is-driver-fault">
                                                            <option value="">기사책임 여부</option>
                                                            <option value="1">예</option>
                                                            <option value="0">아니오</option>
                                                        </select>
                                                    </div>
                                                    <div class="col-2 d-flex">
                                                        <select class="form-select accident-search-filter"
                                                                id="search-category-accident">
                                                            <option value="">카테고리</option>
                                                            <option value="accident_history_taxi_license_plate">
                                                                사고 번호판
                                                            </option>
                                                            <option value="accident_history_location">
                                                                사고 장소
                                                            </option>
                                                            <option value="accident_history_description">
                                                                사고 내용
                                                            </option>
                                                        </select>
                                                    </div>
                                                    <div class="col-4">
                                                        <input type="text"
                                                               class="form-control accident-search-filter"
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
                                                                id="th-accident-history-license-plate"
                                                                style="width: 20%;"
                                                                data-value="accident-history-license-plate">사고 택시
                                                            </th>
                                                            <th class="sortable"
                                                                id="th-accident-history-reg-date"
                                                                style="width: 15%;"
                                                                data-value="accident-history-reg-date">
                                                                사고일
                                                            </th>
                                                            <th class="sortable"
                                                                id="th-accident-history-location"
                                                                style="width: 25%;"
                                                                data-value="accident-history-location">
                                                                사고 장소
                                                            </th>
                                                            <th class="sortable"
                                                                id="th-accident-history-description"
                                                                style="width: 30%;"
                                                                data-value="accident-history-description">
                                                                사고 내용
                                                            </th>
                                                            <th class="sortable"
                                                                id="th-accident-history-is-driver-fault"
                                                                style="width: 10%;"
                                                                data-value="accident-history-is-driver-fault">기사 책임
                                                            </th>
                                                        </tr>
                                                        </thead>
                                                        <tbody id="accident-list">
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <!-- 리스트 테이블 종료 -->

                                            <!-- 페이지 네이션 시작 -->
                                            <nav aria-label="Page navigation example" class="mt-3">
                                                <ul class="pagination justify-content-center"
                                                    id="pagination"></ul>
                                            </nav>
                                            <!-- 페이지 네이션 종료 -->
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
<!-- Modal HTML -->
<!-- Alert placeholder start -->
<div id="alertModalPlaceholder" class="alert alert-placeholder"></div>
<!-- Alert placeholder end -->
<div class="modal fade" id="accidentModal" tabindex="-1" aria-labelledby="accidentModalLabel" aria-hidden="true">

    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="accidentModalLabel">사고 이력 등록</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form class="needs-validation" novalidate>
                    <div class="mb-3">
                        <label for="searchTaxiLicensePlate" class="form-label">사고 택시</label>
                        <div class="input-group mb-3">
                            <input type="text" class="form-control" id="searchTaxiLicensePlate" placeholder="번호판 검색">
                        </div>
                        <div class="taxi-list" style="max-height: 200px; overflow-y: auto;">
                            <ul class="list-group" id="taxiList">
                                <li class="list-group-item taxi-item d-flex align-items-center justify-content-between"
                                    data-driver-id="taxiidx">
                                    <span class="taxi-info">no</span>
                                    <span class="taxi-info">번호판</span>
                                    <span class="taxi-info">차종</span>
                                    <span class="taxi-info">등록일</span>
                                </li>
                            </ul>
                        </div>

                    </div>
                    <div class="row mb-3">
                        <div class="col-6">
                            <label for="accident-date" class="form-label">사고 날짜</label>
                            <input type="date" class="form-control" id="accident-date" required>
                        </div>
                        <div class="col-6">
                            <label for="accident-is-driver-fault" class="form-label">사고 기사책임 여부</label>
                            <select class="form-select" id="accident-is-driver-fault" required>
                                <option value="" selected disabled>선택하세요</option>
                                <option value="true">예</option>
                                <option value="false">아니오</option>
                            </select>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="accident-location" class="form-label">사고 장소</label>
                        <input type="text" class="form-control" id="accident-location" required>
                    </div>
                    <div class="mb-3">
                        <label for="accident-description" class="form-label">사고 내용</label>
                        <textarea class="form-control" id="accident-description" rows="3" required></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-primary" id="save-accident">저장</button>
            </div>
        </div>
    </div>
</div>

<!-- 사고 이력 상세보기 모달 -->
<div class="modal fade" id="accidentDetailModal" tabindex="-1" aria-labelledby="accidentDetailModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="accidentDetailModalLabel">사고 이력 상세보기</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- 사고 이력 상세 정보 -->
                <div class="row mb-3">
                    <div class="col-3"><strong>사고 날짜:</strong></div>
                    <div class="col-9">
                        <input type="date" class="form-control" id="accident-detail-date" readonly>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-3"><strong>사고 장소:</strong></div>
                    <div class="col-9">
                        <input type="text" class="form-control" id="accident-detail-location" readonly>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-3"><strong>사고 내용:</strong></div>
                    <div class="col-9">
                        <textarea class="form-control" id="accident-detail-description" rows="3" readonly></textarea>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-3"><strong>사고 기사:</strong></div>
                    <div class="col-9">
                        <input type="text" class="form-control" id="accident-detail-driver" readonly>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-3"><strong>과실 여부:</strong></div>
                    <div class="col-9">
                        <select class="form-select" id="accident-detail-fault" disabled>
                            <option value="true">과실 있음</option>
                            <option value="false">과실 없음</option>
                        </select>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-3"><strong>택시 번호판:</strong></div>
                    <div class="col-9">
                        <input type="text" class="form-control" id="accident-detail-license-plate" readonly>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-primary" id="edit-accident-btn">수정</button>
                <button type="button" class="btn btn-success" id="save-accident-detail-btn" style="display: none;">저장
                </button>
                <input type="hidden" id="accident-detail-id">
            </div>
        </div>
    </div>
</div>

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
<!-- Custom JS files -->
<script src="/assets/js/custom.js"></script>
<script src="/assets/js/localStorage.js"></script>
<script src="/assets/js/showAlert.js"></script>

<!-- Date Range JS -->
<script src="/assets/vendor/daterange/daterange.js"></script>
<script src="/assets/vendor/daterange/custom-daterange.js"></script>
<!-- 다음 주소 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 페이지네이션 -->
<script src="/assets/js/jquery.twbsPagination.min.js"></script>

<script>
    var taxiIdx = '';
    var searchText = '';
    var searchCategory = '';
    var searchIdx = '${driverInfo.driver_idx}';
    var today = moment().format('YYYY/MM/DD');
    var filterAccidentAllDay = '${accidentFirstRegDate}' + ' - ' + today;
    var filterStartDate = '${accidentFirstRegDate}';
    var filterEndDate = '';
    var currentPage = 1; // 현재 페이지 번호
    var sortOrder = 'asc';
    var sortColumn = 'default';
    var filterIsDriverFault = '';

    $('#filter-accident-reg-date').val(filterAccidentAllDay);

    getTotalPages();
    getList();

    // 모달창 닫은후
    $('#accidentDetailModal').on('hidden.bs.modal', function () {
        $('#edit-accident-btn').show();
        $('#save-accident-detail-btn').hide();
        $('#accidentDetailModal input, #accidentDetailModal textarea, #accident-detail-fault').prop('readonly', true).prop('disabled', true);
    });

    // 상세보기
    $(document).on('click', '.accident-list-tbody-tr', function () {
        var id = $(this).attr('id');
        $.ajax({
            url: '/accident/detail.ajax',
            type: 'GET',
            data: {'accidentIdx': id},
            dataType: 'JSON',
            success: function (data) {
                $('#accident-detail-date').val(data.info.accident_history_accident_date);
                $('#accident-detail-location').val(data.info.accident_history_location);
                $('#accident-detail-description').val(data.info.accident_history_description);
                $('#accident-detail-driver').val(data.info.accident_history_driver_name);
                $('#accident-detail-fault').val(data.info.accident_history_is_at_fault ? "Y" : "N"); // 값 설정
                $('#accident-detail-license-plate').val(data.info.accident_history_taxi_license_plate);
                $('#accident-detail-id').val(data.info.accident_history_idx);
                $('#accidentDetailModal').modal('show');
            },
            error: function (error) {
                console.log(error);
            }
        });
    });

    // 등록버튼
    $('#edit-accident-btn').click(function () {
        $('#accidentDetailModal input, #accidentDetailModal textarea, #accident-detail-fault').prop('readonly', false).prop('disabled', false);
        // 기사와 번호판 필드는 수정하지 못하게 설정
        $('#accident-detail-driver').prop('readonly', true);
        $('#accident-detail-license-plate').prop('readonly', true);
        $('#edit-accident-btn').hide();
        $('#save-accident-detail-btn').show();
    });

    // 수정버튼
    $('#save-accident-detail-btn').click(function () {
        var accidentIdx = $('#accident-detail-id').val(); // 사고 이력의 고유 ID 값
        var accidentDate = $('#accident-detail-date').val();
        var accidentLocation = $('#accident-detail-location').val();
        var accidentDescription = $('#accident-detail-description').val();
        var accidentDriver = $('#accident-detail-driver').val();
        var accidentFault = $('#accident-detail-fault').val();
        var accidentLicensePlate = $('#accident-detail-license-plate').val();
        $.ajax({
            url: '/accident/update.ajax',
            type: 'POST',
            data: {
                'accident_history_idx': accidentIdx,
                'accident_history_accident_date': accidentDate,
                'accident_history_location': accidentLocation,
                'accident_history_description': accidentDescription,
                'accident_history_is_at_fault': accidentFault
            },
            dataType: 'JSON',
            success: function (data) {
                if (data.result) {
                    showAlert('success', '사고 이력이 수정되었습니다.');
                    $('#accidentDetailModal').modal('hide');
                    getList(); // 수정 후 리스트 갱신
                } else {
                    showAlert('danger', '사고 이력 수정에 실패했습니다.');
                }
            },
            error: function (error) {
                showAlert('danger', '사고 이력 수정에 실패했습니다.');
            }
        });
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

    // 필터 값 변경시 리스트 다시호출
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

    // 클릭한 택시 활성화
    $(document).on('click', '.taxi-item', function () {
        $('.taxi-item').removeClass('active');
        $(this).addClass('active');
        taxiIdx = $(this).data('taxi-id');
        console.log(taxiIdx);
    });

    // 지역 선택
    $('#accident-location').on('click', function () {

        new daum.Postcode({
            oncomplete: function (data) {
                var roadAddr = data.roadAddress;
                $('#accident-location').val(roadAddr);
            },
            focusInput: false
        }).open();
    });
    // 모달 저장 버튼 클릭 시
    $('#save-accident').click(function () {
        isModalAlert = true;
        var form = document.querySelector('.needs-validation');
        if (!form.checkValidity()) {
            form.classList.add('was-validated');
            showAlert('danger', '입력 값이 올바르지 않습니다.');
            return;
        }
        var accidentDate = $('#accident-date').val();
        var accidentDescription = $('#accident-description').val();
        var accidentIsDriverFault = $('#accident-is-driver-fault').val();
        var accidentLocation = $('#accident-location').val();
        var driverIdx = '${driverInfo.driver_idx}';

        // console.log(accidentDate);
        // console.log(accidentDescription);
        // console.log(accidentIsDriverFault);
        // console.log(accidentLocation);
        // console.log(driverIdx);
        // console.log(taxiIdx);

        if (!accidentDate || !accidentDescription || !accidentIsDriverFault || !accidentLocation || !taxiIdx) {
            showAlert('danger', '모든 값을 입력해 주세요.');
            return;
        }


        $.ajax({
            url: '/accident/create.ajax',
            type: 'POST',
            data: {
                "accident_history_accident_date": accidentDate,
                "accident_history_description": accidentDescription,
                "accident_history_location": accidentLocation,
                "accident_history_is_at_fault": accidentIsDriverFault,
                "accident_history_driver_id": driverIdx,
                "accident_history_taxi_idx": taxiIdx
            },
            dataType: 'JSON',
            success: function (data) {
                if (data.result) {
                    $('#accidentModal').modal('hide');
                    showAlert('success', '사고 이력이 등록되었습니다.');
                    accidentTaxi = '';
                    accidentDate = '';
                    accidentDescription = '';
                    accidentLocation = '';
                    accidentIsDriverFault = '';
                    driverIdx = '';
                    taxiIdx = '';
                } else {
                    showAlert('danger', '사고 이력 등록에 실패했습니다.');
                }
            },
            error: function (error) {
                showAlert('danger', '사고 이력 등록에 실패했습니다.');
            }
        });
    });
    // 수정 버튼 클릭 시 입력 필드로 변환
    $('#edit-button').click(function () {
        $('.info-value').each(function () {
            var value = $(this).data('value') + '';
            var id = $(this).attr('id');
            if (id === 'driver-address') {
                $(this).html('<input type="text" class="form-control" id="' + id + '" value="' + value + '" onclick="searchAddress()" tabindex="-1" readonly>');
            } else if (id === 'driver-is-retired') {
                var selectHtml = '<select class="form-select" id="' + id + '">'
                    + '<option value="1"' + (value == 1 ? ' selected' : '') + '>퇴사</option>'
                    + '<option value="0"' + (value == 0 ? ' selected' : '') + '>재직중</option>'
                    + '</select>';
                $(this).html(selectHtml);
            } else if (id === 'driver-phone') {
                var formattedValue = formatPhoneNumber(value);
                $(this).html('<input type="text" class="form-control" id="' + id + '" value="' + formattedValue + '" maxlength="13">');
                $('#driver-phone input').on('input', function () {
                    this.value = formatPhoneNumber(this.value.replace(/\D/g, ''));
                });
            } else {
                $(this).html('<input type="text" class="form-control" id="' + id + '" value="' + value + '">');
            }
        });

        $('#driver-photo-input').show();
        $('#license-photo-input').show();

        $('#edit-button').hide();
        $('#save-button').show();
    });

    function formatPhoneNumber(phoneNumber) {
        phoneNumber = phoneNumber.replace(/\D/g, '');
        var formattedValue;
        if (phoneNumber.length > 10) {
            formattedValue = phoneNumber.substring(0, 3) + '-' + phoneNumber.substring(3, 7) + '-' + phoneNumber.substring(7);
        } else if (phoneNumber.length > 6) {
            formattedValue = phoneNumber.substring(0, 3) + '-' + phoneNumber.substring(3, 6) + '-' + phoneNumber.substring(6);
        } else if (phoneNumber.length > 3) {
            formattedValue = phoneNumber.substring(0, 3) + '-' + phoneNumber.substring(3);
        } else {
            formattedValue = phoneNumber;
        }
        return formattedValue;
    }

    // 전화번호 입력 필드 변화 시 포맷팅
    $('#driver-phone').on('input', function (e) {
        var value = $(this).val().replace(/\D/g, '');
        var formattedValue = formatPhoneNumber(value);
        $(this).val(formattedValue);
    });

    // 이미지 파일인지 검사하고 미리보기
    $('#driver-photo-input').on('change', function () {
        if (validateImageFile.call(this)) {
            previewImage.call(this);
        }
    });
    $('#license-photo-input').on('change', function () {
        if (validateImageFile.call(this)) {
            previewImage.call(this);
        }
    });

    // 저장 버튼 클릭 시
    $('#save-button').click(function () {
        var form = document.querySelector('.needs-validation');
        if (!form.checkValidity()) {
            form.classList.add('was-validated');
            showAlert('danger', '입력 값이 올바르지 않습니다.');
            return;
        }

        var driverName = $('#driver-name input').val();
        var driverIsRetired = $('#driver-is-retired select').val();
        var driverPhone = $('#driver-phone input').val().replace(/-/g, '');  // 하이픈 제거
        var driverAddress = $('#driver-address input').val();
        var driverAddressDetail = $('#driver-address-detail input').val();
        var driverIdx = '${driverInfo.driver_idx}';
        var driverPhoto = $('#driver-photo-input')[0].files[0];
        var licensePhoto = $('#license-photo-input')[0].files[0];

        var formData = new FormData();
        formData.append('driver_name', driverName);
        formData.append('driver_is_retired', driverIsRetired);
        formData.append('driver_phone', driverPhone);
        formData.append('driver_address', driverAddress);
        formData.append('driver_address_detail', driverAddressDetail);
        formData.append('driver_idx', driverIdx);

        if (driverPhoto) {
            formData.append('driver_photo_file', driverPhoto);
        }
        if (licensePhoto) {
            formData.append('driver_taxi_license_photo_file', licensePhoto);
        }

        $.ajax({
            url: './update.ajax',
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            dataType: 'JSON',
            success: function (data) {
                if (data.result) {
                    $('.info-value').each(function () {
                        var value;
                        if ($(this).find('input').length > 0) {
                            value = $(this).find('input').val();
                            $(this).data('value', value);
                            if ($(this).attr('id') === 'driver-phone') {
                                value = formatPhoneNumber(value);
                            }
                            $(this).text(value);
                        } else if ($(this).find('select').length > 0) {
                            value = $(this).find('select').val();
                            $(this).data('value', value);
                            if ($(this).attr('id') === 'driver-is-retired') {
                                value = value == 0 ? '재직중' : '퇴사';
                            }
                            $(this).text(value);
                        }
                    });
                    if (data.driver_photo) {
                        $('#driver-photo').attr('src', '/usr/local/tomcat/webapps/upload/' + data.driver_photo);
                    }
                    if (data.license_photo) {
                        $('#driver-taxi-license-photo').attr('src', '/upload/' + data.license_photo);
                    }

                    $('#driver-photo-input').hide();
                    $('#license-photo-input').hide();

                    $('#save-button').hide();
                    $('#edit-button').show();
                    showAlert('success', '수정이 완료되었습니다.');
                    getTotalPages();
                    getList();
                } else {
                    showAlert('danger', '수정에 실패했습니다.');
                }
            },
            error: function (error) {
                showAlert('danger', '수정에 실패했습니다.');
            }
        });
    });

    // 주소검색 daum api
    function searchAddress() {
        new daum.Postcode({
            oncomplete: function (data) {
                var roadAddr = data.roadAddress;
                // console.log($(this));
                $('#driver-address input').val(roadAddr);
            },
            focusInput: false
        }).open();
    }

    // 이미지 미리보기
    function previewImage() {
        var previewId = $(this).data('value');
        var $previewImage = $('#' + previewId);

        var file = this.files[0];
        var reader = new FileReader();

        reader.onload = function (e) {
            $previewImage.attr('src', e.target.result);
            $previewImage.show();
        };

        if (file) {
            reader.readAsDataURL(file);
        } else {
            $previewImage.attr('src', '');
            $previewImage.hide();
        }
    }

    // 이미지 파일만 등록 가능하게
    function validateImageFile() {
        var $fileInput = $(this);

        var file = $fileInput[0].files[0];

        if (file && file.type.startsWith('image/')) {
            // 이미지 파일인 경우
            return true;
        } else {
            showAlert('danger', '이미지 파일만 가능합니다.');
            $fileInput.val(''); // 입력 값 초기화
            return false;
        }
    }

    function getTaxiList() {
        var searchText = $('#searchTaxiLicensePlate').val();
        $.ajax({
            url: '/taxi/searchedList.ajax',
            type: 'GET',
            data: {'searchText': searchText},
            dataType: 'JSON',
            success: function (data) {
                // console.log(data);
                let content = '';
                for (item of data.list) {
                    content += ''
                        + '<li class="list-group-item taxi-item d-flex align-items-center justify-content-between" data-taxi-id="' + item.taxi_idx + '">'
                        + '<span class="taxi-info">' + item.taxi_idx + '</span>'
                        + '<span class="taxi-info">' + item.taxi_license_plate + '</span>'
                        + '<span class="taxi-info">' + item.taxi_model + '</span>'
                        + '<span class="taxi-info">' + item.taxi_registration_date + '</span>'
                        + '</li>';
                }
                $('#taxiList').html(content);
            },
            error: function (error) {
                console.log(error);
            }
        });
    }

    $('#searchTaxiLicensePlate').on('input', getTaxiList);

    // 필터 값 리셋
    function filterReset() {
        $('#search-category-accident').val('');
        $('#search-text-accident').val('');
        $('#filter-accident-is-driver-fault').val('');
        $('#filter-accident-reg-date').val(filterAccidentAllDay);

        currentPage = 1; // 페이지 번호 초기화
        getTotalPages();
        getList(); // 목록 새로고침
    }

    // 리스트 호출
    function getList() {
        getSearchValue();
        accidentListAjax();
    }

    function accidentListAjax() {
        console.log(filterStartDate);
        console.log(filterEndDate);
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
                'sortOrder': sortOrder,
                'filterIsDriverFault': filterIsDriverFault,
                'whereCalled': 'driverInfo'
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
        accidentTotalPagesAjax();
    }

    function accidentTotalPagesAjax() {
        $.ajax({
            url: '/accident/getTotalPages.ajax',
            type: 'GET',
            data: {
                'searchText': searchText,
                'filterStartDate': filterStartDate,
                'filterEndDate': filterEndDate,
                'category': searchCategory,
                'searchIdx': searchIdx,
                'filterIsDriverFault': filterIsDriverFault,
                'whereCalled': 'driverInfo'
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
        filterDate = $('#filter-accident-reg-date').val();
        if (filterDate) {
            dates = filterDate.split(' - ');
            filterStartDate = dates[0];
            filterEndDate = dates[1];
        }

        searchCategory = $('#search-category-accident').val();
        searchText = $('#search-text-accident').val();
        filterIsDriverFault = $('#filter-accident-is-driver-fault').val();

        // console.log(filterStartDate);
        // console.log(filterEndDate);

    }

    // 리스트 보여주기
    function drawTaxiList(list) {
        var content = '';
        if (list) {
            for (item of list) {
                content += '<tr class="accident-list-tbody-tr" id="' + item.accident_history_idx + '">'
                    + '<td class="">' + item.accident_history_taxi_license_plate + '</td>'
                    + '<td class="">' + item.accident_history_accident_date + '</td>'
                    + '<td class="">' + item.accident_history_location + '</td>'
                    + '<td class="ellipsis">' + item.accident_history_description + '</td>'
                    + '<td class="">' + (item.accident_history_is_at_fault == true ? 'Y' : 'N') + '</td>'
                    + '</tr>';
            }
        } else {
            content = '<tr><td colspan="4" class="text-center">데이터가 존재하지 않습니다.</td></tr>';
        }
        $('#accident-list').html(content);

    }
</script>

</html>
