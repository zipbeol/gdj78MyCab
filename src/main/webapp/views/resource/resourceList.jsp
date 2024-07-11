<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>자원예약 리스트</title>
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
                        <a href="#" class="text-decoration-none">자원관리</a>
                    </li>
                    <li class="breadcrumb-item">
                        <a href="/resource/list.go" class="text-decoration-none">자원 예약</a>
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
					                        <button class="nav-link active" id="meetroom-list-tab" data-bs-toggle="tab"
					                                data-bs-target="#meetroom-list-content" type="button" role="tab"
					                                aria-controls="meetroom-list-content" aria-selected="true" onclick="mrListSearch()">회의실 예약
					                                
					                        </button>
					                    </li>
					                    <li class="nav-item" role="presentation">
					                        <button class="nav-link" id="car-list-tab" data-bs-toggle="tab"
					                                data-bs-target="#car-list-content" type="button" role="tab"
					                                aria-controls="car-list-content" aria-selected="false" onclick="carListSearch()">차량 예약
					                        </button>
					                    </li>
					                    <li class="nav-item" role="presentation">
					                        <button class="nav-link" id="equipment-list-tab" data-bs-toggle="tab"
					                                data-bs-target="#equipment-list-content" type="button" role="tab"
					                                aria-controls="equipment-list-content" aria-selected="false" onclick="eqListSearch()">비품 예약
					                        </button>
					                    </li>
					                </ul>
					            </div>
					            <div class="card-body tab-content" id="newTabsContent">
					                <div class="tab-pane show active" id="meetroom-list-content" role="tabpanel"
					                     aria-labelledby="meetroom-list-tab">
					                    <!-- 전체 근태 내역 -->
					                    <h2>회의실</h2>
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
					                            <div class="col-2">
					                                <label for="search-mr-date"
					                                       class="form-label">예약일</label>
					                            </div>
					                            <div class="col-2">
					                                <label for="search-mr-start-time"
					                                       class="form-label">예약 시작시간</label>
					                            </div>
					                            <div class="col-2">
					                                <label for="search-mr-end-time"
					                                       class="form-label">예약 종료시간</label>
					                            </div>
					                            <div class="col-2">
					                                <label for="search-mr-status"
					                                       class="form-label">상태</label>
					                            </div>
					                        </div>
					                        <div class="row mb-3">
					                            <div class="col-1">
					                                <div class="input-group" >
					                                    <select id=search-mr-capacity name="search-mr-capacity">
						                                	<option value="">날짜선택</option>
						                                	<option value="1">1명</option>
						                                	<option value="2">2명</option>
						                                	<option value="3">3명</option>
						                                	<option value="4">4명</option>
						                                	<option value="5">5명</option>
						                                	<option value="6">6명</option>
						                                	<option value="7">7명</option>
						                                	<option value="8">8명</option>
						                                	<option value="9">9명</option>
						                                	<option value="10">10명이상</option>														
								                    </select>
					                                </div>
					                            </div>
					                            <div class="col-2 d-flex" >
					                                <input type="text" class="form-control datePicker" id = "search-mr-date">					                                
					                            </div>
					                            <div class="col-2 d-flex">					                               
					                                <select id=search-mr-start-time name="search-mr-start-time">
					                                	<option value="">날짜선택</option>
														
								                    </select>
					                            </div>
					                            <div class="col-2 d-flex">
					                             	<select id="search-mr-end-time" name="search-mr-end-time">
					                             	<option value="">날짜선택</option>			
								                    </select>
					                            </div>
					                            <div class="col-2 d-flex">
					                                <select class="form-select maintenance-search-filter"
					                                        id="search-mr-status">
					                                    <option value="전체">전체</option>
					                                    <option value="예약가능">예약가능</option>
					                                    <option value="예약불가">예약불가</option>

					                                </select>
					                            </div>
					                            <div class="col-2 d-flex">
					                                <button class="btn btn-secondary" onclick="mrListSearch()">검색</button>
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
					                                   		<th class="text-center" id="meeting_room_photo" style="width: 20%;">사진</th>
					                                        <th class="text-center" id="resorce_name" style="width: 20%;">회의실</th>
					                                        <th class="text-center sortable" id="meeting_room_capacity" style="width: 15%;">인원</th>
					                                        <th class="text-center sortable" id="resource_location" style="width: 10%;">위치</th>
					                                        <th class="text-center" id="resource_meeting_content" style="width: 10%;">비고</th>
					                                        <th class="text-center sortable" id="resource_state" style="width: 10%;">가능여부</th>
					                                    </tr>
					                                </thead>
					                                <tbody id="mr-list-table">
					                                    <!-- 테이블 내용 정의 -->
					                                </tbody>
					                            </table>
					                        </div>
					                    </div>
					                    <!-- 리스트 테이블 종료 -->
					
					                    <!-- 페이지 네이션 시작 -->
					                    <nav aria-label="Page navigation example" class="mt-3">
					                        <ul class="pagination justify-content-center" id="mr-pagination"></ul>
					                    </nav>
					                    <!-- 페이지 네이션 종료 -->
					                </div>
					                
					                
					                <div class="tab-pane fade" id="car-list-content" role="tabpanel"
					                     aria-labelledby="car-list-tab">
					                    <!-- 전체 근태 내역 -->
					                    <h2>차량 예약</h2>
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
					                                <label for="search-car-category"
					                                       class="form-label">차종</label>
					                            </div>
					                            <div class="col-2">
					                                <label for="search-car-date"
					                                       class="form-label">예약날</label>
					                            </div>
					                            <div class="col-2">
					                                <label for="search-car-start-time"
					                                       class="form-label">예약 시작시간</label>
					                            </div>
					                            <div class="col-2">
					                                <label for="search-car-end-time"
					                                       class="form-label">예약 종료시간</label>
					                            </div>
					                            <div class="col-2">
					                                <label for="search-car-status"
					                                       class="form-label">상태</label>
					                            </div>
					                        </div>
					                        <div class="row mb-3">
					                            <div class="col-1">
					                                    <select id= "search-car-category" class="form-control">
					                                    	<option value="">전체</option>
					                                    	<option value="소형">소형</option>
					                                    	<option value="소형">중형</option>
					                                    	<option value="소형">대형</option>
					                                    </select> 
					                            </div>
					                            <div class="col-2 d-flex">
					                                <input type="text" class="form-control datePicker" id= "search-car-date">
					                            </div>
					                            <div class="col-2 d-flex">
					                                <select id="search-car-start-time" name="search-car-start-time">
					                                	<option value="">날짜선택</option>

								                    </select>
					                            </div>
					                            <div class="col-2 d-flex">
					                             	<select id="search-car-end-time" name="search-car-end-time">
					                             		<option value="">날짜선택</option>

								                    </select>
					                            </div>
					                            <div class="col-2 d-flex">
					                                <select class="form-select maintenance-search-filter"
					                                        id="search-car-status">
					                                    <option value="전체">전체</option>
					                                    <option value="예약가능">예약가능</option>
					                                    <option value="예약불가">예약불가</option>

					                                </select>
					                            </div>
					                            <div class="col-2 d-flex">
					                                <button class="btn btn-secondary" onclick="carListSearch()">검색</button>
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
					                                    	<th class="text-center" id="resorce_car-photo" style="width: 20%;">사진</th>
					                                        <th class="text-center" id="resorce_idx" style="width: 20%;">차량명</th>
					                                        <th class="text-center sortable" id="th-emp-name" style="width: 10%;">차종</th>
					                                        <th class="text-center sortable" id="th-emp-name" style="width: 10%;">번호판</th>
					                                        <th class="text-center sortable" id="th-title-name" style="width: 10%;">위치</th>
					                                        <th class="text-center sortable" id="th-dept-name" style="width: 10%;">비고</th>
					                                        <th class="text-center sortable" id="th-dept-name" style="width: 10%;">가능여부</th>
					                                    </tr>
					                                </thead>
					                                <tbody id="car-list-table">
					                                    <!-- 테이블 내용 정의 -->
					                                </tbody>
					                            </table>
					                        </div>
					                    </div>
					                    <!-- 리스트 테이블 종료 -->
					
					                    <!-- 페이지 네이션 시작 -->
					                    <nav aria-label="Page navigation example" class="mt-3">
					                        <ul class="pagination justify-content-center" id="car-pagination"></ul>
					                    </nav>
					                    <!-- 페이지 네이션 종료 -->
					                </div>
					                
					                <div class="tab-pane fade" id="equipment-list-content" role="tabpanel"
					                     aria-labelledby="equipment-list-tab">
					                    <!-- 전체 근태 내역 -->
					                    <h2>전체 근태 내역</h2>
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
					                                <label for="search-eq-category"
					                                       class="form-label">종류</label>
					                            </div>
					                            <div class="col-2">
					                                <label for="search-eq-date"
					                                       class="form-label">예약날짜</label>
					                            </div>
					                            <div class="col-2">
					                                <label for="search-eq-start-time"
					                                       class="form-label">시작시간</label>
					                            </div>
					                            <div class="col-2">
					                                <label for="search-eq-end-time"
					                                       class="form-label">예약 종료시간</label>
					                            </div>
					                            <div class="col-2">
					                                <label for="search-eq-status"
					                                       class="form-label">상태</label>
					                            </div>
					                        </div>
					                        <div class="row mb-3">
					                            <div class="col-1">
					                                    <input type="number" class="form-control " id="search-eq-category" name="search-eq-category" min="0"> 
					                            </div>
					                            <div class="col-2 d-flex">
					                                <input type="text" class="form-control datePicker" id = "search-eq-date">
					                            </div>
					                            <div class="col-2 d-flex">    
					                                <select id="search-eq-start-time" name="search-eq-start-time">
					                                	<option value="">날짜선택</option>
								                    </select>
					                            </div>
					                            <div class="col-2 d-flex">
					                             	<select id="search-eq-end-time" name="search-eq-end-time">
					                             		<option value="">날짜선택</option>
								                    </select>
					                            </div>
					                            <div class="col-2 d-flex">
					                                <select class="form-select maintenance-search-filter"
					                                        id="search-eq-status">
					                                    <option value="전체">전체</option>
					                                    <option value="예약가능">예약가능</option>
					                                    <option value="예약불가">예약불가</option>

					                                </select>
					                            </div>
					                            <div class="col-2 d-flex">
					                                <button class="btn btn-secondary" onclick="eqListSearch()">검색</button>
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
					                                    	<th class="text-center" id="resorce_idx" style="width: 20%;">사진</th>
					                                        <th class="text-center" id="resorce_idx" style="width: 20%;">비품</th>
					                                        <th class="text-center sortable" id="th-emp-name" style="width: 10%;">분류</th>
					                                        <th class="text-center sortable" id="th-title-name" style="width: 10%;">위치</th>
					                                        <th class="text-center sortable" id="th-dept-name" style="width: 10%;">비고</th>
					                                        <th class="text-center sortable" id="th-dept-name" style="width: 10%;">가능여부</th>
					                                    </tr>
					                                </thead>
					                                <tbody id="eq-list-table">
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
    console.log("zzzzz");
