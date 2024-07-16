<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">

  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>일정관리</title>

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
    	#selectableCalendar{
    		width: 1000px;
    		height: 800px;
    	}
		    	/* 테이블 스타일 */
		.schedule-table {
		  width: 100%;
		  border-collapse: collapse;
		  margin: 20px 0;
		  font-size: 18px;
		  text-align: left;
		}
		
		/* 테이블 행 스타일 */
		.schedule-event {
		  border-bottom: 1px solid #ddd;
		  transition: background-color 0.3s ease;
		}
		
		/* 행 호버 효과 */
		.schedule-event:hover {
		  background-color: #f1f1f1;
		}
		
		/* 첫 번째 열 (시간) 스타일 */
		.schedule-event td:first-child {
		  padding: 10px;
		  font-weight: bold;
		  color: #333;
		  width: 150px;
		}
		
		
		/* 세 번째 열 (이벤트 이름) 스타일 */
		.schedule-event td:last-child a {
		  text-decoration: none;
		  color: #007bff; /* 링크 색상 */
		}
		
		.schedule-event td:last-child a:hover {
		  text-decoration: underline;
		}
    	#editButton, #delButton{
    		display: none;
    	}
    	#calendar-util-box{
    		border: 1px solid lightGray;
    		background-color : white;
    		float: left;
		    width: 223px;
		    height: 500px;
		    position: relative;
		    top: 57px;
		    margin-right: 15px;
    	}
    	.fc-insertScheduleButton-button{
	    	float: left;
		    left: -1026px;
		    position: relative;
		    width: 200px;
    	}
    	.fc .fc-toolbar-title{
    		font-size: 20px;
    	}
    	.util-box-category{
    		border: 1px solid lightGray;
    		background-color : lightGray;
    		width: 165px;
    		height: 25px;
    		margin-bottom: 15px;
    		margin-left: 14px;
    		cursor: pointer;
    		overflow: hidden;   
    		text-overflow: ellipsis;
    		
    	}
    	.util-box1{
    		background-color: #ffec63;
    	}
    	.util-box2{
    		background-color: #28b9ff;
    	}
    	.util-box3{
    		background-color: #71f371;
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
		/* util box 체크박스 위치 설정 */
		.form-check-input[type=checkbox]{
			float: right;
		}
		.app-body{
			width: 1500px;
		}
		#detail-profile{
			border: 1px solid black;
			width: 100px;
			height: 100px;
		}
		.form-check-input{
		    text-align: center;
		    margin: 0px;
		    top: -6px;
		    position: relative;	
		}
		.form-check-label{
			text-align: center;
		    margin: 0px;
		    top: -9px;
		    position: relative;	
		    max-width: 84%;
		    text-overflow: ellipsis;
		}
		 .slide-toggle {
            overflow: hidden;
            transition: max-height 0.3s ease-out;
            max-height: 0;
        }
        .slide-toggle.show {
            max-height: 1000px; /* Adjust based on content height */
        }
        .shareCalBox{
        	    overflow: scroll;
			    /* overflow-x: hidden; */
			    height: 237px;
			    width: 192px;
			    position: relative;
        }
    </style>
  </head>

  <body>
    <!-- Page wrapper start -->
    
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
					<div id="alertPlaceholder" class="alert-placeholder"></div>
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
						<li class="breadcrumb-item"><a href="/calemdar/calendar.go"
							class="text-decoration-none">일정 관리</a></li>

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
                  <div class="card">
                    <div class="card-header">
                      <h4 class="card-title">일정관리</h4>
                    </div>
                    <div class="card-body" style="width: 1500px">
                    	<div id="calendar-util-box" class = "alert alert-secondary rounded-3">
                    		<div class="util-box-category alert alert-secondary rounded-3 util-box1" onclick="utilBoxClk(this)">
		                          <label class="form-check-label" for="firstCheckbox">개인</label>
		                          <input class="form-check-input me-1" type="checkbox" value="" id="firstCheckbox" checked disabled="disabled">
                    		</div>
                    		<div class="util-box-category alert alert-secondary rounded-3 util-box2" onclick="utilBoxClk(this)">
		                          <label class="form-check-label" for="secondCheckbox">부서</label>
		                          <input class="form-check-input me-1" type="checkbox" value="" id="secondCheckbox" checked disabled="disabled">
                    		</div>
                    		<div class="util-box-category alert alert-secondary rounded-3 util-box3" onclick="utilBoxClk(this)" >
		                          <label class="form-check-label" for="thirdCheckbox">전사</label>
		                          <input class="form-check-input me-1" type="checkbox" value="" id="thirdCheckbox" checked disabled="disabled">
                    		</div>
		                          <hr>
                    		<div id="share-calendar" >
                    			<div class="util-box-category alert alert-secondary rounded-3 util-box3" id="thirdCheckbox"  onclick="createShareModalOpen()" style="background-color: white">
		                        	<label class="form-check-label" for="thirdCheckbox">공유 캘린더 추가</label>
                    			</div>
		                          <div class="shareCalBox">
			                          <c:forEach items="${shareCalList}" varStatus="status" var="item">
			                          	<div class="util-box-category alert alert-secondary rounded-3 util-box${status.index+4}" onclick="shareUtilBoxClk(this)" 
			                          		 style="background-color: ${item.calendar_color}" data-share-idx = "${item.calendar_idx}">
					                          <label class="form-check-label" for="thirdCheckbox">${item.calendar_name}</label>
					                          <input class="form-check-input me-1" type="checkbox" value="" id="thirdCheckbox" checked disabled="disabled">
			                    		</div>
			                          </c:forEach>
		                          </div>
                    		</div>
                    	</div>
                      <div id="selectableCalendar"></div>
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
                

	<!-- 일정추가 모달 -->
	<div class="modal fade" id="scheduleAddModal" tabindex="-1" aria-labelledby="exampleModalLgLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title h4" id="exampleModalLgLabel">일정 등록</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="input-group mb-3">
                    <label class="input-group-text" for="create-title">제목</label>
                    <input type="text" class="form-control" id="create-title" placeholder="일정 제목을 입력하세요" name="create-title">
                </div>
                <div class="input-group mb-3">
                    <label class="input-group-text" for="create-start-date">시작 일정</label>
                    <input type="text" class="createDatepickerStart form-control" id="create-start-date" name="create-start-date">
                    <select id="create-start-hour" name="create-start-hour">
                        <c:forEach var="a" begin="0" end="23" varStatus="i">
                            <option value="${a}">${a}시</option>
                        </c:forEach>
                    </select>
                    <select id="create-start-min" name="create-start-min">
                        <c:forEach var="a" begin="0" end="59" varStatus="i">
                            <option value="${a}">${a}분</option>
                        </c:forEach>
                    </select>
                    <span class="input-group-text">~</span>
                    <input type="text" class="createDatepickerEnd form-control" id="create-end-date" name="create-end-date">
                    <select id="create-end-hour" name="create-end-hour">
                        <c:forEach var="a" begin="0" end="23" varStatus="i">
                            <option value="${a}">${a}시</option>
                        </c:forEach>
                    </select>
                    <select id="create-end-min" name="create-end-min">
                        <c:forEach var="a" begin="0" end="59" varStatus="i">
                            <option value="${a}">${a}분</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="input-group mb-3">
                    <label class="input-group-text" for="create-category">일정 범위</label>
                    <select class="form-select" id="create-category" onchange="changeCategoryColor(this)">
                        <option value="개인" style="color: #ffec63;">개인</option>
                    	<c:choose>
                    		<c:when test="${myInfo.title_no <=3 }">
	                        	<option value="부서" style="color: #28b9ff;">부서</option>                   		
                    		</c:when>
                    		<c:when test="${myInfo.title_no <=1 }">
	                        	<option value="전사" style="color: #71f371;">전사</option>                    		
                    		</c:when>
                    	</c:choose>
                        <option  disabled="disabled"> 공유 캘린더</option>
                        <c:if test="${shareCalList.size()>0}">
                        	<c:forEach items="${shareCalList}" varStatus="status" var="item">
                        	 	<option value="${item.calendar_name}" style="color: ${item.calendar_color};" data-idx ="${item.calendar_idx}">공유일정${item.calendar_name}</option>
                        	 	
                        	</c:forEach>
                        </c:if>
                    </select>
                    
                </div>
                <div class="input-group mb-3">
                    <label class="input-group-text" for="create-content">내용</label>
                    <textarea class="form-control" id="create-content" placeholder="내용을 입력하세요" rows="3" style="height: 245px;"></textarea>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" onclick="addSchedule()" data-bs-dismiss="modal">작성</button>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>

	<!-- 일정추가 모달 끝 -->
	<!-- 일정 상세보기 시작-->
	<div class="modal fade" id="scheduleDetailModal" tabindex="-1" aria-labelledby="exampleModalLgLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title h4" id="exampleModalLgLabel">일정 상세보기</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                	
	                <div class="modal-body">
		                <div >                   
		                    <div class="input-group mb-3">
		                        <label class="input-group-text" for="detail-title">제목</label>
		                        <input type="text" class="form-control" id="detail-title" name="detail-title" disabled="disabled">
		                        <label class="input-group-text" for="detail-writer">작성자</label>
		                        <input type="text" class="form-control" id="detail-writer" name="detail-writer"  style="width: 30px;" disabled="disabled">
		                    </div>                                    
		                    <div class="input-group mb-3">
		                        <label class="input-group-text" for="detail-start-date">일정</label>
		                        <input type="text" class="form-control detailDatepickerStart" id="detail-start-date" name="detail-start-date" disabled="disabled">
		                        <select id="detail-start-hour" name="detail-start-hour" disabled="disabled">
		                        	    <c:forEach var="a" begin="0" end="23" varStatus="i">
		                        	    	<option value="${a}">${a}시</option>
		                        	    </c:forEach>                    	
		                        </select>
		                        <select id="detail-start-min" name="detail-start-min" disabled="disabled">
		                        	    <c:forEach var="a" begin="0" end="59" varStatus="i">
		                        	    	<option value="${a}">${a}분</option>
		                        	    </c:forEach>                    	
		                        </select>
		                        <span class="input-group-text">~</span>
		                        <input type="text" class="form-control detailDatepickerEnd" id="detail-end-date" name="detail-end-date" disabled="disabled">
		                        <select id="detail-end-hour" name="detail-end-hour" disabled="disabled">
		                        	    <c:forEach var="a" begin="0" end="23" varStatus="i">
		                        	    	<option value="${a}">${a}시</option>
		                        	    </c:forEach>                    	
		                        </select>
		                        <select id="detail-end-min" name="detail-end-min" disabled="disabled">
		                        	    <c:forEach var="a" begin="0" end="59" varStatus="i">
		                        	    	<option value="${a}">${a}분</option>
		                        	    </c:forEach>                    	
		                        </select>
		                    </div>
	                    </div>
	                    <div class="input-group mb-3">
	                        <label class="input-group-text" for="detail-category">일정범위</label>
	                        <select class="form-select" id="detail-category" disabled onchange="changeCategoryColor(this)">
	                            <option value="개인" style="color: #ffec63">개인</option>
			                         <c:choose>
			                    		<c:when test="${myInfo.title_no <=3 }">
				                        	<option value="부서" style="color: #28b9ff;">부서</option>                   		
			                    		</c:when>
			                    		<c:otherwise>
			                    			<option value="부서" style="color: #28b9ff;" disabled="disabled">부서</option>   
			                    		</c:otherwise>
			                    	</c:choose>
			                    	<c:choose>			                    		
			                    		<c:when test="${myInfo.title_no <=1 }">
				                        	<option value="전사" style="color: #71f371;">전사</option>                    		
			                    		</c:when>
			                    		<c:otherwise>
			                    			<option value="전사" style="color: #71f371;" disabled="disabled">전사</option>   
			                    		</c:otherwise>
			                    	</c:choose>
	                            <c:forEach items="${shareCalList}" varStatus="status" var="item">
                        	 		<option value="${item.calendar_name}" style="color: ${item.calendar_color};" data-idx ="${item.calendar_idx}" data-type ="공유일정">공유일정${item.calendar_name}</option>                       	 	
                        		</c:forEach>
	                        </select>
	                    </div>
	                    
	                    <div class="input-group mb-3">
	                        <label class="input-group-text" for="detail-content">내용</label>
	                        <textarea class="form-control" id="detail-content" name="detail-content" placeholder="Enter message" rows="3" style="height: 245px;" disabled="disabled"></textarea>
	                    </div>  
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary btn-lg" onclick="editButton()" id="editButton">수정</button>
                    <button class="btn btn-danger btn-lg" onclick="deleteSchedule()" data-bs-dismiss="modal" id="delButton">삭제</button>                 
                    <button type="button" class="btn btn-secondary btn-lg" data-bs-dismiss="modal">닫기</button>         
                </div>
            </div>
        </div>
    </div>
	<!-- 일정 상세보기 끝 -->
	
	<!-- 공유 캘린더 생성 모달창  시작-->
	<div class="modal fade" id="addSharedCalendarModal" tabindex="-1" aria-labelledby="addSharedCalendarModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title h4" id="addSharedCalendarModalLabel">공유캘린더 생성</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div>
						<div class="input-group mb-3">
							<label class="input-group-text" for="calendar-name">캘린더이름</label> 
							<input type="text" class="form-control" id="create-share-title"name="create-share-title">
						</div>
						<div class="input-group mb-3">
							<label class="input-group-text" for="calendar-color">색상지정</label>
							<input type="color" class="form-control form-control-color" id="create-share-color" name="create-share-color" value="#563d7c">
						</div>
						<div class="input-group mb-3">
							<label class="input-group-text">공유할 사람</label>
							<button class="btn btn-outline-secondary" type="button"
								data-bs-toggle="collapse" data-bs-target="#shareWithList"
								aria-expanded="false" 
								aria-controls="shareWithList">사람선택</button>
							<span id="selectedUsers" class="ms-2"></span>
						</div>
						<div class="collapse" id="shareWithList">
							<div class="accordion" id="accordionPanelsStayOpenExample">

								<c:forEach items="${deptList}" var="deptlist" varStatus="deptStatus">
									<div class="accordion-item">
										<h2 class="accordion-header" id="panelsStayOpen-heading${deptStatus.index}">
											<button class="accordion-button collapsed" type="button"
												data-bs-toggle="collapse"
												data-bs-target="#panelsStayOpen-collapse${deptStatus.index}"
												aria-expanded="false"
												aria-controls="panelsStayOpen-collapse${deptStatus.index}">${deptlist}</button>
										</h2>
											<div id="panelsStayOpen-collapse${deptStatus.index}"
												class="accordion-collapse collapse"
												aria-labelledby="panelsStayOpen-heading${deptStatus.index}" style="">
												<div class="accordion-body">
													<div class="row gx-3">
														
														<c:forEach items="${empList}" varStatus="empStatus" var="emplist">
															<c:if test="${deptlist eq emplist.dept_name}">
																<c:if test="${emplist.emp_no ne loginId}">
																	<button type="button" class="btn btn-primary" data-emp-no="${emplist.emp_no}"
	                                                                    onclick="selectEmployee('${emplist.emp_no}', '${emplist.title_name}', '${emplist.emp_name}')">
	                                                                	${emplist.title_name} ${emplist.emp_name}
	                                                            	</button>
                                                            	</c:if>
															</c:if>										
														</c:forEach>
													</div>
												</div>
											</div>
	
	
									</div>
								</c:forEach>



							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						onclick="createSharedCalendar()" data-bs-dismiss="modal">생성하기</button>
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소하기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 공유 캘린더 생성 모달창  끝-->
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

    <script src="/assets/js/localStorage.js"></script>
    
    <!-- 모멘트 -->
    <script src="/assets/js/moment.min.js"></script>
    
    <!-- 데이터 피커 -->
   <script src="/assets/vendor/daterange/daterange.js"></script>
   <!--  <script src="/assets/vendor/daterange/custom-daterange-mycab.js"></script>
    -->
    <!-- Custom JS files -->
    <script src="/assets/js/custom.js"></script>
    
  <script >
  	var detailIdx;
	var startStr;
	var endStr;
	var createScheduleCategory = document.getElementById('create-category');
	var loginId = "${sessionScope.loginId}";
	console.log(loginId);
	var calendar;
	document.addEventListener("DOMContentLoaded", function(){

			var modal = document.getElementById('mycab-cal-modal');
			var calendarEl = document.getElementById("selectableCalendar");
		
			 calendar = new FullCalendar.Calendar(calendarEl, {
				headerToolbar: {
					left: "prev,next today",
					center: "title",
					right: 'insertScheduleButton'
				},
				customButtons: {
		          insertScheduleButton: {
		            text: '일정추가',
		            click: function(arg) {
		              addScheduleModal(arg);
		            }
		          }
		        },
				locale: 'ko',
				initialDate: new Date(),
				navLinks: true, // can click day/week names to navigate views
				selectable: true,
				selectMirror: true,
				select: function (arg) {
					var adjustedEnd = moment(arg.end).subtract(1, 'days').format("YYYY-MM-DD");
					addScheduleModal(arg,adjustedEnd);		
				},
				eventClick: function (arg) {
					scheduleDetail(arg);
				},
				eventDidMount: function(info) {
			    	console.log(info);
			    },
				
				editable: true,
				dayMaxEvents: true,
				
				events: function(fetchInfo, successCallback, failureCallback){
					console.log(fetchInfo);
					console.log(successCallback);
					console.log(failureCallback);
					$.when(
						    $.ajax({
						        type: "GET",
						        url: "/calendar/listCall.ajax",
						        data: {
						            'schedule_editor': "${sessionScope.loginId}"
						        },
						        dataType: "json"
						    }),
						    $.ajax({
						        type: "GET",
						        url: "/calendar/shareCalListCall.ajax",
						        data: {
						            'schedule_editor': "${sessionScope.loginId}"
						        },
						        dataType: "json"
						    })
						).done(function(response1, response2) {
							console.log("요청 끝났지롱");
						    var events = [];
						    
						    // 첫 번째 AJAX 호출의 응답 처리
						    var listResponse = response1[0]; // response1[0]에 실제 응답 데이터가 들어 있습니다.
						    for (var i = 0; i < listResponse.length; i++) {
						        var res = listResponse[i];
						        var event = {
						            id: res.schedule_idx,
						            title: res.schedule_name,
						            content: res.schedule_content,
						            start: res.schedule_start_date,
						            end: res.schedule_end_date,
						            color: res.schedule_color,
						            category: res.schedule_category
						        };
						        events.push(event);
						    }

						    // 두 번째 AJAX 호출의 응답 처리
						    var shareCalListResponse = response2[0]; // response2[0]에 실제 응답 데이터가 들어 있습니다.
						    for (var i = 0; i < shareCalListResponse.length; i++) {
						        var res = shareCalListResponse[i];
						        var event = {
						            id: res.schedule_idx,
						            title: res.schedule_name,
						            content: res.schedule_content,
						            start: res.schedule_start_date,
						            end: res.schedule_end_date,
						            color: res.calendar_color,
						            category: res.schedule_category,
						            shareIdx: res.calendar_idx,
						            calName: res.calendar_name
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



	function addScheduleModal(arg,adjustedEnd){
		console.log(arg)
		var myModal = new bootstrap.Modal(document.getElementById('scheduleAddModal'));
	  	startStr = arg.startStr;
	  	endStr = adjustedEnd;
	  	
	  	
	  	if(startStr != null){
	      document.getElementById("create-start-date").value = startStr;
	    }
	    if(endStr != null){
	      document.getElementById("create-end-date").value = endStr;
	    }
	    	
	  // 모달을 표시
	  myModal.show();
	}

	function scheduleDetail(arg){
		myModal = new bootstrap.Modal(document.getElementById('scheduleDetailModal'));
		console.log(arg);
		$.ajax({
		        type: "GET",
		        url: "/calendar/calendarDetail.ajax",
		        data: {
		        	'schedule_idx': arg.event.id      	
		        },
		        dataType: "json",
				success: function(response) {
					detailIdx = response.dto.schedule_idx;
					document.getElementById('detail-title').value = response.dto.schedule_name	;
					document.getElementById('detail-content').value = response.dto.schedule_content	;
					var startDate = response.dto.schedule_start_date	;
					var endDate = response.dto.schedule_end_date	;
					var registDate = response.dto.schedule_register_date	;
					document.getElementById("detail-writer").value = response.dto.schedule_dept_name+" "+response.dto.sechdule_emp_name;
					console.log(response.dto.schedule_emp_no);
					var editor = response.dto.schedule_editor	;
					var category =response.dto.schedule_category;
					if(category != "공유일정"){
						document.getElementById('detail-category').value = response.dto.schedule_category	;						
					}else{
						document.getElementById('detail-category').value = response.dto.calendar_name;
					}
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
		// 작성자 검사
		
		console.log(loginId);
		document.getElementById('detail-title').value = arg.event.title;

	    document.getElementById('detail-content').value = arg.event.extendedProps.content;
		 myModal.show();
		
	}
	// 상세보기 모달 버튼 
	function chkLoginId(loginId,empNo){
		console.log("버튼 체크 로그인된 아이디 : "+loginId);
		console.log("작성자 아이디 : "+empNo);
		if(loginId == empNo ){
			document.getElementById("editButton").style.display="block";
			document.getElementById("delButton").style.display="block";
		}else{
			document.getElementById("editButton").style.display="none";
			document.getElementById("delButton").style.display="none";
		}
	}
	
	function addSchedule(){
		
		
		// 시작 날짜 밸류 가져오기
		var startHour = document.getElementById('create-start-hour')
		var startMinute = document.getElementById('create-start-min')		
		var startDate = document.getElementById("create-start-date");
		
		// 종료 날짜 밸류 가져오기
		var endDate = document.getElementById("create-end-date");
		var endHour = document.getElementById("create-end-hour");
		var startMinute = document.getElementById("create-end-min");
		
		
		// 날짜 형식에 맞게 변환
		var startDateTime = adjustDateTime(startDate,startHour,startMinute);
		var endDateTime = adjustDateTime(endDate,endHour,startMinute);
		
		//색깔 가져오기
		
		var selectedOption = createScheduleCategory.options[createScheduleCategory.selectedIndex];
		var shareCalIdx = selectedOption.dataset.idx;
        var color = selectedOption.style.color;
       /* 	   아작스 안에 들어갈 값     	'schedule_end_date': document.getElementById("sel-end-date").value, */
       console.log("zz");
       // 유효성 검사
       var chkVal = checkValidation(document.getElementById('create-title'));
        console.log(color)
        if(chkVal){    
			$.ajax({
		        type: "GET",
		        url: "/calendar/createSchedule.ajax",
		        data: {
		        	'schedule_name': document.getElementById("create-title").value,
		        	'schedule_content': document.getElementById("create-content").value,
		        	'schedule_start_date': startDateTime,
		        	'schedule_end_date': endDateTime,
		        	'schedule_category': document.getElementById("create-category").value,
		        	'schedule_color': color,
		        	'schedule_emp_no': "${sessionScope.loginId}", //나중에 세션으로 처리
		        	'calendar_idx' : shareCalIdx
		        	
		        },
		        dataType: "JSON",
				success: function(response) {
					console.log(response);
					console.log("캘린더 추ㅏ 됌");
					calendar.refetchEvents();
					
		        },
		        error: function(xhr, status, error) {
		        	console.log(xhr,status,error);
		            // 에러 처리
		            $("#result").html("<p>There was an error: " + error + "</p>");
		        }
		    });
        }
	};
  //일정 추가
  function scheduleDetailModalHide(){
	  var modal = document.getElementById('scheduleDetailModal');
	  modal.style.display = "none";	  
  }
  
  moment.locale('ko');	
  
  
  // 일정 형식변환 0000-00-00 / 0~11 / 0~59
  function adjustDateTime(date,hour,min){
	  
	  
	  var parseHour = hour.options[hour.selectedIndex].value;
	  var parseMin = min.options[min.selectedIndex].value;
	  var parseDate = date.value;
	  console.log(parseHour);
	  console.log(parseMin);
	  console.log(parseDate);
	  
	  
	  // 0시 -> 00시 / 1시 -> 01시 로 변환 
	  parseHour = parseHour.padStart(2, '0');
	  parseMin = parseMin.padStart(2, '0');
	  var dateTime = parseDate+'T'+parseHour+':'+parseMin+':'+'00';
	  console.log(dateTime);
	  return dateTime;
  }
  
  
  // 일정 카테고리 선택시 색생 변경
  function changeCategoryColor(t){
	  console.log("색깔변경할거지롱");
	  console.log(t);
	  
	 var val = document.getElementById("create-category");
	 var valOption = val.options[val.selectedIndex];
	 var getColor = valOption.style.color;
	 document.getElementById("create-category").style.color=getColor;	 
	 
	 console.log(getColor);
  };
  
	//일정 삭제
	function deleteSchedule(){
		$.ajax({
	        type: "GET",
	        url: "/calendar/deleteSchedule.ajax",
	        data: {
	        	'schedule_idx': detailIdx        	
	        },
	        dataType: "json",
			success: function(response) {
				if (response.success){
					alert("이벤트 삭제 성공");
				}
				calendar.refetchEvents();
	        },
	        error: function(xhr, status, error) {

	        }
	    });
	}
	function editSchedule(){
		console.log("수정버튼 클릭됨");
		//현재 시간 가져오기 
		var curTime = getCurrentDateTime();
		// SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		// 시작일정 가져오기
		var startHour = document.getElementById('detail-start-hour')
		var startMinute = document.getElementById('detail-start-min')		
		var startDate = document.getElementById("detail-start-date");
		// 종료 일정 가져오기 
		var endDate = document.getElementById("detail-end-date");
		var endHour = document.getElementById("detail-end-hour");
		var endMinute = document.getElementById("detail-end-min");
		
		// 날짜 형식에 맞게 변환
		var startDateTime = adjustDateTime(startDate,startHour,startMinute);
		var endDateTime = adjustDateTime(endDate,endHour,endMinute);
		// 카테고리 가져오기 
		var scheduleCategory = document.getElementById('detail-category');
		// 카테고리 색 가져오기
		var selectedOption = scheduleCategory.options[scheduleCategory.selectedIndex];
        var color = selectedOption.style.color;
        var calIdx = selectedOption.dataset.idx;
        var shareCategory = selectedOption.dataset.type;
        console.log("gadsgasdgasdgsda"+calIdx);
        console.log("gadsgasdgasdgsda"+shareCategory);
        // 유효성 검사"C:/Users/mh/OneDrive/바탕 화면/새 텍스트 문서 (2).txt"
        var chkVal = checkValidation(document.getElementById('detail-title'));
        console.log(chkVal);
		console.log(document.getElementById('detail-title').value);
		
		
		if (chkVal) {
			$.ajax({
				type: 'GET',
				url: '/calendar/editSchedule.ajax',
				data:{
					'schedule_idx': detailIdx,
					'schedule_name': document.getElementById('detail-title').value,
					'schedule_content': document.getElementById('detail-content').value,
				
					'schedule_start_date': startDateTime,
					'schedule_end_date': endDateTime,
					'schedule_edit_date' : curTime,
					'schedule_editor' : "${sessionScope.loginId}", // 세션으로 가져오기
					'schedule_category': document.getElementById('detail-category').value,
					'schedule_color' : color,
					'calendar_idx' : calIdx,
					'share_category' : shareCategory
				},
				dataType :"json",
				success: function(response){
					if (response.success) {
						alert("수정에 성공 했습니다")
						calendar.refetchEvents();
					}
				},
				error: function(e){
					console.log(e);
				}
			});
		}
		
	};
	
	function getCurrentDateTime(){
		  var now = new Date();
		  var year = now.getFullYear();
          var month = String(now.getMonth() + 1).padStart(2, '0');
          var day = String(now.getDate()).padStart(2, '0');
          var hours = String(now.getHours()).padStart(2, '0');
          var minutes = String(now.getMinutes()).padStart(2, '0');
          var seconds = String(now.getSeconds()).padStart(2, '0');
          
          var curTime = year+'-'+month+'-'+day+'T'+hours+':'+minutes+':'+seconds;
          console.log(curTime);
		   
		return curTime;
	};
	// 밸류를 넣어 유효성 검사
	function checkValidation(get){
		if(get.value ===''){
			alert(get.id+"에 입력된 값이 없습니다 다시 입력해 주세요.");
			return false
		}else{
			return true
		}
	};
	
	// utilBox 클릭 이벤트 
	function utilBoxClk(t){
		var chkBox = t.querySelector('input[type="checkbox"]').checked;
		var chkBoxVal = t.querySelector('label').innerText;
		
		if(chkBox){
			t.querySelector('input[type="checkbox"]').checked = false;
			var events = calendar.getEvents();
			for (let e of events) {
				if(e.extendedProps.category == chkBoxVal){
					console.log("ㅋㅋㅋ",e);
		            e.setProp('display', 'none');
				}
			}
			
		}else{
			t.querySelector('input[type="checkbox"]').checked =true;
			var events = calendar.getEvents();
			for (let e of events) {
				if(e.extendedProps.category == chkBoxVal){
					console.log("ㅋㅋㅋ",e);
		            e.setProp('display', '');
				}
			}
		}

	};
	
	function shareUtilBoxClk(t){
		var chkBox = t.querySelector('input[type="checkbox"]').checked;
		var chkBoxVal = t.querySelector('label').innerText;
		var idx = t.dataset.shareIdx;
		console.log(idx);
		
		if(chkBox){
			t.querySelector('input[type="checkbox"]').checked = false;
			var events = calendar.getEvents();
			for (let e of events) {
				if(e.extendedProps.shareIdx == idx){
					console.log("ㅋㅋㅋ",e);
		            e.setProp('display', 'none');
				}
			}
			
		}else{
			t.querySelector('input[type="checkbox"]').checked =true;
			var events = calendar.getEvents();
			for (let e of events) {
				if(e.extendedProps.shareIdx == idx){
					console.log("ㅋㅋㅋ",e);
		            e.setProp('display', '');
				}
			}
		}

	};
	
	// 수정버튼 버튼변경 (readOnly해제)
	function editButton(){
		var editBtn =  document.getElementById("editButton");
		editBtn.innerHTML = '수정완료';
		editBtn.removeAttribute("onlick");
		editBtn.setAttribute("onclick","editSchedule()");
		document.getElementById("detail-category").disabled = false;
		document.getElementById("detail-end-min").disabled = false;
		document.getElementById("detail-end-hour").disabled = false;
		document.getElementById("detail-start-min").disabled= false;
		document.getElementById("detail-start-hour").disabled =false;
		document.getElementById("detail-title").disabled = false;
		document.getElementById("detail-start-date").disabled = false;
		document.getElementById("detail-end-date").disabled = false;
		document.getElementById("detail-content").disabled = false;
		document.getElementById("editButton").setAttribute('data-bs-dismiss',"modal");
		
	}
	
	$('#scheduleDetailModal').on('hidden.bs.modal', function (e) {
		console.log("모달창 닫힘");
		var editBtn =  document.getElementById("editButton");
		editBtn.innerHTML = '수정';
		editBtn.removeAttribute("onlick");
		editBtn.setAttribute("onclick","editButton()");
		document.getElementById("detail-category").disabled = true;
		document.getElementById("detail-end-min").disabled = true;
		document.getElementById("detail-end-hour").disabled = true;
		document.getElementById("detail-start-min").disabled= true;
		document.getElementById("detail-start-hour").disabled =true;
		document.getElementById("detail-title").disabled = true;
		document.getElementById("detail-start-date").disabled = true;
		document.getElementById("detail-end-date").disabled = true;
		document.getElementById("detail-content").disabled = true;
		editBtn.removeAttribute("data-bs-dismiss");
	});
	
	
	
	//공유 캘린더 생성 모달창 열기
	function createShareModalOpen(){
		var myModal = new bootstrap.Modal(document.getElementById('addSharedCalendarModal'));
	  // 모달을 표시
	  myModal.show();
	}
	
	 var selectedEmployees = []; // 선택된 사원들을 저장할 배열

	    // 사원 선택 버튼 클릭 시
	   function selectEmployee(empNo,empTitleName, employeeName) {
		 console.log(empNo)
        // 이미 선택된 사원인지 확인
        var alreadySelected = selectedEmployees.find(emp => emp.empNo === empNo);
        if (!alreadySelected) {
        	console.log("\${empNo}");
            // 선택된 사원 배열에 추가
            selectedEmployees.push({ empNo: empNo ,empTitle : empTitleName ,  empName : employeeName });
            
            // 선택된 사원을 화면에 표시 (버튼 형식으로 추가)
            var selectedUsersElem = document.getElementById('selectedUsers');
            selectedUsersElem.innerHTML += `<button type="button" class="btn btn-outline-primary me-2" 
            data-emp-no="\${empNo}" onclick="deselectEmployee('\${empNo}','\${empTitleName}', '\${employeeName}')">\${empTitleName} \${employeeName}</button>`;
            
            // 선택된 사원을 리스트에서 제거
            var buttons = document.querySelectorAll(`#accordionPanelsStayOpenExample button[data-emp-no='\${empNo}']`);
			var sibal = document.querySelector(`button[data-emp-no='\${empNo}']`);
			console.log(sibal);
            buttons.forEach(button => button.disabled = true); // 선택된 사원 버튼 비활성화

            buttons.forEach(button => {
                console.log(button.textContent); // 해당 empId를 가진 모든 요소의 텍스트 내용 출력
            });
        }
    }
	 
	   function deselectEmployee(empNo,empTitleName,employeeName) {
		   console.log("공유일정 취소버튼 클릭됨",`\${empNo}`);
		   console.log("공유일정 취소버튼 클릭됨",`\${empTitleName}`);
		   console.log("공유일정 취소버튼 클릭됨",`\${employeeName}`);
	        // 선택된 사원 배열에서 제거
	        selectedEmployees = selectedEmployees.filter(emp => emp.empNo !== empNo);
	        
	        // 화면에서 선택 해제된 사원 버튼 제거
	        var selectedUsersElem = document.getElementById('selectedUsers');
	        selectedUsersElem.innerHTML = selectedEmployees.map(emp => `<button type="button" class="btn btn-outline-primary me-2" data-emp-id="\${emp.empNo}" onclick="deselectEmployee('\${emp.empNo}','\${emp.empTitle}','\${emp.empName}')"> \${emp.empTitle} \${emp.empName}</button>`).join('');

	        // 선택 해제된 사원을 리스트에서 다시 활성화
	        var buttons = document.querySelectorAll(`#accordionPanelsStayOpenExample button[data-emp-no='\${empNo}']`);
	        buttons.forEach(button => button.disabled = false); // 선택 해제된 사원 버튼 활성화
	    }
	   

	    // 캘린더 생성 버튼 클릭 시
	    function createSharedCalendar() {
	    	console.log(selectedEmployees);
	    	/* var chkstr = document.getElementById('create-share-title').value;
	    	chkStringLength(chkstr); */
	    	if(selectedEmployees.length<=0){
	    		showAlert('success', '최소한 한명이상을 선택 해주세요.');
	    		
	    	}else{
	    		var infoList = {};
	    		selectedEmployees.push({empNo : loginId});
	    		infoList.empList =selectedEmployees;
	    		infoList.shareTitle = document.getElementById('create-share-title').value;
	    		infoList.shareColor = document.getElementById('create-share-color').value;
	    		infoList.loginId = '${sessionScope.loginId}';
	    		console.log(document.getElementById('create-share-title').value);
	    		console.log(document.getElementById('create-share-color').value);
	    		//infoList = {"shareTitle" : document.getElementById('create-share-title').value};
	    		//infoList = {"shareColor" : document.getElementById('create-share-color').value};	    			    		
	    		var jsonData = JSON.stringify(infoList);
	    	 $.ajax({
	                type: "POST",
	                url: "/calendar/createShareCalendar.ajax", // Update with your server endpoint
	                data: jsonData,
	            	contentType:'application/json; charset=utf-8',
	                success: function(response) {
	                    console.log("Success:", response);
	                    location.reload();
	                },
	                error: function(error) {
	                    console.error("Error:", error);
	                }
	            });
	        // 여기에 선택된 사원들을 서버로 전송하거나 다른 작업을 수행할 수 있습니다.
	        
	        // 모달 닫기
		        var addSharedCalendarModal = new bootstrap.Modal(document.getElementById('addSharedCalendarModal'));
		        addSharedCalendarModal.hide();
	    	}
	    		
	    }
	
	    
	    // 데
  		// Date Range
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
		
		var createPikEnd = $(".createDatepickerEnd").daterangepicker({
			singleDatePicker: true,
			showOtherMonths: true,
			startDate: moment().startOf("hour"),
			endDate: moment().startOf("hour").add(32, "hour"),
			locale: {
				format: "YYYY-MM-DD",
				daysOfWeek: ['일', '월', '화', '수', '목', '금', '토'],
		        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
			},
			
		});
		
		
		$(".detailDatepickerStart").daterangepicker({
			singleDatePicker: true,
			showOtherMonths: true,
			startDate: moment().startOf("hour"),
			endDate: moment().startOf("hour").add(32, "hour"),
			locale: {
				format: "YYYY-MM-DD",
				daysOfWeek: ['일', '월', '화', '수', '목', '금', '토'],
		        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
			},
			
		});
		
		$(".detailDatepickerEnd").daterangepicker({
			singleDatePicker: true,
			showOtherMonths: true,
			startDate: moment().startOf("hour"),
			endDate: moment().startOf("hour").add(32, "hour"),
			locale: {
				format: "YYYY-MM-DD",
				daysOfWeek: ['일', '월', '화', '수', '목', '금', '토'],
		        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
			},
			
		});
		
		
		$(".createDatepickerStart").on('apply.daterangepicker', function(ev, picker) {
		    // apply 버튼을 눌렀을 때 실행할 코드
		    var chkStartDateVal = document.getElementById("create-start-date").value;
			var chkEndDateVal = document.getElementById("create-end-date").value;
			console.log(chkStartDateVal);
			console.log(chkEndDateVal);
			console.log("DatePicker : " , ev);
			console.log("DatePicker : " , picker);
			console.log("DatePicker : " , picker.startDate.toDate());
			console.log(createPikEnd);
			createPikEnd.setStartDate =createPikEnd;
			
			  $(".createDatepickerEnd").datepicker("setStartDate", picker.startDate.toDate());
			if(chkStartDateVal>chkEndDateVal){
				alert("시작날짜보다 종료날짜가 더 빠릅니다.");
				document.getElementById("create-end-date").value = document.getElementById("create-start-date").value;
			};
		});
		
		$(".createDatepickerEnd").on('apply.daterangepicker', function(ev, picker) {
		    // apply 버튼을 눌렀을 때 실행할 코드
		    var chkStartDateVal = document.getElementById("create-start-date").value;
			var chkEndDateVal = document.getElementById("create-end-date").value;
			console.log(chkStartDateVal);
			console.log(chkEndDateVal);
			console.log("DatePicker : " , ev);
			console.log("DatePicker : " , picker);
			if(chkStartDateVal>chkEndDateVal){
				alert("시작날짜보다 종료날짜가 더 빠릅니다.");
				document.getElementById("create-end-date").value = document.getElementById("create-start-date").value;
			};
		});
		
		
		$(".detailDatepickerStart").on('apply.daterangepicker', function(ev, picker) {
		    // apply 버튼을 눌렀을 때 실행할 코드
		    var chkStartDateVal = document.getElementById("detail-start-date").value;
			var chkEndDateVal = document.getElementById("detail-end-date").value;
			console.log(chkStartDateVal);
			console.log(chkEndDateVal);
			console.log("DatePicker : " , ev);
			console.log("DatePicker : " , picker);
			if(chkStartDateVal>chkEndDateVal){
				alert("시작날짜보다 종료날짜가 더 빠릅니다.");
				document.getElementById("detail-end-date").value = document.getElementById("detail-start-date").value;
			};
		});
		
		$(".detailDatepickerEnd").on('apply.daterangepicker', function(ev, picker) {
		    // apply 버튼을 눌렀을 때 실행할 코드
		    var chkStartDateVal = document.getElementById("detail-start-date").value;
			var chkEndDateVal = document.getElementById("detail-end-date").value;
			console.log(chkStartDateVal);
			console.log(chkEndDateVal);
			console.log("DatePicker : " , ev);
			console.log("DatePicker : " , picker);
			if(chkStartDateVal>chkEndDateVal){
				alert("시작날짜보다 종료날짜가 더 빠릅니다.");
				document.getElementById("detail-end-date").value = document.getElementById("detail-start-date").value;
			};
		});
		
		// 글자 사이즈 체크
		function chkStringLength(str){
			if(srt.length>20){
				alert("글자 크기가 20글자가 넘어갑니다 다시 입력해 주세요.")
				location.reload();
			}
		}
</script>
<script src="/assets/js/showAlert.js"></script>

</html>