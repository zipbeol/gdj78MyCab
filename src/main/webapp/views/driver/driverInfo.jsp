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
                                                        <img src="/upload/${driverInfo.driver_photo}"
                                                             style="width: 150px; height: 150px;" id="driver-photo">
                                                        <input type="file" id="driver-photo-input"
                                                               data-value="driver-photo" style="display: none;"
                                                               class="form-control">
                                                    </dd>
                                                    <dd class="col-6 d-flex">
                                                        <img src="/upload/${driverInfo.driver_taxi_license_photo}"
                                                             style="width: 200px; height: 150px;"
                                                             id="driver-taxi-license-photo">
                                                        <input type="file" id="license-photo-input"
                                                               data-value="driver-taxi-license-photo"
                                                               style="display: none;" class="form-control">
                                                    </dd>
                                                    <dt class="col-12">기사 이름:</dt>
                                                    <dd class="col-12 info-value mb-3" id="driver-name"
                                                        data-value="${driverInfo.driver_name}">${driverInfo.driver_name}</dd>
                                                    <dt class="col-12">기사 재직 여부:</dt>
                                                    <dd class="col-12 info-value mb-3" id="driver-is-retired"
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
                                                    <dt class="col-12">기사 연락처:</dt>
                                                    <dd class="col-12 info-value mb-3" id="driver-phone"
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
<script src="/assets/js/localStorage.js"></script>
<script src="/assets/js/showAlert.js"></script>
<!-- 다음 주소 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
    // 수정
    $('#edit-button').click(function () {
        $('.info-value').each(function () {
            var value = $(this).data('value');
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
        var formattedValue = '';
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

    $('#driver-phone').on('input', function (e) {
        var value = $(this).val().replace(/\D/g, '');
        var formattedValue = '';

        if (value.length > 10) {
            value = value.substring(0, 11);
        }

        if (value.length > 7) {
            formattedValue = value.substring(0, 3) + '-' + value.substring(3, 7) + '-' + value.substring(7);
        } else if (value.length > 3) {
            formattedValue = value.substring(0, 3) + '-' + value.substring(3);
        } else {
            formattedValue = value;
        }

        $(this).val(formattedValue);
    });

    // 파일 이미지인지 검사, 이미지 맞으면 미리보기
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

    // 저장
    $('#save-button').click(function () {
        var form = document.querySelector('.needs-validation');
        if (!form.checkValidity()) {
            form.classList.add('was-validated');
            showAlert('danger', '입력 값이 올바르지 않습니다.');
            return;
        }
        var driverName = $('#driver-name input').val();
        var driverIsRetired = $('#driver-is-retired select').val();
        var driverPhone = $('#driver-phone input').val();
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
                        $('#driver-photo').attr('src', '/upload/' + data.driver_photo);
                    }
                    if (data.license_photo) {
                        $('#driver-taxi-license-photo').attr('src', '/upload/' + data.license_photo);
                    }

                    $('#driver-photo-input').hide();
                    $('#license-photo-input').hide();

                    $('#save-button').hide();
                    $('#edit-button').show();
                    showAlert('success', '수정이 완료되었습니다.');
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
                var extraRoadAddr = '';
                if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                    extraRoadAddr += data.bname;
                }
                if (data.buildingName !== '' && data.apartment === 'Y') {
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
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

</script>

</html>