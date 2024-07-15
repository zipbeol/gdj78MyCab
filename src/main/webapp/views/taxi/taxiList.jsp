<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>My Cab - 택시 조회</title>
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

    <!-- Date Range CSS -->
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
                        <a href="/taxi/list.go" class="text-decoration-none">택시 조회</a>
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
                                    <h4 class="card-title">택시 조회</h4>
                                </div>
                                <div class="card-body">
                                    <!-- 여기에 코딩 -->
                                    <div class="text-end mb-3">
                                        <input type="button" class="btn btn-primary" data-bs-toggle="modal"
                                               data-bs-target="#registorModal" value="택시 등록"/>
                                    </div>
                                    <!-- 검색창 시작 -->
                                    <div class="search-filter-container border border-2 p-3 rounded mb-3">
                                        <div class="row mb-3">
                                            <div class="col-10">
                                            </div>
                                            <div class="col-2 text-end d-md-flex justify-content-md-end gap-2">
                                                <input type="button" class="btn btn-secondary" onclick="filterReset()"
                                                       value="초기화">
                                                <input type="button" class="btn btn-primary" onclick="getTaxiList()"
                                                       value="검색" style="display: none">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-4">
                                                <label for="filter-taxi-reg-date" class="form-label">등록일 필터</label>
                                            </div>
                                            <div class="col-2">
                                                <label for="filter-taxi-model" class="form-label">차종 필터</label>
                                            </div>
                                            <div class="col-2">

                                                <label for="filter-taxi-is-active" class="form-label">폐차여부 필터</label>
                                            </div>
                                            <div class="col-1"></div>
                                            <div class="col-3">

                                                <label for="search-taxi-license-plate" class="form-label">번호판 검색</label>
                                            </div>
                                        </div>
                                        <div class="row mb-3">
                                            <div class="col-4">
                                                <div class="input-group" id="filter-taxi-reg-date-div">
                                                    <input type="text"
                                                           class="form-control datepicker-range taxi-search-filter"
                                                           id="filter-taxi-reg-date">
                                                    <span class="input-group-text"><i class="bi bi-calendar2-range"></i></span>
                                                </div>
                                            </div>
                                            <div class="col-2">
                                                <select id="filter-taxi-model" class="form-select taxi-search-filter">
                                                    <option value="">차종</option>
                                                    <c:forEach items="${taxiModelList}" var="taxiModel">
                                                        <option value="${taxiModel}">${taxiModel}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="col-2">
                                                <select id="filter-taxi-is-active"
                                                        class="form-select taxi-search-filter">
                                                    <option value="">폐차 여부</option>
                                                    <option value="1">폐차아님</option>
                                                    <option value="0">폐차</option>
                                                </select>
                                            </div>
                                            <div class="col-1"></div>
                                            <div class="col-3 text-end">
                                                <input type="text" class="form-control taxi-search-filter bg-"
                                                       id="search-taxi-license-plate"
                                                       placeholder="번호판을 입력해 주세요">
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
                                                    <th class="text-center sortable" id="th-taxi-license-plate"
                                                        style="width: 25%;" data-value="taxi-license-plate">번호판
                                                    </th>
                                                    <th class="text-center sortable" id="th-taxi-model"
                                                        style="width: 20%;" data-value="taxi-model">차종
                                                    </th>
                                                    <th class="text-center sortable" id="th-taxi-reg-date"
                                                        style="width: 25%;" data-value="taxi-reg-date">등록일
                                                    </th>
                                                    <th class="text-center sortable" id="th-taxi-is-active"
                                                        style="width: 15%;" data-value="taxi-is-active">폐차 여부
                                                    </th>
                                                </tr>
                                                </thead>
                                                <tbody id="taxi-list">
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
                    <!-- Modal -->
                    <div class="modal fade" id="registorModal" tabindex="-1" aria-labelledby="registorModalLabel"
                         aria-hidden="true">
                        <!-- Alert placeholder start -->
                        <div id="alertModalPlaceholder" class="alert alert-placeholder"></div>
                        <!-- Alert placeholder end -->
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="registorModalLabel">택시 등록</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <form class="needs-validation" novalidate>
                                        <div class="mb-3">
                                            <label for="license-plate" class="form-label">번호판</label>
                                            <input id="license-plate" type="text" class="form-control" maxlength="9"
                                                   placeholder="(ex: 서울11바1111)" required>
                                            <div class="invalid-feedback">번호판을 입력해 주세요.</div>
                                        </div>
                                        <div class="mb-3">
                                            <label for="taxi-year" class="form-label">연식</label>
                                            <input id="taxi-year" type="number" class="form-control" min="0" max="9999"
                                                   placeholder="(ex: 2023)" required>
                                            <div class="invalid-feedback">연식을 입력해 주세요.</div>
                                        </div>
                                        <div class="mb-3">
                                            <label for="car-model" class="form-label">차종</label>
                                            <input id="car-model" type="text" class="form-control"
                                                   placeholder="(ex: 그랜저)" required>
                                            <div class="invalid-feedback">차종을 입력해 주세요.</div>
                                        </div>
                                        <div class="mb-3">
                                            <label for="car-fuel" class="form-label">연료</label>
                                            <select id="car-fuel" class="form-select" required>
                                                <option value="">연료를 선택해주세요</option>
                                                <option value="LPG">LPG</option>
                                                <option value="전기">전기</option>
                                                <option value="경유">경유</option>
                                                <option value="휘발유">휘발유</option>
                                            </select>
                                            <div class="invalid-feedback">연료 타입을 선택해 주세요.</div>
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"
                                            onclick="isModalAlert=false">닫기
                                    </button>
                                    <button type="button" onclick="taxiRegistration()" class="btn btn-primary">등록
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

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

