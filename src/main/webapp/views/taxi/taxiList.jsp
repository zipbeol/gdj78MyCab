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

    <!-- Date Range CSS -->
    <link rel="stylesheet" href="/assets/vendor/daterange/daterange.css">
    <!-- 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

    <!-- 따로 적용한 CSS -->
    <link rel="stylesheet" href="/assets/css/default.css">
    <style>

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
                                               data-bs-target="#exampleModal" value="택시 등록"/>
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
                                                       value="검색">
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
                                                <div class="input-group">
                                                    <input type="text" class="form-control datepicker-range"
                                                           id="filter-taxi-reg-date">
                                                    <span class="input-group-text"><i class="bi bi-calendar2-range"></i></span>
                                                </div>
                                            </div>
                                            <div class="col-2">
                                                <select id="filter-taxi-model" class="form-select">
                                                    <option value="">차종</option>
                                                    <c:forEach items="${taxiModelList}" var="taxiModel">
                                                        <option value="${taxiModel}">${taxiModel}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="col-2">
                                                <select id="filter-taxi-is-active" class="form-select">
                                                    <option value="">폐차 여부</option>
                                                    <option value="1">false</option>
                                                    <option value="0">true</option>
                                                </select>
                                            </div>
                                            <div class="col-1"></div>
                                            <div class="col-3 text-end">
                                                <input type="text" class="form-control" id="search-taxi-license-plate"
                                                       oninput="search()" placeholder="번호판을 입력해 주세요">
                                            </div>
                                        </div>
                                    </div>
                                    <!-- 검색창 종료 -->
                                    <!-- 리스트 테이블 시작 -->
                                    <div class="table-outer">
                                        <table class="table table-hover table-bordered align-middle custom-table m-0">
                                            <thead>
                                            <tr>
                                                <th class="text-center" id="th-taxi-license-plate"
                                                    onclick="getThSpanId(this)" style="width: 25%;">번호판 <span
                                                        id="table-th-taxi-license-plate"></span></th>
                                                <th class="text-center" id="th-taxi-model" onclick="getThSpanId(this)"
                                                    style="width: 20%;">
                                                    차종 <span id="table-th-taxi-model"></span></th>
                                                <th class="text-center" id="th-taxi-reg-date"
                                                    onclick="getThSpanId(this)" style="width: 25%;">등록일 <span
                                                        id="table-th-taxi-reg-date"></span></th>
                                                <th class="text-center" id="th-taxi-is-active"
                                                    onclick="getThSpanId(this)" style="width: 10%;">폐차 여부 <span
                                                        id="table-th-taxi-is-active"></span></th>
                                            </tr>
                                            </thead>
                                            <tbody id="taxi-list">
                                            <c:forEach items="${taxiList}" var="taxi">
                                                <tr class="taxi-list-tbody-tr" id="${taxi.taxi_idx}">
                                                    <td class="text-center">${taxi.taxi_license_plate}</td>
                                                    <td class="text-center">${taxi.taxi_model}</td>
                                                    <td class="text-center">${taxi.taxi_registration_date}</td>
                                                    <td class="text-center">
                                                        <c:choose>
                                                            <c:when test="${taxi.taxi_is_active == 1}">
                                                                false
                                                            </c:when>
                                                            <c:otherwise>
                                                                true
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                </tr>
                                            </c:forEach>

                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- 리스트 테이블 종료 -->
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Row end -->
                    <!-- Modal -->
                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                         aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">택시 등록</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="mb-3">
                                        <label for="license-plate" class="form-label">번호판 (ex: 서울11바1111)</label>
                                        <input id="license-plate" type="text" class="form-control" maxlength="9"
                                               required/>
                                    </div>

                                    <div class="mb-3">
                                        <label for="taxi-year" class="form-label">연식 (ex: 2023)</label>
                                        <input id="taxi-year" type="number" class="form-control" min="0" max="9999"
                                               oninput="isNumbers(this)" required/>
                                    </div>

                                    <div class="mb-3">
                                        <label for="car-model" class="form-label">차종 (ex: 그랜저)</label>
                                        <input id="car-model" type="text" class="form-control" required/>
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
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
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
<script src="/assets/js/LocalStorage.js"></script>