/* 카테고리 변수 저장 */
	var resSerachCategory = '회의실';
	var	resSearchDate ='';
	var resSearchStartTime = '';
	var resSearchEndTime= '';
	var resStatus = '';
	var resOption = '';
    var currentPage = 1; // 현재 페이지 번호
	var today = moment().format('YYYY/MM/DD');
	var showPage =1;

 
$(document).ready(function(){
	$('#pagination').twbsPagination('destroy');
	getMrList(currentPage);	
	
});
 
 // 탭 클릭 
 // 회의실
 $('#meetroom-list-tab').on('click', function(e) {
	//카테고리 설정
	resSerachCategory = "회의실"
	filterStartDate = today
	
	$('#pagination').twbsPagination('destroy');
	getMrList(currentPage);
});
 
// 차량
 $('#car-list-tab').on('click', function(e) {
	//카테고리 설정
	resSerachCategory = "차량"
	filterStartDate = today
	$('#pagination').twbsPagination('destroy');
    getCarList(currentPage);
});

// 비품
 $('#equipment-list-tab').on('click', function(e) {
	//카테고리 설정
	resSerachCategory = "비품"
	filterStartDate = today
	$('#pagination').twbsPagination('destroy');
	 getEqList(currentPage);
});

	function mrListSearch(){
		resSerachCategory = "회의실"
		filterStartDate = today
		getMrList(currentPage);
	}
	function carListSearch(){
		resSerachCategory = "차량"
		filterStartDate = today
	    getCarList(currentPage);
	}

	function eqListSearch(){
		resSerachCategory = "차량"
		filterStartDate = today
	    getCarList(currentPage);
	}


 function getSearchValue() {
 	if(resSerachCategory == '회의실'){

 		resSearchDate = document.getElementById("search-mr-date").value;
 		var startTime = document.getElementById("search-mr-start-time").value;
 		var endTime= document.getElementById("search-mr-end-time").value;
 		resStatus = document.getElementById("search-mr-status").value;
 		resOption = document.getElementById("search-mr-capacity").value;
 		resSearchStartTime = setDateTimeFormat(resSearchDate,startTime)
 		resSearchEndTime = setDateTimeFormat(resSearchDate,endTime)
 		
 	}else if(resSerachCategory == '차량'){
 		resSearchDate = document.getElementById("search-car-date").value;
 		var startTime = document.getElementById("search-car-start-time").value;
 		var endTime= document.getElementById("search-car-end-time").value;
 		resStatus = document.getElementById("search-car-status").value;
 		resOption = document.getElementById("search-car-category").value;
 		resSearchStartTime = setDateTimeFormat(resSearchDate,startTime)
 		resSearchEndTime = setDateTimeFormat(resSearchDate,endTime)
 	}else if(resSerachCategory == '비품'){
 		resSearchDate = document.getElementById("search-eq-date").value;
 		var startTime = document.getElementById("search-eq-start-time").value;
 		var endTime= document.getElementById("search-eq-end-time").value;
 		resStatus = document.getElementById("search-eq-status").value;
 		resOption = document.getElementById("search-eq-category").value;
 		resSearchStartTime = setDateTimeFormat(resSearchDate,startTime)
 		resSearchEndTime = setDateTimeFormat(resSearchDate,endTime)
 	}
 	
 }
 
 
 function setDateTimeFormat(date,time){
	 console.log(date);
	 console.log(time);
	 var dateTime = date + " " + time;
	 console.log(dateTime);
	 return dateTime;
 };

 // 회의실 리스트 호출
 function getMrList(currentPage) {
     getSearchValue();
     $.ajax({
         url: '/resource/resourceList.ajax',
         type: 'GET',
         data: {
             'resSerachCategory': resSerachCategory,
             'resSearchDate': resSearchDate,
             'resSearchStartTime':resSearchStartTime,
             'resSearchEndTime': resSearchEndTime,
             'resStatus' : resStatus,
             'resOption' : resOption ,   
             'currentPage' : currentPage
         },
         dataType: 'JSON',
         success: function (data) {
             drawMrList(data.list);
             
             var startPage = 1;
             
             $('#mr-pagination').twbsPagination({
 	    		startPage:data.currPage, // 시작 페이지
 	    		totalPages:data.totalPages, // 총 페이지 갯수
 	    		visiblePages:5,  // 보여줄 페이지 수[1][2][3][4][5]
 	    		onPageClick:function(evt,pg){ // 페이지 클릭시 실행 함수
 	    			console.log(evt); // 이벤트 객체
 	    			console.log(pg); //클릭한 페이지 번호 의미
 	        		showPage = pg;
 	        		getMrList(pg);
 	    			
 	    		}
 	       	});
         },
         error: function (error) {
             console.log(error);
         }
     });
 }
 
 function getCarList(currentPage) {
     getSearchValue();
     console.log(resOption);
     $.ajax({
         url: '/resource/resourceList.ajax',
         type: 'GET',
         data: {
             'resSerachCategory': resSerachCategory,
             'resSearchDate': resSearchDate,
             'resSearchStartTime':resSearchStartTime,
             'resSearchEndTime': resSearchEndTime,
             'resStatus' : resStatus,
             'resOption' : resOption,
             'currentPage':currentPage
         },
         dataType: 'JSON',
         success: function (data) {
        	 console.log("차량 리스트 불러오기 성공");
             drawCarList(data.list);
             
             var startPage = 1;
             
             $('#car-pagination').twbsPagination({
 	    		startPage:data.currPage, // 시작 페이지
 	    		totalPages:data.totalPages, // 총 페이지 갯수
 	    		visiblePages:5,  // 보여줄 페이지 수[1][2][3][4][5]
 	    		onPageClick:function(evt,pg){ // 페이지 클릭시 실행 함수
 	    			console.log(evt); // 이벤트 객체
 	    			console.log(pg); //클릭한 페이지 번호 의미
 	        		showPage = pg;
 	        		getCarList(pg);
 	    			
 	    		}
 	       	});
         },
         error: function (error) {
             console.log(error);
         }
     });
 }
 
 function getEqList(currentPage) {
     getSearchValue();
     $.ajax({
         url: '/resource/resourceList.ajax',
         type: 'GET',
         data: {
             'resSerachCategory': resSerachCategory,
             'resSearchDate': resSearchDate,
             'resSearchStartTime':resSearchStartTime,
             'resSearchEndTime': resSearchEndTime,
             'resStatus' : resStatus,
             'resOption' : resOption,
             'currentPage':currentPage
         },
         dataType: 'JSON',
         success: function (data) {
             drawEqList(data.list);
             
             var startPage = 1;
             
             $('#eq-pagination').twbsPagination({
 	    		startPage:data.currPage, // 시작 페이지
 	    		totalPages:data.totalPages, // 총 페이지 갯수
 	    		visiblePages:5,  // 보여줄 페이지 수[1][2][3][4][5]
 	    		onPageClick:function(evt,pg){ // 페이지 클릭시 실행 함수
 	    			console.log(evt); // 이벤트 객체
 	    			console.log(pg); //클릭한 페이지 번호 의미
 	        		showPage = pg;
 	        		getEqList(pg);
 	    			
 	    		}
 	       	});
         },
         error: function (error) {
             console.log(error);
         }
     });
 }
 
 function drawMrList(list) {
     var content = '';
     if (list.length > 0) {
         for (item of list) {
        	 console.log(item);
         	console.log(item.new_file_name);
           
             content += '<tr class="mr-list-table-tbody-tr" id="' + item.resource_idx + '">'
             	if (item.new_file_name ==null) {
             		content += '<td class="text-center"><img src = "/assets/images/free-icon-no-image-11573069.png" class = "table-img"></td>'					
				}else{
					content +='<td class="text-center"><img src = "/photo/'+item.new_file_name+'" class = "table-img"></td>'	
				}
             
             content += '<td class="text-center">' + item.resource_name+ '</td>'
             	+ '<td class="text-center">' + item.meeting_room_capacity+ '</td>'
             	+ '<td class="text-center">' + item.resource_location+ '</td>'
             	+ '<td class="text-center">' + item.resource_meeting_content+ '</td>'
             	+ '<td class="text-center">' + item.resource_state+ '</td>'
                + '</tr>';
         }
     } else {
         content = '<tr><td colspan="7" class="text-center">데이터가 존재하지 않습니다.</td></tr>';
     }
     $('#mr-list-table').html(content);
     
     
     $(document).on('click', '.mr-list-table-tbody-tr', function () {
         location.href = '/resource/resourceReservation.go?resource_idx=' + $(this).attr('id');
     });
 }
 
 function drawCarList(list) {
     var content = '';
     if (list.length > 0) {
         for (item of list) {
         	console.log(item.resource_name);
           
             content += '<tr class="car-list-table-tbody-tr" id="' + item.resource_idx + '">'
          		if (item.new_file_name ==null) {
          			content += '<td class="text-center"><img src = "/assets/images/free-icon-no-image-11573069.png" class = "table-img"></td>'					
				}else{
					content +='<td class="text-center"><img src = "/photo/'+item.new_file_name+'" class = "table-img"></td>'
				}
             content += '<td class="text-center">' + item.resource_name+ '</td>'
             	+ '<td class="text-center">' + item.company_car_category+ '</td>'
             	+ '<td class="text-center">' + item.company_car_license_plate+ '</td>'
             	+ '<td class="text-center">' + item.resource_location+ '</td>'
             	+ '<td class="text-center">' + item.resource_meeting_content+ '</td>'
             	+ '<td class="text-center">' + item.resource_state+ '</td>'
                + '</tr>';
         }
     } else {
         content = '<tr><td colspan="7" class="text-center">데이터가 존재하지 않습니다.</td></tr>';
     }
     $('#car-list-table').html(content);
     
     
     $(document).on('click', '.car-list-table-tbody-tr', function () {
         location.href = '/resource/resourceReservation.go?resource_idx=' + $(this).attr('id');
     });
 }
 
 function drawEqList(list) {
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
             	+ '<td class="text-center">' + item.resource_equipment_category+ '</td>'
             	+ '<td class="text-center">' + item.resource_location+ '</td>'
             	+ '<td class="text-center">' + item.resource_meeting_content+ '</td>'
             	+ '<td class="text-center">' + item.resource_state+ '</td>'
                + '</tr>';
         }
     } else {
         content = '<tr><td colspan="7" class="text-center">데이터가 존재하지 않습니다.</td></tr>';
     }
     $('#eq-list-table').html(content);
     
     
     $(document).on('click', '.eq-list-table-tbody-tr', function () {
         location.href = '/resource/resourceReservation.go?resource_idx=' + $(this).attr('id');
     });
 }
 
