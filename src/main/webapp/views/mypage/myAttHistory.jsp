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
                                        <h2>수정 요청 내역</h2>
                                        <div class="mt-3"></div>
                                        <!-- 택시 스케쥴 내용을 여기에 추가 -->
                                        <div class="table-outer">
											<div class="table-responsive">
												<table class="table align-middle table-hover m-0">
													<thead>
														<tr>
															<th class="text-center" id="th-emp-no"
																style="width: 10%;" data-value="emp-no">No</th>
															<th class="text-center" id="th-emp-name"
																style="width: 20%;" data-value="emp-name">신청일</th>
															<th class="text-center" id="th-dept-name"
																style="width: 20%;" data-value="dept-name">승인 여부</th>
														</tr>
													</thead>
													<tbody id="att-Edit-list">
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
                        <label class="input-group-text" for="detail-no">사번</label>
                        <input type="text" class="form-control" id="detail-no" name="emp_no" readonly>
                        <input type="hidden" class="form-control" id="detail-idx" name="attendance_management" readonly>
                    </div>   
                    </div>  
                    <div class="col-6">  
                    <div class="input-group mb-3">
                        <label class="input-group-text" for="detail-name">이름</label>
                        <input type="text" class="form-control" id="detail-name" name="emp_name" readonly>
                    	</div> 
                    </div>  
                 </div>                                        
                    <div class="input-group mb-3">
                        <label class="input-group-text" for="detail-workday">날짜</label>
                        <input type="text" class="form-control" id="detail-workday" name="work_day" readonly>
                    </div>
                     <div class="row">
                	<div class="col-6">     
                    <div class="input-group mb-3">
                        <label class="input-group-text" for="detail-att-time">출근</label>
                        <input type="text" class="form-control" id="detail-att" name="att_time" readonly>
                    </div>   
                    </div>  
                    <div class="col-6">  
                    <div class="input-group mb-3">
                        <label class="input-group-text" for="detail-leave-time">퇴근</label>
                        <input type="text" class="form-control" id="detail-leave" name="leave_time" readonly>
                    	</div> 
                    </div>  
                 </div>                   
                    <div class="input-group mb-3">
                        <label class="input-group-text" for="detail-result">현재 근태 결과</label>
                        <input type="text" class="form-control" id="detail-result" name="att_modify_attresult" readonly>
                        <input type="hidden" class="form-control" id="detail-modify-result" name="att_modify_attresult" value="근무" readonly>
                    </div>
                    <div class="input-group mb-3">
                        <label class="input-group-text" for="detail-reason">수정 신청 사유</label>
                        <textarea class="form-control" id="detail-reason" name="att_reason" rows="3" style="height: 245px; resize:none;" ></textarea>
                    </div> 
                    <h4>🚨수정 요청 승인시 근태 결과는 근무로 변경됩니다.</h4> 
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary btn-lg" onclick="attEdit()" id="editButton">수정 요청</button>
                    <button type="button" class="btn btn-secondary btn-lg" data-bs-dismiss="modal">닫기</button>
                          
                </div>
            </div>
        </div>
    </div>
<!-- 캘린더 상세보기 모달 끝-->