<script>
    var searchText = $('#search-taxi-license-plate').val();
    var filterStartDate = '';
    var filterEndDate = '';
    var filterTaxiModel = '';
    var filterIsActive = '';
    var currentPage = 1; // 현재 페이지 번호
    var loading = false; // 로딩 상태를 나타내는 플래그

    var today = moment().format('YYYY/MM/DD');
    $('#filter-taxi-reg-date').val(today + ' - ' + today);

    $(document).ready(function () {
        getTaxiList(); // 페이지 로드 시 처음 택시 목록을 가져옵니다.

        // 스크롤 이벤트 감지
        $(window).scroll(function () {
            if ($(window).scrollTop() + $(window).height() >= $(document).height() - 100) {
                if (!loading) {
                    currentPage++;
                    getTaxiList();
                }
            }
        });
    });

    $('.taxi-list-tbody-tr').on('click', function () {
        location.href = '/taxi/detail.go?taxi_idx=' + $(this).attr('id');
    });

    function filterReset() {
        $('#filter-taxi-is-active').val('');
        $('#filter-taxi-model').val('');
        $('#filter-taxi-reg-date').val(today + ' - ' + today);
        $('#search-taxi-license-plate').val('');
        currentPage = 1; // 페이지 번호 초기화
        $('#taxi-list').html(''); // 기존 리스트 초기화
        getTaxiList(); // 목록 새로고침
    }

    function search() {
        searchText = $('#search-taxi-license-plate').val();
        currentPage = 1; // 페이지 번호 초기화
        $('#taxi-list').html(''); // 기존 리스트 초기화
        getTaxiList();
    }

    function isNumbers(input) {
        var value = input.value;
        if (isNaN(value) || value < 0 || value > 9999) {
            input.value = input.value.slice(0, -1);
        }
    }

    function getTaxiList() {
        var filterDate = $('#filter-taxi-reg-date').val();
        if (filterDate) {
            var dates = filterDate.split(' - ');
            filterStartDate = dates[0];
            filterEndDate = dates[1];
        }

        filterTaxiModel = $('#filter-taxi-model').val();
        filterIsActive = $('#filter-taxi-is-active').val();

        loading = true; // 데이터 로딩 시작
        $.ajax({
            url: './list.ajax',
            type: 'GET',
            data: {
                'searchText': searchText,
                'filterStartDate': filterStartDate,
                'filterEndDate': filterEndDate,
                'filterTaxiModel': filterTaxiModel,
                'filterIsActive': filterIsActive,
                'page': currentPage // 페이지 번호 전달
            },
            dataType: 'JSON',
            success: function (data) {
                drawTaxiList(data.taxiList);
                loading = false; // 데이터 로딩 완료
            },
            error: function (error) {
                console.log(error);
                loading = false; // 데이터 로딩 실패
            }
        });
    }

    function drawTaxiList(list) {
        var content = '';
        for (item of list) {
            var taxi_is_active = item.taxi_is_active === 1 ? 'true' : 'false';
            content += '<tr class="taxi-list-tbody-tr" id="' + item.taxi_idx + '">'
                + '<td class="text-center">' + item.taxi_license_plate + '</td>'
                + '<td class="text-center">' + item.taxi_model + '</td>'
                + '<td class="text-center">' + item.taxi_registration_date + '</td>'
                + '<td class="text-center">' + taxi_is_active + '</td>'
                + '</tr>';
        }
        $('#taxi-list').append(content);
    }

    function taxiRegistration() {
        var taxi_license_plate = $('#license-plate').val();
        var taxi_model = $('#car-model').val();
        var taxi_fuel_type = $('#car-fuel').val();
        var taxi_year = $('#taxi-year').val();

        if (taxi_license_plate === '') {
            alert('번호판을 입력해 주세요.');
            $('#license-plate').focus();
            return;
        } else if (taxi_year === '') {
            alert('연식을 입력해 주세요.');
            $('#taxi-year').focus();
            return;
        } else if (taxi_model === '') {
            alert('차종을 입력해 주세요.');
            $('#car-model').focus();
            return;
        } else if (taxi_fuel_type === '') {
            alert('연료 타입을 선택해 주세요.');
            $('#car-fuel').focus();
            return;
        }

        // Send AJAX request
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
                alert(data.message);
                if (data.isSuccess) {
                    $('#exampleModal').modal('hide');
                    filterReset(); // 새로고침
                }
            },
            error: function (error) {
                console.log(error);
                alert('택시 등록 중 오류가 발생했습니다.');
            }
        });
    }
</script>


</body>
</html>
