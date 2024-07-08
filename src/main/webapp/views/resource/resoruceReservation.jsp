<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">

  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap Gallery - My Cab Bootstrap 5 Dashboard</title>

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

    <!-- 따로 적용한 CSS -->

    <link rel="stylesheet" href="/assets/css/default.css">

    <!-- 데이트 피커 -->
    <link rel="stylesheet" href="/assets/vendor/daterange/daterange.css">
    
    <style >
	.util-box-category{
		font-size: 20px;
		
	}
    #timeSlotsContainer input{
    	width: 20px;
    	height: 20px;
    	float: right;
    }	
    .create-rsv-btn{
    	position: absolute;
    	right: 10px;
    	top : 10px;
    }
    #timeCheckboxes {
        display: flex;
        flex-wrap: wrap;
        gap: 10px;
        padding: 20px;
    }

    .util-box-category {
        flex: 1 0 48%; /* 2 items per row with some gap */
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        transition: transform 0.2s;
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 10px 20px;
        background-color: lightblue;
    }

    .util-box-category:hover {
        transform: scale(1.05);
    }

    .form-check-label {
        font-size: 16px;
        font-weight: bold;
        color: #333;
    }

    .form-check-input {
        margin-left: 10px;
        transform: scale(1.2);
    }

    @media (max-width: 768px) {
        .util-box-category {
            flex: 1 0 100%; /* 1 item per row for smaller screens */
        }
    }
    </style>
   
  </head>

  <body>
    <!-- Page wrapper start -->
    
    <div>
    	<input type="text" id="test11">
    </div>
	<div class="page-wrapper">

		<!-- Main container start -->
		<div class="main-container">

			<!-- Sidebar wrapper start -->
			<jsp:include page="/views/sidebar.jsp" />
			<!-- Sidebar wrapper end -->

			<!-- App container starts -->
			<div class="app-container">

				<!-- App header starts -->

				<div class="app-header d-flex align-items-center">

					<!-- Toggle buttons start -->
					<div class="d-flex">
						<button class="btn btn-outline-primary me-2 toggle-sidebar"
							id="toggle-sidebar">
							<i class="bi bi-list fs-5"></i>
						</button>
						<button class="btn btn-outline-primary me-2 pin-sidebar"
							id="pin-sidebar">
							<i class="bi bi-list fs-5"></i>
						</button>
					</div>
					<!-- Toggle buttons end -->

					<!-- App brand sm start -->
					<div class="app-brand-sm d-lg-none d-sm-block">
						<a href="/"> <img src="/assets/images/logo-sm.svg"
							class="logo" alt="Bootstrap Gallery">
						</a>
					</div>
					<!-- App brand sm end -->

					<!-- Breadcrumb start -->
					<ol class="breadcrumb d-none d-lg-flex ms-3">
						<li class="breadcrumb-item"><a href="/"><i
								class="bi bi-house lh-1"></i></a> <a href="/"
							class="text-decoration-none">메인</a></li>
						<li class="breadcrumb-item"><a href="#"
							class="text-decoration-none">인사 관리</a></li>
						<li class="breadcrumb-item"><a href="/emp/hremp/list.go"
							class="text-decoration-none">사원 조회</a></li>
					</ol>
					<!-- Breadcrumb end -->

					<!-- App header actions start -->
					<jsp:include page="/views/appHeader.jsp" />
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
										<h4 class="card-title">예약</h4>
									</div>
									<div class="card-body">
										<div class="row">
											<div class="container mt-5">
									        <div class="row">
									            <div class="col-12">
									                <h1 class="mb-4">${dto.resource_name}</h1>
									                <div class="card mb-3">
									                    <div class="card-header" style = "position:relative";>
											                <ul class="nav nav-tabs card-header-tabs" id="taxiTabs" role="tablist">
											                    <li class="nav-item" role="presentation">
											                        <button class="nav-link active" id="rsv-detail-tab" data-bs-toggle="tab"
											                                data-bs-target="#rsv-detil" type="button" role="tab"
											                                aria-controls="rsv-detil" aria-selected="true">상세정보
											                        </button>
											                    </li>
											                    <li class="nav-item" role="presentation">
											                        <button class="nav-link" id="rsv-calendar-tab" data-bs-toggle="tab"
											                                data-bs-target="#rsv-calendar" type="button" role="tab"
											                                aria-controls="rsv-calendar" aria-selected="false">예약 정보
											                        </button>
											                    </li>
											                       <button type="button" class="btn btn-primary create-rsv-btn" data-bs-toggle="modal" data-bs-target="#exampleModalCenter">
											                        	일정추가
											                    	</button>
											                </ul>
											            </div>
									                    <div class="card-body tab-content" id="newTabsContent">
											                <div class="tab-pane show active" id="rsv-detil" role="tabpanel"
											                     aria-labelledby="rsv-detail-tab">
											                    <!-- 전체 근태 내역 -->
											                    <h2>상세정보</h2>
											                    <div class="text-end mb-1">
											                    </div>
											                    <div class="col" id = "resourceInfo">
					                                               
					                                            </div>
		
											                    <!-- 페이지 네이션 종료 -->
											                </div>
											                
											                
											                <div class="tab-pane fade active" id="rsv-calendar" role="tabpanel"
											                     aria-labelledby="rsv-calendar-tab">
											                    <!-- 전체 근태 내역 -->
											                    <h2>예약 정보</h2>
											                    <div class="text-end mb-1">
											                    </div>
											              		<div class="row">
											              			<div class="col-8">
											              				<div id="selectableCalendar" class=""></div>
											              			</div>
											              			<div class="col-3">
											              				<div class="row">
											              					<div class="col">
												              					<h2 id="rsvBoxTitle">예약일정</h2>
												              				</div>
												              				<div class="col-auto ml-auto">
												              					<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModalCenter">
														                        	일정추가
														                    	</button>
											              					</div>
											              				</div>												                    		
														                          <hr>
												                    		<div id="reervation-cal-info" >
																				<div id="timeSlotsContainer" class="shareCalBox">
																				    <c:forEach begin="9" end="18" var="hour" varStatus="status">
																				        <c:set var="timeString" value="${hour < 10 ? '0' += hour : hour}:00" />
																				           		<div class="util-box-category alert alert-secondary rounded-3  util-box${status.index}" 
																				             style="background-color: lightblue" data-share-idx="${item.calendar_idx}" data-time="${timeString}">
																						            <label class="form-check-label" for="thirdCheckbox">${timeString}</label>
																						            <input class="form-check-input me-1 chk-no-${status.index}" type="checkbox" 
																						            value="" id="thirdCheckbox" onchange="changeChkBox(this)" data-chkbox="${status.index}">
																				           		</div>
																				    </c:forEach>
																				</div>
												                    		</div>
												                    	</div>
												                    	
											              			</div>									              			
											              		</div>
											                </div>
											            </div>
									                </div>
									            </div>
									        </div>
									        <div class="row mt-5">
									            <div class="col-12">
									                <div class="card">
									                    <div class="card-header">
									                        <h4 class="card-title">예약된 자원 목록</h4>
									                    </div>
									                    <div class="card-body">
									                        <table class="table table-bordered">
									                            <thead>
									                                <tr>
									                                    <th>자원 타입</th>
									                                    <th>자원 이름</th>
									                                    <th>예약 날짜</th>
									                                    <th>시작 시간</th>
									                                    <th>종료 시간</th>
									                                    <th>수정</th>
									                                    <th>삭제</th>
									                                </tr>
									                            </thead>
									                            <tbody>
									                                <tr>
									                                    <td>회의실</td>
									                                    <td>회의실 A</td>
									                                    <td>2024-07-06</td>
									                                    <td>10:00</td>
									                                    <td>12:00</td>
									                                    <td><button class="btn btn-warning btn-sm">수정</button></td>
									                                    <td><button class="btn btn-danger btn-sm">삭제</button></td>
									                                </tr>
									                                <!-- 예약된 자원 데이터가 여기에 추가됩니다 -->
									                            </tbody>
									                        </table>
									                    </div>
									                </div>
									            </div>
									        </div>
									    </div>
										</div>
										<!-- 기본 정보 -->
										
										<!-- 버튼 -->
										
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
					<span>Â© Bootstrap Gallery 2024</span>
				</div>
				<!-- App footer end -->

			</div>
			<!-- App container ends -->

		</div>
		<!-- Main container end -->

	</div>
	
	
	<!-- 예약하기 모달창 -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1" aria-labelledby="exampleModalCenterTitle" style="display: none;" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title" id="exampleModalCenterTitle">자원 예약하기</h5>
	                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	            </div>
	            <div class="modal-body">
	                <div class="input-group mb-3">
	                    <label class="input-group-text" for="resource_name">자원명</label>
	                    <input type="text" class="form-control" id="resource_name" name="resource_name" value="${dto.resource_name}" readOnly>
	                </div>
	                <div class="input-group mb-3">
	                    <label class="input-group-text" for="resource_category">자원분류</label>
	                    <input type="text" class="form-control" id="resource_category" name="resource_category" value="${dto.resource_category}" readOnly>
	                </div>
	                <div class="input-group mb-3">
	                    <label class="input-group-text" for="reservation-date">예약 날짜</label>
	                    <input type="text" class="form-control createDatepickerStart" id="reservation_date" name="reservation_date">
	                </div>
	
	                <!-- 시간 선택 탭 -->
	                <ul class="nav nav-tabs mb-3" id="myTab" role="tablist">
	                    <li class="nav-item" role="presentation">
	                        <button class="nav-link active" id="start-time-tab" data-bs-toggle="tab" data-bs-target="#start-time" type="button" role="tab" aria-controls="start-time" aria-selected="true">시간 선택</button>
	                    </li>
	                </ul>
	                <div class="tab-content" id="myTabContent">
	                    <div class="tab-pane fade show active" id="start-time" role="tabpanel" aria-labelledby="start-time-tab">
	                        <div class="input-group mt-3">
	                            <label class="form-label">예약 시간을 선택 해주세요</label><br>
	                            <div id="timeCheckboxes">
	                                <c:forEach begin="9" end="18" var="hour" varStatus="status">
	                                    <c:set var="timeString" value="${hour < 10 ? '0' += hour : hour}:00" />
	                                    <div class="util-box-category alert alert-secondary rounded-3 util-box${status.index}"
	                                         data-share-idx="${item.calendar_idx}" data-time="${timeString}">
	                                        <label class="form-check-label" for="chk-${status.index}">${timeString}</label>
	                                        <input class="form-check-input me-1 chk-no-${status.index}" type="checkbox"
	                                               value="${timeString}" id="chk-${status.index}" onchange="changeChkBox(this)" data-chkbox="${status.index}">
	                                    </div>
	                                </c:forEach>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	
	                <div class="input-group mb-3 mt-3">
	                    <label class="input-group-text" for="resource_reserve_content">예약 사유</label>
	                    <textarea class="form-control" id="resource_reserve_content" name="resource_reserve_content" cols="100" wrap="hard" required></textarea>
	                </div>
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소하기</button>
	                <button type="button" class="btn btn-primary" onclick="saveReservation()" data-bs-dismiss="modal">예약하기</button>
	            </div>
	        </div>
	    </div>
	</div>
	<!-- 예약하기 모달창 끝 -->

