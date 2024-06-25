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
              <a href="index.go">
                <img src="/assets/images/logo-sm.svg" class="logo" alt="Bootstrap Gallery">
              </a>
            </div>
            <!-- App brand sm end -->

            <!-- Breadcrumb start -->
            <ol class="breadcrumb d-none d-lg-flex ms-3">
              <li class="breadcrumb-item">
                <i class="bi bi-house lh-1"></i>
                <a href="/" class="text-decoration-none">메인</a>
              </li>
              <a href="/calendar/calendar.go" class="breadcrumb-item">일정관리</a>
            </ol>
            <!-- Breadcrumb end -->

            <!-- App header actions start -->
            <div class="header-actions">
              <div class="dropdown">
                <a class="dropdown-toggle d-flex px-3 py-4 position-relative" href="#!" role="button"
                  data-bs-toggle="dropdown" aria-expanded="false">
                  <img src="/assets/images/flags/1x1/gb.svg" class="flag-img" alt="Cab Admin Template">
                </a>
                <div class="dropdown-menu dropdown-menu-end shadow-sm dropdown-menu-mini">
                  <div class="country-container">
                    <a href="index.go" class="py-2">
                      <img src="/assets/images/flags/1x1/us.svg" alt="Business Dashboard Templates">
                    </a>
                    <a href="index.go" class="py-2">
                      <img src="/assets/images/flags/1x1/in.svg" alt="Business Dashboard Templates">
                    </a>
                    <a href="index.go" class="py-2">
                      <img src="/assets/images/flags/1x1/br.svg" alt="Business Dashboard Templates">
                    </a>
                    <a href="index.go" class="py-2">
                      <img src="/assets/images/flags/1x1/tr.svg" alt="IT Dashboard Templates">
                    </a>
                    <a href="index.go" class="py-2">
                      <img src="/assets/images/flags/1x1/id.svg" alt="IT Dashboard Templates">
                    </a>
                  </div>
                </div>
              </div>
              <div class="dropdown border-start">
                <a class="dropdown-toggle d-flex px-3 py-4 position-relative" href="#!" role="button"
                  data-bs-toggle="dropdown" aria-expanded="false">
                  <i class="bi bi-grid fs-4 lh-1 text-secondary"></i>
                </a>
                <div class="dropdown-menu dropdown-menu-end shadow-sm dropdown-menu-md">
                  <!-- Row start -->
                  <div class="d-flex gap-2 m-2 flex-wrap">
                    <a href="javascript:void(0)" class="g-col-4 p-2 border rounded-2">
                      <img src="/assets/images/brand-behance.svg" class="img-3x" alt="IT Dashboard Templates">
                    </a>
                    <a href="javascript:void(0)" class="g-col-4 p-2 border rounded-2">
                      <img src="/assets/images/brand-google.svg" class="img-3x" alt="IT Dashboard Templates">
                    </a>
                    <a href="javascript:void(0)" class="g-col-4 p-2 border rounded-2">
                      <img src="/assets/images/brand-bitcoin.svg" class="img-3x" alt="IT Dashboard Templates">
                    </a>
                    <a href="javascript:void(0)" class="g-col-4 p-2 border rounded-2">
                      <img src="/assets/images/brand-dribbble.svg" class="img-3x" alt="IT Dashboard Templates">
                    </a>
                  </div>
                  <!-- Row end -->
                  <div class="d-grid">
                    <a href="javascript:void(0)" class="btn btn-primary m-2">View All</a>
                  </div>
                </div>
              </div>
              <div class="dropdown border-start">
                <a class="dropdown-toggle d-flex px-3 py-4 position-relative" href="#!" role="button"
                  data-bs-toggle="dropdown" aria-expanded="false">
                  <i class="bi bi-bag-check fs-4 lh-1 text-secondary"></i>
                  <span class="count-label info"></span>
                </a>
                <div class="dropdown-menu dropdown-menu-end dropdown-menu-md shadow-sm">
                  <div class="d-flex flex-column p-3 mx-3 my-2 border">
                    <a href="javascript:void(0)" class="text-decoration-none">
                      <h3 class="mb-1">$35,000</h3>
                      <div class="mb-1 d-flex justify-content-between">
                        <span class="text-secondary">Revenue</span>
                        <span class="text-primary">+2%</span>
                      </div>
                      <div class="progress small">
                        <div class="progress-bar bg-primary" role="progressbar" style="width: 25%" aria-valuenow="25"
                          aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                    </a>
                  </div>
                  <div class="d-flex flex-column p-3 mx-3 my-2 border">
                    <a href="javascript:void(0)" class="text-decoration-none">
                      <h3 class="mb-1">$48,000</h3>
                      <div class="mb-1 d-flex justify-content-between">
                        <span class="text-secondary">Income</span>
                        <span class="text-primary">+7%</span>
                      </div>
                      <div class="progress small">
                        <div class="progress-bar bg-primary" role="progressbar" style="width: 50%" aria-valuenow="50"
                          aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                    </a>
                  </div>
                  <div class="d-flex flex-column p-3 mx-3 my-2 border">
                    <a href="javascript:void(0)" class="text-decoration-none">
                      <h3 class="mb-1">3400</h3>
                      <div class="mb-1 d-flex justify-content-between">
                        <span class="text-secondary">Sales</span>
                        <span class="text-danger">+3%</span>
                      </div>
                      <div class="progress small">
                        <div class="progress-bar bg-danger" role="progressbar" style="width: 75%" aria-valuenow="75"
                          aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                    </a>
                  </div>
                  <div class="d-grid mx-3 my-3">
                    <a href="javascript:void(0)" class="btn btn-primary">View all</a>
                  </div>
                </div>
              </div>
              <div class="dropdown border-start">
                <a class="dropdown-toggle d-flex px-3 py-4 position-relative" href="#!" role="button"
                  data-bs-toggle="dropdown" aria-expanded="false">
                  <i class="bi bi-envelope-open fs-4 lh-1 text-secondary"></i>
                  <span class="count-label"></span>
                </a>
                <div class="dropdown-menu dropdown-menu-end dropdown-menu-md shadow-sm">
                  <a href="javascript:void(0)" class="dropdown-item">
                    <div class="d-flex py-2">
                      <img src="/assets/images/user.png" class="img-3x me-3 rounded-3" alt="Admin Templates">
                      <div class="m-0">
                        <h5 class="mb-1">Stacy Macdonald</h5>
                        <p class="mb-1 text-secondary">
                          Got a new review. Congratulations!
                        </p>
                        <p class="small m-0 text-secondary">Today, 07:30pm</p>
                      </div>
                    </div>
                  </a>
                  <a href="javascript:void(0)" class="dropdown-item">
                    <div class="d-flex py-2">
                      <img src="/assets/images/user2.png" class="img-3x me-3 rounded-3" alt="Admin Templates">
                      <div class="m-0">
                        <h5 class="mb-1">Harriet Orozco</h5>
                        <p class="mb-1 text-secondary">
                          Happy Customer.
                        </p>
                        <p class="small m-0 text-secondary">Today, 08:00pm</p>
                      </div>
                    </div>
                  </a>
                  <a href="javascript:void(0)" class="dropdown-item">
                    <div class="d-flex py-2">
                      <img src="/assets/images/user1.png" class="img-3x me-3 rounded-3" alt="Admin Templates">
                      <div class="m-0">
                        <h5 class="mb-1">Grady Baxter</h5>
                        <p class="mb-1 text-secondary">
                          Grady wrote a new comment!
                        </p>
                        <p class="small m-0 text-secondary">Today, 09:30pm</p>
                      </div>
                    </div>
                  </a>
                  <div class="d-grid mx-3 my-3">
                    <a href="javascript:void(0)" class="btn btn-primary">View all</a>
                  </div>
                </div>
              </div>
              <div class="dropdown ms-2">
                <a id="userSettings" class="dropdown-toggle d-flex py-2 align-items-center text-decoration-none"
                  href="#!" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                  <img src="/assets/images/user.png" class="rounded-2 img-3x" alt="Bootstrap Gallery">
                </a>
                <div class="dropdown-menu dropdown-menu-end shadow-sm">
                  <div class="p-3 border-bottom mb-2">
                    <h6 class="mb-1">Ella Lindsey</h6>
                    <p class="m-0 small opacity-50">info@testing.com</p>
                  </div>
                  <a class="dropdown-item d-flex align-items-center" href="profile.go"><i
                      class="bi bi-person fs-4 me-2"></i>Profile</a>
                  <a class="dropdown-item d-flex align-items-center" href="settings.go"><i
                      class="bi bi-gear fs-4 me-2"></i>Settings</a>
                  <div class="d-grid p-3 py-2">
                    <a class="btn btn-danger" href="login.go">Logout</a>
                  </div>
                </div>
              </div>
            </div>
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
                    <div class="card-body">
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
    
    <!-- 일정 리스트 모달 -->
	<div class="modal fade show" id="mycab-cal-modal" tabindex="-1" aria-labelledby="exampleModalCenteredScrollableTitle" aria-modal="true" role="dialog">
                        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title" id="exampleModalCenteredScrollableTitle">
                                일정관리
                              </h5>
                              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body" id = "cal-modal-content">
                              <table id = "cal-modal-content2" class="schedule-table">
                              
                              </table>
                              
                     
                              <br><br><br><br><br><br><br><br><br><br>
                              <br><br><br><br><br><br><br><br><br><br>
                              <p>Just like that.</p>
                            </div>
                            <div class="modal-footer">
                              <button type="button" class="btn btn-primary">
                                일정추가
                              </button>
                              <button type="button" class="btn btn-primary">
                                취소
                              </button>
                            </div>
                          </div>
                        </div>
                      </div>
                      
    <!-- 일정리스트 모달 끝 -->                  
    <!-- 일반모달 -->                  
	<div class="modal fade show" id="exampleModalCenteredScrollable" tabindex="-1" aria-labelledby="exampleModalCenteredScrollableTitle" aria-modal="true" role="dialog" style="display: none;">
                        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title" id="exampleModalCenteredScrollableTitle">
                                Modal title
                              </h5>
                              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                              <p>
                                This is some placeholder content to show a
                                vertically centered modal. We've added some
                                extra copy here to show how vertically centering
                                the modal works when combined with scrollable
                                modals. We also use some repeated line breaks to
                                quickly extend the height of the content,
                                thereby triggering the scrolling. When content
                                becomes longer than the predefined max-height of
                                modal, content will be cropped and scrollable
                                within the modal.
                              </p>
                              <br><br><br><br><br><br><br><br><br><br>
                              <br><br><br><br><br><br><br><br><br><br>
                              <p>Just like that.</p>
                            </div>
                            <div class="modal-footer">
                              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                Close
                              </button>
                              <button type="button" class="btn btn-primary">
                                Save changes
                              </button>
                            </div>
                          </div>
                        </div>
                      </div>
	<!-- 일반모달 끝 -->
	<!-- 일정추가 모달 -->
	<div class="modal fade" id="scheduleAddModal" tabindex="-1"
		aria-labelledby="exampleModalLgLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title h4" id="exampleModalLgLabel">일정 등록</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="mb-3">
                    <label for="scheduleTitle" class="form-label">제목</label>
                    <input type="text" class="form-control" id="scheduleTitle" placeholder="일정 제목을 입력하세요" name="scheduleTitle">
                </div>
                <div class="mb-3">
                    <label for="sel-start-date" class="form-label">시작 일정</label>
                    <div class="input-group">
                        <input type="text" class="datepicker form-control" id="sel-start-date" name="sel-start-date">
                        <input type="time" class="form-control" name="sel-start-date">
                    </div>
                </div>
                <div class="mb-3">
                    <label for="sel-end-date" class="form-label">종료 일정</label>
                    <div class="input-group">
                        <input type="text" class="datepicker form-control" id="sel-end-date" name="sel-end-date">
                        <input type="time" class="form-control" name="sel-end-date">
                    </div>
                </div>
                <div class="mb-3">
                    <label for="scheduleCategory" class="form-label">일정 범위</label>
                    <select class="form-select" id="scheduleCategory">
                        <option value="개인" style="color: red;">개인</option>
                        <option value="부서" style="color: blue;">부서</option>
                        <option value="전사" style="color: green;">전사</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="scheduleContent" class="form-label">내용</label>
                    <textarea class="form-control" id="scheduleContent" placeholder="내용을 입력하세요" rows="3"></textarea>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" onclick="addSchedule()">작성</button>
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
                    <div class="input-group mb-3">
                        <label class="input-group-text" for="scheduleDetailTitle">제목</label>
                        <input type="text" class="form-control" id="scheduleDetailTitle" name="scheduleDetailTitle" readonly>
                    </div>                                    
                    <div class="input-group mb-3">
                        <label class="input-group-text" for="sel-start-date">일정</label>
                        <input type="text" class="form-control datepicker" id="sel-start-date-Detail" name="sel-start-date-Detail" readonly>
                        <input type="time" class="form-control" name="sel-start-time-Detail" readonly>
                        <span class="input-group-text">~</span>
                        <input type="text" class="form-control datepicker" id="sel-end-date-Detail" name="sel-end-date-Detail" readonly>
                        <input type="time" class="form-control" name="sel-end-time-Detail" readonly>
                    </div>
                    <div class="input-group mb-3">
                        <label class="input-group-text" for="scheduleDetailCategory">일정범위</label>
                        <select class="form-select" id="scheduleDetailCategory" disabled>
                            <option value="개인">개인</option>
                            <option value="부서">부서</option>
                            <option value="전사">전사</option>
                        </select>
                    </div>
                    <div class="input-group mb-3">
                        <label class="input-group-text" for="scheduleDetailColor">색깔 선택</label>
                        <input type="color" class="form-control form-control-color" id="scheduleDetailColor" name="scheduleDetailColor" disabled>
                    </div>
                    <div class="input-group mb-3">
                        <label class="input-group-text" for="scheduleDetailContent">내용</label>
                        <textarea class="form-control" id="scheduleDetailContent" name="scheduleDetailContent" placeholder="Enter message" rows="3" style="height: 245px;" readonly></textarea>
                    </div>  
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary btn-lg" onclick="editSchedule()">수정</button>
                    <button class="btn btn-danger btn-lg" onclick="deleteSchedule()">삭제</button>                 
                    <button type="button" class="btn btn-secondary btn-lg" data-bs-dismiss="modal">닫기</button>         
                </div>
            </div>
        </div>
    </div>
	<!-- 일정 상세보기 끝 -->
	
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
    
  <script >
  	var calendar;
	var startStr;
	var endStr;
	var scheduleCategory = document.getElementById('scheduleCategory');
	
	function addSchedule(){
		console.log(document.getElementById("sel-start-date").value,document.getElementById("sel-end-date").value);
		//선택된 색 값 가져오기 
		
		var selectedOption = scheduleCategory.options[scheduleCategory.selectedIndex];
        var color = selectedOption.style.color;
        console.log(color)
		$.ajax({
	        type: "GET",
	        url: "/calendar/createSchedule.ajax",
	        data: {
	        	'schedule_name': document.getElementById("scheduleTitle").value,
	        	'schedule_content': document.getElementById("scheduleTitle").value,
	        	'schedule_start_date': document.getElementById("sel-start-date").value,
	        	'schedule_end_date': document.getElementById("sel-end-date").value,
	        	'schedule_category': document.getElementById("scheduleCategory").value,
	        	'schedule_color': color,
	        	'schedule_emp_no': '30001' //나중에 세션으로 처리
	        },
	        dataType: "json",
			success: function(response) {
				var myModal = new bootstrap.Modal(document.getElementById('scheduleAddModal'));
				var modalCloseButton = document.getElementById('scheduleAddModalCloseButton');
				console.log(calendar.refetchEvents());
				console.log(calendar);
				calendar.refetchEvents();
				
	        },
	        error: function(xhr, status, error) {
	            // 에러 처리
	            $("#result").html("<p>There was an error: " + error + "</p>");
	        }
	    });
		
	};
  //일정 추가
  
  
  moment.locale('ko');	
</script>

</html>