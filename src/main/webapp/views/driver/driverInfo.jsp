<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
                                                <!-- 수정필요 -->
                                                <dd class="col-10"><img src="/upload/${driverInfo.driver_photo}"
                                                                        style="width: 150px; height: 150px;"></dd>
                                                <div class="col-2 text-end"><input type="button"
                                                                                   class="btn btn-secondary"
                                                                                   value="면허사진"></div>
                                                <!-- 수정필요 -->
                                                <dt class="col-3">기사 이름:</dt>
                                                <dd class="col-9 info-value mb-3" id="driver-name"
                                                    data-value="${driverInfo.driver_name}">${driverInfo.driver_name}</dd>
                                                <dt class="col-3">기사 재직 여부:</dt>
                                                <dd class="col-9 info-value mb-3" id="driver-is-retired"
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
                                                <dt class="col-3">기사 연락처:</dt>
                                                <dd class="col-9 info-value mb-3" id="driver-phone"
                                                    data-value="${driverInfo.driver_phone}">${fn:substring(driverInfo.driver_phone, 0, 3)}-${fn:substring(driverInfo.driver_phone, 3, 7)}-${fn:substring(driverInfo.driver_phone, 7, 11)}</dd>

                                                <dt class="col-3">기사 주소:</dt>
                                                <dd class="col-9 mb-3 d-flex gap-2">
                                                    <div class="col-6">
                                                        <span class="info-value" id="driver-address"
                                                              data-value="${driverInfo.driver_address}">${driverInfo.driver_address}</span>
                                                    </div>
                                                    <div class="col-6">
                                                        <span class="info-value" id="driver-address-detail"
                                                              data-value="${driverInfo.driver_address_detail}">${driverInfo.driver_address_detail}</span>
                                                    </div>
                                                </dd>
                                                <dt class="col-3">기사 입사일:</dt>
                                                <dd class="col-9 mb-3"
                                                    data-value="${driverInfo.driver_registration_date}">${driverInfo.driver_registration_date}</dd>
                                            </dl>
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
<!-- 면허사진 -->
<div class="modal fade" id="licensePhotoModal" tabindex="-1" aria-labelledby="licensePhotoModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="licensePhotoModalLabel">면허 사진</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <img id="licensePhoto" src="" alt="Driver License Photo" class="img-fluid">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
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
<!-- Custom JS files -->
<script src="/assets/js/custom.js"></script>
<script src="/assets/js/LocalStorage.js"></script>
<script src="/assets/js/showAlert.js"></script>
<!-- 다음 주소 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
    $('.btn-secondary').click(function () {
        var licensePhotoUrl = '/upload/${driverInfo.driver_taxi_license_photo}';
        $('#licensePhoto').attr('src', licensePhotoUrl);
        $('#licensePhotoModal').modal('show');
    });
    $('#edit-button').click(function () {
        $('.info-value').each(function () {
            var value = $(this).data('value');
            var id = $(this).attr('id');
            console.log(id);
            if (id === 'driver-address') {
                $(this).html('<input type="text" class="form-control" id="' + id + '" value="' + value + '" onclick="searchAddress()" tabindex="-1" readonly>');
            } else if (id === 'driver-is-retired') {
                var selectHtml = '<select class="form-select" id="' + id + '">'
                    + '<option value="1"' + (value == 1 ? ' selected' : '') + '>퇴직</option>'
                    + '<option value="0"' + (value == 0 ? ' selected' : '') + '>재직중</option>'
                    + '</select>';
                $(this).html(selectHtml);
                console.log(value);
            } else {
                $(this).html('<input type="text" class="form-control" id="' + id + '" value="' + value + '">');
            }
        });
        $('#edit-button').hide();
        $('#save-button').show();
    });

    $('#save-button').click(function () {
        var driverName = $('#driver-name input').val();
        var driverIsRetired = $('#driver-is-retired select').val();
        var driverPhone = $('#driver-phone input').val();
        var driverAddress = $('#driver-address input').val();
        var driverAddressDetail = $('#driver-address-detail input').val();
        var driverIdx = '${driverInfo.driver_idx}';
        <%--console.log(driverName);--%>
        <%--console.log(driverIsRetired);--%>
        <%--console.log(driverPhone);--%>
        <%--console.log(driverAddress);--%>
        <%--console.log(driverAddressDetail);--%>
        <%--console.log('${driverInfo.driver_idx}');--%>
        $.ajax({
            url: './update.ajax',
            type: 'POST',
            data: {
                'driver_name': driverName,
                'driver_is_retired': driverIsRetired,
                'driver_phone': driverPhone,
                'driver_address': driverAddress,
                'driver_address_detail': driverAddressDetail,
                'driver_idx': driverIdx
            },
            dataType: 'JSON',
            success: function (data) {
                console.log(data);
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
                                value = value === 0 ? '재직중' : '퇴사';
                            }
                            $(this).text(value);
                        }
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

    function searchAddress() {
        new daum.Postcode({
            oncomplete: function (data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if (data.buildingName !== '' && data.apartment === 'Y') {
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }


                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                $('#driver-address').val(roadAddr);

            }
            , focusInput: false
        }).open();
    }

    function formatPhoneNumber(phoneNumber) {
        return phoneNumber.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
    }

</script>

</html>
