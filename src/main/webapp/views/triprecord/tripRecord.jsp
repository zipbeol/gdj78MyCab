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
        .dot {
            overflow: hidden;
            float: left;
            width: 12px;
            height: 12px;
            background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/mini_circle.png');
        }

        .dotOverlay {
            position: relative;
            bottom: 10px;
            border-radius: 6px;
            border: 1px solid #ccc;
            border-bottom: 2px solid #ddd;
            float: left;
            font-size: 12px;
            padding: 5px;
            background: #fff;
        }

        .dotOverlay:nth-of-type(n) {
            border: 0;
            box-shadow: 0px 1px 2px #888;
        }

        .number {
            font-weight: bold;
            color: #ee6152;
        }

        .dotOverlay:after {
            content: '';
            position: absolute;
            margin-left: -6px;
            left: 50%;
            bottom: -8px;
            width: 11px;
            height: 8px;
            background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white_small.png')
        }

        .distanceInfo {
            position: relative;
            top: 5px;
            left: 5px;
            list-style: none;
            margin: 0;
        }

        .distanceInfo .label {
            display: inline-block;
            width: 50px;
        }

        .distanceInfo:after {
            content: none;
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
                                    <h4 class="card-title">택시 시뮬레이터</h4>
                                </div>
                                <div class="card-body">
                                    <div id="map" style="width:100%;height:350px;"></div>
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

<!-- 카카오 맵 -->
<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6a9392fb6c3d719802f976bbff4678eb&libraries=services"></script>

<script>
    navigator.geolocation.getCurrentPosition(function (pos) {
        console.log(pos);
        var latitude = pos.coords.latitude;
        var longitude = pos.coords.longitude;
        document.getElementById('location').innerHTML = document.getElementById('location').innerHTML + latitude + ', ' + longitude;
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div
            mapOption = {
                center: new kakao.maps.LatLng(latitude, longitude), // 지도의 중심좌표
                level: 5 // 지도의 확대 레벨
            };

        var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

        var drawingFlag = false; // 선이 그려지고 있는 상태를 가지고 있을 변수입니다
        var moveLine; // 선이 그려지고 있을때 마우스 움직임에 따라 그려질 선 객체 입니다
        var clickLine; // 마우스로 클릭한 좌표로 그려질 선 객체입니다
        var distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다
        var dots = []; // 선이 그려지고 있을때 클릭할 때마다 클릭 지점과 거리를 표시하는 커스텀 오버레이 배열입니다.

        document.getElementById('startBtn').addEventListener('click', function (evt) {
            var clickPosition = new kakao.maps.LatLng(latitude, longitude);
            start({latLng: clickPosition});
        });

        // 지도에 클릭 이벤트를 등록합니다
        // 지도를 클릭하면 선 그리기가 시작됩니다 그려진 선이 있으면 지우고 다시 그립니다
        kakao.maps.event.addListener(map, 'click', function (evt) {
            start(evt);
        });

        function start(mouseEvent) {
            // 마우스로 클릭한 위치입니다
            var clickPosition = mouseEvent.latLng;
            console.log(mouseEvent);

            // 지도 클릭이벤트가 발생했는데 선을 그리고있는 상태가 아니면
            if (!drawingFlag) {
                // 상태를 true로, 선이 그리고있는 상태로 변경합니다
                drawingFlag = true;

                // 지도 위에 선이 표시되고 있다면 지도에서 제거합니다
                deleteClickLine();

                // 지도 위에 커스텀오버레이가 표시되고 있다면 지도에서 제거합니다
                deleteDistance();

                // 지도 위에 선을 그리기 위해 클릭한 지점과 해당 지점의 거리정보가 표시되고 있다면 지도에서 제거합니다
                deleteCircleDot();

                // 클릭한 위치를 기준으로 선을 생성하고 지도위에 표시합니다
                clickLine = new kakao.maps.Polyline({
                    map: map, // 선을 표시할 지도입니다
                    path: [clickPosition], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
                    strokeWeight: 3, // 선의 두께입니다
                    strokeColor: '#db4040', // 선의 색깔입니다
                    strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
                    strokeStyle: 'solid' // 선의 스타일입니다
                });

                // 선이 그려지고 있을 때 마우스 움직임에 따라 선이 그려질 위치를 표시할 선을 생성합니다
                moveLine = new kakao.maps.Polyline({
                    strokeWeight: 3, // 선의 두께입니다
                    strokeColor: '#db4040', // 선의 색깔입니다
                    strokeOpacity: 0.5, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
                    strokeStyle: 'solid' // 선의 스타일입니다
                });

                // 클릭한 지점에 대한 정보를 지도에 표시합니다
                displayCircleDot(clickPosition, 0);


            } else { // 선이 그려지고 있는 상태이면
                // 그려지고 있는 선의 좌표 배열을 얻어옵니다
                var path = clickLine.getPath();

                // 좌표 배열에 클릭한 위치를 추가합니다
                path.push(clickPosition);

                // 다시 선에 좌표 배열을 설정하여 클릭 위치까지 선을 그리도록 설정합니다
                clickLine.setPath(path);

                var distance = Math.round(clickLine.getLength());
                displayCircleDot(clickPosition, distance);
            }
        }

        // 지도에 마우스무브 이벤트를 등록합니다
        // 선을 그리고있는 상태에서 마우스무브 이벤트가 발생하면 그려질 선의 위치를 동적으로 보여주도록 합니다
        kakao.maps.event.addListener(map, 'mousemove', function (mouseEvent) {
            // 지도 마우스무브 이벤트가 발생했는데 선을 그리고있는 상태이면
            if (drawingFlag) {
                // 마우스 커서의 현재 위치를 얻어옵니다
                var mousePosition = mouseEvent.latLng;

                // 마우스 클릭으로 그려진 선의 좌표 배열을 얻어옵니다
                var path = clickLine.getPath();

                // 마우스 클릭으로 그려진 마지막 좌표와 마우스 커서 위치의 좌표로 선을 표시합니다
                var movepath = [path[path.length - 1], mousePosition];
                moveLine.setPath(movepath);
                moveLine.setMap(map);

                var distance = Math.round(clickLine.getLength() + moveLine.getLength()), // 선의 총 거리를 계산합니다
                    content = '<div class="dotOverlay distanceInfo">총거리 <span class="number">' + distance + '</span>m</div>'; // 커스텀오버레이에 추가될 내용입니다

                // 거리정보를 지도에 표시합니다
                showDistance(content, mousePosition);
            }
        });

        // 지도에 마우스 오른쪽 클릭 이벤트를 등록합니다
        // 선을 그리고있는 상태에서 마우스 오른쪽 클릭 이벤트가 발생하면 선 그리기를 종료합니다
        kakao.maps.event.addListener(map, 'rightclick', function (mouseEvent) {
            // 지도 오른쪽 클릭 이벤트가 발생했는데 선을 그리고있는 상태이면
            if (drawingFlag) {
                // 마우스무브로 그려진 선은 지도에서 제거합니다
                moveLine.setMap(null);
                moveLine = null;

                // 마우스 클릭으로 그린 선의 좌표 배열을 얻어옵니다
                var path = clickLine.getPath();

                // 선을 구성하는 좌표의 개수가 2개 이상이면
                if (path.length > 1) {
                    // 마지막 클릭 지점에 대한 거리 정보 커스텀 오버레이를 지웁니다
                    if (dots[dots.length - 1].distance) {
                        dots[dots.length - 1].distance.setMap(null);
                        dots[dots.length - 1].distance = null;
                    }

                    var distance = Math.round(clickLine.getLength()), // 선의 총 거리를 계산합니다
                        content = getTimeHTML(distance); // 커스텀오버레이에 추가될 내용입니다

                    // 그려진 선의 거리정보를 지도에 표시합니다
                    showDistance(content, path[path.length - 1]);

                } else {
                    // 선을 구성하는 좌표의 개수가 1개 이하이면
                    // 지도에 표시되고 있는 선과 정보들을 지도에서 제거합니다.
                    deleteClickLine();
                    deleteCircleDot();
                    deleteDistance();
                }

                // 상태를 false로, 그리지 않고 있는 상태로 변경합니다
                drawingFlag = false;

            }
        });

        // 클릭으로 그려진 선을 지도에서 제거하는 함수입니다
        function deleteClickLine() {
            if (clickLine) {
                clickLine.setMap(null);
                clickLine = null;
            }
        }

        // 마우스 드래그로 그려지고 있는 선의 총거리 정보를 표시하고
        // 마우스 오른쪽 클릭으로 선 그리기가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 생성하고 지도에 표시하는 함수입니다
        function showDistance(content, position) {
            if (distanceOverlay) { // 커스텀오버레이가 생성된 상태이면
                // 커스텀 오버레이의 위치와 표시할 내용을 설정합니다
                distanceOverlay.setPosition(position);
                distanceOverlay.setContent(content);
            } else { // 커스텀 오버레이가 생성되지 않은 상태이면
                // 커스텀 오버레이를 생성하고 지도에 표시합니다
                distanceOverlay = new kakao.maps.CustomOverlay({
                    map: map, // 커스텀오버레이를 표시할 지도입니다
                    content: content,  // 커스텀오버레이에 표시할 내용입니다
                    position: position, // 커스텀오버레이를 표시할 위치입니다.
                    xAnchor: 0,
                    yAnchor: 0,
                    zIndex: 3
                });
            }
        }

        // 그려지고 있는 선의 총거리 정보와
        // 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 삭제하는 함수입니다
        function deleteDistance() {
            if (distanceOverlay) {
                distanceOverlay.setMap(null);
                distanceOverlay = null;
            }
        }

        // 선이 그려지고 있는 상태일 때 지도를 클릭하면 호출하여
        // 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 표출하는 함수입니다
        function displayCircleDot(position, distance) {
            // 클릭 지점을 표시할 빨간 동그라미 커스텀오버레이를 생성합니다
            var circleOverlay = new kakao.maps.CustomOverlay({
                content: '<span class="dot"></span>',
                position: position,
                zIndex: 1
            });

            // 지도에 표시합니다
            circleOverlay.setMap(map);

            if (distance > 0) {
                // 클릭한 지점까지의 그려진 선의 총 거리를 표시할 커스텀 오버레이를 생성합니다
                var distanceOverlay = new kakao.maps.CustomOverlay({
                    content: '<div class="dotOverlay">거리 <span class="number">' + distance + '</span>m</div>',
                    position: position,
                    yAnchor: 1,
                    zIndex: 2
                });

                // 지도에 표시합니다
                distanceOverlay.setMap(map);
            }

            // 배열에 추가합니다
            dots.push({circle: circleOverlay, distance: distanceOverlay});
        }

        // 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 지도에서 모두 제거하는 함수입니다
        function deleteCircleDot() {
            for (var i = 0; i < dots.length; i++) {
                if (dots[i].circle) {
                    dots[i].circle.setMap(null);
                }

                if (dots[i].distance) {
                    dots[i].distance.setMap(null);
                }
            }

            dots = [];
        }

        function getTimeHTML(distance) {
            // 자동차 서울시 평균 시속 30km/h 이고, 초속은 30 * 1000 / 3600 = 8.33m/s 입니다
            var carSpeed = 30 * 1000 / 3600; // meters per second
            var totalTimeInSeconds = distance / carSpeed | 0; // 초 단위로 시간 계산
            console.log(totalTimeInSeconds);

            var hours = Math.floor(totalTimeInSeconds / 3600);
            var minutes = Math.floor((totalTimeInSeconds % 3600) / 60);
            var seconds = totalTimeInSeconds % 60;

            var timeString = '';
            if (hours > 0) {
                timeString += '<span class="number">' + hours + '</span>시간 ';
            }
            if (minutes > 0 || hours > 0) { // 시간이 있으면 분도 표시, 분만 있을 경우에도 표시
                timeString += '<span class="number">' + minutes + '</span>분 ';
            }
            timeString += '<span class="number">' + seconds + '</span>초';

            var money = 0;
            console.log(distance);
            if (distance < 1600) {
                console.log(distance + ' <= 1600');
                money = 4800;
            } else {
                console.log(distance + ' > 1600');
                var extraDistance = distance - 1600;

                // 131m당 100원 추가
                var distanceCharges = Math.ceil(extraDistance / 131) * 100;

                // 30초당 100원 추가
                var extraTimeInSeconds = extraDistance / carSpeed;
                var timeCharges = Math.ceil(extraTimeInSeconds / 30) * 100; // 30초당 100원

                money = 4800 + distanceCharges + timeCharges;
            }

            // 거리와 시간을 가지고 HTML Content를 만들어 리턴합니다
            var content = '<ul class="dotOverlay distanceInfo">';
            content += '    <li>';
            content += '        <span class="label">총거리</span><span class="number">' + distance + '</span>m';
            content += '    </li>';
            content += '    <li>';
            content += '        <span class="label">예상 시간</span>' + timeString;
            content += '    </li>';
            content += '    <li>';
            content += '        <span class="label">예상 금액</span>' + money + '원';
            content += '    </li>';
            content += '</ul>';

            return content;
        }

    });
</script>

</html>