<!-- 근태 수정 내역 모달 시작 -->
	<div class="modal fade" id="attApplyModal" tabindex="-1" aria-labelledby="registerModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title h4" id="exampleModalLgLabel">근태 수정 요청 내역</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="row mb-3">
                    <div class="col-6">
                        <div class="input-group">
                            <label class="input-group-text" for="detail-no">사번</label>
                            <input type="text" class="form-control" id="ddetail-no" name="emp_no" readonly>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="input-group">
                            <label class="input-group-text" for="detail-name">이름</label>
                            <input type="text" class="form-control" id="ddetail-name" name="emp_name" readonly>
                        </div>
                    </div>
                </div>
                <div class="input-group mb-3">
                    <label class="input-group-text" for="detail-workday">날짜</label>
                    <input type="text" class="form-control" id="ddetail-workday" name="work_day" readonly>
                </div>
                <div class="row mb-3">
                    <div class="col-6">
                        <div class="input-group">
                            <label class="input-group-text" for="detail-att-time">출근</label>
                            <input type="text" class="form-control" id="ddetail-att-time" name="att_time" readonly>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="input-group">
                            <label class="input-group-text" for="detail-leave-time">퇴근</label>
                            <input type="text" class="form-control" id="ddetail-leave-time" name="leave_time" readonly>
                        </div>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-6">
                        <div class="input-group">
                            <label class="input-group-text" for="detail-before-att">수정 전 근태 결과</label>
                            <input type="text" class="form-control" id="ddetail-before-att" name="before_att_time" readonly>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="input-group">
                            <label class="input-group-text" for="detail-after-att">수정 요청 근태 결과</label>
                            <input type="text" class="form-control" id="ddetail-after-att" name="after_att_time" readonly>
                        </div>
                    </div>
                </div>
                <div class="input-group mb-3">
                    <label class="input-group-text" for="detail-reason">수정 신청 사유</label>
                    <textarea class="form-control" id="ddetail-reason" name="att_reason" rows="3" style="height: 245px; resize: none;"readonly></textarea>
                </div>
                <div class="input-group mb-3">
                    <label class="input-group-text" for="detail-rejection-reason">수정 거부 사유</label>
                    <input type="text" class="form-control" id="ddetail-rejection-reason" name="rejection_reason" readonly>
                </div>
                <div class="row mb-3">
                    <div class="col-6">
                        <div class="input-group">
                            <label class="input-group-text" for="detail-handler">담당자</label>
                            <input type="text" class="form-control" id="ddetail-handler" name="handler" readonly>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="input-group">
                            <label class="input-group-text" for="detail-process-date">처리일</label>
                            <input type="text" class="form-control" id="ddetail-process-date" name="process_date" readonly>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                
            </div>
        </div>
    </div>