/*     // 필터 값 리셋
    function filterReset() {
        $('#filter-att-result').val('');
        $('#search-emp').val('');
        $('#filterforsearch').val('emp_no');
        $('#filter-att-date').val(today);
        filterAttDate = $('#filter-att-date').val(today);
        currentPage = 1; // 페이지 번호 초기화
        getTotalPages();
        getList(); // 목록 새로고침
    }   
    $('#search-emp').on('keyup', function(){
    	currentPage = 1;
        getTotalPages();
        getList();
       
    });
    
    $('#filter-att-date').on('change', function(){
    	currentPage = 1;
        getTotalPages();
        getList();
    });
    
    $('#filter-att-result').on('change', function(){
    	currentPage = 1;
        getTotalPages();
        getList();
    }); */

  
    
    
    


    // 토탈 페이지 호출
/*     function getTotalPages() {
        getSearchValue();
        $.ajax({
            url: '/resource/resGetPages.ajax',
            type: 'GET',
            data: {
                'resSerachCategory': resSerachCategory,
                'resSearchStartTime':resSearchStartTime,
                'resSearchEndTime': resSearchEndTime,
                'resStatus' : resStatus,
                'resOption' : resOption   
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
    } */

    
    


    


        // 9:00부터 18:00까지 30분 간격으로 옵션 추가
addOptions(9, 18, 60,document.getElementById("search-mr-start-time"));
addOptions(9, 18, 60,document.getElementById("search-mr-end-time"));
addOptions(9, 18, 60,document.getElementById("search-car-start-time"));
addOptions(9, 18, 60,document.getElementById("search-car-end-time"));
addOptions(9, 18, 60,document.getElementById("search-eq-start-time"));
addOptions(9, 18, 60,document.getElementById("search-eq-end-time"));



function addOptions(startHour, endHour, intervalMinutes, elem) {
    for (let hour = startHour; hour <= endHour; hour++) {
        console.log(hour);
        for (let minutes = 0; minutes < 60; minutes += intervalMinutes) {
            if (hour === endHour && minutes > 0 && elem === null) break;
            const option = document.createElement("option");
            const timeHour = String(hour).padStart(2, '0');
            const timeMin = String(minutes).padStart(2, '0');
            var timeString = timeHour + ":" + timeMin;
            console.log(timeString);
            option.value = timeString;
            option.textContent = timeString;
            elem.appendChild(option);
        }
    }
}



</script>

</html>
