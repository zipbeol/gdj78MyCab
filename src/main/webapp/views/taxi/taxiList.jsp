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
                                    <div class="text-end mb-2">
                                        <input type="button" class="btn btn-primary" data-bs-toggle="modal"
                                               data-bs-target="#exampleModal" value="택시 등록"/>
                                    </div>
                                    <div class="">
                                        <!-- 검색 관련 필터 -->
                                        <label for="date-filter" class="form-label">날짜 선택</label>
                                        <div id="date-filter" class="date-filter-container d-flex">
                                            <input type="date" id="start-date" class="form-control"
                                                   placeholder="시작 날짜"/>
                                            <span> ~ </span>
                                            <input type="date" id="end-date" class="form-control" placeholder="종료 날짜"/>
                                        </div>


                                        <select id="car-model-filter" class="form-select">
                                            <option value="">차종 선택</option>
                                            <c:forEach items="${taxiModelList}" var="taxiModel">
                                                <option value="${taxiModel}">${taxiModel}</option>
                                            </c:forEach>
                                        </select>

                                        <select id="is-active-filter" class="form-select">
                                            <option value="">폐차 여부 선택</option>
                                            <option value="true">폐차 아님</option>
                                            <option value="false">폐차</option>
                                        </select>

                                        <input type="text" id="license-plate-search" class="form-control"
                                               placeholder="번호판 입력"/>

                                        <button type="button" class="btn btn-primary" onclick="filterResults()">검색
                                        </button>

                                        </tr>
                                        </table>
                                    </div>
                                    <div class="table-outer">
                                        <table class="table table-hover table-bordered align-middle custom-table m-0">
                                            <thead>
                                            <tr>
                                                <th class="text-center">번호판</th>
                                                <th class="text-center">차종</th>
                                                <th class="text-center">등록일</th>
                                                <th class="text-center">폐차 여부</th>
                                            </tr>
                                            </thead>
                                            <tbody id="taxi-list">
                                            </tbody>
                                        </table>
                                    </div>
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

<!-- Custom JS files -->
<script src="/assets/js/custom.js"></script>
<script src="/assets/js/LocalStorage.js"></script>

<script>
    // 스크립트
    getTaxiList();

    function isNumbers(input) {
        const value = input.value;
        if (isNaN(value) || value < 0 || value > 9999) {
            input.value = input.value.slice(0, -1);
        }
    }

    function getTaxiList() {
        $.ajax({
            url: './list.ajax',
            type: 'GET',
            data: {},
            dataType: 'JSON',
            success: function (data) {
                console.log(data);
                drawTaxiList(data.taxiList);
            },
            error: function (error) {
                console.log(error);
            }
        });
    }

    function drawTaxiList(list) {
        console.log(list);
        var content = '';
        for (item of list) {
            var taxi_is_active = item.taxi_is_active === 1 ? 'true' : 'false';
            content += '<tr>'
                + '<td class="text-center">' + item.taxi_license_plate + '</td>'
                + '<td class="text-center">' + item.taxi_model + '</td>'
                + '<td class="text-center">' + item.taxi_registration_date + '</td>'
                + '<td class="text-center">' + taxi_is_active + '</td>'
                + '<tr>';
        }
        $('#taxi-list').html(content);
    }

    function taxiRegistration() {
        var taxi_license_plate = $('#license-plate').val();
        var taxi_model = $('#car-model').val();
        var taxi_fuel_type = $('#car-fuel').val();
        var taxi_year = $('#taxi-year').val();

        console.log('taxi_license_plate = ', taxi_license_plate);
        console.log('taxi_model = ', taxi_model);
        console.log('taxi_fuel_type = ', taxi_fuel_type);
        console.log('taxi_year = ', taxi_year);

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
                console.log(data);
                alert(data.message);
                if (data.isSuccess) {
                    $('#exampleModal').modal('hide');
                    getTaxiList(); // Refresh the list
                    $('#license-plate').val('');
                    $('#car-model').val('');
                    $('#car-fuel').val('');
                }
            },
            error: function (error) {
                console.log(error);
                alert('택시 등록 중 오류가 발생했습니다.');
            }
        });
    }

    function filterResults() {
        const startDate = $('#start-date').val();
        const endDate = $('#end-date').val();
        const isActive = $('#is-active-filter').val();
        const carModel = $('#car-model-filter').val();
        const licensePlate = $('#license-plate-search').val();

        $.ajax({
            url: './list.ajax',
            type: 'GET',
            data: {
                startDate: startDate,
                endDate: endDate,
                isActive: isActive,
                carModel: carModel,
                licensePlate: licensePlate
            },
            dataType: 'JSON',
            success: function (data) {
                console.log(data);
                drawTaxiList(data.taxiList);
            },
            error: function (error) {
                console.log(error);
            }
        });
    }
</script>
</body>
</html>