</div>
<!-- 근태 수정 내역 모달 끝 -->

			
						

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
                                day: res.work_day,
                                color: "#38ff38"
                            };
                            events.push(event);
                                if(res.leave_time != null){
                                	event = {
                                            id: res.attendance_idx,
                                            title: "퇴근",
                                            start: res.leave_time,
                                            end: res.leave_time,
                                            day: res.work_day,
                                            color: "#28d4c4"	
                                        };
                                	events.push(event);
                                	if (res.att_result != null) {
                                		event={
                                    			id: res.attendance_idx,
                                                title: res.att_result,
                                                start: res.att_time,
                                                end: res.leave_time,
                                                allDay: true,
                                                color: res.att_result === '지각' ? '#ff8d22' :
                                                		 res.att_result === '결근' ? '#fd1616' :
                                                		res.att_result === '근무' ? '#56ca31' :
                                                		res.att_result === '연차' ? '#ff6820' : 'gray'
                                    	};
                                    	events.push(event);
									}
                                	
                                	
                                }else if (res.att_result != null) {
                                	event={
                                			id: res.attendance_idx,
                                            title: res.att_result,
                                            start: res.att_time,
                                            end: res.leave_time,
                                            allDay: true,
                                            color: res.att_result === '지각' ? '#ff8d22' :
                                            		 res.att_result === '결근' ? '#fd1616' :
                                            		res.att_result === '근무' ? '#56ca31' :
                                            		res.att_result === '연차' ? '#ff6820' : 'gray'
                                	};
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
    

    
    // 근태결과 모달창 생성
    function scheduleDetail(arg){
		
    	
    	myModal = new bootstrap.Modal(document.getElementById('scheduleDetailModal'));
		
		
		console.log(arg.event.id);
		$.ajax({
		        type: "GET",
		        url: "/myAttHistoryDetail.ajax",
		        data: {
		        	'attendance_idx': arg.event.id      	
		        },
		        dataType: "json",
				success: function(response) {
					console.log(response.dto.emp_no);
					
					document.getElementById('detail-no').value = response.dto.emp_no	;
					document.getElementById('detail-idx').value = response.dto.attendance_idx	;
					document.getElementById('detail-name').value = response.dto.emp_name	;
					document.getElementById('detail-workday').value = response.dto.work_day;
					document.getElementById('detail-result').value = response.dto.att_result;
					document.getElementById('detail-att').value = response.sTime || '정보없음';
					console.log('null인가요..?'+response.eTime);
					
					document.getElementById('detail-leave').value = response.eTime || '정보없음';
					myModal.show();
		        },
		        error: function(xhr, status, error) {
		            // 에러 처리
		            $("#result").html("<p>There was an error: " + error + "</p>");
		        }
		    });
    }
    
    //근태 수정 요청
    function attEdit(){
    	
    	var no = document.getElementById('detail-no').value;
    	var idx = document.getElementById('detail-idx').value;
    	var name = document.getElementById('detail-name').value;
    	var workday = document.getElementById('detail-workday').value;
    	var result = document.getElementById('detail-result').value;
    	var modifyResult = document.getElementById('detail-modify-result').value;
    	var reason = document.getElementById('detail-reason').value;
    	
    	
    	if (reason === '' || reason.trim() === '') {
    		alert('수정 사유를 입력해주세요!');
			
		}else{
    	
    	$.ajax({
	        type: "GET",
	        url: "/myAttEditApply.ajax",
	        data: {
	        	'attendance_management': idx,
	        	'att_applicant': no,
	        	'att_previous_attresult': result,
	        	'att_modify_attresult': modifyResult,
	        	'att_reason': reason,
	        },
	        dataType: "json",
			success: function(data) {
				if (data.isSuccess) {
					$('#scheduleDetailModal').modal('hide');
                    showAlert('success', '근태 수정 요청이 완료되었습니다.');
                   
                } else {
                	$('#scheduleDetailModal').modal('hide');
                    showAlert('danger', '근태 수정 요청에 실패했습니다.');
                }  
	        },
	        error: function(xhr, status, error) {
	            // 에러 처리
	            $("#result").html("<p>There was an error: " + error + "</p>");
	        }
	    });
		}
    }
    
    
    var showPage = 1; // 현재 페이지 번호
    
    
    $(document).ready(function(){ // html 문서가 모두 읽히면 되면(준비되면) 다음 내용을 실행 해라
    	listCall(showPage);
    });

    function listCall(page){
        $.ajax({
           type:'get',
           url:'/attEditApplyList.ajax',
           data:{
              'page':page,
              'cnt':10,
              'emp_no': '${sessionScope.loginId}'
           },
           dataType:'json',
           success:function(data){
              drawList(data.list);
              console.log(data);
              //플러그인 추가
              var startPage = data.currPage > data.totalPages? data.totalPages : data.currPage;
              
              $('#pagination').twbsPagination({
            	  startPage:startPage, //시작페이지
            	  totalPages:data.totalPages, //총 페이지 갯수
            	  visiblePages:5, //보여줄 페이지 수 [1][2][3][4][5]
             	  onPageClick:function(evt, pg){//페이지 클릭시 실행 함수
            		  console.log(evt); // 이벤트 객체
            		  console.log(pg); //클릭한 페이지 번호
            		  showPage = pg;
            		  listCall(pg);
            	  }
            	  
              });
              
           },
           error:function(error){
              console.log(error)
           }
        });
    }
    
    
    
 
    // 리스트 보여주기
    function drawList(list) {
        var content = '';
        if (list.length > 0) {
            for (item of list) {
            	console.log(item.att_apply_status);
                var att_apply_status = item.att_apply_status === true ? 'Y' : 'N';
                
                
             // ISO 8601 날짜 문자열을 Date 객체로 변환
                var date = new Date(item.att_applicant_date);
                // 한국 시간으로 변환
                var kstDate = new Date(date.getTime() + (9 * 60 * 60 * 1000));
                // 날짜만 추출 (yyyy-mm-dd 형식)
                var formattedDate = kstDate.toISOString().split('T')[0];
              
                content += '<tr class="att-Edit-list-tbody-tr" id="' + item.att_management_idx + '">'
                	+ '<td class="text-center">' + item.att_management_idx+ '</td>'
                    + '<td class="text-center">' + formattedDate  + '</td>'
                    + '<td class="text-center">' + att_apply_status + '</td>'
                    + '</tr>';
            }
        } else {
            content = '<tr><td colspan="7" class="text-center">데이터가 존재하지 않습니다.</td></tr>';
        }
        $('#att-Edit-list').html(content);
    }
    
    
    function toKoreanTime(dateString) {
		if (!dateString) return '';
        
        // 입력된 문자열을 UTC 시간으로 변환
        const date = new Date(dateString);

        // UTC+9 시간으로 변환
        const koreanTime = new Date(date.getTime() + 9 * 60 * 60 * 1000);

        // 시간을 'hh:mm' 형식으로 변환
        const hours = ('0' + koreanTime.getUTCHours()).slice(-2);
        const minutes = ('0' + koreanTime.getUTCMinutes()).slice(-2);
        return hours + ':' + minutes;
    }
    
    
    $(document).on('click', '.att-Edit-list-tbody-tr', function () {
        console.log($(this).attr('id'));
        var attidx = $(this).attr('id');
        
        
       
        getAttEditList(attidx).done(function(data) {
        	console.log(data);
        	
        	// ISO 8601 날짜 문자열을 Date 객체로 변환
            var date = new Date(data.att.att_modify_date);
            // 한국 시간으로 변환
            var kstDate = new Date(date.getTime() + (9 * 60 * 60 * 1000));
            // 날짜만 추출 (yyyy-mm-dd 형식)
            var formattedDate = kstDate.toISOString().split('T')[0];
        	
        	
            $('#ddetail-no').val(data.att.att_applicant);
            $('#ddetail-name').val(data.att.emp_name);
            $('#ddetail-workday').val(data.att.work_day);
            $('#ddetail-att-time').val(toKoreanTime(data.att.att_time));
            $('#ddetail-leave-time').val(toKoreanTime(data.att.leave_time));
            $('#ddetail-before-att').val(data.att.att_previous_attresult);
            $('#ddetail-after-att').val(data.att.att_modify_attresult);
            $('#ddetail-reason').val(data.att.att_reason);
            
            const rejectionReason = data.att.att_modify_reject != null ? data.att.att_modify_reject : '';
            const handler = data.att.att_modifier != 0 ? data.att.att_modifier : '검토 전입니다';
            const processDate = data.att.att_modify_date ? formattedDate : '검토 전입니다';
            
          
            
            console.log("리젝트~"+rejectionReason);
            console.log("핸들러~"+handler);
            
         // Null 체크 및 '검토 전입니다' 설정
            $('#ddetail-rejection-reason').val(rejectionReason);
            $('#ddetail-handler').val(handler);
            $('#ddetail-process-date').val(processDate);
          
            $('#attApplyModal').modal('show');
        }); 
    });
    
    function getAttEditList(attidx) {//사원 상세보기 
        return $.ajax({
            url: '/getAttEditListDetail.ajax',
            type: 'GET',
            data: {
                'att_management_idx': attidx     
            },
            dataType: 'JSON',           
            success: function(data) {
                return data;
            },
            error: function(xhr, status, error) {
                console.error('근태 수정 내역 데이터를 가져오는 중 오류 발생:', status, error);
            }
        });
    }
    
    
</script>

</html>
