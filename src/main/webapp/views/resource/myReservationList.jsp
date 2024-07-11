<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>내예약</title>
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
    
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <style>
     .accordion-button::after {
            flex-shrink: 0;
        }
        .time-slot {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 5px 10px;
            border-bottom: 1px solid #e9ecef;
        }
        .time-slot:last-child {
            border-bottom: none;
        }
        .accordion-body {
            text-align: left; /* 왼쪽 정렬 */
        }
        .container {
            max-width: 100%;
            padding-left: 0;
            padding-right: 0;
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

      
     .table-img{
     	width: 200px;
     	height: 200px;
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
                        <a href="#" class="text-decoration-none">자원 관리</a>
                    </li>
                    <li class="breadcrumb-item">
                        <a href="/resource/myReservationList.go" class="text-decoration-none">내 예약</a>
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
					            <div class="card-body tab-content" id="newTabsContent">
					                <div class="tab-pane show active" id="meetroom-list-content" role="tabpanel"
					                     aria-labelledby="meetroom-list-tab">
					                    <!-- 전체 근태 내역 -->
					                    <h2>내예약</h2>
					                    <div class="text-end mb-1">
					                    </div>
					                    <!-- 검색창 시작 -->
					                    <div class="search-filter-container border border-2 p-3 rounded mb-3">
					                        <div class="row">
					                            <div class="col-12 text-end d-md-flex justify-content-md-end gap-2">
					                                <input type="button" class="btn btn-secondary" onclick="filterReset()"
					                                       value="초기화">
					                            </div>
					                        </div>
					                        <div class="row">
					                            <div class="col-1">
					                                <label for="search-mr-capacity"
					                                       class="form-label">인원</label>
					                            </div>					                          
					                        </div>
					                        <div class="row mb-3">
					                            <div class="col-3">
					                                <div class="input-group" >
					                                    <select id=search-mr-capacity name="search-mr-capacity" onchange="changeCategry(this)">
						                                	<option value="">분류선택</option>
						                                	<option value="회의실">회의실</option>
						                                	<option value="차량">차량</option>
						                                	<option value="비품">비품</option>
						                                												
								                    	</select>
					                                </div>
					                            </div>
					                           
					                            <div class="col-2 d-flex">
					                                <button class="btn btn-secondary" onclick="">검색</button>
					                            </div>
					                        </div>
					                    </div>
					                    <!-- 검색창 종료 -->
					
					                    <!-- 리스트 테이블 시작 -->
					                     <!-- 리스트 테이블 시작 -->
					                    <div class="table-outer">
					                        <div class="table-responsive">
					                            <table class="table align-middle table-hover m-0">
					                                <thead>
					                                    <tr>
					                                    	<th class="text-center" id="resorce_idx" style="width: 20%;">사진</th>
					                                        <th class="text-center" id="resorce_idx" style="width: 20%;">자원명</th>
					                                        <th class="text-center sortable" id="th-emp-name" style="width: 10%;">분류</th>
					                                        <th class="text-center sortable" id="th-title-name" style="width: 10%;">위치</th>
					                                    </tr>
					                                </thead>
					                                <tbody id="list-table">
					                                    <!-- 테이블 내용 정의 -->
					                                </tbody>
					                            </table>
					                        </div>
					                    </div>
					                    <!-- 리스트 테이블 종료 -->
					
					                    <!-- 페이지 네이션 시작 -->
					                    <nav aria-label="Page navigation example" class="mt-3">
					                        <ul class="pagination justify-content-center" id="eq-pagination"></ul>
					                    </nav>
					                    <!-- 페이지 네이션 종료 -->
					            </div>
					        </div>
					    </div>
					</div>
				</div>
				
						
	<div class="modal fade " id="exampleModalXl" tabindex="-1" aria-labelledby="exampleModalXlLabel"aria-modal="true">
                        <div class="modal-dialog modal-xl">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title h4" id="exampleModalXlLabel">
                                예약수정
                              </h5>
                              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                            
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
<!-- Row end -->
                    
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
</div>




<!-- 근태 수정 내역 모달 시작 -->
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
<script src="/assets/js/localStorage.js"></script>
<script src="/assets/js/showAlert.js"></script>
<!-- 페이지네이션 -->
<script src="/assets/js/jquery.twbsPagination.min.js"></script>
<!-- 캘린더  -->
<script src="/assets/vendor/calendar/js/main.min.js"></script>
<script src="/assets/vendor/calendar/custom/mycab-cal.js"></script>
<script>
	var resSerachCategory = '';
	var	resSearchDate ='';
	var resSearchStartTime = '';
	var resSearchEndTime= '';
	var resStatus = '';
	var resOption = '';
	var currentPage = 1; // 현재 페이지 번호
	var today = moment().format('YYYY/MM/DD');
	var showPage =1;
	var loginId = ${sessionScope.loginId};
	
	$(document).ready(function(){
		$('#pagination').twbsPagination('destroy');
		getList(showPage);	
		
	});
	
	function changeCategry(t){
		resSerachCategory = t.value;
		getList(showPage);
	}
	
	function getList(currentPage) {
	     $.ajax({
	         url: '/resource/myReservationList.ajax',
	         type: 'GET',
	         data: {
	             'resSerachCategory': resSerachCategory,
	             'empNo' : ${sessionScope.loginId},
	             'currentPage' : currentPage
	         },
	         dataType: 'JSON',
	         success: function (data) {
	             drawList(data.list);
	             
	             var startPage = 1;
	             $('#pagination').twbsPagination('destroy');
	 	    	console.log(data.currPage);
	            console.log(data.totalPages);
	             $('#eq-pagination').twbsPagination({
	 	    		startPage:data.currPage, // 시작 페이지
	 	    		totalPages:data.totalPages, // 총 페이지 갯수

	 	    		visiblePages:5,  // 보여줄 페이지 수[1][2][3][4][5]
	 	    		onPageClick:function(evt,pg){ // 페이지 클릭시 실행 함수
	 	    			console.log(evt); // 이벤트 객체
	 	    			console.log(pg); //클릭한 페이지 번호 의미
	 	        		showPage = pg;
	 	        		getList(pg);
	 	    			
	 	    		}
	 	       	});
	         },
	         error: function (error) {
	             console.log(error);
	         }
	     });
	 }
	
	function drawList(list) {
	     var content = '';
	     if (list.length > 0) {
	         for (item of list) {
	         	console.log(item.resource_name);
	           
	             content += '<tr class="eq-list-table-tbody-tr" id="' + item.resource_idx + '">'
	          		if (item.new_file_name ==null) {
	          			content += '<td class="text-center"><img src = "/assets/images/free-icon-no-image-11573069.png" class = "table-img"></td>'					
					}else{
						content += '<td class="text-center"><img src = "/photo/'+item.new_file_name+'" class = "table-img"></td>'
					}
	             content += '<td class="text-center">' + item.resource_name+ '</td>'
	             	+ '<td class="text-center">' + item.resource_category+ '</td>'
	             	+ '<td class="text-center">' + item.resource_location+ '</td>'
	                + '</tr>';
	         }
	     } else {
	         content = '<tr><td colspan="7" class="text-center">데이터가 존재하지 않습니다.</td></tr>';
	     }
	     $('#list-table').html(content);
	     
	     
	     $(document).on('click', '.eq-list-table-tbody-tr', function () {
	         var idx = $(this).attr('id');
	         openCalModal(idx);
	         
	     });
	 }
	
	var calendar;
	
	function openCalModal(idx) {
		$("#exampleModalXl").modal('show');
			$('#exampleModalXl').on('shown.bs.modal', function () {
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
							getSelectRsvDate(arg.startStr,idx);
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
								            'resource_idx': idx
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
		};
		
		
		// 날짜로 해당일자 예약정보 가져오기 0000-00-00
	    var selectRsvInfo = [];
	    var selectRsvDateInfo = [];
	     function getSelectRsvDate(date,idx){
	    	selectRsvDateInfo = [];
	    	console.log(date);
	    	 $.ajax({
	 	        type: "POST",
	 	        url: "/resource/getSelectRsvDate.ajax",
	 	        data: {
	 	        	'resource_idx': idx,
	 	        	'resource_reserve_start_date' : date
	 	        }, 	        	
	 	       	dataType: "json",
	 			success: function(response) {
	 				var info =  response.dto;
	 				for (let dayInfo of info) {
	 					console.log("dgadsgadsgdasg",dayInfo);
	 					console.log(dayInfo.resource_reserve_start_date);
	 					var rsvInfo ={
	 							date : dayInfo.resource_reserve_start_date,
	 							empNo : dayInfo.resource_reservation_emp_no
	 					};
	 					console.log("info의 값이다 임마 : " ,rsvInfo );
	 					selectRsvDateInfo.push(rsvInfo);
					}
	 				console.log(selectRsvDateInfo);
	 				updateTimeSlots(date);
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

	    	        if(selectRsvDateInfo.length == 0){
	    	        	let checkboxes = slot.querySelectorAll('input[type="checkbox"]');
	    	        	slot.style.backgroundColor = "lightblue";
	    	        	checkboxes.disabled = false;
	    	        	checkboxes.checked = false;
	    	        }
	    	       
	    	        for (let i = 0; i < selectRsvDateInfo.length; i++) {
					    let getInfo = selectRsvDateInfo[i];
					    var dateString = getInfo.date;
					    var getempNo = getInfo.empNo;
					    console.log(getempNo);
					    
					    let date = new Date(dateString);
					    console.log("시간" + date);
					    
					    let hours = date.getHours().toString().padStart(2, '0');
					    let minutes = date.getMinutes().toString().padStart(2, '0');
					    let formattedTime = `\${hours}:\${minutes}`;
					    
					    console.log(formattedTime);
					    console.log(timeString);
					    let checkbox = slot.querySelector('input[type="checkbox"]');
					    if (formattedTime === timeString) {
					    	if(getempNo === loginId){
				    	        slot.style.backgroundColor = "violet"	
				    	        //checkbox = slot.querySelector('input[type="checkbox"]');
				    	        checkbox.disabled = false;
				    	        checkbox.checked = true;
				    	        console.log("내가예약한거");
				    	        break;
					    	}else{
				    	        slot.style.backgroundColor = "lightcoral"	
				    	        //checkbox = slot.querySelector('input[type="checkbox"]');
				    	        checkbox.disabled = true;
				    	        checkbox.checked = true;
				    	        console.log("남이 예약한거");
				    	        break;
					    	}
					    						       
					    }else{
			    	        slot.style.backgroundColor = "lightblue";
			    	        //checkbox = slot.querySelector('input[type="checkbox"]');
			    	        checkbox.disabled = false;
			    	        checkbox.checked = false;
			    	        console.log("예약안된거");
			    	        
					    }
				    
				}

	    	        
	   		}
	    }
</script>

</html>
