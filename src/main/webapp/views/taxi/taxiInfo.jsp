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
                    <div id="alertPlaceholder"></div>
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
                                        <div class="row">
                                            <div class="col-8">
                                                <h1>택시 정보</h1>
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
                                                    <dt class="col-3">택시 번호판:</dt>
                                                    <dd class="col-9 info-value mb-3" id="taxi-license-plate"
                                                        data-value="${taxiDTO.taxi_license_plate}">${taxiDTO.taxi_license_plate}</dd>

                                                    <dt class="col-3">택시 차종:</dt>
                                                    <dd class="col-9 info-value mb-3" id="taxi-model"
                                                        data-value="${taxiDTO.taxi_model}">${taxiDTO.taxi_model}</dd>

                                                    <dt class="col-3">택시 연료타입:</dt>
                                                    <dd class="col-9 info-value mb-3" id="taxi-fuel-type"
                                                        data-value="${taxiDTO.taxi_fuel_type}">${taxiDTO.taxi_fuel_type}</dd>

                                                    <dt class="col-3">택시 등록일:</dt>
                                                    <dd class="col-9 mb-3">${taxiDTO.taxi_registration_date}</dd>

                                                    <dt class="col-3">택시 연식:</dt>
                                                    <dd class="col-9 info-value mb-3" id="taxi-year"
                                                        data-value="${taxiDTO.taxi_year}">${taxiDTO.taxi_year}</dd>

                                                    <dt class="col-3">택시 폐차여부:</dt>
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
                                    </div>
                                    <div class="tab-pane fade" id="taxi-schedule" role="tabpanel"
                                         aria-labelledby="taxi-schedule-tab">
                                        <h1>택시 스케쥴</h1>
                                        <!-- 여기 스케쥴 내용을 추가하세요 -->
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

<script>

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