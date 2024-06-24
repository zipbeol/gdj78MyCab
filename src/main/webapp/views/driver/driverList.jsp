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
    </style>


</head>

<body>
<!-- Page wrapper start -->
<div class="page-wrapper">

    <!-- Main container start -->
    <div class="main-container">

        <!-- Sidebar wrapper start -->
        <jsp:include page="/views/sidebar.jsp"/>
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
                </ol>
                <!-- Breadcrumb end -->

                <!-- App header actions start -->
                <jsp:include page="/views/appHeader.jsp"/>
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
                                    <h4 class="card-title">기사 조회</h4>
                                </div>
                                <div class="card-body">
                                    <!-- 여기에 코딩 -->
                                    <div class="text-end mb-3">
                                        <input type="button" class="btn btn-primary" data-bs-toggle="modal"
                                               data-bs-target="#registorModal" value="기사 등록"/>
                                    </div>
                                    <!-- 검색창 시작 -->
                                    <div class="search-filter-container border border-2 p-3 rounded mb-3">
                                        <div class="row mb-3">
                                            <div class="col-10">
                                            </div>
                                            <div class="col-2 text-end d-md-flex justify-content-md-end gap-2">
                                                <input type="button" class="btn btn-secondary" onclick="filterReset()"
                                                       value="초기화">
                                                <input type="button" class="btn btn-primary" onclick="getList()"
                                                       value="검색" style="display: none">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-4">
                                                <label for="filter-driver-reg-date" class="form-label">입사일 필터</label>
                                            </div>
                                            <div class="col-2">
                                                <label for="filter-driver-is-retired" class="form-label">재직여부 필터</label>
                                            </div>
                                            <div class="col-2"></div>
                                            <div class="col-1"></div>
                                            <div class="col-3">
                                                <label for="search-driver-name" class="form-label">이름 검색</label>
                                            </div>
                                        </div>
                                        <div class="row mb-3">
                                            <div class="col-4">
                                                <div class="input-group" id="filter-taxi-reg-date-div">
                                                    <input type="text"
                                                           class="form-control datepicker-range driver-search-filter"
                                                           id="filter-driver-reg-date">
                                                    <span class="input-group-text"><i class="bi bi-calendar2-range"></i></span>
                                                </div>
                                            </div>
                                            <div class="col-2">
                                                <select id="filter-driver-is-retired"
                                                        class="form-select driver-search-filter">
                                                    <option value="">재직 여부</option>
                                                    <option value="0">재직중</option>
                                                    <option value="1">퇴사</option>
                                                </select>
                                            </div>
                                            <div class="col-2"></div>
                                            <div class="col-1"></div>
                                            <div class="col-3 text-end">
                                                <input type="text" class="form-control driver-search-filter bg-"
                                                       id="search-driver-name"
                                                       placeholder="이름을 입력해 주세요">
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
                                                    <th class="text-center" id="th-driver-photo"
                                                        style="width: 10%;" data-value="driver-photo">사진
                                                    </th>
                                                    <th class="text-center sortable" id="th-driver-name"
                                                        style="width: 20%;" data-value="driver-name">이름
                                                    </th>
                                                    <th class="text-center sortable" id="th-driver-reg-date"
                                                        style="width: 20%;" data-value="driver-reg-date">입사일
                                                    </th>
                                                    <th class="text-center sortable" id="th-driver-is-retired"
                                                        style="width: 20%;" data-value="driver-is-retired">재직여부
                                                    </th>
                                                    <th class="text-center" id="th-driver-phone"
                                                        style="width: 10%;" data-value="driver-phone">연락처
                                                    </th>
                                                    <th class="text-center sortable" id="th-driver-address"
                                                        style="width: 20%;" data-value="driver-address">주소
                                                    </th>
                                                </tr>
                                                </thead>
                                                <tbody id="driver-list">
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
                    <div class="modal fade" id="registorModal" tabindex="-1" aria-labelledby="registerModalLabel"
                         aria-hidden="true">
                        <!-- Alert placeholder start -->
                        <div id="alertModalPlaceholder"></div>
                        <!-- Alert placeholder end -->
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="registerModalLabel">기사 등록</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <form class="needs-validation" novalidate>
                                        <div class="mb-3">
                                            <label for="register-driver-photo" class="form-label">사진</label>
                                            <div id="preview-container"
                                                 class="d-flex align-items-center justify-content-center border border-2 mb-3"
                                                 style="height: 108px; width: 108px;">
                                                <img id="preview-image" src="" alt="이미지 미리보기"
                                                     style="display: none; width: 100px; height: 100px;">
                                            </div>
                                            <input id="register-driver-photo" type="file" class="form-control"
                                                   accept="image/*" onchange="previewImage()" required/>
                                            <div class="invalid-feedback">사진을 등록해 주세요.</div>
                                        </div>
                                        <div class="mb-3">
                                            <label for="register-driver-name" class="form-label">이름</label>
                                            <input id="register-driver-name" type="text" class="form-control"
                                                   maxlength="100" placeholder="(ex: 홍길동)" required/>
                                            <div class="invalid-feedback">이름을 입력해 주세요.</div>
                                        </div>
                                        <div class="mb-3">
                                            <label for="register-driver-taxi-license" class="form-label">택시 면허</label>
                                            <input id="register-driver-taxi-license" type="file" class="form-control"
                                                   required/>
                                            <div class="invalid-feedback">면허를 등록해 주세요.</div>
                                        </div>
                                        <div class="row mb-3 d-flex">
                                            <div class="col-6">
                                                <div class="mb-3">
                                                    <label for="register-driver-address" class="form-label">도로명
                                                        주소</label>
                                                    <input id="register-driver-address" type="text"
                                                           class="form-control mb-1" placeholder="도로명주소"
                                                           onclick="searchAddress()" tabindex="-1" required/>
                                                    <div class="invalid-feedback">주소를 입력해 주세요.</div>
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <div class="mb-3">
                                                    <label for="register-driver-address-detail" class="form-label">상세
                                                        주소</label>
                                                    <input id="register-driver-address-detail" type="text"
                                                           class="form-control" placeholder="상세주소"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="mb-3">
                                            <label for="register-driver-phone" class="form-label">연락처</label>
                                            <input id="register-driver-phone" type="text" class="form-control"
                                                   pattern="\d{3}-\d{3,4}-\d{4}" required/>
                                            <div class="invalid-feedback">연락처를 입력해 주세요.</div>
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                                    <button type="button" onclick="registration()" class="btn btn-primary">등록
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
<%--<div class="modal fade" id="fullScreenImageModal" tabindex="-1" aria-labelledby="fullScreenImageModalLabel"--%>
<%--     aria-hidden="true">--%>
<%--    <div class="modal-dialog modal-dialog-centered modal-fullscreen">--%>
<%--        <div class="modal-content">--%>
<%--            <div class="modal-header">--%>
<%--                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>--%>
<%--            </div>--%>
<%--            <div class="modal-body d-flex justify-content-center align-items-center">--%>
<%--                <div class="tenor-gif-embed" data-postid="1694043654178124794" data-share-method="host"--%>
<%--                     data-aspect-ratio="1.21818" data-width="100%"><a--%>
<%--                        href="https://tenor.com/view/blank-stare-wallace-and-gromit-penguin-wallace-and-gromit-penguin-gif-1694043654178124794">Blank--%>
<%--                    Stare Wallace And Gromit GIF</a>from <a href="https://tenor.com/search/blank+stare-gifs">Blank Stare--%>
<%--                    GIFs</a></div>--%>
<%--                <script type="text/javascript" async src="https://tenor.com/embed.js"></script>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
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
<script src="/assets/js/LocalStorage.js"></script>
<script src="/assets/js/showAlert.js"></script>
<!-- 페이지네이션 -->
<script src="/assets/js/jquery.twbsPagination.min.js"></script>
<!-- 다음 주소 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
    var searchText = '';
    var today = moment().format('YYYY/MM/DD');
    var filterAllDay = '${driverFirstRegDate}' + ' - ' + today;
    var filterEndDate = '';
    var filterIsRetired = '';
    var currentPage = 1; // 현재 페이지 번호
    var sortOrder = 'asc';
    var sortColumn = 'default';
    var uploadDir = '/upload/';

    $('#filter-driver-reg-date').val(filterAllDay);

    getTotalPages();
    getList();

    // 연락처 입력할때 - 붙이기
    $('#register-driver-phone').on('input', function (e) {
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
        console.log($(this).val());
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


    // 상세 페이지 이동
    $(document).on('click', '.driver-list-tbody-tr', function () {
        location.href = '/driver/detail.go?driver_idx=' + $(this).attr('id');
    });

    // 페이지네이션
    $('#pagination').twbsPagination({
        totalPages: 10, // 총 페이지 수 (백엔드에서 가져와야 함)
        visiblePages: 5, // 표시할 페이지 수
        startPage: 1, // 시작 페이지
        paginationClass: 'pagination align-items-center',
        onPageClick: function (event, page) {
            currentPage = page; // 현재 페이지 업데이트
            getList(); // 택시 목록 갱신
        }
    });

    // 필터기능
    $('#filter-driver-reg-date').on('change', function () {
        currentPage = 1;
        getTotalPages();
        getList();
    });
    $('.driver-search-filter').on('input', function () {
        currentPage = 1;
        getTotalPages();
        getList();
    });

    // 이미지만 업로드 가능하게
    $('#register-driver-photo').on('change', validateImageFile);
    $('#register-driver-taxi-license').on('change', validateImageFile);

    // 카카오 api 주소 검색
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
                $('#register-driver-address').val(roadAddr);
                $('#register-driver-address').prop('readonly', true);

            }
            , focusInput: false
        }).open();
    }

    // 필터 값 리셋
    function filterReset() {
        $('#filter-driver-is-retired').val('');
        $('#filter-driver-reg-date').val(filterAllDay);
        $('#search-driver-name').val('');
        currentPage = 1; // 페이지 번호 초기화
        getTotalPages();
        getList(); // 목록 새로고침
    }

    // 기사리스트 호출
    function getList() {
        getSearchValue();
        $.ajax({
            url: './list.ajax',
            type: 'GET',
            data: {
                'searchText': searchText,
                'filterStartDate': filterStartDate,
                'filterEndDate': filterEndDate,
                'filterIsRetired': filterIsRetired,
                'page': currentPage,
                'sortColumn': sortColumn,
                'sortOrder': sortOrder
            },
            dataType: 'JSON',
            success: function (data) {
                drawList(data.driverList);
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
                'filterIsRetired': filterIsRetired
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
        var filterDate = $('#filter-driver-reg-date').val();
        if (filterDate) {
            var dates = filterDate.split(' - ');
            filterStartDate = dates[0];
            filterEndDate = dates[1];
        }

        filterIsRetired = $('#filter-driver-is-retired').val();
        searchText = $('#search-driver-name').val();
    }

    // 리스트 보여주기
    function drawList(list) {
        var content = '';
        if (list.length > 0) {
            for (item of list) {
                var driver_is_retired = item.driver_is_retired === '0' ? '재직중' : '퇴사';
                content += '<tr class="driver-list-tbody-tr" id="' + item.driver_idx + '">'
                    + '<td class="text-center"><img src="' + uploadDir + item.driver_photo + '" style="width: 50px; height: 50px"></td>'
                    + '<td class="text-center">' + item.driver_name + '</td>'
                    + '<td class="text-center">' + item.driver_registration_date + '</td>'
                    + '<td class="text-center">' + driver_is_retired + '</td>'
                    + '<td class="text-center">' + item.driver_phone + '</td>'
                    + '<td class="text-center text-truncate">' + item.driver_address + '...</td>'
                    + '</tr>';
            }
        } else {
            content = '<tr><td colspan="7" class="text-center">데이터가 존재하지 않습니다.</td></tr>';
        }
        $('#driver-list').html(content);
    }

    // 기사 등록
    function registration() {
        var driverName = $('#register-driver-name').val();

        if (driverName === '페더스 맥그로우') {
            $('#preview-image').prop('src', 'https://i.pinimg.com/736x/2b/e8/99/2be899dcfd079a8c5d526a9c1145e8b2.jpg');
            $('#preview-image').show();
            return;
        } else if (driverName === '핑구') {
            $('#preview-image').prop('src', 'https://pbs.twimg.com/profile_images/949661980725407744/Sj3u2y2n_200x200.jpg');
            $('#preview-image').show();
            return;
        } else if (driverName === '뚱이') {
            $('#preview-image').prop('src', 'https://mblogthumb-phinf.pstatic.net/MjAyMTA4MDdfMjUy/MDAxNjI4MzIzODYzMzQy.khvu5YEAgnLEBuqHKgvYHeiDCg1lhd4_MWr3LznilFgg.6r3pHj5vkq8PuclIO_TD4lKTEsKLR_sWj6rS9LoSyHwg.JPEG.lama0909/patrickstar.jpg?type=w800');
            $('#preview-image').show();
            return;
        } else if (driverName === '야돈') {
            $('#preview-image').prop('src', 'https://pbs.twimg.com/media/DnyAdfFXsAISPGQ.jpg');
            $('#preview-image').show();
            return;
        }

        isModalAlert = true;
        var form = document.querySelector('.needs-validation');
        if (!form.checkValidity()) {
            form.classList.add('was-validated');
            showAlert('danger', '입력 값이 올바르지 않습니다.');
            return;
        }

        var formData = new FormData();
        formData.append('driver_photo_file', $('#register-driver-photo')[0].files[0]);
        formData.append('driver_name', $('#register-driver-name').val());
        formData.append('driver_taxi_license_photo_file', $('#register-driver-taxi-license')[0].files[0]);
        formData.append('driver_address', $('#register-driver-address').val());
        formData.append('driver_address_detail', $('#register-driver-address-detail').val());
        formData.append('driver_phone', $('#register-driver-phone').val().replace(/-/g, ''));
        console.log(formData.get('driver_phone'));

        $.ajax({
            url: './create.ajax',
            type: 'POST',
            dataType: 'JSON',
            processData: false,
            contentType: false,
            data: formData,
            success: function (data) {
                if (data.isSuccess) {
                    $('#registorModal').modal('hide');
                    isModalAlert = false;
                    $('#register-driver-photo').val('');
                    $('#register-driver-name').val('')
                    $('#register-driver-taxi-license').val('')
                    $('#register-driver-address').val('')
                    $('#register-driver-address-detail').val('')
                    $('#register-driver-phone').val('')
                    $('#preview-image').prop('src', '');
                    showAlert('success', '기사가 성공적으로 등록되었습니다.');
                    getTotalPages();
                    getList();
                } else {
                    showAlert('danger', '기사 등록 중 오류가 발생했습니다.');
                }
            },
            error: function (error) {
                console.log(error);
                showAlert('danger', '기사 등록 중 오류가 발생했습니다.');
            }
        });
    }

    // 이미지 미리보기
    function previewImage() {
        var $fileInput = $('#register-driver-photo');
        var $previewImage = $('#preview-image');

        var file = $fileInput[0].files[0];
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
        isModalAlert = true;
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