</body>

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

    <!-- Calendar JS -->
    <script src="/assets/vendor/calendar/js/main.min.js"></script>
    <script src="/assets/vendor/calendar/custom/mycab-cal.js"></script>

    
    
    <!-- 모멘트 -->
    <script src="/assets/js/moment.min.js"></script>
    
    <!-- 데이터 피커 -->
   <script src="/assets/vendor/daterange/daterange.js"></script>
   <script src="/assets/vendor/daterange/custom-daterange-mycab.js"></script>
    
    <!-- Custom JS files -->
    <script src="/assets/js/custom.js"></script>


    
  <script>

  $(document).ready(function() {
	var resourceInfo = $("#resourceInfo");
	resourceInfo.empty();	
	var category = '${dto.resource_category}'
	        if (category == '회의실') {
	        	resourceInfo.append(`
	            	<dl class="row">
                        <dt class="col-2 info-label">회의실명:</dt>
                        <dd class="col-2 info-value mb-3">${dto.resource_name}</dd>
                    </dl>
                    <dl class="row">
                        <dt class="col-2 info-label">위치</dt>
                        <dd class="col-2 info-value mb-3" >${dto.resource_location}</dd>
                    </dl>
                    <dl class="row">
                        <dt class="col-2 info-label">수용인원</dt>
                        <dd class="col-2 info-value mb-3" >${dto.meeting_room_capacity}</dd>
                    </dl>
	                <dl class="row">
	                    <dt class="col-2 info-label">배치도</dt>
	                    <dd class="col-2 info-value mb-3" >
	                    </dd>
	                </dl>                    
                    <dl class="row">
                        <dt class="col-1 info-label">상세내용</dt>
                        <pre><dd class="row">${dto.resource_content}</dd></pre>
                    </dl>

	            `);
	        } else if (category == '차량') {
	        	resourceInfo.append(`
	                <div class="row">
	                    <div class="col-md-3 form-group">
	                        <label for="roomNumber">회의실 이름</label>
	                        <input type="text" class="form-control" id="meetRoomName" name="meetRoomName" required>
	                    </div>
	                    <div class="col-md-3 form-group">
	                        <label for="floor">층</label>
	                        <input type="number" class="form-control" id="meetRoomLocation" name="meetRoomLocation" required>
	                    </div>
	                    <div class="col-md-3 form-group">
	                        <label for="capacity">수용 인원</label>
	                        <input type="number" class="form-control" id="meetRoomCapacity" name="meeting_room_capacity" required>
	                    </div>
	                </div>	                
	            `);
	        } else if (category == '비품') {
	        	resourceInfo.append(`
	                <div class="row">
	                    <div class="col-md-3 form-group">
	                        <label for="equipmentType">비품 종류</label>
	                        <input type="text" class="form-control" id="equipmentCategory" name="resource_equipment_category" required>
	                    </div>
	                    <div class="col-md-3 form-group">
	                        <label for="quantity">수량</label>
	                        <input type="number" class="form-control" id="quantity" name="quantity" required>
	                    </div>
	                </div>
	            `);
	        }
	
	
	
	// 캘린더 불러오기

	});
  // 캘린더 불러오기 
	var calendar
  
  
  $('#rsv-calendar-tab').on('click', function(e) {
	 var calendarEl = document.getElementById("selectableCalendar");
		
		calendar = new FullCalendar.Calendar(calendarEl, {
			headerToolbar: {
				left: "prev,next today",
				center: "title",
				right: false
			},

			locale: 'ko',
			initialDate: new Date(),
			selectable: true,
			selectMirror: true,
			select: function (arg) {
				getSelectRsvDate(arg.startStr);
			},
			dateClick: false,
			eventClick : false,
			
			editable: false,
			dayMaxEvents: true,
		  	views: {
			    timeGrid: {
			      dayMaxEventRows: 6 // adjust to 6 only for timeGridWeek/timeGridDay
			    }
			  },
			
			events: function(fetchInfo, successCallback, failureCallback){
				console.log(fetchInfo);
				console.log(successCallback);
				console.log(failureCallback);
				$.when(
					    $.ajax({
					        type: "GET",
					        url: "/resource/rsvList.ajax",
					        data: {
					            'resource_idx': ${dto.resource_idx}
					        },
					        dataType: "json"
					    }),
					    
					).done(function(response) {
						console.log("요청 끝났지롱");
					    var events = [];
					    
					    // 첫 번째 AJAX 호출의 응답 처리
					    var listResponse = response.revList; // response1[0]에 실제 응답 데이터가 들어 있습니다.
					    for (var i = 0; i < listResponse.length; i++) {
					        var res = listResponse[i];
					        var event = {
					            id: res.resource_reservation_idx,
					            title: "예약",
					            content: res.resource_reserve_content,
					            start: res.resource_reserve_start_date,
					            end: res.resource_reserve_end_date,
					            color: "lightcoral",
					            category: res.resource_category
					        };
					        events.push(event);
					    }

					    console.log('Events:', events);
					    successCallback(events);

					}).fail(function() {
					    alert("캘린더 불러오기에 실패했습니다.");
					});
			}
		});
	
		calendar.render();
	});
  


	$(".createDatepickerStart").daterangepicker({
		singleDatePicker: true,
		showOtherMonths: true,
		startDate: moment().startOf("hour"),
		endDate: moment().startOf("hour").add(32, "hour"),
		select: function(){
			console.log("드디어 돼싸 ㄷㅋㅋㅋ")	
		},
		locale: {
			format: "YYYY-MM-DD",
			daysOfWeek: ['일', '월', '화', '수', '목', '금', '토'],
	        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
		},
		
	});
	
	$(".createDatepickerStart").on('apply.daterangepicker', function(ev, picker) {
	    console.log("데이트피커 선택됨 :" ,ev);
	    console.log("데이트피커 선택됨 :" ,picker);
	    var startDate = picker.startDate.format('YYYY-MM-DD');
	    getSelectRsvDate(startDate);
	    console.log("시작 날짜:", startDate);
	});
  	
	
    function saveReservation() {
        const resourceName = document.getElementById('resource_name').value;
        const resourceCategory = document.getElementById('resource_category').value;
        const reservationDate = document.getElementById('reservation_date').value;
        const reservationContent = document.getElementById('resource_reserve_content').value;

        // 선택된 시간들 가져오기
        const selectedTimes = [];
        document.querySelectorAll('#start-time input[type="checkbox"]:checked').forEach((checkbox) => {
        	
        	if (!checkbox.disabled) {
                selectedTimes.push(checkbox.value);
            }
        });

        // 선택된 시간이 하나도 없을 경우 경고창 표시
        if (selectedTimes.length === 0) {
            alert("적어도 하나의 시간을 선택하세요.");
            return;
        }

        console.log(`자원명: \${resourceName}, 자원분류: \${resourceCategory}, 예약 날짜: \${reservationDate}, 선택된 시간: \${selectedTimes}, 예약 사유: \${reservationContent}`);
        // 시간 형식 조절 
        var resource_reserve_start_date = adjustStartDateTime(reservationDate,selectedTimes)
        var resource_reserve_end_date = adjustEndDateTime(reservationDate,selectedTimes)
        
        console.log(resource_reserve_start_date)
        console.log(resource_reserve_end_date)
        
        //복잡한 json 에 담기
        var rsvInfo ={};
        var dateInfo = 
        rsvInfo.resIdx = ${dto.resource_idx};
        rsvInfo.resEmpId = ${sessionScope.loginId};
        rsvInfo.resName = resourceName;
        rsvInfo.resCategory = resourceCategory;
        rsvInfo.rsvStartDate = resource_reserve_start_date;
        rsvInfo.rsvEndDate = resource_reserve_end_date;
        rsvInfo.rsvContent = reservationContent;
        
        var jsonData = JSON.stringify(rsvInfo);
        
        // 일정추가
         $.ajax({
	        type: "POST",
	        url: "/resource/createReservation.ajax",
	        data: jsonData,
        	contentType:'application/json; charset=utf-8',
			success: function(response) {
				var date = getCurrentDateTime()
				getSelectRsvDate(date)
				calendar.refetchEvents();
	        },
	        error: function(xhr, status, error) {
	            // 에러 처리
	            $("#result").html("<p>There was an error: " + error + "</p>");
	        }
	    }); 
    }
    
    function adjustStartDateTime(reservationDate,selectedTimes){
	  	var ajTime = [];
  	  	for (let time of selectedTimes) {
	  		var dateTime = reservationDate+' '+time;
	  		console.log(dateTime)
	  		ajTime.push(dateTime);
		}

  	  
  		return ajTime;
    }
    
    function adjustEndDateTime(reservationDate,selectedTimes){
	  	var ajTime = [];
  	  	for (let time of selectedTimes) {
	  		spTimes = time.split(":");
	  		var setTime = spTimes[0]+":"+"59";

	  		var dateTime = reservationDate+' '+setTime;
	  		ajTime.push(dateTime);
			console.log(setTime);
	  		console.log(dateTime)
		}

  	  
  		return ajTime;
    }
    
    //현재날 예약정보 가져오기
    document.addEventListener('DOMContentLoaded', function() {
    	var date = getCurrentDateTime();
    	 getSelectRsvDate(date);
    	
    });
    
    
    //현재날 가져오기
	function getCurrentDateTime(){
		var now = new Date();
		var year = now.getFullYear();
        var month = String(now.getMonth() + 1).padStart(2, '0');
        var day = String(now.getDate()).padStart(2, '0');     
        var curTime = year+'-'+month+'-'+day;
        console.log(curTime);
		   
		return curTime;
	};
    
    // 날짜로 해당일자 예약정보 가져오기 0000-00-00
    var selectRsvDateInfo = [];
    
     function getSelectRsvDate(date){
    	selectRsvDateInfo = [];
    	console.log(date);
    	 $.ajax({
 	        type: "POST",
 	        url: "/resource/getSelectRsvDate.ajax",
 	        data: {
 	        	'resource_idx': "${dto.resource_idx}",
 	        	'resource_reserve_start_date' : date
 	        }, 	        	
 	       	dataType: "json",
 			success: function(response) {
 				var info =  response.dto;
 				for (let dayInfo of info) {
 					console.log(dayInfo.resource_reserve_start_date);
 					selectRsvDateInfo.push(dayInfo.resource_reserve_start_date);
				}
 				console.log(selectRsvDateInfo);
 				updateTimeSlots(date)
 				updateModal(date)
 	        },
 	        
 	        error: function(xhr, status, error) {
 	            // 에러 처리
 	            $("#result").html("<p>There was an error: " + error + "</p>");
 	        }
 	    }); 
    }
     
     function updateTimeSlots(date) {
    	    var container = document.getElementById("timeSlotsContainer");
    	    var slots = container.getElementsByClassName("util-box-category");
    	    document.getElementById("rsvBoxTitle").innerHTML = date;
			
    	    for (let slot of slots) {
    	        let timeString = slot.dataset.time;
    	        console.log("Comparing timeString:", timeString);
    	        console.log("Current reservations:", selectRsvDateInfo);

    	        // 배열의 각 항목에서 시간 부분만 추출하여 비교
    	        let isReserved = selectRsvDateInfo.some(dateString => {
    	            let date = new Date(dateString);
    	            console.log("시간"+date);
    	            let hours = date.getHours().toString().padStart(2, '0');
    	            let minutes = date.getMinutes().toString().padStart(2, '0');
    	            let formattedTime = `\${hours}:\${minutes}`;
    	            console.log(formattedTime);
    	            console.log(timeString);
    	            return formattedTime == timeString;
    	        });

    	        console.log("Is reserved:", isReserved);
    	        slot.style.backgroundColor = isReserved ? "lightcoral" : "lightblue";

    	        let checkbox = slot.querySelector('input[type="checkbox"]');
    	        checkbox.disabled = isReserved;
    	        checkbox.checked = isReserved;
    	    }
    	}
     
     function updateModal(date) {
    	 $('.createDatepickerStart').data('daterangepicker').setStartDate(date);
 	    var container = document.getElementById("timeCheckboxes");
 	    var slots = container.getElementsByClassName("util-box-category");

 	    for (let slot of slots) {
 	        let timeString = slot.dataset.time;
 	        console.log("Comparing timeString:", timeString);
 	        console.log("Current reservations:", selectRsvDateInfo);

 	        // 배열의 각 항목에서 시간 부분만 추출하여 비교
 	        let isReserved = selectRsvDateInfo.some(dateString => {
 	            let date = new Date(dateString);
 	            console.log("시간"+date);
 	            let hours = date.getHours().toString().padStart(2, '0');
 	            let minutes = date.getMinutes().toString().padStart(2, '0');
 	            let formattedTime = `\${hours}:\${minutes}`;
 	            console.log(formattedTime);
 	            console.log(timeString);
 	            return formattedTime == timeString;
 	        });

 	        console.log("Is reserved:", isReserved);
 	        slot.style.backgroundColor = isReserved ? "lightcoral" : "lightblue";

 	        let checkbox = slot.querySelector('input[type="checkbox"]');
 	        checkbox.disabled = isReserved;
 	        checkbox.checked = isReserved;
 	    }
 	}
     
     function changeChkBox(t){
    	 var chkboxValue = t.getAttribute('data-chkbox');

         // 동일한 data-chkbox 값을 가진 모든 체크박스를 선택하고, 현재 체크박스의 상태로 설정합니다.
         var checkboxes = document.querySelectorAll('input[type="checkbox"][data-chkbox="' + chkboxValue + '"]');
         console.log(checkboxes);
         checkboxes.forEach(function(cb) {
             cb.checked = t.checked;
         });
     }
</script>



</html>