<script>
    var searchText = $('#search-taxi-license-plate').val();
    var today = moment().format('YYYY/MM/DD');
    var filterAllDay = '${taxiRegFirstDate}' + ' - ' + today;
    var filterEndDate = '';
    var filterTaxiModel = '';
    var filterIsActive = '';
    var currentPage = 1; // 현재 페이지 번호
    var sortOrder = 'asc';
    var sortColumn = 'default';

    $('#filter-taxi-reg-date').val(filterAllDay);

    getTotalPages();
    getTaxiList();


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
        getTaxiList();
    });


    // 상세 페이지 이동
    $(document).on('click', '.taxi-list-tbody-tr', function () {
        location.href = '/taxi/detail.go?taxi_idx=' + $(this).attr('id');
    });

    // 페이지네이션
    $('#pagination').twbsPagination({
        totalPages: 10, // 총 페이지 수 (백엔드에서 가져와야 함)
        visiblePages: 5, // 표시할 페이지 수
        startPage: 1, // 시작 페이지
        paginationClass: 'pagination align-items-center',
        onPageClick: function (event, page) {
            currentPage = page; // 현재 페이지 업데이트
            getTaxiList(); // 택시 목록 갱신
        }
    });

    // 필터기능
    $('#filter-taxi-reg-date').on('change', function () {
        currentPage = 1;
        getTotalPages();
        getTaxiList();
    });
    $('.taxi-search-filter').on('input', function () {
        currentPage = 1;
        getTotalPages();
        getTaxiList();
    });

    // 필터 값 리셋
    function filterReset() {
        $('#filter-taxi-is-active').val('');
        $('#filter-taxi-model').val('');
        $('#filter-taxi-reg-date').val(filterAllDay);
        $('#search-taxi-license-plate').val('');
        currentPage = 1; // 페이지 번호 초기화
        getTotalPages();
        getTaxiList(); // 목록 새로고침
    }

    // 택시리스트 호출
    function getTaxiList() {
        getSearchValue();
        $.ajax({
            url: './list.ajax',
            type: 'GET',
            data: {
                'searchText': searchText,
                'filterStartDate': filterStartDate,
                'filterEndDate': filterEndDate,
                'filterTaxiModel': filterTaxiModel,
                'filterIsActive': filterIsActive,
                'page': currentPage,
                'sortColumn': sortColumn,
                'sortOrder': sortOrder
            },
            dataType: 'JSON',
            success: function (data) {
                drawTaxiList(data.taxiList);
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
                'searchText': searchText,
                'filterStartDate': filterStartDate,
                'filterEndDate': filterEndDate,
                'filterTaxiModel': filterTaxiModel,
                'filterIsActive': filterIsActive
            },
            dataType: 'JSON',
            success: function (data) {
                // console.log(data);
                $('#pagination').twbsPagination('destroy');
                $('#pagination').twbsPagination({
                    totalPages: data.totalPages, // 서버에서 받은 총 페이지 수
                    visiblePages: 5,
                    startPage: currentPage,
                    paginationClass: 'pagination align-items-center',
                    onPageClick: function (event, page) {
                        currentPage = page;
                        getTaxiList();
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
        var filterDate = $('#filter-taxi-reg-date').val();
        if (filterDate) {
            var dates = filterDate.split(' - ');
            filterStartDate = dates[0];
            filterEndDate = dates[1];
        }

        filterTaxiModel = $('#filter-taxi-model').val();
        filterIsActive = $('#filter-taxi-is-active').val();
        searchText = $('#search-taxi-license-plate').val();
    }

    // 리스트 보여주기
    function drawTaxiList(list) {
        var content = '';
        if (list.length > 0) {
            for (item of list) {
                var taxi_is_active = item.taxi_is_active === 1 ? '폐차' : '폐차아님';
                content += '<tr class="taxi-list-tbody-tr" id="' + item.taxi_idx + '">'
                    + '<td class="text-center">' + item.taxi_license_plate + '</td>'
                    + '<td class="text-center">' + item.taxi_model + '</td>'
                    + '<td class="text-center">' + item.taxi_registration_date + '</td>'
                    + '<td class="text-center">' + taxi_is_active + '</td>'
                    + '</tr>';
            }
        } else {
            content = '<tr><td colspan="4" class="text-center">데이터가 존재하지 않습니다.</td></tr>';
        }
        $('#taxi-list').html(content);
    }

    // 택시 등록
    function taxiRegistration() {
        var form = document.querySelector('.needs-validation');
        isModalAlert = true;
        if (!form.checkValidity()) {
            form.classList.add('was-validated');
            showAlert('danger', '입력 값이 올바르지 않습니다.');
            return;
        }

        var taxi_license_plate = $('#license-plate').val();
        var taxi_model = $('#car-model').val();
        var taxi_fuel_type = $('#car-fuel').val();
        var taxi_year = $('#taxi-year').val();

        $.ajax({
            url: './create.ajax',
            type: 'POST',
            dataType: 'JSON',
            data: {
                taxi_license_plate: taxi_license_plate,
                taxi_model: taxi_model,
                taxi_fuel_type: taxi_fuel_type,
                taxi_year: taxi_year
            },
            success: function (data) {
                if (data.isSuccess) {
                    $('#registorModal').modal('hide');
                    isModalAlert = false;
                    $('#license-plate').val('');
                    $('#car-model').val('');
                    $('#car-fuel').val('');
                    $('#taxi-year').val('');
                    showAlert('success', '택시가 성공적으로 등록되었습니다.');
                    getTotalPages();
                    getTaxiList();
                } else {
                    showAlert('danger', '택시 등록 중 오류가 발생했습니다.');
                }
            },
            error: function (error) {
                console.log(error);
                showAlert('danger', '택시 등록 중 오류가 발생했습니다.');
            }
        });
    }


</script>

</html>
