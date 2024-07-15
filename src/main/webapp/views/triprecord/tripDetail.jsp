<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>My Cab - 운행 상세</title>
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
    <!-- CSS Files -->
    <link rel="stylesheet" href="/assets/fonts/bootstrap/bootstrap-icons.css">
    <link rel="stylesheet" href="/assets/css/main.min.css">
    <!-- Vendor Css Files -->
    <link rel="stylesheet" href="/assets/vendor/overlay-scroll/OverlayScrollbars.min.css">
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
                        <a href="/taxi/list.go" class="text-decoration-none">운행 기록 조회</a>
                    </li>
                    <li class="breadcrumb-item">
                        <a href="/taxi/list.go" class="text-decoration-none">운행 기록 상세</a>
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
                                    <h4 class="card-title">운행 기록 상세</h4>
                                </div>
                                <div class="card-body">
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <h5>운행 정보 요약</h5>
                                            <p><strong>운행 택시기사:</strong> ${info.trip_record_driver_name}</p>
                                            <p><strong>운행 택시:</strong> ${info.trip_license_plate}</p>
                                            <p><strong>운행 일시:</strong> ${info.trip_record_date}</p>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <h5>운행 상세 정보</h5>
                                            <p><strong>출발지:</strong> ${info.trip_record_start_location}</p>
                                            <p><strong>도착지:</strong> ${info.trip_record_end_location}</p>
                                            <p><strong>거리:</strong> <fmt:formatNumber
                                                    value="${info.trip_record_distance / 1000}" minFractionDigits="1"
                                                    maxFractionDigits="1"/> km</p>
                                            <p><strong>요금:</strong> <fmt:formatNumber value="${info.trip_record_fare}"
                                                                                      type="number"/> 원</p>

                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-12">
                                            <h5>운행 경로 비교</h5>
                                            <div class="d-flex">
                                                <div id="actualRouteMap"
                                                     style="width:500px;height:400px;"></div>
                                                <div id="navigationRouteMap"
                                                     style="width:500px;height:400px;"></div>
                                            </div>
                                            <p><strong>경로의 유사성:</strong><span id="routeSimilarity"></span></p>
                                        </div>
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
<!-- JavaScript Files -->
<!-- Required jQuery first, then Bootstrap Bundle JS -->
<script src="/assets/js/jquery.min.js"></script>
<script src="/assets/js/bootstrap.bundle.min.js"></script>
<!-- Vendor Js Files -->
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

<!-- 카카오 맵 -->
<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6a9392fb6c3d719802f976bbff4678eb&libraries=services"></script>

<script>
    // Dynamic Time Warping class definition
    class DynamicTimeWarping {
        constructor(ts1, ts2, distFunc) {
            this.ts1 = ts1;
            this.ts2 = ts2;
            this.distFunc = distFunc;

            // Initialize the accumulated cost matrix with large numbers
            this.cost = Array(ts1.length).fill().map(() => Array(ts2.length).fill(Number.POSITIVE_INFINITY));
            this.cost[0][0] = distFunc(ts1[0], ts2[0]);

            // Compute the accumulated cost matrix
            for (let i = 1; i < ts1.length; i++) {
                this.cost[i][0] = this.cost[i - 1][0] + distFunc(ts1[i], ts2[0]);
            }
            for (let j = 1; j < ts2.length; j++) {
                this.cost[0][j] = this.cost[0][j - 1] + distFunc(ts1[0], ts2[j]);
            }
            for (let i = 1; i < ts1.length; i++) {
                for (let j = 1; j < ts2.length; j++) {
                    this.cost[i][j] = Math.min(
                        this.cost[i - 1][j],    // Insertion
                        this.cost[i][j - 1],    // Deletion
                        this.cost[i - 1][j - 1] // Match
                    ) + distFunc(ts1[i], ts2[j]);
                }
            }
        }

        getDistance() {
            return this.cost[this.ts1.length - 1][this.ts2.length - 1];
        }
    }

    var tripLocationData = [];
    var tripDistance = '${info.trip_record_distance}';

    <c:forEach var="location" items="${tripLocationData}">
    tripLocationData.push({
        lat: ${location.latitude},
        lng: ${location.longitude}
    });
    </c:forEach>

    // 출발지와 도착지 좌표
    var startLocation = {lat: tripLocationData[0].lat, lng: tripLocationData[0].lng};
    var endLocation = {
        lat: tripLocationData[tripLocationData.length - 1].lat,
        lng: tripLocationData[tripLocationData.length - 1].lng
    };

    // 중간 좌표 계산
    var midLat = (startLocation.lat + endLocation.lat) / 2;
    var midLng = (startLocation.lng + endLocation.lng) / 2;
    var midPoint = {lat: midLat, lng: midLng};

    console.log(midPoint);

    // 실제 경로 지도 초기화
    var actualMapContainer = $('#actualRouteMap')[0];
    var actualMapOption = {
        center: new kakao.maps.LatLng(midPoint.lat, midPoint.lng),
        level: 5
    };
    var actualMap = new kakao.maps.Map(actualMapContainer, actualMapOption);

    // 실제 경로 표시
    var actualPath = tripLocationData.map(function (location) {
        return new kakao.maps.LatLng(location.lat, location.lng);
    });
    var polylineActual = new kakao.maps.Polyline({
        path: actualPath,
        strokeWeight: 5,
        strokeColor: '#FF0000', // 실제 경로 색상
        strokeOpacity: 0.7,
        strokeStyle: 'solid'
    });
    polylineActual.setMap(actualMap);

    // 네비게이션 경로 지도 초기화
    var naviMapContainer = $('#navigationRouteMap')[0];
    var naviMapOption = {
        center: new kakao.maps.LatLng(midPoint.lat, midPoint.lng),
        level: 5
    };
    var naviMap = new kakao.maps.Map(naviMapContainer, naviMapOption);

    var naviLocationData = [];

    $.ajax({
        url: 'https://apis-navi.kakaomobility.com/v1/directions',
        type: 'GET',
        headers: {
            'Authorization': 'KakaoAK 7e6d12e9c7079432daf4ef284186acb1' // 실제 API 키로 변경 필요
        },
        data: {
            origin: startLocation.lng + ',' + startLocation.lat,
            destination: endLocation.lng + ',' + endLocation.lat
        },
        success: function (data) {
            console.log(data);
            var naviDistance = data.routes[0].sections[0].distance;
            console.log(naviDistance);
            naviLocationData = data.routes[0].sections[0].guides.map(function (item) {
                return {lat: item.y, lng: item.x};
            });

            var routePath = naviLocationData.map(function (location) {
                return new kakao.maps.LatLng(location.lat, location.lng);
            });
            var polylineNavi = new kakao.maps.Polyline({
                path: routePath,
                strokeWeight: 5,
                strokeColor: '#0000FF', // 네비게이션 경로 색상
                strokeOpacity: 0.7,
                strokeStyle: 'solid'
            });
            polylineNavi.setMap(naviMap); // 네비게이션 경로 지도에 표시

            // 경로 유사성 계산
            calculateRouteSimilarity(tripLocationData, naviLocationData);
        },
        error: function (error) {
            console.log(error);
        }
    });

    function calculateRouteSimilarity(route1, route2) {
        var dtw = new DynamicTimeWarping(route1, route2, function(a, b) {
            var dx = a.lat - b.lat;
            var dy = a.lng - b.lng;
            return Math.sqrt(dx * dx + dy * dy);
        });

        var distance = dtw.getDistance();
        console.log('DTW Distance:', distance);
        document.getElementById('routeSimilarity').textContent = distance.toFixed(2);
    }
</script>
</html>
