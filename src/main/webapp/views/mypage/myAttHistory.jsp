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
                        <a href="#" class="text-decoration-none">마이페이지</a>
                    </li>
                    <li class="breadcrumb-item">
                        <a href="/attendance/myAttendance/list.go" class="text-decoration-none">근태 관리</a>
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
                                        <li class="nav-item" role="presentation">
                                            <button class="nav-link" id="taxi-schedule-tab" data-bs-toggle="tab"
                                                    data-bs-target="#taxi-schedule" type="button" role="tab"
                                                    aria-controls="taxi-schedule" aria-selected="false">수정 요청 내역
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
                                      
                                    <div class="tab-pane fade" id="taxi-schedule" role="tabpanel"
                                         aria-labelledby="taxi-schedule-tab">
                                        <h1>수정 요청 내역</h1>
                                        <!-- 택시 스케쥴 내용을 여기에 추가 -->
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



<!-- 캘린더 상세보기 모달  -->
<div class="modal fade" id="scheduleDetailModal" tabindex="-1" aria-labelledby="exampleModalLgLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title h4" id="exampleModalLgLabel">근태 수정 요청</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body"> 
                <div class="row">
                	<div class="col-6">     
                    <div class="input-group mb-3">
                        <label class="input-group-text" for="detail-title">사번</label>
                        <input type="text" class="form-control" id="detail-title" name="emp_no" readonly>
                    </div>   
                    </div>  
                    <div class="col-6">  
                    <div class="input-group mb-3">
                        <label class="input-group-text" for="detail-title">이름</label>
                        <input type="text" class="form-control" id="detail-title" name="emp_no" readonly>
                    	</div> 
                    </div>  
                 </div>                                        
                    <div class="input-group mb-3">
                        <label class="input-group-text" for="detail-start-date">일정</label>
                        <input type="text" class="form-control detailDatepicker" id="detail-start-date" name="detail-start-date" readonly>
                        <select id="detail-start-hour" name="detail-start-hour">
                        	    <c:forEach var="a" begin="0" end="23" varStatus="i">
                        	    	<option value="${a}">${a}시</option>
                        	    </c:forEach>                    	
                        </select>
                        <select id="detail-start-min" name="detail-start-min">
                        	    <c:forEach var="a" begin="0" end="59" varStatus="i">
                        	    	<option value="${a}">${a}분</option>
                        	    </c:forEach>                    	
                        </select>
                        <span class="input-group-text">~</span>
                        <input type="text" class="form-control detailDatepicker" id="detail-end-date" name="detail-end-date" readonly>
                        <select id="detail-end-hour" name="detail-end-hour">
                        	    <c:forEach var="a" begin="0" end="23" varStatus="i">
                        	    	<option value="${a}">${a}시</option>
                        	    </c:forEach>                    	
                        </select>
                        <select id="detail-end-min" name="detail-end-min">
                        	    <c:forEach var="a" begin="0" end="59" varStatus="i">
                        	    	<option value="${a}">${a}분</option>
                        	    </c:forEach>                    	
                        </select>
                    </div>
                    <div class="input-group mb-3">
                        <label class="input-group-text" for="detail-category">일정범위</label>
                        <select class="form-select" id="detail-category" disabled onchange="changeCategoryColor(this)">
                            <option value="개인" style="color: #ffec63">개인</option>
                            <option value="부서" style="color: #28b9ff">부서</option>
                            <option value="전사" style="color: #71f371">전사</option>
                        </select>
                    </div>
                    
                    <div class="input-group mb-3">
                        <label class="input-group-text" for="detail-content">수정 신청 사유</label>
                        <textarea class="form-control" id="detail-content" name="detail-content" placeholder="Enter message" rows="3" style="height: 245px;"></textarea>
                    </div>  
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary btn-lg" onclick="editSchedule()" id="editButton">수정 요청</button>
                    <button type="button" class="btn btn-secondary btn-lg" data-bs-dismiss="modal">닫기</button>         
                </div>
            </div>
        </div>
    </div>
<!-- 캘린더 상세보기 모달 끝-->

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
    
    var nowTab = 'maintenance';
    // 캘린더 리스트 불러오기 시작
document.addEventListener("DOMContentLoaded", function() {

    var modal = document.getElementById('mycab-cal-modal');
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
            addScheduleModal(arg, adjustedEnd);
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
                url: "/attHistory.ajax",
                data: {
                    'emp_no': "${sessionScope.loginId}"
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
                                day: res.work_day
                            };
                            events.push(event);
                                if(res.leave_time != null){
                                	event = {
                                            id: res.attendance_idx,
                                            title: "퇴근",
                                            start: res.leave_time,
                                            end: res.leave_time,
                                            day: res.work_day,
                                            color: "red"	
                                        };
                                	events.push(event);
                                	event={
                                            title: res.att_result,
                                            start: res.leave_time,
                                            allDay: true,
                                            color: "green"
                                	}
                                	events.push(event);
                                	
                                }
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
    
    $('#filter-maintenance-reg-date').val(filterMaintenanceAllDay);


    getTotalPages();
    getList();

   
    $('#maintenance-tab').on('click', function () {
        nowTab = 'maintenance'
        currentPage = 1;
        getTotalPages();
        getList();
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
    $('#filter-accident-reg-date').on('change', function () {
        currentPage = 1;
        getTotalPages();
        getList();
    });
    $('.accident-search-filter').on('input', function () {
        currentPage = 1;
        getTotalPages();
        getList();
    });
    $('#filter-maintenance-reg-date').on('change', function () {
        currentPage = 1;
        getTotalPages();
        getList();
    });
    $('.maintenance-search-filter').on('input', function () {
        currentPage = 1;
        getTotalPages();
        getList();
    });

   
    
    
    // 근태결과 모달창 생성
    function scheduleDetail(arg){
		myModal = new bootstrap.Modal(document.getElementById('scheduleDetailModal'));
		myModal.show();
		console.log(arg);
		$.ajax({
		        type: "GET",
		        url: "/calendar/calendarDetail.ajax",
		        data: {
		        	'schedule_idx': arg.event.id      	
		        },
		        dataType: "json",
				success: function(response) {
					var idx = response.dto.schedule_idx;
					document.getElementById('detail-title').value = response.dto.schedule_name	;
					document.getElementById('detail-content').value = response.dto.schedule_content	;
					var startDate = response.dto.schedule_start_date	;
					var endDate = response.dto.schedule_end_date	;
					var registDate = response.dto.schedule_register_date	;
					empNo = response.dto.schedule_emp_no;
					console.log(response.dto.schedule_emp_no);
					var editor = response.dto.schedule_editor	;
					document.getElementById('detail-category').value = response.dto.schedule_category	;
					var edit = response.dto.schedule_edit_date	;
					var isDel = response.dto.schedule_del	;
					document.getElementById('detail-start-date').value = response.divideStartDate;
					document.getElementById('detail-start-hour').value = response.divideStartHour;
					document.getElementById('detail-start-min').value = response.divideStartMin		;		
					document.getElementById('detail-end-date').value = response.divideEndDate;
					document.getElementById('detail-end-hour').value = response.divideEndHour;
					document.getElementById('detail-end-min').value = response.divideEndMin;
					
					// 아이디 검사
					chkLoginId("${sessionScope.loginId}",response.dto.schedule_emp_no);
		        },
		        error: function(xhr, status, error) {
		            // 에러 처리
		            $("#result").html("<p>There was an error: " + error + "</p>");
		        }
		    });
    }
</script>

</html>
