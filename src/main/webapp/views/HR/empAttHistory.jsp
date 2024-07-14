<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
    
     <!-- Calendar CSS -->
    <link rel="stylesheet" href="/assets/vendor/calendar/css/main.min.css">
    <link rel="stylesheet" href="/assets/vendor/calendar/css/custom.css">

    <!-- 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

    <!-- Date Range CSS -->
    <link rel="stylesheet" href="/assets/vendor/daterange/daterange.css">
    <!-- 따로 적용한 CSS -->
    <link rel="stylesheet" href="/assets/css/default.css">
    <!-- FontAwesome 추가 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

    <style>
        .maintenance-list-tbody-tr td.ellipsis {
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            max-width: 1px; /* 추가: 텍스트가 잘릴 수 있도록 설정 */
        }

        .table-responsive {
            overflow-x: initial; /* 스크롤 바 방지 */
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

        .info-label {
            font-weight: bold; /* Optionally make labels bold */
        }

        .info-value {
            font-size: 16px; /* Adjust font size as needed */
        }

        .edit-save-buttons {
            text-align: end; /* Align buttons to the right */
            margin-top: 10px; /* Add space above the buttons */
        }
        .fc-day-sat .fc-daygrid-day-number {
         color: blue;
      }
      
      .fc-day-sun .fc-daygrid-day-number {
         color: red;
      }
      .fc-day-sun .fc-col-header-cell-cushion {
         color: red;
      }
      
      .fc-day-sat .fc-col-header-cell-cushion {
         color: blue;
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
                        <a href="#" class="text-decoration-none">인사관리</a>
                    </li>
                    <li class="breadcrumb-item">
                        <a href="/attendance/attendance/list.go" class="text-decoration-none">근태 관리</a>
                    </li>
                    <li class="breadcrumb-item">
                        <a href="#" class="text-decoration-none">사원 근태 상세보기</a>
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
                                    <ul class="nav nav-tabs card-header-tabs" id="taxiTabs" role="tablist">
                                        <li class="nav-item" role="presentation">
                                            <button class="nav-link active" id="taxi-detail-tab" data-bs-toggle="tab"
                                                    data-bs-target="#taxi-detail" type="button" role="tab"
                                                    aria-controls="taxi-detail" aria-selected="true">근태 내역
                                            </button>
                                        </li>
                                    </ul>
                                </div>
                                <div class="card-body tab-content" id="taxiTabsContent">
                                    <div class="tab-pane fade show active" id="taxi-detail" role="tabpanel"
                                         aria-labelledby="taxi-detail-tab">
                                        <!-- 택시 상세 내용 -->
                                        	<div id="selectableCalendar"></div>
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
<!-- 캘린더  -->
<script src="/assets/vendor/calendar/js/main.min.js"></script>
<script src="/assets/vendor/calendar/custom/mycab-cal.js"></script>
<script>
    var emp_no = ${emp_no};
    console.log('사번 :'+emp_no);
    var nowTab = 'maintenance';
    // 캘린더 리스트 불러오기 시작
document.addEventListener("DOMContentLoaded", function() {

    
    var calendarEl = document.getElementById("selectableCalendar");

    calendar = new FullCalendar.Calendar(calendarEl, {
        headerToolbar: {
            left: "prev,next today",
            center: "title",
            right: ""
        },
        locale: 'ko',
        initialDate: new Date(),
        navLinks: false, // can click day/week names to navigate views
        selectable: false,
        selectMirror: false,
        select: function(arg) {
            var adjustedEnd = moment(arg.end).subtract(1, 'days').format("YYYY-MM-DD");
            
        },
        eventClick: function(arg) {
            scheduleDetail(arg);
        },
        eventDidMount: function(info) {
            console.log(info);
        },
        dayMaxEvents: true,

        events: function(fetchInfo, successCallback, failureCallback) {
            console.log(fetchInfo);
            console.log(successCallback);
            console.log(failureCallback);

            $.ajax({
                type: "GET",
                url: "/myAttHistory.ajax",
                data: {
                    'emp_no': "${emp_no}"
                },
                dataType: "json",
                success: function(response) {
                    var events = [];

                    for (var i = 0; i < response.dto.length; i++) {
                        var res = response.dto[i];
                        var event;

                        if (res.att_time != null) {
                            event = {
                                id: res.attendance_idx,
                                title: "출근",
                                start: res.att_time,
                                end: res.att_time,
                                day: res.work_day,
                                color: "#38ff38"
                            };
                            events.push(event);
                            if (res.leave_time != null) {
                                event = {
                                    id: res.attendance_idx,
                                    title: "퇴근",
                                    start: res.leave_time,
                                    end: res.leave_time,
                                    day: res.work_day,
                                    color: "#28d4c4"
                                };
                                events.push(event);
                            }
                        }

                        if (res.att_result != null) {
                            event = {
                                id: res.attendance_idx,
                                title: res.att_result,
                                start: res.work_day, 
                                end: res.work_day,  
                                allDay: true,
                                color: res.att_result === '지각' ? '#ff8d22' :
                                       res.att_result === '결근' ? '#fd1616' :
                                       res.att_result === '근무' ? '#56ca31' :
                                       res.att_result === '오전 반차' ? '#3CB4FF' :
                                       res.att_result === '오후 반차' ? '#3CB4FF' :
                                       res.att_result === '연차' ? '#B24BE5' : 'gray'
                            };
                            events.push(event);
                        }
                    }

                    console.log('Events:', events);
                    successCallback(events);
                },
                error: function(xhr, status, error) {
                    alert("캘린더 불러오기에 실패했습니다.");
                }
            });
        }
    });

    calendar.render();
});

    // 캘린더 리스트 불러오기 끝
    

    
   
    
    
</script>

</html>
